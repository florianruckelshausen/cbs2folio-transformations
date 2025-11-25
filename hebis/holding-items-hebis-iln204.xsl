<?xml version="1.0" encoding="UTF-8"?>
<!-- date of last edit: 2025-11-25 (YYYY-MM-DD) -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common" version="1.1" exclude-result-prefixes="exsl">

  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 204 UB Gießen: holding-items-hebis-iln204.xsl -->
  <!-- ================================================= -->

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original', .)"/>
    <!-- 209A$f/209G$a ? -->
    <!-- Text variables -->
    <xsl:variable name="abt" select="$i/datafield[@tag = '209A' and subfield[@code = 'x'] = '00']/subfield[@code = 'f']/text()"/>
    <xsl:variable name="signature"
      select="$i/datafield[@tag = '209A' and subfield[@code = 'x'] = '00']/subfield[@code = 'a']/text()"/>
    <xsl:variable name="signature-lowercase" select="
      translate($signature,
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz')"/>    
    <xsl:variable name="book-code"
      select="$i/datafield[@tag = '209G' and subfield[@code = 'x'] = '00']/subfield[@code = 'a']/text()"/>
    <xsl:variable name="loan-type"
      select="$i/datafield[@tag = '209A' and subfield[@code = 'x'] = '00']/subfield[@code = 'd']/text()"/>
    <!-- Boolean variables -->    
    <xsl:variable name="hap" 
      select="substring($i/datafield[@tag = '209G' and subfield[@code = 'x'] = '01']/subfield[@code = 'a']/text(),1,3) = 'hap'"/>
    <xsl:variable name="local-order" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,2) = 'La')"/>
    <xsl:variable name="microform"
      select="contains($i/datafield[@tag = '209G' and subfield[@code = 'x'] = '01']/subfield[@code = 'a']/text(), 'Mikroformen')"/>
    <xsl:variable name="dummy" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],2,1) = 'd') or
                                       (substring($i/../datafield[@tag='002@']/subfield[@code='0'],2,1) = 'c')"/>
    <xsl:variable name="dummy-do" select="($i/datafield[@tag='208@']/subfield[@code='b'] = 'do')"/>    
    <xsl:variable name="article-in-volume" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],2,1) = 'o')"/>  
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <xsl:variable name="interlibrary-loan" select="($i/../datafield[@tag='002@']/subfield[@code='0'] = 'Luf') and 
                                                    substring($signature,1,2) = 'FL' "/>
    
    <permanentLocationId>
      <xsl:variable name="ranges-list">
        <ranges>
          <department code="000" default-location="ILN204/CG/UB/Unbekannt">
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">in bearbeitung</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">restituiert</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">tausch</prefix>
            <!-- "Titel erscheint nicht", "Titel wird nicht erscheinen" etc. -->
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">titel</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">umarbeitung</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">vermisst</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">völlig vergriffen</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">vorauszahlung</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">wird nicht erscheinen</prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">zurück</prefix>
            <prefix location="ILN204/CG/UB/UBKoerbe">ipod</prefix>
            <prefix location="ILN204/CG/UB/UBKoerbe">korb nr</prefix>
            <prefix location="ILN204/CG/UB/UBKoerbe">kopfhoerer</prefix>
            <prefix location="ILN204/CG/UB/UBKoerbe">stecker nr</prefix>            
            <prefix location="ILN204/CG/UB/Freihand1OG">/</prefix>
            <!-- RVK: Kein range, sondern prefix wg. besserer Performance -->
            <!-- ab hier 1. OG -->
            <prefix location="ILN204/CG/UB/Freihand1OG">000 a</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 b</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 c</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 d</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 e</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 f</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 g</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 h</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 i</prefix>            
            <prefix location="ILN204/CG/UB/Freihand1OG">000 k</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">000 l</prefix>
            <!-- ab hier 2. OG -->
            <prefix location="ILN204/CG/UB/Freihand2OG">000 m</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 n</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 p</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 q</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 r</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 s</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 t</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 u</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 v</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 w</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 x</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 y</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">000 z</prefix>
            <!-- alte ZNL-Regel. Bleibt erstmal bestehen, weil es noch ein paar Reste,
                 z.B. HAP-Exemplare gibt. -->
            <prefix location="ILN204/CG/UB/Freihand2OG">002</prefix>
            <prefix location="ILN204/CG/UB/UBMagPhil1">064</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">140</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">1/</prefix>
            <range from="1600" to="1899" location="ILN204/CG/UB/UBSLS"/>
            <range from="1900" to="1990" location="ILN204/CG/UB/UBMagPohlheim"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">2/</prefix>
            <range from="20.000.00" to="24.999.99" location="ILN204/CG/UB/UBMag3"/>
            <range from="27.000.00" to="27.999.99" location="ILN204/CG/UB/Freihand2OG"/>            
            <prefix location="ILN204/CG/UB/UBMagKeller">2o 1/</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">2o 2/</prefix>
            <range from="2o 20.000.00" to="2o 24.999.99" location="ILN204/CG/UB/UBMag3"/>
            <!-- 2o 3/ aktuell nicht belegt
            <prefix location="ILN204/CG/UB/UBMagKeller">2o 3/</prefix>  -->
            <prefix location="ILN204/CG/UB/UBMagKeller">2o 4/</prefix>
            <range from="2o 40.000.00" to="2o 44.999.99" location="ILN204/CG/UB/UBMagPohlheim"/>
            <prefix location="ILN204/CG/UB/UBMag3">2o a</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o bt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o b</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">2o erk</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o hass</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o kt a</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">2o kt b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o kt-a</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">2o kt-b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o landesk</prefix>
            <!-- 2o ma - 2o mz aktuell nicht belegt
            <range from="2o ma" to="2o mz" location="ILN204/CG/UB/UBMag3"/> -->
            <prefix location="ILN204/CG/UB/UBMag3">2o ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">2o ztg</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">2o zz</prefix>
            <range from="2o zz 1" to="2o zz 48" location="ILN204/CG/UB/UBMag3"/>
            <range from="2o zz 49" to="2o zz 99" location="ILN204/CG/UB/UBMag3"/>
            <!-- 2o 3/ aktuell nicht belegt
            <prefix location="ILN204/CG/UB/UBMagKeller">3/</prefix> -->
            <!--32er Signaturen waren nicht in LBS-Konkordanz, lt.- Homepage in Zweigbibl. Phil. 1 -->
            <prefix location="ILN204/CG/UB/UBMagPhil1">32</prefix>
            <prefix location="ILN204/CG/UB/UBMagPhil1">350</prefix>
            <!-- 4 b 49 - 4 b 73 aktuell nicht belegt
            <range from="4 b 49" to="4 b 73" location="ILN204/CG/UB/UBMag3"/> -->
            <prefix location="ILN204/CG/UB/UBMag3">4 ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">4/</prefix>
            <range from="40.000.00" to="44.999.99" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="47.000.00" to="47.999.99" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="49.000.00" to="49.999.99" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">4o 1/</prefix>            
            <prefix location="ILN204/CG/UB/UBMagKeller">4o 2/</prefix>
            <range from="4o 20.000.00" to="4o 24.999.99" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">4o 3/</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">4o 4/</prefix>            
            <range from="4o 40.000.00" to="4o 44.999.99" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="4o 49.000.00" to="4o 49.999.99" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">4o azz</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o a</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o bt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o b</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">4o erk</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o hass</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o kr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o kt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o landesk</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o mus</prefix>
            <!-- 4o ma - 4o mz aktuell nicht belegt -->
            <range from="4o ma" to="4o mz" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">4o pap</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">4o ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">4o ztg</prefix>
            <range from="4o zz 1" to="4o zz 19" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="4o zz 20" to="4o zz 48" location="ILN204/CG/UB/UBMag3"/>
            <range from="4o zz 49" to="4o zz 65" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="4o zz 66" to="4o zz 99" location="ILN204/CG/UB/UBMagPohlheim"/>
            <prefix location="ILN204/CG/UB/UBMagKeller">5/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 49/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 50/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 51/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 52/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 53/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 54/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 55/</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">a 56/</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">abw</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">adk</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">ags</prefix>            
            <prefix location="ILN204/CG/UB/UBMagPohlheim">al</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">amag</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">an</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">ap</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">aro</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">azz</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">a</prefix>
            <range from="b 1" to="b 48" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="b 49" to="b 73" location="ILN204/CG/UB/UBMag3"/>
            <range from="b 74" to="b 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="bap 1" to="bap 10" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="bap 13" to="bap 26" location="ILN204/CG/UB/UBMagPohlheim"/>
            <prefix location="ILN204/CG/UB/UBMag3">bap 27</prefix>
            <range from="bap 28" to="bap 99" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="bap a" to="bap z" location="ILN204/CG/UB/UBMagPohlheim"/>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">bel</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">bt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">cd</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">c</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">depositum</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">da</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">d</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">einzelsig</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">erk</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">e</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">fd</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh agr</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh all</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh altege</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ang</prefix>
            <!-- fh ang inkludiert fh ang und fh angl -->
            <prefix location="ILN204/CG/UB/Mikroformen">fh arbeitsplatz mikroformen</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bap</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bio</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bliz</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh bot</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh che</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh didge</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">fh einzelsig</prefix>            
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ern</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh fil</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh geo</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh germ</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ger</prefix>            
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ggr</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh gkt</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">fh grünland</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh he</prefix>
            <!-- fh his inkludiert auch FH Hist -->
            <prefix location="ILN204/CG/UB/Freihand2OG">fh his</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh hsh</prefix>
            <range from="fh jur a" to="fh jur y" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh jur z</prefix>
            <prefix location="ILN204/CG/UB/Freihand1OG">fh kid</prefix>
            <!-- fh kla inkludiert auch FH KlassPhil und FH KlassArch -->
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kla</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kun</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kup</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh kyb</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh lit</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh mat</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh nat</prefix>
            <range from="fh ori a" to="fh ori z" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="fh orient /" to="fh orient wl" location="ILN204/CG/UB/Freihand2OG"/>
            <range from="fh orient wn" to="fh orient z" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ostge</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh pap</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh phi</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh psy</prefix>
            <!-- fh rom inkludiert fh rom und fh romanistik -->
            <prefix location="ILN204/CG/UB/Freihand2OG">fh rom</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sla</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sls 20</prefix>
            <range from="fh sls 28" to="fh sls 30" location="ILN204/CG/UB/Freihand2OG"/>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh spo</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh spr</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh ssl</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sta</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh sued</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh tea</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh tec</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh umw</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh vol</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh vsp</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh zeitung</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh zoo</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fh zp1</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">fk</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">fp</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">frsla</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">f</prefix>
            <range from="g 1" to="g 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">gb</prefix>
            <prefix location="ILN204/CG/UB/UBMagPhil1">gdm</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">ges</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">giso</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">gr 2o 2/</prefix>
            <range from="gr 2o 20.00" to="gr 2o 49.99" location="ILN204/CG/UB/UBMag3"/>
            <range from="gr 2o a 49" to="gr 2o a 56" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o hass</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o kt</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">gr 2o ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">gr 2o ztg</prefix>
            <range from="gr 2o zz 1" to="gr 2o zz 20" location="ILN204/CG/UB/UBMag3"/>
            <range from="gr 2o zz 49" to="gr 2o zz 99" location="ILN204/CG/UB/UBMag3"/>
            <prefix location="ILN204/CG/UB/UBMag3">hass</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">hr</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">hs</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">h</prefix>
            <range from="i 0" to="i 9" location="ILN204/CG/UB/UBMagKeller"/>
            <range from="i 10" to="i 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">in</prefix>
            <range from="k 1" to="k 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">kr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">kt a</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">kt b</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">kt-a</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">kt-b</prefix>
            <range from="l 1" to="l 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBMag3">landesk</prefix>
            <prefix location="ILN204/CG/UB/Freihand2OG">lbs</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">les</prefix>
            <range from="m 0" to="m 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <!-- ZNL-Bestand  in Pohlheim -->
            <prefix location="ILN204/CG/UB/UBMagPohlheim">mag 002</prefix>
            <!-- Ehemalige ZPII-Bestände -->
            <prefix location="ILN204/CG/UB/UBMag3">mag 03.</prefix>
            <!-- Ehemalige FH-Bestände (altege - vsp) -->
            <prefix location="ILN204/CG/UB/UBMag3">mag altege</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag bap</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag didge</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag eden</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag germ</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag kyb</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag mat</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag nat</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag og</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag philos</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag psych</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag rom</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag sls</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag ssl</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag sport</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag tec</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag teo</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag vol</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mag vsp</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">mag ug</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">msla</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">mus</prefix>
            <range from="n 1" to="n 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/UBSLS">nachl</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">nl</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">no</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">nr</prefix>
            <range from="o 1" to="o 999999" location="ILN204/CG/UB/UBMagKeller"/>
            <prefix location="ILN204/CG/UB/OSR">osr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">ott</prefix>            
            <prefix location="ILN204/CG/UB/UBSLS">pap</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">pl</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">progr</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">p</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">q</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">rara</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">r</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">sap</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">sch</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">ss</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">s</prefix>
            <prefix location="ILN204/CG/UB/UBSLS">thaer</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">theo</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">t</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">u</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">vorl</prefix>
            <prefix location="ILN204/CG/UB/UBMagPohlheim">vuf</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">vv</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">v</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">w</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">x </prefix>
            <prefix location="ILN204/CG/UB/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/UB/UBMagKeller">y</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">z nr</prefix>
            <prefix location="ILN204/CG/UB/UBMag3">ztg</prefix>
            <!-- Spatium nach 'z' erforderlich, damit 'zz'-Signaturen nicht von dieser Regel erfasst werden --> 
            <prefix location="ILN204/CG/UB/UBMagKeller">z </prefix>
            <range from="zz 1" to="zz 19" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="zz 20" to="zz 30" location="ILN204/CG/UB/UBMag3"/>
            <range from="zz 49" to="zz 65" location="ILN204/CG/UB/UBMagPohlheim"/>
            <range from="zz 66" to="zz 99" location="ILN204/CG/UB/UBMagPohlheim"/>            
          </department>
          <department code="002" default-location="ILN204/CG/ZNL/Unbekannt">
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">in bearbeitung</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/ZNL/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/ZNL/ZNLKoerbe">ipod</prefix>
            <prefix location="ILN204/CG/ZNL/ZNLKoerbe">korb nr</prefix>
            <prefix location="ILN204/CG/ZNL/ZNLKoerbe">kopfhoerer</prefix>
            <prefix location="ILN204/CG/ZNL/ZNLKoerbe">stecker nr</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">002 </prefix>            
            <prefix location="ILN204/CG/ZNL/Freihand">130</prefix>           
            <range from="4o 20.000.00" to="4o 21.999.99" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o 22.000.00" to="4o 22.999.99" location="ILN204/CG/ZNL/Freihand"/>            
            <range from="4o zz 1" to="4o zz 20" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o zz 49" to="4o zz 99" location="ILN204/CG/ZNL/Freihand"/>
            <range from="4o zz 49" to="4o zz 65" location="ILN204/CG/ZNL/Freihand"/>
            <range from="bap 11,1" to="bap 12,9" location="ILN204/CG/ZNL/Freihand"/>
            <prefix location="ILN204/CG/ZNL/Freihand">in</prefix>
            <prefix location="ILN204/CG/ZNL/Freihand">ss</prefix>
            <range from="zeitschriftenraum" to="zeitschriftenraum b"
              location="ILN204/CG/ZNL/Freihand"/>
            <range from="zz 1" to="zz 20" location="ILN204/CG/ZNL/Freihand"/>
            <range from="zz 49" to="zz 99" location="ILN204/CG/ZNL/Freihand"/>
          </department>
          <department code="005" default-location="ILN204/CG/ZHB/Unbekannt">
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">in bearbeitung</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/ZHB/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/ZHB/ZHBKoerbe">ipod</prefix>
            <prefix location="ILN204/CG/ZHB/ZHBKoerbe">korb nr</prefix>
            <prefix location="ILN204/CG/ZHB/ZHBKoerbe">kopfhoerer</prefix>
            <prefix location="ILN204/CG/ZHB/ZHBKoerbe">stecker nr</prefix>
            <prefix location="ILN204/CG/ZHB/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZHB/Freihand">005</prefix>
            <prefix location="ILN204/CG/ZHB/Magazin">205</prefix>
            <prefix location="ILN204/CG/ZHB/Freihand">wand</prefix>
          </department>
          <department code="009" default-location="ILN204/CG/ZP2/Unbekannt">
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">in bearbeitung</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/ZP2/ZP2Koerbe">ipod</prefix>
            <prefix location="ILN204/CG/ZP2/ZP2Koerbe">korb nr</prefix>
            <prefix location="ILN204/CG/ZP2/ZP2Koerbe">kopfhoerer</prefix>
            <prefix location="ILN204/CG/ZP2/ZP2Koerbe">stecker nr</prefix>            
            <prefix location="ILN204/CG/ZP2/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">040</prefix>
            <range from="009 aa" to="009 az" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ba" to="009 bh" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 bio</prefix>
            <range from="009 bk" to="009 bo 9730" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 bot a" to="009 bot z" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 bp" to="009 bw" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ca" to="009 ck" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 cl" to="009 cz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 da" to="009 di 49" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did bio</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did ggr</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did mat</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did phy</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 did z</prefix>
            <range from="009 dipl 1" to="009 dipl 9" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 dk" to="009 dz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ea" to="009 ex 970" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 exam 1" to="009 exam 9" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ey" to="009 ez" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 fa" to="009 fz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ga" to="009 gf" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 gg 421" to="009 gg 91" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 ggr</prefix>
            <range from="009 gh" to="009 gz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 hc" to="009 hu" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ia" to="009 ix" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ka" to="009 kx" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ky 10" to="009 ky 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 kyb</prefix>
            <range from="009 kz 10" to="009 kz 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 la" to="009 lc" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ld 10" to="009 ld 2999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ld 30" to="009 ld 8699" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ld 870" to="009 ld 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 le" to="009 lg" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 lh" to="009 lo" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 lp" to="009 ly" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ma 10" to="009 ma 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 mag 1" to="009 mag 9" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 mat</prefix>
            <range from="009 mb" to="009 ml" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 mn" to="009 ms" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 mus</prefix>
            <range from="009 mx" to="009 mz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 na 10" to="009 na 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 nat</prefix>
            <range from="009 nb" to="009 nz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 pa 10" to="009 pa 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 pae</prefix>
            <range from="009 pb" to="009 pg" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ph 10" to="009 ph 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 phi</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 phy</prefix>
            <range from="009 pi" to="009 pz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 qa" to="009 qy" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ra" to="009 rd" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 re 10" to="009 re 99999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 rel</prefix>
            <range from="009 rf" to="009 rz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 sa" to="009 sp" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 sq" to="009 su" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ta" to="009 td" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 te 10" to="009 te 9999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">009 tea</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 tec</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009 teo</prefix>
            <range from="009 tf" to="009 tz" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 ua" to="009 ux" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 va" to="009 vx" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 wa" to="009 wx" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 xa" to="009 yv" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 za" to="009 ze" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zg" to="009 zn" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zo 1" to="009 zo 9999" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zoo a" to="009 zoo z" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 zx" to="009 zy" location="ILN204/CG/ZP2/Freihand"/>
            <range from="009 010" to="009 999" location="ILN204/CG/ZP2/Freihand"/>
            <prefix location="ILN204/CG/ZP2/Freihand">cd</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">lbs</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">zeit</prefix>
          </department>
          <department code="010" default-location="ILN204/CG/ZRW/Freihand">
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">in bearbeitung</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/ZRW/ZRWKoerbe">ipod</prefix>
            <prefix location="ILN204/CG/ZRW/ZRWKoerbe">korb nr</prefix>
            <prefix location="ILN204/CG/ZRW/ZRWKoerbe">kopfhoerer</prefix>
            <prefix location="ILN204/CG/ZRW/ZRWKoerbe">stecker nr</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">14</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">22</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">23</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">32</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">45</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">60</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">61</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">62</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">63</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">64</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">65</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">66</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">k</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">mag</prefix>
          </department>
          <department code="015" default-location="ILN204/CG/DezFB/EDZ"/>
          <department code="020" default-location="ILN204/CG/ZRW/Freihand">
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">in bearbeitung</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/ZRW/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/ZRW/Freihand">an</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">a</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">b</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">c</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">d</prefix>
            <prefix location="ILN204/CG/ZRW/Freihand">einzelsignaturen</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">e</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">f</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">g</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">h</prefix>
            <prefix location="ILN204/CG/ZRW/Magazin">mag</prefix>
          </department>
          <department code="021" default-location="ILN204/CG/DezFB/WiWi-BWL01">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL01"/>
          </department>
          <department code="022" default-location="ILN204/CG/DezFB/WiWi-BWL02">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL02"/>
          </department>
          <department code="023" default-location="ILN204/CG/DezFB/WiWi-BWL03">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL03"/>
          </department>
          <department code="024" default-location="ILN204/CG/DezFB/WiWi-BWL04">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL04"/>
          </department>
          <department code="025" default-location="ILN204/CG/DezFB/WiWi-BWL05">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL05"/>
          </department>
          <department code="026" default-location="ILN204/CG/DezFB/WiWi-BWL06">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL06"/>
          </department>
          <department code="027" default-location="ILN204/CG/DezFB/WiWi-BWL07">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL07"/>
          </department>
          <department code="028" default-location="ILN204/CG/DezFB/WiWi-BWL08">
            <range from="/" to="z" location="ILN204/CG/DezFB/WiWi-BWL08"/>
          </department>
          <department code="030" default-location="ILN204/CG/ZP2/Freihand">
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">ausgesondert</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">bestellt</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">erscheint nicht</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">nicht lieferbar</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">nicht mehr lieferbar</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">storniert</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">vergriffen</prefix>
            <prefix location="ILN204/CG/ZP2/Erwerbungssignatur">x</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">/</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">009</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">03.</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 diplom</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 kup</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 mag</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 mus</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 pol</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">030 soz</prefix>
            <prefix location="ILN204/CG/ZP2/Freihand">z</prefix>
          </department>
          <department code="055" default-location="ILN204/CG/DezFB/Mediothek-Musikwiss"/>
          <department code="061" default-location="ILN204/CG/DezFB/Testothek-Psychologie"/>
          <department code="082" default-location="ILN204/CG/DezFB/FB-Klass-Archaeologie"/>
          <department code="084" default-location="ILN204/CG/DezFB/FB-Historisches-Institut"/>
          <department code="090" default-location="ILN204/CG/DezFB/FB-Germanistik"/>
          <department code="092" default-location="ILN204/CG/DezFB/Sudetendeutsches-Woerterbuch"/>
          <department code="100" default-location="ILN204/CG/DezFB/FB-Anglistik"/>
          <department code="111" default-location="ILN204/CG/DezFB/FB-Klass-Philologie">
            <prefix location="ILN204/CG/DezFB/FB-Klass-Philologie">/</prefix>
            <prefix location="ILN204/CG/DezFB/FB-Klass-Philologie">0</prefix>
            <prefix location="ILN204/CG/DezFB/FB-Klass-Philologie">bestellt</prefix>
            <range from="gr a" to="gr z" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="i 0" to="i 6999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="ii 1" to="ii 999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="iii 1 1" to="iii 9 99999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="iv 1 1" to="iv 4 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="ix 1 1" to="ix 6 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="lat a" to="lat z" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <prefix location="ILN204/CG/DezFB/FB-Klass-Philologie">pap</prefix>
            <range from="v 1 1" to="v 9 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="vi 1 1" to="vi 9 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="vii 1 1" to="vii 3 99999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="viii 1 1" to="viii 7 9999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="x 1 1" to="x 4 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xi 1 1" to="xi 9 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xii 1 1" to="xii 9 99999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xiii 1 1" to="xiii 1 9999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xiv 1 1" to="xiv 9 99999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xv 3 1" to="xv 5 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xvi 1" to="xvi 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="xvii 1" to="xvii 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
            <range from="zs 0" to="zs 999999" location="ILN204/CG/DezFB/FB-Klass-Philologie"/>
          </department>
          <department code="112" default-location="ILN204/CG/DezFB/FB-Romanistik"/>
          <department code="116" default-location="ILN204/CG/DezFB/SlavistikMediathek"/>
          <department code="117" default-location="ILN204/CG/DezFB/AngewTheaterwiss"/>
          <department code="120" default-location="ILN204/CG/DezFB/FB-Mathe-Informatik"/>
          <department code="122" default-location="ILN204/CG/DezFB/FB-Mathe-Informatik"/>
          <department code="138" default-location="ILN204/CG/DezFB/Strahelnschutz"/>
          <department code="151" default-location="ILN204/CG/DezFB/Hermann-Hoffmann-Akademie"/>
          <department code="154" default-location="ILN204/CG/DezFB/Zoologie1"/>
          <department code="157" default-location="ILN204/CG/DezFB/Genetik"/>
          <department code="172" default-location="ILN204/CG/DezFB/Milchwissenschaften"/>
          <department code="174" default-location="ILN204/CG/DezFB/Veterinaeranatomie"/>
          <department code="175" default-location="ILN204/CG/DezFB/Veterinaerphysiologie"/>
          <department code="176" default-location="ILN204/CG/DezFB/Biochemie-Endokrinologie"/>
          <department code="177" default-location="ILN204/CG/DezFB/Veterinärpathologie"/>
          <department code="178" default-location="ILN204/CG/DezFB/Tieraerztliche-Nahrungsmittelkunde"/>
          <department code="179" default-location="ILN204/CG/DezFB/Tierhygiene"/>
          <department code="180" default-location="ILN204/CG/DezFB/Tierschutz-Ethologie"/>
          <department code="182" default-location="ILN204/CG/DezFB/Gefluegelkrankheiten"/>
          <department code="184" default-location="ILN204/CG/DezFB/Kleintier-Innere-Chirurgie"/>
          <department code="185" default-location="ILN204/CG/DezFB/Pferdeklinik"/>
          <department code="186" default-location="ILN204/CG/DezFB/Klinik-Wiederkäuer"/>
          <department code="187" default-location="ILN204/CG/DezFB/Reproduktionsmedizin-und-Neugeborenenkunde"/>
          <department code="189" default-location="ILN204/CG/DezFB/Virologie"/>
          <department code="190" default-location="ILN204/CG/DezFB/Parhmakol-Toxikol-BFS"/>
          <department code="192" default-location="ILN204/CG/DezFB/Prozesstechnik"/>
          <department code="209" default-location="ILN204/CG/DezFB/Ländliches-Genossenschaftswesen"/>
          <department code="211" default-location="ILN204/CG/DezFB/Biomathematik"/>
          <!-- BIK 230 eigentlich nicht mehr aktiv, aber ggf. noch in CBS-Test -->
          <department code="230" default-location="ILN204/CG/DezFB/Fachbibliotheken"/>
          <department code="231" default-location="ILN204/CG/DezFB/Anatomie"/>
          <department code="232" default-location="ILN204/CG/DezFB/Physiologie"/>
          <department code="233" default-location="ILN204/CG/DezFB/Biochemie"/>
          <department code="234" default-location="ILN204/CG/DezFB/Pathologie"/>
          <department code="235" default-location="ILN204/CG/DezFB/Arbeitsmedizin"/>
          <department code="236" default-location="ILN204/CG/DezFB/Geschichte-der-Medizin"/>
          <department code="237" default-location="ILN204/CG/DezFB/Hygiene-Umweltmedizin"/>
          <department code="238" default-location="ILN204/CG/DezFB/Rechtsmedizin"/>
          <department code="250" default-location="ILN204/CG/DezFB/Dermatologie"/>
          <department code="258" default-location="ILN204/CG/DezFB/Augenklinik"/>
          <department code="259" default-location="ILN204/CG/DezFB/Psychiat-Neurol"/>
          <department code="260" default-location="ILN204/CG/DezFB/Psychosomatische-Medizin"/>
          <department code="290" default-location="ILN204/CG/DezFB/Uniarchiv-SLS"/>
          <!-- BIK 320 eigentlich nicht mehr aktiv, aber ggf. noch in CBS-Test -->
          <department code="320" default-location="ILN204/CG/DezFB/Fachbibliotheken"/>
          <!-- BIK 322 eigentlich nicht mehr aktiv, aber ggf. noch in CBS-Test -->
          <department code="322" default-location="ILN204/CG/DezFB/AAA-DaF"/>
          <department code="331" default-location="ILN204/CG/DezFB/WiWi-VWL01"/>
          <department code="332" default-location="ILN204/CG/DezFB/WiWi-VWL02"/>
          <department code="333" default-location="ILN204/CG/DezFB/WiWi-VWL03"/>
          <department code="335" default-location="ILN204/CG/DezFB/WiWi-VWL05"/>
          <department code="336" default-location="ILN204/CG/DezFB/WiWi-VWL06"/>
          <department code="341" default-location="ILN204/CG/DezFB/WiWi-Statistik-Oekonometrie"/>
          <department code="342" default-location="ILN204/CG/DezFB/WiWi-BWL09"/>
          <department code="343" default-location="ILN204/CG/DezFB/WiWi-BWL10"/>
          <department code="345" default-location="ILN204/CG/DezFB/WiWi-VWL04"/>
          <!-- BIK 351 eigentlich nicht mehr aktiv, aber ggf. noch in CBS-Test -->
          <department code="351" default-location="ILN204/CG/DezFB/Fachbibliotheken"/>
          <department code="372" default-location="ILN204/CG/DezFB/ÖkologischerLandbau"/>
          <department code="374" default-location="ILN204/CG/DezFB/LW-Inklusion-ZfL"/>
          <department code="375" default-location="ILN204/CG/DezFB/LernwerkstattIFIB"/>
          <department code="376" default-location="ILN204/CG/DezFB/DidWerkSpr"/>
          <department code="380" default-location="ILN204/CG/DezFB/AKWildbiologie"/>
          <department code="950" default-location="ILN204/CG/Aufsatz/Aufsatzkatalogisate"/>
          <department code="992" default-location="ILN204/E/E/Onlinemedien"/>
          <department code="993" default-location="ILN204/E/E/Onlinemedien"/>
          <department code="994" default-location="ILN204/E/E/Onlinemedien"/>          
        </ranges>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$electronicholding">ILN204/E/E/Online Medien</xsl:when>
        <xsl:when test="$local-order">ILN204/CG/Aufsatz/Erwerbung-LT</xsl:when>
        <xsl:when test="$microform">ILN204/CG/UB/Mikroformen</xsl:when>
        <xsl:when test="$dummy-do">ILN204/CG/Aufsatz/dodummy</xsl:when>
        <xsl:when test="$dummy or $article-in-volume">ILN204/CG/Aufsatz/Aufsatzkatalogisate</xsl:when>
        <xsl:when test="$loan-type = 'a'">
          <xsl:choose>
            <xsl:when test="$abt = '000'">ILN204/CG/UB/Erwerbungssignatur</xsl:when>
            <xsl:when test="$abt = '002'">ILN204/CG/ZNL/Erwerbungssignatur</xsl:when>            
            <xsl:when test="$abt = '005'">ILN204/CG/ZHB/Erwerbungssignatur</xsl:when>
            <xsl:when test="$abt = '055'">ILN204/CG/ZP2/Erwerbungssignatur</xsl:when>
            <xsl:when test="$abt = '009'">ILN204/CG/ZP2/Erwerbungssignatur</xsl:when>
            <xsl:when test="$abt = '010'">ILN204/CG/ZRW/Erwerbungssignatur</xsl:when>
            <xsl:when test="$abt = '020'">ILN204/CG/ZRW/Erwerbungssignatur</xsl:when>
            <xsl:when test="$abt = '030'">ILN204/CG/ZP2/Erwerbungssignatur</xsl:when>
            <xsl:otherwise>ILN204/CG/UB/Erwerbungssignatur</xsl:otherwise>
          </xsl:choose>
        </xsl:when>        
        <xsl:when test="$hap">
          <xsl:choose>
            <xsl:when test="$abt = '000'">ILN204/CG/UB/Handapparate</xsl:when>
            <xsl:when test="$abt = '002'">ILN204/CG/ZNL/Handapparate</xsl:when>
            <xsl:when test="$abt = '005'">ILN204/CG/ZHB/Handapparate</xsl:when>
            <xsl:when test="$abt = '009'">ILN204/CG/ZP2/Handapparate</xsl:when>
            <xsl:when test="$abt = '010'">ILN204/CG/ZRW/Handapparate</xsl:when>
            <xsl:when test="$abt = '020'">ILN204/CG/ZRW/Handapparate</xsl:when>
            <xsl:when test="$abt = '030'">ILN204/CG/ZP2/Handapparate</xsl:when>
            <xsl:when test="$abt = '090'">ILN204/CG/DezFB/FB-Germanistik-HAP</xsl:when>
            <xsl:when test="$abt = '100'">ILN204/CG/DezFB/FB-Anglistik-HAP</xsl:when>
            <xsl:when test="$abt = '112'">ILN204/CG/DezFB/FB-Romanistik-HAP</xsl:when>
            <xsl:when test="$abt = '120'">ILN204/CG/DezFB/FB-Mathe-Informatik-HAP</xsl:when>
            <xsl:when test="$abt = '122'">ILN204/CG/DezFB/FB-Mathe-Informatik-HAP</xsl:when>
            <xsl:when test="$abt = '151'">ILN204/CG/DezFB/Hermann-Hoffmann-Akademie</xsl:when>
            <xsl:when test="$abt = '154'">ILN204/CG/DezFB/Zoologie1</xsl:when>
            <xsl:when test="$abt = '157'">ILN204/CG/DezFB/Genetik</xsl:when>
            <xsl:when test="$abt = '174'">ILN204/CG/DezFB/Veterinaeranatomie</xsl:when>
            <xsl:when test="$abt = '176'">ILN204/CG/DezFB/Biochemie-Endokrinologie</xsl:when>
            <xsl:when test="$abt = '177'">ILN204/CG/DezFB/Veterinärpathologie</xsl:when>
            <xsl:when test="$abt = '179'">ILN204/CG/DezFB/Tierhygiene</xsl:when>
            <xsl:when test="$abt = '180'">ILN204/CG/DezFB/Tierschutz-Ethologie</xsl:when>
            <xsl:when test="$abt = '184'">ILN204/CG/DezFB/Kleintier-Innere-Chirurgie</xsl:when>
            <xsl:when test="$abt = '185'">ILN204/CG/DezFB/Pferdeklinik</xsl:when>
            <xsl:when test="$abt = '189'">ILN204/CG/DezFB/Virologie</xsl:when>
            <xsl:when test="$abt = '190'">ILN204/CG/DezFB/Parhmakol-Toxikol-BFS</xsl:when>
            <xsl:when test="$abt = '192'">ILN204/CG/DezFB/Prozesstechnik</xsl:when>
            <xsl:when test="$abt = '236'">ILN204/CG/DezFB/Geschichte-der-Medizin</xsl:when>
            <xsl:when test="$abt = '259'">ILN204/CG/DezFB/Psychiat-Neurol</xsl:when>
            <xsl:when test="$abt = '331'">ILN204/CG/DezFB/WiWi-VWL01</xsl:when>
            <xsl:when test="$abt = '343'">ILN204/CG/DezFB/WiWi-BWL10</xsl:when>
            <xsl:otherwise>ILN204/CG/DezFB/Unbekannt</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$interlibrary-loan">
          <xsl:choose>
            <xsl:when test="$loan-type = 'u'">ILN204/CG/UB/UBFernleihen</xsl:when>
            <xsl:when test="$loan-type = 'd'">ILN204/CG/UB/UBFernleihen</xsl:when>
            <xsl:when test="$loan-type = 'i'">ILN204/CG/UB/UBFernleihenLesesaal</xsl:when>          
            <xsl:otherwise>ILN204/CG/UB/Unbekannt</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="
            exsl:node-set($ranges-list)/ranges/department[@code = $abt]/prefix or
            exsl:node-set($ranges-list)/ranges/department[@code = $abt]/range">
          <xsl:variable name="location-prefix-match">
            <xsl:call-template name="get-location-by-prefix">
              <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
              <xsl:with-param name="prefix-list"
                select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/prefix"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$location-prefix-match = ''">
              <xsl:call-template name="get-location-by-range">
                <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
                <xsl:with-param name="range-list"
                  select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/range"/>
                <xsl:with-param name="default-location"
                  select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/@default-location"
                />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$location-prefix-match"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of
            select="exsl:node-set($ranges-list)/ranges/department[@code = $abt]/@default-location"/>
        </xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <xsl:template match="permanentLoanTypeId">
    <xsl:variable name="loantype"
      select="key('original', .)/datafield[@tag = '209A']/subfield[@code = 'd']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=". = 'u'">0 u Ausleihbar</xsl:when>
        <xsl:when test=". = 'b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test=". = 'c'">2 c Lehrbuchsammlungsausleihe</xsl:when>
        <xsl:when test=". = 's'">3 s Präsenzbestand</xsl:when>
        <xsl:when test=". = 'd'">4 d Passive Fernleihe</xsl:when>
        <xsl:when test=". = 'i'">5 i Nur für den Lesesaal</xsl:when>
        <xsl:when test=". = 'f'">6 f nur Kopie möglich</xsl:when>
        <!-- ILN 8: in LBS3 nicht genutzt -->
        <!-- Status 7 mit 237A/481 Semesterausleihe erzeugen? = vertagt, da unklar, ob in Folio nutzbar und fuer CBS-Saetze nicht relevant -->
        <xsl:when test=". = 'e'">8 e Vermisst</xsl:when>
        <xsl:when test=". = 'a'">9 a Zur Erwerbung bestellt</xsl:when>
        <xsl:when test=". = 'g'">9 g Nicht ausleihbar</xsl:when>
        <xsl:when test=". = 'o'">9 o Ausleihstatus unbekannt</xsl:when>
        <xsl:when test=". = 'z'">9 z Verlust</xsl:when>
        <!-- <xsl:otherwise>0 u Ausleihbar</xsl:otherwise>  wg. Zs ohne $d? -->
        <xsl:otherwise>9 o Ausleihstatus unbekannt</xsl:otherwise>
        <!-- damit Sonderfaelle auffallen -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <xsl:template match="notes[ancestor::holdingsRecords]">
    <notes>
      <arr>
        <xsl:copy-of select="arr/i"/>
        <xsl:if test="../discoverySuppress[(substring(., 1, 1) = 'g') or (substring(., 1, 2) = 'pe')]">
          <i>
            <note>Diskrepanz 4850n-Selektionscode</note>
            <holdingsNoteTypeId>Note</holdingsNoteTypeId>
            <staffOnly>true</staffOnly>
          </i>
        </xsl:if>
      </arr>
    </notes>
  </xsl:template>

  <xsl:template match="discoverySuppress">
    <!-- uses 208@$b (und/oder Kat. 247E/XY ?) -->
    <discoverySuppress>
      <xsl:value-of select="(substring(., 1, 4) = 'true') or (substring(., 1, 1) = 'g') or (substring(., 1, 2) = 'pe')"/>
    </discoverySuppress>
  </xsl:template>

  <!-- Parsing call number for prefix - optional -->

  <xsl:template name="prefix">
    <!-- default, nutzt °,@  -->
    <xsl:param name="cn"/>
    <xsl:param name="cnprefixelement"/>
    <xsl:param name="cnelement"/>
    <xsl:variable name="cnprefix">
      <xsl:choose>
        <xsl:when test="contains($cn, '°')">
          <xsl:value-of select="concat(substring-before($cn, '°'), '°')"/>
        </xsl:when>
        <xsl:when test="contains($cn, '@')">
          <xsl:value-of select="substring-before($cn, '@')"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:message>Debug: <xsl:value-of select="$cnelement"/> Prefix "<xsl:value-of select="$cnprefix"
      />"</xsl:message>
    <xsl:if test="string-length($cnprefix) > 0">
      <xsl:element name="{$cnprefixelement}">
        <xsl:value-of select="normalize-space(translate($cnprefix, '@', ''))"/>
      </xsl:element>
    </xsl:if>
    <xsl:element name="{$cnelement}">
      <xsl:value-of select="normalize-space(translate(substring-after($cn, $cnprefix), '@', ''))"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="callNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'callNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'callNumber'"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="itemLevelCallNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'itemLevelCallNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'itemLevelCallNumber'"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="check-range">
    <!-- Checks if the string signature-short-lowercase is in the range defined
      by the strings range-start and range-end.
      
      The three strings are getting sorted by comparing char by char with a
      predefined sort key. If each char of signature-short-lowercase
      is between the corresponding char of range-start and range-end, the
      template returns 1, otherwise 0.
      
      Inspired by https://weinert-automation.de/pub/XSLT1.0RangeFilter.pdf        
    -->

    <xsl:param name="signature-short-lowercase"/>
    <xsl:param name="range-start"/>
    <xsl:param name="range-end"/>
    <xsl:param name="i" select="1"/>
    <xsl:param name="o" select="1"/>
    <xsl:variable name="sortChar">'0123456789aäbcdefghijklmnoöpqrsßtuüvwxyz'</xsl:variable>
    <xsl:variable name="frmFrst">
      <xsl:value-of select="substring($range-start, $i, 1)"/>
    </xsl:variable>
    <xsl:variable name="befFrst">
      <xsl:value-of select="substring($range-end, $i, 1)"/>
    </xsl:variable>
    <xsl:variable name="frmCmp">
      <xsl:value-of select="
          string-length(
          substring-before($sortChar, $frmFrst))"/>
    </xsl:variable>
    <xsl:variable name="befTmp">
      <xsl:value-of select="
          string-length(
          substring-before($sortChar, $befFrst))"/>
    </xsl:variable>
    <xsl:variable name="befCmp">
      <xsl:choose>
        <xsl:when test="$befTmp = 0">99</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$befTmp"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when
        test="$i > string-length($signature-short-lowercase) and $o > string-length($signature-short-lowercase)">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="idFrst">
          <xsl:value-of select="substring($signature-short-lowercase, $i, 1)"/>
        </xsl:variable>
        <xsl:variable name="idCmp">
          <xsl:value-of select="string-length(substring-before($sortChar, $idFrst))"/>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$idCmp >= $frmCmp and $befCmp >= $idCmp">
            <xsl:call-template name="check-range">
              <xsl:with-param name="signature-short-lowercase" select="$signature-short-lowercase"/>
              <xsl:with-param name="range-start" select="$range-start"/>
              <xsl:with-param name="range-end" select="$range-end"/>
              <xsl:with-param name="i" select="$i + 1"/>
              <xsl:with-param name="o" select="$o + 1"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="0"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="compare-tokens">
    <xsl:param name="signature-lowercase-trimmed"/>
    <xsl:param name="range-from"/>
    <xsl:param name="range-to"/>
    <xsl:param name="in-range"/>

    <xsl:variable name="range-from-tokens">
      <xsl:call-template name="tokenize">
        <xsl:with-param name="text" select="translate($range-from, ' /.-,()', '||||||')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="range-to-tokens">
      <xsl:call-template name="tokenize">
        <xsl:with-param name="text" select="translate($range-to, ' /.-,()', '||||||')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="signature-tokens">
      <xsl:call-template name="tokenize">
        <xsl:with-param name="text" select="translate($signature-lowercase-trimmed, ' /.-,()', '|||||||')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="comparison-token-position">
      <xsl:call-template name="get-first-non-identical-token">
        <xsl:with-param name="range-from-tokens" select="$range-from-tokens"/>
        <xsl:with-param name="range-to-tokens" select="$range-to-tokens"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="identical-prefix">
      <xsl:call-template name="concat-items">
        <xsl:with-param name="items"
          select="exsl:node-set($range-from-tokens)/item[position() &lt; $comparison-token-position]"
        />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="signature-prefix">
      <xsl:call-template name="concat-items">
        <xsl:with-param name="items"
          select="exsl:node-set($signature-tokens)/item[position() &lt; $comparison-token-position]"
        />
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="
          $identical-prefix = $signature-prefix or
          $comparison-token-position = 1">
        <xsl:variable name="range-from-comparison-token">
          <xsl:value-of
            select="exsl:node-set($range-from-tokens)/item[position() = $comparison-token-position]"
          />
        </xsl:variable>
        <xsl:variable name="range-to-comparison-token">
          <xsl:value-of
            select="exsl:node-set($range-to-tokens)/item[position() = $comparison-token-position]"/>
        </xsl:variable>
        <xsl:variable name="signature-comparison-token">
          <xsl:choose>
            <!-- Numerical comparison: range-from < signature-token < range-to
              Comparison token won't be truncated to the length of of the range to token
              e.g. B 6061 is range when range-from is B 74 and range-to is B 99999
              but B 6061 is not in range when range-from is B 49 and range-to is B 73
              because B 6061 is not truncated to B 60
            -->
            <xsl:when
              test="string(number(exsl:node-set($signature-tokens)/item[position() = $comparison-token-position])) != 'NaN'">
              <xsl:value-of select="string(number(exsl:node-set($signature-tokens)/item[position() = $comparison-token-position]))"/>
            </xsl:when>
            <!-- String comparison -->
            <xsl:otherwise>
              <xsl:value-of select="exsl:node-set($signature-tokens)/item[position() = $comparison-token-position]"/>
            </xsl:otherwise>
          </xsl:choose>

        </xsl:variable>
        <xsl:choose>
          <xsl:when test="
              string(number($signature-comparison-token)) != 'NaN' and
              string(number($range-from-comparison-token)) != 'NaN' and
              string(number($range-to-comparison-token)) != 'NaN'">
            <!-- The current signature token and the comparison tokens, e.g. the from token and the to token
              can be converted to a number. Therefore a numeric comparison decides whether the signature
              token fits in the range. -->
            <xsl:choose>
              <xsl:when test="
                  number($range-from-comparison-token) &lt;= number($signature-comparison-token) and
                  number($signature-comparison-token) &lt;= number($range-to-comparison-token)">
                <xsl:value-of select="1"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="0"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <!-- String comparison if the tokens can't be converted to a number.
                 Tokens are truncated to the minimum string length of either from or to comparison token.
              -->
            <xsl:call-template name="check-range">
              <xsl:with-param name="signature-short-lowercase" select="substring($signature-comparison-token, 1, 
                                                                        min((string-length($range-from-comparison-token),
                                                                           string-length($range-to-comparison-token))
                                                                          )
                                                                       )"/>
              <xsl:with-param name="range-start" select="substring($range-from-comparison-token, 1, 
                                                           min((string-length($range-from-comparison-token),
                                                               string-length($range-to-comparison-token))
                                                              )
                                                           )"/>
              <xsl:with-param name="range-end" select="substring($range-to-comparison-token, 1, 
                                                           min((string-length($range-from-comparison-token),
                                                               string-length($range-to-comparison-token))
                                                              )
                                                           )"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="concat-items">
    <xsl:param name="items"/>
    <xsl:for-each select="$items">
      <xsl:value-of select="."/>
      <xsl:if test="position() != last()">
        <xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="get-first-non-identical-token">
    <xsl:param name="range-from-tokens"/>
    <xsl:param name="range-to-tokens"/>
    <xsl:param name="current-position" select="1"/>
    <xsl:choose>
      <xsl:when
        test="exsl:node-set($range-from-tokens)/item[1] = exsl:node-set($range-to-tokens)/item[1]">
        <xsl:variable name="range-from-tokens-rest">
          <xsl:for-each select="exsl:node-set($range-from-tokens)/item[position() != 1]">
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="range-to-tokens-rest">
          <xsl:for-each select="exsl:node-set($range-to-tokens)/item[position() != 1]">
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:call-template name="get-first-non-identical-token">
          <xsl:with-param name="range-from-tokens" select="$range-from-tokens-rest"/>
          <xsl:with-param name="range-to-tokens" select="$range-to-tokens-rest"/>
          <xsl:with-param name="current-position" select="$current-position + 1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$current-position"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="get-location-by-prefix">
    <xsl:param name="signature-lowercase"/>
    <xsl:param name="prefix-list"/>
    <xsl:if test="$prefix-list">
      <xsl:variable name="prefix-zeroless">
        <xsl:value-of select="$prefix-list[1]"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="starts-with($signature-lowercase, $prefix-zeroless)">
          <xsl:value-of select="$prefix-list/@location"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="get-location-by-prefix">
            <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
            <xsl:with-param name="prefix-list" select="$prefix-list[position() != 1]"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="get-location-by-range">
    <xsl:param name="signature-lowercase"/>
    <xsl:param name="range-list"/>
    <xsl:param name="last-range"/>
    <xsl:param name="in-range"/>
    <xsl:param name="default-location" select="'Unbekannter Standort'"/>
    <xsl:choose>
      <xsl:when test="$in-range = 1">
        <xsl:value-of select="$last-range/@location"/>
      </xsl:when>
      <xsl:when test="$range-list">
        <!-- if there are unchecked ranges more ranges, test them -->
        <xsl:call-template name="get-location-by-range">
          <xsl:with-param name="signature-lowercase" select="$signature-lowercase"/>
          <xsl:with-param name="last-range" select="$range-list[1]"/>
          <xsl:with-param name="range-list" select="$range-list[position() != 1]"/>
          <xsl:with-param name="in-range">
            <xsl:call-template name="compare-tokens">
              <xsl:with-param name="signature-lowercase-trimmed">
                <!--<xsl:value-of
                  select="substring($signature-lowercase, 1, string-length($range-list[1]/@to))"
                />-->
                <xsl:value-of select="$signature-lowercase"/>
              </xsl:with-param>
              <xsl:with-param name="range-from">
                <xsl:value-of select="$range-list[1]/@from"/>
              </xsl:with-param>
              <xsl:with-param name="range-to">
                <xsl:value-of select="$range-list[1]/@to"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="default-location" select="$default-location"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!-- range-list has been exhausted -->
        <xsl:value-of select="$default-location"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="remove-leading-zeros">
    <xsl:param name="range-string"/>
    <xsl:choose>
      <xsl:when test="
          string-length($range-string) >= 6 and
          not(contains(substring($range-string, 1, 6), ' '))">
        <xsl:choose>
          <xsl:when test="string(number(substring($range-string, 1, 6))) != 'NaN'">
            <xsl:value-of select="translate(substring($range-string, 1, 6), '0', '')"/>
            <xsl:value-of select="substring($range-string, 7)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring($range-string, 1, 1)"/>
            <xsl:call-template name="remove-leading-zeros">
              <xsl:with-param name="range-string" select="substring($range-string, 2)"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$range-string != ''">
          <xsl:value-of select="substring($range-string, 1, 1)"/>
          <xsl:call-template name="remove-leading-zeros">
            <xsl:with-param name="range-string" select="substring($range-string, 2)"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Tokenize a string that's pipe separated -->
  <!-- Source: https://gist.github.com/rnelson/395bccd30092cedca87f -->
  <xsl:template name="tokenize">
    <xsl:param name="text"/>
    <xsl:param name="separator" select="'|'"/>
    <xsl:choose>
      <xsl:when test="not(contains($text, $separator))">
        <item>
          <xsl:value-of select="normalize-space($text)"/>
        </item>
      </xsl:when>
      <xsl:otherwise>
        <item>
          <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
        </item>
        <xsl:call-template name="tokenize">
          <xsl:with-param name="text" select="substring-after($text, $separator)"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
