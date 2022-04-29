<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
    
  <!-- Map item note types -->
  <xsl:template match="itemNoteTypeId">
    <itemNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Binding'">87c450be-2033-41fb-80ba-dd2409883681</xsl:when>
        <xsl:when test=".='Note'">8d0a5eca-25de-4391-81a9-236eeefdd20b</xsl:when>
        <xsl:when test=".='Reproduction'">acb3a58f-1d72-461d-97c3-0e7119e8d544</xsl:when>
        <xsl:when test=".='Electronic bookplate'">f3ae3823-d096-4c65-8734-0c1efd2ffea8</xsl:when>
        <xsl:when test=".='Action note'">0e40884c-3523-4c6d-8187-d578e3d2794e</xsl:when>
        <xsl:when test=".='Copy note'">1dde7141-ec8a-4dae-9825-49ce14c728e7</xsl:when>
        <xsl:when test=".='Provenance'">c3a539b9-9576-4e3a-b6de-d910200b2919</xsl:when>
        <xsl:when test=".='Abrufzeichen exemplarspezifisch (8600)'">1f679b18-3a4d-421a-aa8f-8a0d8f758f71</xsl:when>
        <xsl:otherwise>8d0a5eca-25de-4391-81a9-236eeefdd20b</xsl:otherwise>
      </xsl:choose>
    </itemNoteTypeId>
  </xsl:template>

  <!-- Map instance note types -->
  <xsl:template match="instanceNoteTypeId">
    <instanceNoteTypeId>
      <xsl:choose>
        <xsl:when test=".='Information related to Copyright Status'">654be0fd-bba2-4791-afa3-ae60300d7043</xsl:when>
        <xsl:when test=".='Supplement note'">aecfda7a-e8aa-46d6-9046-9b0b8c231b85</xsl:when>
        <xsl:when test=".='Bibliography note'">86b6e817-e1bc-42fb-bab0-70e7547de6c1</xsl:when>
        <xsl:when test=".='Exhibitions note'">0ed2da88-3f81-42f5-b688-91b70919d9bb</xsl:when>
        <xsl:when test=".='Data quality note'">7929eee7-6822-4199-8df4-bb2ae773e4cd</xsl:when>
        <xsl:when test=".='Numbering peculiarities note'">cf635f41-29e7-4dd0-8598-33f230157074</xsl:when>
        <xsl:when test=".='Type of computer file or data note'">3d931c23-6ae8-4e5a-8802-dc8c2e21ea19</xsl:when>
        <xsl:when test=".='Local notes'">265c4910-3997-4242-9269-6a4a2e91392b</xsl:when>
        <xsl:when test=".='Language note'">7356cde5-ec6b-4961-9cb0-961c48a37af4</xsl:when>
        <xsl:when test=".='Publications About Described Materials note'">e0ea861c-959f-4912-8579-5e9ea8a69454</xsl:when>
        <xsl:when test=".='Biographical or Historical Data'">c636881b-8927-4480-ad1b-8d7b27b4bbfe</xsl:when>
        <xsl:when test=".='Additional Physical Form Available note'">1d51e8b2-dee7-43f5-983c-a40757b9cdfa</xsl:when>
        <xsl:when test=".='System Details note'">95f62ca7-5df5-4a51-9890-d0ec3a34665f</xsl:when>
        <xsl:when test=".='Target Audience note'">922fdcde-952d-45c2-b9ea-5fc8959ad116</xsl:when>
        <xsl:when test=".='Cartographic Mathematical Data'">794f19f1-d00b-4b4b-97e9-0de5a34495a0</xsl:when>
        <xsl:when test=".='Linking Entry Complexity note'">779c22a2-311c-4ebb-b71e-b246c7ee574d</xsl:when>
        <xsl:when test=".='Funding Information Note'">f289c02b-9515-4c3f-b242-ffd071e82135</xsl:when>
        <xsl:when test=".='Reproduction note'">d548fdff-b71c-4359-8055-f1c008c30f01</xsl:when>
        <xsl:when test=".='Formatted Contents Note'">5ba8e385-0e27-462e-a571-ffa1fa34ea54</xsl:when>
        <xsl:when test=".='Geographic Coverage note'">28e12ad3-4a8d-48cc-b56c-a5ded22fc844</xsl:when>
        <xsl:when test=".='Terms Governing Use and Reproduction note'">f677d908-69c6-4450-94a6-abbcf94a1ee5</xsl:when>
        <xsl:when test=".='Immediate Source of Acquisition note'">86c4bd09-16de-45ee-89d3-b6d32fae6de9</xsl:when>
        <xsl:when test=".='Accessibility note'">a6a5550f-4981-4b48-b821-a57d5c8ca3b3</xsl:when>
        <xsl:when test=".='Information About Documentation note'">13047c94-7d2c-4c41-9658-abacfa97a5c8</xsl:when>
        <xsl:when test=".='Preferred Citation of Described Materials note'">09812302-92f7-497e-9120-ed25de458ea5</xsl:when>
        <xsl:when test=".='Type of report and period covered note'">f939b820-4a23-43d1-84ba-101add6e1456</xsl:when>
        <xsl:when test=".='Original Version note'">42be8949-6f69-4c55-874b-60b744ac1103</xsl:when>
        <xsl:when test=".='Creation / Production Credits note'">9f08c9b7-500a-43e0-b00f-ba02396b198f</xsl:when>
        <xsl:when test=".='Entity and Attribute Information note'">1cb8ac76-01fa-49be-8b9c-fcdaf17458a5</xsl:when>
        <xsl:when test=".='Copy and Version Identification note'">ec9f8285-6bf9-4e6c-a3cb-38ef17f0317f</xsl:when>
        <xsl:when test=".='Awards note'">e8cdc2fe-c53c-478a-a7f3-47f2fc79c6d4</xsl:when>
        <xsl:when test=".='Location of Other Archival Materials note'">9a4b39f4-a7d5-4c4d-abc6-5ccf1fc1d78c</xsl:when>
        <xsl:when test=".='Summary'">10e2e11b-450f-45c8-b09b-0f819999966e</xsl:when>
        <xsl:when test=".='Participant or Performer note'">9b56b954-7f3b-4e4b-8ed0-cf40aef13975</xsl:when>
        <xsl:when test=".='Restrictions on Access note'">e814a32e-02da-4773-8f3a-6629cdb7ecdf</xsl:when>
        <xsl:when test=".='With note'">06b44741-888e-4b15-a75e-cb29e27752d1</xsl:when>
        <xsl:when test=".='Date / time and place of an event note'">43295b78-3bfa-4c28-bc7f-8d924f63493f</xsl:when>
        <xsl:when test=".='Scale note for graphic material'">72c611ab-f353-4c09-a0cc-33ff96cc3bef</xsl:when>
        <xsl:when test=".='Action note'">1c017b8d-c783-4f63-b620-079f7a5b9c07</xsl:when>
        <xsl:when test=".='Citation / References note'">6ca9df3f-454d-4b5b-9d41-feb5d5030b99</xsl:when>
        <xsl:when test=".='Binding Information note'">0dc69a30-6d2b-40df-a50e-e4982bda86f4</xsl:when>
        <xsl:when test=".='Source of Description note'">66ea8f28-d5da-426a-a7c9-739a5d676347</xsl:when>
        <xsl:when test=".='Ownership and Custodial History note'">56cf513e-a738-40c5-a3ab-b0c60ba07e15</xsl:when>
        <xsl:when test=".='Cumulative Index / Finding Aides notes'">fda2f2e3-965f-4220-8a2b-93d35ce6d582</xsl:when>
        <xsl:when test=".='Location of Originals / Duplicates note'">c6340b85-d048-426a-89aa-163cfb801a56</xsl:when>
        <xsl:when test=".='Methodology note'">02b5b0c6-3375-4912-ac75-ad9f552362b2</xsl:when>
        <xsl:when test=".='General note'">6a2533a7-4de2-4e64-8466-074c2fa9308c</xsl:when>
        <xsl:when test=".='Case File Characteristics note'">6f76f4e7-9c0b-4138-9371-09b36136372d</xsl:when>
        <xsl:when test=".='Accumulation and Frequency of Use note'">1c7acba3-523d-4237-acd2-e88549bfc660</xsl:when>
        <xsl:when test=".='Former Title Complexity note'">806cb024-80d2-47c2-8bbf-b91091c85f68</xsl:when>
        <xsl:when test=".='Study Program Information note'">06489647-c7b7-4b6c-878a-cb7c1178e9ca</xsl:when>
        <xsl:when test=".='Issuing Body note'">49475f04-35ef-4f8a-aa7f-92773594ca76</xsl:when>
        <xsl:when test=".='Dissertation note'">b73cc9c2-c9fa-49aa-964f-5ae1aa754ecd</xsl:when>
        <xsl:otherwise>6a2533a7-4de2-4e64-8466-074c2fa9308c</xsl:otherwise>
      </xsl:choose>
    </instanceNoteTypeId>
  </xsl:template>

  <!-- Map Aternative titles -->
  <xsl:template match="alternativeTitleTypeId">
    <alternativeTitleTypeId>
      <xsl:choose>
        <xsl:when test=".='Cover title'">5c364ce4-c8fd-4891-a28d-bb91c9bcdbfb</xsl:when>
        <xsl:when test=".='Running title'">09964ad1-7aed-49b8-8223-a4c105e3ef87</xsl:when>
        <xsl:when test=".='Caption title'">432ca81a-fe4d-4249-bfd3-53388725647d</xsl:when>
        <xsl:when test=".='Uniform title'">30512027-cdc9-4c79-af75-1565b3bd888d</xsl:when>
        <xsl:when test=".='Parallel title'">4bb300a4-04c9-414b-bfbc-9c032f74b7b2</xsl:when>
        <xsl:when test=".='Distinctive title'">781c04a4-f41e-4ab0-9118-6836e93de3c8</xsl:when>
        <xsl:when test=".='No type specified'">0fe58901-183e-4678-a3aa-0b4751174ba8</xsl:when>
        <xsl:when test=".='Spine title'">dae08d04-8c4e-4ab2-b6bb-99edbf252231</xsl:when>
        <xsl:when test=".='Added title page title'">2ca8538d-a2fd-4e60-b967-1cb220101e22</xsl:when>
        <xsl:when test=".='Portion of title'">a8b45056-2223-43ca-8514-4dd88ece984b</xsl:when>
        <xsl:otherwise>0fe58901-183e-4678-a3aa-0b4751174ba8</xsl:otherwise>
      </xsl:choose>
    </alternativeTitleTypeId>
  </xsl:template>
  
  <!-- Map material types -->
  <xsl:template match="materialTypeId">
    <materialTypeId>
      <xsl:choose>
        <!-- <xsl:when test=".='0 Druckschrift'">24080190-7539-4520-bde1-762f57d006fc</xsl:when> --> 
        <xsl:when test=".='Audiovisuelles Material'">e378db32-4422-405d-bf08-89efd33335fd</xsl:when>
        <xsl:when test=".='Tonträger'">baed4206-eef1-4c00-8126-d159a2113a71</xsl:when>
        <xsl:when test=".='Computerlesbares Material'">a662fc3c-6a6e-4992-a38b-a74f875204c1</xsl:when>
        <xsl:when test=".='Karten'">e8b94e9e-4144-46a8-b31c-774978d1c5ec</xsl:when>
        <xsl:when test=".='Noten'">79edde01-85ce-451b-870a-edbfcbd8dbd7</xsl:when>
        <xsl:when test=".='Mikroformen'">0a877486-1efb-43c2-b0e6-d539dd352aa2</xsl:when>
        <xsl:when test=".='Sonstiges'">789c3cc7-54ac-41ed-90c6-da7fb417574a</xsl:when>
        <xsl:otherwise>24080190-7539-4520-bde1-762f57d006fc</xsl:otherwise>
      </xsl:choose>
    </materialTypeId>
  </xsl:template>
  
  <!-- Map contrutor type codes to uuid-->
  <xsl:template match="contributorTypeId">
    <contributorTypeId>
      <xsl:choose>
        <xsl:when test=".='arc'">754edaff-07bb-45eb-88bf-10a8b6842c38</xsl:when>
        <xsl:when test=".='cov'">b7000ced-c847-4b43-8f29-c5325e6279a8</xsl:when>
        <xsl:when test=".='bkp'">c9c3bbe8-d305-48ef-ab2a-5eff941550e3</xsl:when>
        <xsl:when test=".='prc'">5ee1e598-72b8-44d5-8edd-173e7bc4cf8c</xsl:when>
        <xsl:when test=".='dpc'">d32885eb-b82c-4391-abb2-4582c8ee02b3</xsl:when>
        <xsl:when test=".='pre'">d04782ec-b969-4eac-9428-0eb52d97c644</xsl:when>
        <xsl:when test=".='abr'">28de45ae-f0ca-46fe-9f89-283313b3255b</xsl:when>
        <xsl:when test=".='pop'">fd0a47ec-58ce-43f6-8ecc-696ec17a98ab</xsl:when>
        <xsl:when test=".='ccp'">3db02638-598e-44a3-aafa-cbae77533ee1</xsl:when>
        <xsl:when test=".='bnd'">f90c67e8-d1fa-4fe9-b98b-cbc3f019c65f</xsl:when>
        <xsl:when test=".='cph'">2b7080f7-d03d-46af-86f0-40ea02867362</xsl:when>
        <xsl:when test=".='lyr'">398a0a2f-752d-4496-8737-e6df7c29aaa7</xsl:when>
        <xsl:when test=".='prd'">b13f6a89-d2e3-4264-8418-07ad4de6a626</xsl:when>
        <xsl:when test=".='aft'">d517010e-908f-49d6-b1e8-8c1a5f9a7f1c</xsl:when>
        <xsl:when test=".='egr'">af9a58fa-95df-4139-a06d-ecdab0b2317e</xsl:when>
        <xsl:when test=".='rth'">44eaf0db-85dd-4888-ac8d-a5976dd483a6</xsl:when>
        <xsl:when test=".='his'">81b2174a-06b9-48f5-8c49-6cbaf7b869fe</xsl:when>
        <xsl:when test=".='ctg'">22286157-3058-434c-9009-8f8d100fc74a</xsl:when>
        <xsl:when test=".='spy'">2fba7b2e-26bc-4ac5-93cb-73e31e554377</xsl:when>
        <xsl:when test=".='ard'">255be0dd-54d0-4161-9c6c-4d1f58310303</xsl:when>
        <xsl:when test=".='csp'">7bebb5a2-9332-4ba7-a258-875143b5d754</xsl:when>
        <xsl:when test=".='cpc'">5d92d9de-adf3-4dea-93b5-580e9a88e696</xsl:when>
        <xsl:when test=".='led'">d791c3b9-993a-4203-ac81-3fb3f14793ae</xsl:when>
        <xsl:when test=".='prs'">8210b9d7-8fe7-41b7-8c5f-6e0485b50725</xsl:when>
        <xsl:when test=".='anl'">396f4b4d-5b0a-4fb4-941b-993ebf63db2e</xsl:when>
        <xsl:when test=".='str'">7e5b0859-80c1-4e78-a5e7-61979862c1fa</xsl:when>
        <xsl:when test=".='col'">dd44e44e-a153-4ab6-9a7c-f3d23b6c4676</xsl:when>
        <xsl:when test=".='wam'">913233b3-b2a0-4635-8dad-49b6fc515fc5</xsl:when>
        <xsl:when test=".='arr'">ac64c865-4f29-4d51-8b43-7816a5217f04</xsl:when>
        <xsl:when test=".='bsl'">50a6d58a-cea2-42a1-8c57-0c6fde225c93</xsl:when>
        <xsl:when test=".='att'">d836488a-8d0e-42ad-9091-b63fe885fe03</xsl:when>
        <xsl:when test=".='lie'">7d60c4bf-5ddc-483a-b179-af6f1a76efbe</xsl:when>
        <xsl:when test=".='sgn'">12a73179-1283-4828-8fd9-065e18dc2e78</xsl:when>
        <xsl:when test=".='dte'">0d8dc4be-e87b-43df-90d4-1ed60c4e08c5</xsl:when>
        <xsl:when test=".='ctt'">e8423d78-7b08-4f81-8f34-4871d5e2b7af</xsl:when>
        <xsl:when test=".='dtc'">00311f78-e990-4d8b-907e-c67a3664fe15</xsl:when>
        <xsl:when test=".='res'">fec4d84b-0421-4d15-b53f-d5104f39b3ca</xsl:when>
        <xsl:when test=".='pbl'">a60314d4-c3c6-4e29-92fa-86cc6ace4d56</xsl:when>
        <xsl:when test=".='wal'">cb8fdd3f-7193-4096-934c-3efea46b1138</xsl:when>
        <xsl:when test=".='mfr'">d669122b-c021-46f5-a911-1e9df10b6542</xsl:when>
        <xsl:when test=".='trl'">3322b734-ce38-4cd4-815d-8983352837cc</xsl:when>
        <xsl:when test=".='lit'">52c08141-307f-4997-9799-db97076a2eb3</xsl:when>
        <xsl:when test=".='inv'">21430354-f17a-4ac1-8545-1a5907cd15e5</xsl:when>
        <xsl:when test=".='crt'">bd13d6d3-e604-4b80-9c5f-4d68115ba616</xsl:when>
        <xsl:when test=".='drt'">12101b05-afcb-4159-9ee4-c207378ef910</xsl:when>
        <xsl:when test=".='apl'">7d0a897c-4f83-493a-a0c5-5e040cdce75b</xsl:when>
        <xsl:when test=".='pth'">2cb49b06-5aeb-4e84-8160-79d13c6357ed</xsl:when>
        <xsl:when test=".='fnd'">3555bf7f-a6cc-4890-b050-9c428eabf579</xsl:when>
        <xsl:when test=".='fds'">60d3f16f-958a-45c2-bb39-69cc9eb3835e</xsl:when>
        <xsl:when test=".='hst'">abfa3014-7349-444b-aace-9d28efa5ede4</xsl:when>
        <xsl:when test=".='mdc'">ee04a129-f2e4-4fd7-8342-7a73a0700665</xsl:when>
        <xsl:when test=".='elg'">5b2de939-879c-45b4-817d-c29fd16b78a0</xsl:when>
        <xsl:when test=".='brl'">a986c8f2-b36a-400d-b09f-9250a753563c</xsl:when>
        <xsl:when test=".='com'">27aeee86-4099-466d-ba10-6d876e6f293b</xsl:when>
        <xsl:when test=".='tyd'">a2c9e8b5-edb4-49dc-98ba-27f0b8b5cebf</xsl:when>
        <xsl:when test=".='rsr'">cf04404a-d628-432b-b190-6694c5a3dc4b</xsl:when>
        <xsl:when test=".='drm'">33aa4117-95d1-4eb5-986b-dfba809871f6</xsl:when>
        <xsl:when test=".='cas'">468ac852-339e-43b7-8e94-7e2ce475cb00</xsl:when>
        <xsl:when test=".='tld'">af09f37e-12f5-46db-a532-ccd6a8877f2d</xsl:when>
        <xsl:when test=".='tlp'">3ed655b0-505b-43fe-a4c6-397789449a5b</xsl:when>
        <xsl:when test=".='rsg'">453e4f4a-cda9-4cfa-b93d-3faeb18a85db</xsl:when>
        <xsl:when test=".='cli'">ec0959b3-becc-4abd-87b0-3e02cf2665cc</xsl:when>
        <xsl:when test=".='cll'">8999f7cb-6d9a-4be7-aeed-4cc6aae35a8c</xsl:when>
        <xsl:when test=".='lbt'">6d5779a3-e692-4a24-a5ee-d1ce8a6eae47</xsl:when>
        <xsl:when test=".='rce'">ab7a95da-590c-4955-b03b-9d8fbc6c1fe6</xsl:when>
        <xsl:when test=".='coe'">9945290f-bcd7-4515-81fd-09e23567b75d</xsl:when>
        <xsl:when test=".='mod'">e79ca231-af4c-4724-8fe1-eabafd2e0bec</xsl:when>
        <xsl:when test=".='vdg'">c6005151-7005-4ee7-8d6d-a6b72d25377a</xsl:when>
        <xsl:when test=".='asn'">9593efce-a42d-4991-9aad-3a4dc07abb1e</xsl:when>
        <xsl:when test=".='edt'">9deb29d1-3e71-4951-9413-a80adac703d0</xsl:when>
        <xsl:when test=".='rse'">7156fd73-b8ca-4e09-a002-bb2afaaf259a</xsl:when>
        <xsl:when test=".='cng'">2a3e2d58-3a21-4e35-b7e4-cffb197750e3</xsl:when>
        <xsl:when test=".='stl'">a3642006-14ab-4816-b5ac-533e4971417a</xsl:when>
        <xsl:when test=".='app'">ca3b9559-f178-41e8-aa88-6b2c367025f9</xsl:when>
        <xsl:when test=".='ppt'">4f7c335d-a9d9-4f38-87ef-9a5846b63e7f</xsl:when>
        <xsl:when test=".='pro'">81bbe282-dca7-4763-bf5a-fe28c8939988</xsl:when>
        <xsl:when test=".='enj'">61afcb8a-8c53-445b-93b9-38e799721f82</xsl:when>
        <xsl:when test=".='bjd'">acad26a9-e288-4385-bea1-0560bb884b7a</xsl:when>
        <xsl:when test=".='auc'">5c132335-8ad0-47bf-a4d1-6dda0a3a2654</xsl:when>
        <xsl:when test=".='adi'">e2a1a9dc-4aec-4bb5-ae43-99bb0383516a</xsl:when>
        <xsl:when test=".='stm'">b02cbeb7-8ca7-4bf4-8d58-ce943b4d5ea3</xsl:when>
        <xsl:when test=".='rcd'">b388c02a-19dc-4948-916d-3688007b9a2c</xsl:when>
        <xsl:when test=".='lel'">61c9f06f-620a-4423-8c78-c698b9bb555f</xsl:when>
        <xsl:when test=".='prm'">d6a6d28c-1bfc-46df-b2ba-6cb377a6151e</xsl:when>
        <xsl:when test=".='ill'">3add6049-0b63-4fec-9892-e3867e7358e2</xsl:when>
        <xsl:when test=".='pmn'">3cbd0832-328e-48f5-96c4-6f7bcf341461</xsl:when>
        <xsl:when test=".='spn'">38c09577-6652-4281-a391-4caabe4c09b6</xsl:when>
        <xsl:when test=".='prg'">b47d8841-112e-43be-b992-eccb5747eb50</xsl:when>
        <xsl:when test=".='own'">21dda3dc-cebd-4018-8db2-4f6d50ce3d02</xsl:when>
        <xsl:when test=".='itr'">18ba15a9-0502-4fa2-ad41-daab9d5ab7bb</xsl:when>
        <xsl:when test=".='pbd'">2d046e17-742b-4d99-8e25-836cc141fee9</xsl:when>
        <xsl:when test=".='edc'">863e41e3-b9c5-44fb-abeb-a8ab536bb432</xsl:when>
        <xsl:when test=".='sce'">05875ac5-a509-4a51-a6ee-b8051e37c7b0</xsl:when>
        <xsl:when test=".='ldr'">f74dfba3-ea20-471b-8c4f-5d9b7895d3b5</xsl:when>
        <xsl:when test=".='cpe'">6358626f-aa02-4c40-8e73-fb202fa5fb4d</xsl:when>
        <xsl:when test=".='fac'">036b6349-27c8-4b68-8875-79cb8e0fd459</xsl:when>
        <xsl:when test=".='nrt'">2c345cb7-0420-4a7d-93ce-b51fb636cce6</xsl:when>
        <xsl:when test=".='clr'">81c01802-f61b-4548-954a-22aab027f6e5</xsl:when>
        <xsl:when test=".='fld'">2576c328-61f1-4684-83cf-4376a66f7731</xsl:when>
        <xsl:when test=".='cwt'">316cd382-a4fe-4939-b06e-e7199bfdbc7a</xsl:when>
        <xsl:when test=".='rcp'">94e6a5a8-b84f-44f7-b900-71cd10ea954e</xsl:when>
        <xsl:when test=".='pht'">1aae8ca3-4ddd-4549-a769-116b75f3c773</xsl:when>
        <xsl:when test=".='lsa'">3c1508ab-fbcc-4500-b319-10885570fe2f</xsl:when>
        <xsl:when test=".='dfe'">3ebe73f4-0895-4979-a5e3-2b3e9c63acd6</xsl:when>
        <xsl:when test=".='prn'">b318e49c-f2ad-498c-8106-57b5544f9bb0</xsl:when>
        <xsl:when test=".='pte'">45747710-39dc-47ec-b2b3-024d757f997e</xsl:when>
        <xsl:when test=".='cmm'">e0dc043c-0a4d-499b-a8a8-4cc9b0869cf3</xsl:when>
        <xsl:when test=".='uvp'">fec9ae68-6b55-4dd6-9637-3a694fb6a82b</xsl:when>
        <xsl:when test=".='rtm'">54fd209c-d552-43eb-850f-d31f557170b9</xsl:when>
        <xsl:when test=".='dln'">e04bea27-813b-4765-9ba1-e98e0fca7101</xsl:when>
        <xsl:when test=".='srv'">a21a56ea-5136-439a-a513-0bffa53402de</xsl:when>
        <xsl:when test=".='ive'">e7e8fc17-7c97-4a37-8c12-f832ddca7a71</xsl:when>
        <xsl:when test=".='let'">a5c024f1-3c81-492c-ab5e-73d2bc5dcad7</xsl:when>
        <xsl:when test=".='cos'">5aa6e3d1-283c-4f6d-8694-3bdc52137b07</xsl:when>
        <xsl:when test=".='blw'">245cfa8e-8709-4f1f-969b-894b94bc029f</xsl:when>
        <xsl:when test=".='cnd'">a79f874f-319e-4bc8-a2e1-f8b15fa186fe</xsl:when>
        <xsl:when test=".='cte'">f3aa0070-71bd-4c39-9a9b-ec2fd03ac26d</xsl:when>
        <xsl:when test=".='aus'">40fe62fb-4319-4313-ac88-ac4912b1e1fa</xsl:when>
        <xsl:when test=".='lgd'">5e9333a6-bc92-43c0-a306-30811bb71e61</xsl:when>
        <xsl:when test=".='pat'">1b51068c-506a-4b85-a815-175c17932448</xsl:when>
        <xsl:when test=".='lse'">a8d59132-aa1e-4a62-b5bd-b26b7d7a16b9</xsl:when>
        <xsl:when test=".='isb'">97082157-5900-4c4c-a6d8-2e6c13f22ef1</xsl:when>
        <xsl:when test=".='pfr'">f9395f3d-cd46-413e-9504-8756c54f38a2</xsl:when>
        <xsl:when test=".='std'">9e7651f8-a4f0-4d02-81b4-578ef9303d1b</xsl:when>
        <xsl:when test=".='sgd'">c0c46b4f-fd18-4d8a-96ac-aff91662206c</xsl:when>
        <xsl:when test=".='rdd'">fcfc0b86-b083-4ab8-8a75-75a66638ed2e</xsl:when>
        <xsl:when test=".='dnr'">8fbe6e92-87c9-4eff-b736-88cd02571465</xsl:when>
        <xsl:when test=".='clt'">cbceda25-1f4d-43b7-96a5-f2911026a154</xsl:when>
        <xsl:when test=".='adp'">35a3feaf-1c13-4221-8cfa-d6879faf714c</xsl:when>
        <xsl:when test=".='act'">7131e7b8-84fa-48bd-a725-14050be38f9f</xsl:when>
        <xsl:when test=".='pma'">0683aecf-42a8-432d-adb2-a8abaf2f15d5</xsl:when>
        <xsl:when test=".='fmd'">f5f9108a-9afc-4ea9-9b99-4f83dcf51204</xsl:when>
        <xsl:when test=".='med'">a7a25290-226d-4f81-b780-2efc1f7dfd26</xsl:when>
        <xsl:when test=".='rst'">94b839e8-cabe-4d58-8918-8a5058fe5501</xsl:when>
        <xsl:when test=".='cou'">36b921fe-6c34-45c8-908b-5701f0763e1b</xsl:when>
        <xsl:when test=".='ato'">e8b5040d-a5c7-47c1-96ca-6313c8b9c849</xsl:when>
        <xsl:when test=".='prp'">e2b5ceaf-663b-4cc0-91ba-bf036943ece8</xsl:when>
        <xsl:when test=".='hnr'">5c1e0a9e-1fdc-47a5-8d06-c12af63cbc5a</xsl:when>
        <xsl:when test=".='ctr'">28f7eb9e-f923-4a77-9755-7571381b2a47</xsl:when>
        <xsl:when test=".='rpt'">86b9292d-4dce-401d-861e-2df2cfaacb83</xsl:when>
        <xsl:when test=".='dbp'">d5e6972c-9e2f-4788-8dd6-10e859e20945</xsl:when>
        <xsl:when test=".='pan'">003e8b5e-426c-4d33-b940-233b1b89dfbd</xsl:when>
        <xsl:when test=".='wde'">de1ea2dc-8d9d-4dfa-b86e-8ce9d8b0c2f2</xsl:when>
        <xsl:when test=".='bpd'">9e99e803-c73d-4250-8605-403be57f83f9</xsl:when>
        <xsl:when test=".='acp'">c9d28351-c862-433e-8957-c4721f30631f</xsl:when>
        <xsl:when test=".='frg'">06fef928-bd00-4c7f-bd3c-5bc93973f8e8</xsl:when>
        <xsl:when test=".='cns'">756fcbfc-ef95-4bd0-99cc-1cc364c7b0cd</xsl:when>
        <xsl:when test=".='ren'">6b566426-f325-4182-ac31-e1c4e0b2aa19</xsl:when>
        <xsl:when test=".='ilu'">e038262b-25f8-471b-93ea-2afe287b00a3</xsl:when>
        <xsl:when test=".='mus'">08553068-8495-49c2-9c18-d29ab656fef0</xsl:when>
        <xsl:when test=".='wat'">6a983219-b6cd-4dd7-bfa4-bcb0b43590d4</xsl:when>
        <xsl:when test=".='ant'">ced7cdfc-a3e0-47c8-861b-3f558094b02e</xsl:when>
        <xsl:when test=".='dis'">f26858bc-4468-47be-8e30-d5db4c0b1e88</xsl:when>
        <xsl:when test=".='lbr'">e603ffa2-8999-4091-b10d-96248c283c04</xsl:when>
        <xsl:when test=".='edm'">b1e95783-5308-46b2-9853-bd7015c1774b</xsl:when>
        <xsl:when test=".='dfd'">e46bdfe3-5923-4585-bca4-d9d930d41148</xsl:when>
        <xsl:when test=".='fmo'">5c3abceb-6bd8-43aa-b08d-1187ae78b15b</xsl:when>
        <xsl:when test=".='sll'">3179eb17-275e-44f8-8cad-3a9514799bd0</xsl:when>
        <xsl:when test=".='ptf'">2230246a-1fdb-4f06-a08a-004fd4b929bf</xsl:when>
        <xsl:when test=".='tcd'">0efdaf72-6126-430a-8256-69c42ff6866f</xsl:when>
        <xsl:when test=".='cpt'">86890f8f-2273-44e2-aa86-927c7f649b32</xsl:when>
        <xsl:when test=".='cur'">d67decd7-3dbe-4ac7-8072-ef18f5cd3e09</xsl:when>
        <xsl:when test=".='lil'">ae8bc401-47da-4853-9b0b-c7c2c3ec324d</xsl:when>
        <xsl:when test=".='pta'">630142eb-6b68-4cf7-8296-bdaba03b5760</xsl:when>
        <xsl:when test=".='mfp'">a2231628-6a5a-48f4-8eac-7e6b0328f6fe</xsl:when>
        <xsl:when test=".='sec'">12b7418a-0c90-4337-90b7-16d2d3157b68</xsl:when>
        <xsl:when test=".='dto'">0d2580f5-fe16-4d64-a5eb-f0247cccb129</xsl:when>
        <xsl:when test=".='rpy'">cd06cefa-acfe-48cb-a5a3-4c48be4a79ad</xsl:when>
        <xsl:when test=".='cts'">9fc0bffb-6dd9-4218-9a44-81be4a5059d4</xsl:when>
        <xsl:when test=".='wdc'">32021771-311e-497b-9bf2-672492f322c7</xsl:when>
        <xsl:when test=".='rps'">13361ce8-7664-46c0-860d-ffbcc01414e0</xsl:when>
        <xsl:when test=".='dtm'">9d81737c-ec6c-49d8-9771-50e1ab4d7ad7</xsl:when>
        <xsl:when test=".='dsr'">3665d2dd-24cc-4fb4-922a-699811daa41c</xsl:when>
        <xsl:when test=".='aut'">6e09d47d-95e2-4d8a-831b-f777b8ef6d81</xsl:when>
        <xsl:when test=".='jud'">41a0378d-5362-4c1a-b103-592ff354be1c</xsl:when>
        <xsl:when test=".='etr'">6ccd61f4-c408-46ec-b359-a761b4781477</xsl:when>
        <xsl:when test=".='con'">94bb3440-591f-41af-80fa-e124006faa49</xsl:when>
        <xsl:when test=".='org'">539872f1-f4a1-4e83-9d87-da235f64c520</xsl:when>
        <xsl:when test=".='wac'">bf1a8165-54bf-411c-a5ea-b6bbbb9c55df</xsl:when>
        <xsl:when test=".='osp'">563bcaa7-7fe1-4206-8fc9-5ef8c7fbf998</xsl:when>
        <xsl:when test=".='scl'">223da16e-5a03-4f5c-b8c3-0eb79f662bcb</xsl:when>
        <xsl:when test=".='spk'">ac0baeb5-71e2-435f-aaf1-14b64e2ba700</xsl:when>
        <xsl:when test=".='ape'">f0061c4b-df42-432f-9d1a-3873bb27c8e6</xsl:when>
        <xsl:when test=".='prf'">246858e3-4022-4991-9f1c-50901ccc1438</xsl:when>
        <xsl:when test=".='bdd'">5f27fcc6-4134-4916-afb8-fcbcfb6793d4</xsl:when>
        <xsl:when test=".='wst'">7c5c2fd5-3283-4f96-be89-3bb3e8fa6942</xsl:when>
        <xsl:when test=".='prv'">3b4709f1-5286-4c42-9423-4620fff78141</xsl:when>
        <xsl:when test=".='brd'">55e4a59b-2dfd-478d-9fe9-110fc24f0752</xsl:when>
        <xsl:when test=".='jug'">b76cb226-50f9-4d34-a3d0-48b475f83c80</xsl:when>
        <xsl:when test=".='len'">e4f2fd1c-ee79-4cf7-bc1a-fbaac616f804</xsl:when>
        <xsl:when test=".='mtk'">002c0eef-eb77-4c0b-a38e-117a09773d59</xsl:when>
        <xsl:when test=".='cmp'">901d01e5-66b1-48f0-99f9-b5e92e3d2d15</xsl:when>
        <xsl:when test=".='wit'">ec56cc25-e470-46f7-a429-72f438c0513b</xsl:when>
        <xsl:when test=".='mte'">8af7e981-65f9-4407-80ae-1bacd11315d5</xsl:when>
        <xsl:when test=".='ann'">06b2cbd8-66bf-4956-9d90-97c9776365a4</xsl:when>
        <xsl:when test=".='lso'">99f6b0b7-c22f-460d-afe0-ee0877bc66d1</xsl:when>
        <xsl:when test=".='ins'">f6bd4f15-4715-4b0e-9258-61dac047f106</xsl:when>
        <xsl:when test=".='pra'">08cb225a-302c-4d5a-a6a3-fa90850babcd</xsl:when>
        <xsl:when test=".='rsp'">3c3ab522-2600-4b93-a121-8832146d5cdf</xsl:when>
        <xsl:when test=".='lee'">88a66ebf-0b18-4ed7-91e5-01bc7e8de441</xsl:when>
        <xsl:when test=".='chr'">593862b4-a655-47c3-92b9-2b305b14cce7</xsl:when>
        <xsl:when test=".='ctb'">9f0a2cf0-7a9b-45a2-a403-f68d2850d07c</xsl:when>
        <xsl:when test=".='exp'">764c208a-493f-43af-8db7-3dd48efca45c</xsl:when>
        <xsl:when test=".='tch'">f72a24d1-f404-4275-9350-158fe3a20b21</xsl:when>
        <xsl:when test=".='dst'">7b21bffb-91e1-45bf-980a-40dd89cc26e4</xsl:when>
        <xsl:when test=".='ptt'">68dcc037-901e-46a9-9b4e-028548cd750f</xsl:when>
        <xsl:when test=".='dpt'">7c62ecb4-544c-4c26-8765-f6f6d34031a0</xsl:when>
        <xsl:when test=".='mrk'">168b6ff3-7482-4fd0-bf07-48172b47876c</xsl:when>
        <xsl:when test=".='ivr'">eecb30c5-a061-4790-8fa5-cf24d0fa472b</xsl:when>
        <xsl:when test=".='fpy'">26ad4833-5d49-4999-97fc-44bc86a9fae0</xsl:when>
        <xsl:when test=".='scr'">867f3d13-779a-454e-8a06-a1b9fb37ba2a</xsl:when>
        <xsl:when test=".='orm'">df7daf2f-7ab4-4c7b-a24d-d46695fa9072</xsl:when>
        <xsl:when test=".='ths'">cce475f7-ccfa-4e15-adf8-39f907788515</xsl:when>
        <xsl:when test=".='evp'">54f69767-5712-47aa-bdb7-39c31aa8295e</xsl:when>
        <xsl:when test=".='elt'">201a378e-23dd-4aab-bfe0-e5bc3c855f9c</xsl:when>
        <xsl:when test=".='eng'">366821b5-5319-4888-8867-0ffb2d7649d1</xsl:when>
        <xsl:when test=".='aui'">1f20d444-79f6-497a-ae0d-98a92e504c58</xsl:when>
        <xsl:when test=".='bkd'">846ac49c-749d-49fd-a05f-e7f2885d9eaf</xsl:when>
        <xsl:when test=".='sng'">6847c9ab-e2f8-4c9e-8dc6-1a97c6836c1c</xsl:when>
        <xsl:when test=".='aud'">4b41e752-3646-4097-ae80-21fd02e913f7</xsl:when>
        <xsl:when test=".='sad'">c5988fb2-cd21-469c-b35e-37e443c01adc</xsl:when>
        <xsl:when test=".='red'">b38c4e20-9aa0-43f4-a1a0-f547e54873f7</xsl:when>
        <xsl:when test=".='rev'">85962960-ef07-499d-bf49-63f137204f9a</xsl:when>
        <xsl:when test=".='dft'">c86fc16d-61d8-4471-8089-76550daa04f0</xsl:when>
        <xsl:when test=".='fmk'">2129a478-c55c-4f71-9cd1-584cbbb381d4</xsl:when>
        <xsl:when test=".='prt'">02c1c664-1d71-4f7b-a656-1abf1209848f</xsl:when>
        <xsl:when test=".='wpr'">115fa75c-385b-4a8e-9a2b-b13de9f21bcf</xsl:when>
        <xsl:when test=".='anm'">b998a229-68e7-4a3d-8cfd-b73c10844e96</xsl:when>
        <xsl:when test=".='csl'">c04ff362-c80a-4543-88cf-fc6e49e7d201</xsl:when>
        <xsl:when test=".='stn'">94d131ef-2814-49a0-a59c-49b6e7584b3d</xsl:when>
        <xsl:when test=".='plt'">d30f5556-6d79-4980-9528-c48ef60f3b31</xsl:when>
        <xsl:when test=".='sds'">1c623f6e-25bf-41ec-8110-6bde712dfa79</xsl:when>
        <xsl:when test=".='sht'">206246b1-8e17-4588-bad8-78c82e3e6d54</xsl:when>
        <xsl:when test=".='dnc'">3bd0b539-4440-4971-988c-5330daa14e3a</xsl:when>
        <xsl:when test=".='dgs'">825a7d9f-7596-4007-9684-9bee72625cfc</xsl:when>
        <xsl:when test=".='flm'">22f8ea20-b4f0-4498-8125-7962f0037c2d</xsl:when>
        <xsl:when test=".='vac'">1ce93f32-3e10-46e2-943f-77f3c8a41d7d</xsl:when>
        <xsl:when test=".='cor'">8ddb69bb-cd69-4898-a62d-b71649089e4a</xsl:when>
        <xsl:when test=".='asg'">ad9b7785-53a2-4bf4-8a01-572858e82941</xsl:when>
        <xsl:when test=".='cre'">7aac64ab-7f2a-4019-9705-e07133e3ad1a</xsl:when>
        <xsl:when test=".='art'">f9e5b41b-8d5b-47d3-91d0-ca9004796337</xsl:when>
        <xsl:when test=".='ltg'">2b45c004-805d-4e7f-864d-8664a23488dc</xsl:when>
        <xsl:when test=".='dgg'">6901fbf1-c038-42eb-a03e-cd65bf91f660</xsl:when>
        <xsl:when test=".='cpl'">8f9d96f5-32ad-43d7-8122-18063a617fc8</xsl:when>
        <xsl:when test=".='rbr'">0d022d0d-902d-4273-8013-0a2a753d9d76</xsl:when>
        <xsl:when test=".='rpc'">c96df2ce-7b00-498a-bf37-3011f3ef1229</xsl:when>
        <xsl:when test=".='fmp'">2665431e-aad4-44d1-9218-04053d1cfd53</xsl:when>
        <xsl:when test=".='trc'">0eef1c70-bd77-429c-a790-48a8d82b4d8f</xsl:when>
        <xsl:when test=".='msd'">e1edbaae-5365-4fcb-bb6a-7aae38bbed9c</xsl:when>
        <xsl:when test=".='cot'">0ad74d5d-03b9-49bb-b9df-d692945ca66e</xsl:when>
        <xsl:when test=".='pup'">2c9cd812-7b00-47e8-81e5-1711f3b6fe38</xsl:when>
        <xsl:when test=".='mcp'">66bfc19c-eeb0-4167-bd8d-448311aab929</xsl:when>
        <xsl:when test=".='mon'">d2df2901-fac7-45e1-a9ad-7a67b70ea65b</xsl:when>
        <xsl:when test=".='crp'">319cb290-a549-4ae8-a0ed-a65fe155cac8</xsl:when>
        <xsl:when test=".='opn'">300171aa-95e1-45b0-86c6-2855fcaf9ef4</xsl:when>
        <xsl:when test=".='cmt'">c7345998-fd17-406b-bce0-e08cb7b2671f</xsl:when>
        <xsl:when test=".='ppm'">e38a0c64-f1d3-4b03-a364-34d6b402841c</xsl:when>
        <xsl:when test=".='tyg'">58461dca-efd4-4fd4-b380-d033e3540be5</xsl:when>
        <xsl:when test=".='win'">53f075e1-53c0-423f-95ae-676df3d8c7a2</xsl:when>
        <xsl:when test=".='pdr'">097adac4-6576-4152-ace8-08fc59cb0218</xsl:when>
        <xsl:when test=".='gis'">369783f6-78c8-4cd7-97ab-5029444e0c85</xsl:when>
        <xsl:when test=".='crr'">c8050073-f62b-4606-9688-02caa98bdc60</xsl:when>
        <xsl:when test=".='cst'">e1510ac5-a9e9-4195-b762-7cb82c5357c4</xsl:when>
        <xsl:when test=".='stg'">3e86cb67-5407-4622-a540-71a978899404</xsl:when>
        <xsl:when test=".='mrb'">515caf91-3dde-4769-b784-50c9e23400d5</xsl:when>
        <xsl:when test=".='dub'">88370fc3-bf69-45b6-b518-daf9a3877385</xsl:when>
        <xsl:when test=".='aqt'">57247637-c41b-498d-9c46-935469335485</xsl:when>
        <xsl:otherwise>361f4bfd-a87d-463c-84d8-69346c3082f6</xsl:otherwise>
      </xsl:choose>
    </contributorTypeId>
  </xsl:template>

  <!-- Map instance statues -->
  <xsl:template match="statusId">
    <statusId>
    <xsl:choose>
      <xsl:when test=".='Cataloged'">9634a5ab-9228-4703-baf2-4d12ebc77d56</xsl:when>
      <xsl:when test=".='Uncataloged'">26f5208e-110a-4394-be29-1569a8c84a65</xsl:when>
      <xsl:when test=".='Autopsie'">bac08adf-98ef-44ee-8e8a-ab76128c92c1</xsl:when>
      <xsl:when test=".='Bibliografisch vollständig'">8bc58a74-b04e-45a4-8c5d-64568a5f0d55</xsl:when>
      <xsl:when test=".='Erwerbungsdatensatz'">5dc8b06f-6b85-4a64-9825-811d5c0660a8</xsl:when>
      <xsl:when test=".='Datensatz für internen Gebrauch'">3f378ff8-a474-4232-85b1-977650abba83</xsl:when>
      <xsl:when test=".='Lösch-Status'">287f32a7-434b-4a89-a7f3-d12c8d6bf81c</xsl:when>
      <xsl:when test=".='Maschinell konvertierte Daten'">e1700e6a-f606-4464-a9af-f0849890f17e</xsl:when>
      <xsl:when test=".='Katalogisat ohne Autopsie'">8867ba26-c5da-4a5d-851d-976429f83a45</xsl:when>
      <xsl:when test=".='Verwaltungsdatensatz'">07ae89f4-e760-421a-8c74-c69f643881dc</xsl:when>
      <xsl:when test=".='Fremddatensatz'">449a7305-0bfc-434d-ba93-1ce916f706b1</xsl:when>
      <xsl:when test=".='Katalogisat nach Autopsie im Vorläufigkeitsstatus'">0c81eb93-f2f1-477a-9bbb-a0b18b094f8f</xsl:when>
      <xsl:when test=".='Maschinelle Einspielung, möglicherweise dublett'">b7ca8a3f-e818-4253-8461-55f198eaf101</xsl:when>
      <xsl:when test=".='Zunächst verdeckt eingespieltes Novum'">c8678080-990d-4633-95cb-56d06bbf108f</xsl:when>
      <xsl:when test=".='Inhalt oder Struktur ist zu überprüfen'">775bdbe0-ba63-4d51-aa78-04b2ee81bd27</xsl:when>
    </xsl:choose>
    </statusId>
  </xsl:template>

  <!-- Map identifier types -->
  <xsl:template match="identifierTypeId">
    <identifierTypeId>
      <xsl:choose>
        <xsl:when test=".='Cancelled GPO item number'">5069054d-bc3a-4212-a4e8-e2013a02386f</xsl:when>
        <xsl:when test=".='Standard technical report number'">8e3dd25e-db82-4b06-8311-90d41998c109</xsl:when>
        <xsl:when test=".='CODEN'">593b78cb-32f3-44d1-ba8c-63fd5e6989e6</xsl:when>
        <xsl:when test=".='Report number'">37b65e79-0392-450d-adc6-e2a1f47de452</xsl:when>
        <xsl:when test=".='URN'">eb7b2717-f149-4fec-81a3-deefb8f5ee6b</xsl:when>
        <xsl:when test=".='GPO item number'">351ebc1c-3aae-4825-8765-c6d50dbf011f</xsl:when>
        <xsl:when test=".='DOI'">39554f54-d0bb-4f0a-89a4-e422f6136316</xsl:when>
        <xsl:when test=".='System control number'">7e591197-f335-4afb-bc6d-a6d76ca3bace</xsl:when>
        <xsl:when test=".='ISBN'">8261054f-be78-422d-bd51-4ed9f33c3422</xsl:when>
        <xsl:when test=".='StEdNL'">3fbacad6-0240-4823-bce8-bb122cfdf229</xsl:when>
        <xsl:when test=".='Control number'">5d164f4b-0b15-4e42-ae75-cfcf85318ad9</xsl:when>
        <xsl:when test=".='LCCN'">c858e4f2-2b6b-4385-842b-60732ee14abb</xsl:when>
        <xsl:when test=".='Invalid ISBN'">fcca2643-406a-482a-b760-7a7f8aec640e</xsl:when>
        <xsl:when test=".='OCLC'">439bfbae-75bc-4f74-9fc7-b2a2d47ce3ef</xsl:when>
        <xsl:when test=".='ISSN'">913300b2-03ed-469a-8179-c1092c991227</xsl:when>
        <xsl:when test=".='Handle'">216b156b-215e-4839-a53e-ade35cb5702a</xsl:when>
        <xsl:when test=".='Local identifier'">5130aed5-1095-4fb6-8f6f-caa3d6cc7aae</xsl:when>
        <xsl:when test=".='UkMac'">650ef996-35e3-48ec-bf3a-a0d078a0ca37</xsl:when>
        <xsl:when test=".='ASIN'">7f907515-a1bf-4513-8a38-92e1a07c539d</xsl:when>
        <xsl:when test=".='Invalid ISSN'">27fd35a6-b8f6-41f2-aa0e-9c663ceb250c</xsl:when>
        <xsl:when test=".='Linking ISSN'">5860f255-a27f-4916-a830-262aa900a6b9</xsl:when>
        <xsl:when test=".='Publisher or distributor number'">b5d8cdc4-9441-487c-90cf-0c7ec97728eb</xsl:when>
        <xsl:when test=".='BNB'">3187432f-9434-40a8-8782-35a111a1491e</xsl:when>
        <xsl:when test=".='PPN'">d5558bde-b5dc-421b-919b-361cb161525c</xsl:when>
        <xsl:when test=".='DNB-Nummer'">e176c942-bc34-417c-8ee5-920e5b279c1d</xsl:when>
		<xsl:when test=".='Autorisierte ISSN'">3e318d19-a1ea-4afe-a185-4dc9f6c6249e</xsl:when>
		<xsl:when test=".='Formal falsche ISSN einer parallelen Ausgabe'">d841e41b-143f-4487-9ae4-cae8523a91e6</xsl:when>
		<xsl:when test=".='Formal falsche ISBN der Sekundärausgabe'">7c4cf019-1c22-4004-9b4d-bfa0be4ea553</xsl:when>
		<xsl:when test=".='Formal falsche ISMN'">7495a40f-1cc1-4af1-82ed-19a412e24fe6</xsl:when>
		<xsl:when test=".='Erstkatalogisierer-​ID-Nummer'">7ef1b405-cb90-4d4e-b5e3-2b25f5d8a79b</xsl:when>
		<xsl:when test=".='ISBN der parallelen Ausgabe auf einem anderen Datenträger'">b17bc05a-08ee-40a3-b6c7-c1d677507014</xsl:when>
		<xsl:when test=".='ISBN der parallelen Ausgabe als Online-​Ausgabe'">f3c10486-4d80-4a0c-bc12-1b36fcdbe5a5</xsl:when>
		<xsl:when test=".='ISBN der parallelen Druckausgabe'">54457e3e-12d8-49fc-8eb0-99f06760049c</xsl:when>
		<xsl:when test=".='ISBN der Sekundärausgabe'">54042b80-58d7-443f-b620-c718df834a2d</xsl:when>
		<xsl:when test=".='ISBN einer Manifestation in anderer physischer Form'">47e6ce08-5ecb-4403-99ca-3c5a84412b48</xsl:when>
		<xsl:when test=".='ISMN'">972ee37b-6ce3-461f-aace-4201bcb576ad</xsl:when>
		<xsl:when test=".='International Standard Recording Code (ISRC)'">a016b7cc-82a7-4d66-ad9b-6edd57deb4e7</xsl:when>
		<xsl:when test=".='ISSN der parallelen Ausgabe auf einem anderen Datenträger'">45ab6e0b-94c9-476c-88f3-ad7da45004c2</xsl:when>
		<xsl:when test=".='ISSN der parallelen Ausgabe als Online-​Ausgabe'">bacc4dd4-0427-424b-888a-786cba8de27e</xsl:when>
		<xsl:when test=".='ISSN der parallelen Ausgabe als Druck-​Ausgabe'">ec70cc68-7d3a-4f1c-a3dc-c3ead0bb5cb0</xsl:when>
		<xsl:when test=".='ISSN einer Manifestation in anderer physischer Form'">ff50893e-c884-4137-9a19-730a717b03ea</xsl:when>
		<xsl:when test=".='Produktsigel für Pakete von Online-Ressourcen'">0af95dfb-6c4e-4db0-8ee6-bc95897f03e2</xsl:when>
		<xsl:when test=".='ISBN-A'">88324f74-cf3f-45c8-84ca-90d8ce3353f5</xsl:when>
		<xsl:when test=".='Anzeigenummer Neuerscheinungsdienst'">84549c48-f95a-4017-9164-d3ee468559c9</xsl:when>
		<xsl:when test=".='WV-Nummer'">91dd4d66-bb6b-45f9-9678-646b6322b31b</xsl:when>
		<xsl:when test=".='ZDB-Nummer'">976aa3bc-8917-4b15-9e13-87fb3104173d</xsl:when>
		<xsl:when test=".='Erstkatalogisierer-ID-Nummer aus Titelumlenkungen'">b986eebc-e74d-4b43-ab96-640b74a243b3</xsl:when>
		<xsl:when test=".='Fremddaten-Identifikations-Nummer'">52e079be-2f0b-42c9-9c98-d3501178b32f</xsl:when>
		<xsl:when test=".='Swets-Nummer'">e0526caa-ebeb-400c-b9bf-bd2f1a94326d</xsl:when>
		<xsl:when test=".='Bibliographischer Nachweis alter Drucke'">ee436c6c-a37b-4121-b197-32a494a89bbe</xsl:when>
		<xsl:when test=".='VD18-Nummer'">8341f1f9-6ac0-4108-ae9a-749017e9a6df</xsl:when>
		<xsl:when test=".='Sonstige Standardnummern'">7423b056-9fd6-4918-bfd7-9ab3af630345</xsl:when>
		<xsl:when test=".='EAN'">ad80de2d-c060-48a0-b85f-9b1b14e22ed0</xsl:when>
		<xsl:when test=".='Universal Product Code (UPC)'">bffb24f2-5655-490a-846e-c7e01524b906</xsl:when>
		<xsl:otherwise>2e8b3b6c-0e7d-4e48-bca2-b0b23b376af5</xsl:otherwise>
      </xsl:choose>
    </identifierTypeId>
  </xsl:template>
  
  <!-- Map holdings types -->
  <xsl:template match="holdingsTypeId">
    <holdingsTypeId>
      <xsl:choose>
        <xsl:when test=".='electronic'">996f93e2-5b5e-4cf2-9168-33ced1f95eed</xsl:when>
        <xsl:when test=".='physical'">0c422f92-0f4d-4d32-8cbe-390ebc33a3e5</xsl:when>
      </xsl:choose>
    </holdingsTypeId>
  </xsl:template>

  <!-- Map holdings source -->
  <xsl:template match="sourceId">
    <sourceId>
      <xsl:choose>
        <xsl:when test=".='hebis'">ed96edb1-d91d-4a31-9c40-006f5199d782</xsl:when>
        <xsl:otherwise>f32d531e-df79-46b3-8932-cdd35f7a2264</xsl:otherwise> <!-- FOLIO -->
      </xsl:choose>
    </sourceId>
  </xsl:template>

  <xsl:template match="original"/>
</xsl:stylesheet>