Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFCC76196
	for <ath10k@archiver.kernel.org>; Tue, 28 Mar 2023 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KSg3xSnv09ub9gJaz/17Yga4My51KgNBG4G7xNOOexw=; b=qsnyAp2rEsq4WI
	+2yg7DJUR+xo/k5EvO+ni/ONiTnwiLrXs4arOTSYQYKaBqJF1oFbI++U7bVqfYM5avFS/Z1/2nPnO
	u5y765lugBFpjxwNp37leEzl7uujShKP3lUUu1ipwswrMstEw/6n9YP+NfhlU/TBsfezCJctSUcD1
	FAyuoXhNhRm842M5sX5hWfGcG0i61P9udTKQefl+G3UOiuFr/bl4yeCu9jr4vRFbNy8zZGRxaEdZj
	NeTcTANozqnNfoC7+etnMwM0i/DX041rNPzuqCavT6a0Tt6VAt3U5KOJbwGbdAw/m2bD+UCf0HN2e
	HaZ3qEiwRp+aomT78E2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phGN0-00FqFi-3D;
	Tue, 28 Mar 2023 20:56:43 +0000
Received: from mail-co1nam11on20725.outbound.protection.outlook.com ([2a01:111:f400:7eab::725] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phGMy-00FqFB-0Y
	for ath10k@lists.infradead.org;
	Tue, 28 Mar 2023 20:56:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIj/lUBZXgl2DKJyGJ9g9zaqpvpaPb8M+7SbRDapp6YnulSN8Pjzv3zcSqF8QDW6q67sZmaJ0pvkiXIfrmpS7nIRrsPyPA5+saA2klcY9MKPrDeW8k0VoL81K0I21xQeZQb0zBoIYP2orZSI6IHXlOypb1BsUPAcHwEE+DVqeYju4I0r2kuyLlLZaN2iAF36mZzpUuOPT6q3iDiHcWPJKLgv3FmNFwOgMjB/+380u09rBFyM97doHJcur3jIS9bLlCJu1HYoXav3lnx2M01Us3rSM0/tXBoHQ2uvDWsHv1XZAxGikEsET3r9cjDtlHO1LgBRbmHE+YUMwvOoeqsTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x27sUiLWdOM17yyWaWu/XHZnUhsrbXg8UKjirblW90=;
 b=J6aKCyy28epDJ84Kh4P+B01SPoviYoWymObBP9I2aDgJPUnCMWpI7dWkSjRC0D+G2eZ0ziXy8FpKr/zij5v8EpTvZqicKxrEPuVPAEALMlbJFQ24ZcAPfVL+Hpm4NSt+dPSkoiKAf2b83EinMJZyMHeY7nQsDFMv7NYIPzkkLlw4KTJ992y16qhgb0ArgA70O4CEyu+JcQ+NDV45K0/N+5vhMB2IVR620EPXTnYVpBinY4npO8jjIk8WaSu+QxtY1nhKhcSl2KFoBfV0XpeVEWgRXYSLUBpNRLbEAYRtziX/23CQVWkps5gWx1u6zE2l+VHEUj8xULvcPPkXnmWt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blackmesa.com; dmarc=pass action=none
 header.from=blackmesa.com; dkim=pass header.d=blackmesa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackmesa.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x27sUiLWdOM17yyWaWu/XHZnUhsrbXg8UKjirblW90=;
 b=sqFXiEHffVEWCQXtJP8TIBMLXwXSoA5zTmF1kdSZRJRmPEQAMKf4G190GLOCaPDkcNg01T1NSCCAUJ3BpN2UOGu4A2SPtShrG9RMFXTsmFVUxGprzwd1zzjxaL82+p6/ny0YJY5YrtnsFqILnup5ZbZqJT8vjJmpUZDShIHWRrjJi4dZ+jNnizil0ltmjdzedlthuhMaTsjTRCTaTPquRxNFNtOuDPJ7at6C1KbA6pBW4HPRo+vsIBKkRKuSotTa6HlXbZHGT6fMI8A3+JknXTIpZ+UFiMey5eHZ1mZVk7t0i23t8OhxdXUZsTuIE7HT0AFpDo3OewGn50EjjFAf4w==
Received: from IA0PR20MB5731.namprd20.prod.outlook.com (2603:10b6:208:435::10)
 by PH7PR20MB6006.namprd20.prod.outlook.com (2603:10b6:510:2b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.18; Tue, 28 Mar
 2023 20:56:33 +0000
Received: from IA0PR20MB5731.namprd20.prod.outlook.com
 ([fe80::6a63:94a0:7df7:5b3b]) by IA0PR20MB5731.namprd20.prod.outlook.com
 ([fe80::6a63:94a0:7df7:5b3b%4]) with mapi id 15.20.6254.016; Tue, 28 Mar 2023
 20:56:33 +0000
From: Peter Dohm <peterdohm@blackmesa.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Odd crash in ath10k card only on certain firmware versions...
Thread-Topic: Odd crash in ath10k card only on certain firmware versions...
Thread-Index: AQHZYbeH3gsxzd10bUCFYN7k4uUj4A==
Date: Tue, 28 Mar 2023 20:56:33 +0000
Message-ID:  <IA0PR20MB5731A6A9BAFB17E886DF2097B0889@IA0PR20MB5731.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_c582a513-2b28-4351-aeaa-7b64aa5c2891_Enabled=True;MSIP_Label_c582a513-2b28-4351-aeaa-7b64aa5c2891_SiteId=0521f216-fcb4-42bb-822b-1bc9a3925fe7;MSIP_Label_c582a513-2b28-4351-aeaa-7b64aa5c2891_SetDate=2023-03-28T20:56:32.780Z;MSIP_Label_c582a513-2b28-4351-aeaa-7b64aa5c2891_Name=Black
 Mesa Guarded
 Data;MSIP_Label_c582a513-2b28-4351-aeaa-7b64aa5c2891_ContentBits=0;MSIP_Label_c582a513-2b28-4351-aeaa-7b64aa5c2891_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=blackmesa.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR20MB5731:EE_|PH7PR20MB6006:EE_
x-ms-office365-filtering-correlation-id: 60257be2-5ea4-4dab-3674-08db2fcee99a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Pyoxgb7K4T2/nnkuk3KG4DIIyq3ACCBfBmuvIPhgOqozUcszMtyK4CGL0XamC6XEHOkRXpy/kQsRhQ9i8sCRvuua1OfcmzzmgSqYJJSvGqqixcTmHieqZAe9ub91T/FcSBVYLgjyZE0JSVvwO8Nk6SYUC5I1HjrYVU380ePTmuJ3PAgurym3lbolRBy9hKhw9VoAvEP4hJgia29MfBKz8MwvNNUNHXMho5WPuP9F1m4ss/KU5zXbjDhvzmddsR5su0KSjP8jguxuojtw5kGZXxGfWvbDsLBmM5fwBC377YrN6JnUPaQXr4rYhI2EJR1MUin73kREvye239zwDtLH57eXLPxZvHOcXDeD3xuUXaEQ8Z7W160O2zQl6XrbWTMgOXnXMvmUNVl7h4amhlIgfY3XQF/MQ+JM9cgl7pELWYbTC6hbfhkmn+Gsv7LRt6/IfjpfglwQB4wMXIQSF2l7BEHhKmzMqwV2+/mi2gc1wU0j6ZuA/0F8xXw4WEyowgD7nvd1N+GGsgslW2YGJUUm44dg+BqcmJw2Nw9aYSGcTDvuKSfNKx+h7zLoewwC2ZbqR83eh1A5BqVA3N3Ew6dVb7+gJnioBNy23Zbftr1f0ls=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR20MB5731.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(396003)(39830400003)(451199021)(2906002)(38100700002)(122000001)(41300700001)(8936002)(5660300002)(52536014)(55016003)(86362001)(33656002)(40140700001)(38070700005)(6916009)(478600001)(316002)(7696005)(71200400001)(966005)(26005)(6506007)(9686003)(66556008)(66446008)(64756008)(76116006)(66476007)(8676002)(66946007)(91956017)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?2zyUHEIcEpyaZcUcE1ThfWNqRVkwcQTcnIqQXSJ6lyes6SbfQO2Nr4Qj?=
 =?Windows-1252?Q?SXGAqBH5/wEvrCykcseZJqZ7++I4qD8ZKZpY4jL15g2H7EAt0nNtK2ej?=
 =?Windows-1252?Q?CIHFw73kYUotmSstsm1DsQ3YYPXOoK0zckt9++WDLaN/U5oD4JVdzkjk?=
 =?Windows-1252?Q?WSjSSrcrOqnRtD8tEKIQtGTJjjfNICPA4gSrYLkc6lPtN7Bww0ZKWHI2?=
 =?Windows-1252?Q?vpck91gry2doptwVJDtQPDoGeSEXVkPc6kG+QmC7bP9590OWrcWHQo9R?=
 =?Windows-1252?Q?Cse4HpRtBG94BaNsTaJaXBaOgLD9KArhxmwS8/ifAjp6Pk4r83EOamO0?=
 =?Windows-1252?Q?PSOUaUxpLB3fR46kSWgHQgMgHI0aWKoSNGTFCLeEuHj3jees/OlwtKsp?=
 =?Windows-1252?Q?Uaz6dXqGQw8Gh0O4KXE72Eiy2SqeHvm3PwZ5NTlA3CTXaZftQ9ll9/m+?=
 =?Windows-1252?Q?XUGaC9Ru3MOgW68ulicQjpWUhBThAj3VR1ewKvrDukq6uDupL/0eJRkp?=
 =?Windows-1252?Q?WIcBIag2jb+wIvpEFuDiyYOreBS3dWUHve0YU+ea/QvA7NWUJpyeR+Gp?=
 =?Windows-1252?Q?bW+e6leRiIRCEdHJnNBZtaoDvXPFzc46ZI98kRonNT74iQ02zJOjFgSZ?=
 =?Windows-1252?Q?Rp8uyw0w2kch0KprEYw7pr2yEUGUPBShrtVx++FmIkvSAtQQhT8qi8R5?=
 =?Windows-1252?Q?yl1ChzbbY1xcyT6UGnaF7gvxRgcbHCJjKbWwvO+aC1rrQAXAbxflgccd?=
 =?Windows-1252?Q?9l40JhV/YohTld/Dgpo2TTQrlqgbIauyv1odBjRjsybQh3V4EP9vbGw+?=
 =?Windows-1252?Q?P1cJb1n9Gnk6UD8kSSVAu9I4WBoCyBG7nG4kRJVoNg+l0Ywct7AiX+ws?=
 =?Windows-1252?Q?IDUnNW+i+tVYp4th/7tEbvXtfE1/yiOqVMgSCJKFRll0qf0MUEWpfpvP?=
 =?Windows-1252?Q?r6b5ePNpPndwgkQN84hdfFlU8mmAsNhYYOmKN2xEGdlZ/FxArjmrTP8H?=
 =?Windows-1252?Q?ycDtdu540AhmnZqL6DBFqTflOyvEDZtCfz3OHDl1rjR0fD7Rk50Jt8LP?=
 =?Windows-1252?Q?x4KVsQOvrxXlJ19fhN2RLN1wCTz6nNH0nA88ywKC/cTxVvyTyz4fo8fD?=
 =?Windows-1252?Q?Mfm9upcK6e57h15B8KMMYaA2eZVzgWARs/nfHl+ABQkIeGyxKs1U5Nah?=
 =?Windows-1252?Q?eEih8cLZ6jAVIbl+fP3YyH6No+TC1yOfThVMQmKWnY+LB4DA9zc0yyIl?=
 =?Windows-1252?Q?6KPocOMRBuo61r1CNiqJJGM/ouRd0gF5rxZV+LxqcEyldjZwNcy/IKyi?=
 =?Windows-1252?Q?LqWjHEibAIbt8tpU7/w/u/YqygBm0ylnaE/UiPid9IO4pJc8fe6M9MOc?=
 =?Windows-1252?Q?7Tgc0r+iQY6O6bU8tqy4ZhhMZSlaySqjO3HdWDGLoXfT4jWt5vbM9+Fe?=
 =?Windows-1252?Q?RekTPKlDO74GcBcAL0oDjyG2tBPs7ix59IErTLKMXYzHiOl2XY5JnnJs?=
 =?Windows-1252?Q?MPPYh/e9BeB57OoykG5jgdIZbvNhkR/eg+LLxZGbH3yHs371kBT70ceI?=
 =?Windows-1252?Q?Df166WDZT0L7DuwDdKPGhOmqUPSs4NwcNdSoyuKTlJncaJHxgC95w3gF?=
 =?Windows-1252?Q?pCSTkHeYctBTfAynbSjZxHbzog0x9lwqe+V/DYZWmjEBthVy5Jk0ZxTo?=
 =?Windows-1252?Q?U7tk0VaZnYu7KngMtfRloPQbmjBrk6M2?=
MIME-Version: 1.0
X-OriginatorOrg: blackmesa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR20MB5731.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60257be2-5ea4-4dab-3674-08db2fcee99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 20:56:33.1471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0521f216-fcb4-42bb-822b-1bc9a3925fe7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6L6LKTfeMthnu4rGMJyplJO1+bCUGDrZCpqVS7FCr4DuugP/oym8hhzQZf9AwXbq0fwG9nQd2tmsaP4dwvtEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_135640_235373_C22F52AF 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi all.

I=92ve been experimenting with a generic QCA6174 hw 3.0 card that was purch=
ased with my Protectli Vault appliance (https://protectli.com/product/m2-wi=
fi/) which looks to just be this device resold: https://www.jetone.com.tw/j=
ww6051.html

The device per lspci looks like so:

07:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Netw=
ork Adapter (rev 30)
    Subsystem: Qualcomm Atheros Device 3361
    Flags: bus master, fast devsel, latency 0, IRQ 176
    Memory at b1000000 (64-bit, non-prefetchable) [size=3D2M]
    Capabilities: [40] Power Management version 3
    Capabilities: [50] MSI: Enable+ Count=3D1/8 Maskable+ 64bit-
    Capabilities: [70] Express Endpoint, MSI 00
    Capabilities: [100] Advanced Error Reporting
    Capabilities: [148] Virtual Channel
    Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [178] Latency Tolerance Reporting
    Capabilities: [180] L1 PM Substates
    Kernel driver in use: ath10k_pci
    Kernel modules: ath10k_pci

This is an arch linux kernel: 6.2.8-arch1-1#1 SMP PREEMPTY_DYNAMIC, and eve=
rything is the latest generally available as per the date of this original =
email, March 28, 2023.

The default linux firmware that ships with arch (which uses the latest per =
hashes of the latest available on github) crashes as i=92ll describe below.=
..
 =

If I use firmware version QCA6174/hw3.0/4.4.1/firmware-6.bin_WLAN.RM.4.4.1-=
00132-QCARMSWP-1, everything works perfectly. If i use any firmware newer t=
han version 00132, i get the following crash during in module load:
 =

(these are the only dmesg lines emitted, and the adapter interface does not=
 plumb)
 =

[timestamp] ath10k_pci 0000:07:00.0: wmi unified ready event not received
[timestamp] ath10k_pci 0000:07:00.0: device has crashed during init
[timestamp] ath10k_pci 0000:07:00.0: device has crashed during init
[timestamp] ath10k_pci 0000:07:00.0: failed to wait for target init: -70
[timestamp] ath10k_pci 0000:07:00.0: could not init core (-110)
[timestamp] ath10k_pci 0000:07:00.0: could not probe fw (-110)
 =

Does anyone have ANY ideas why this particular card is crashing on the most=
 recent firmwares? I am glad to experiment to try and figure this out with =
others=92 help.
 =

Cheers
 =

+--=3D=3D--+
| Peter J. Dohm (He/Him/His)
| Vice President of Technology
| Black Mesa Technologies, Inc
| peterdohm@blackmesa.com
| +1-614-668-7554
+--=3D=3D--+

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
