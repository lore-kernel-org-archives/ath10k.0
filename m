Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39038C04FD1
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4Popq9k2sDDhUjWXWgGfKUUfyH2guI2e4/fppntRUQ=; b=21WAYcktR5O4gHV4aKmxKnmKo0
	ul7gLh6friHP3edwAMYVKSBNzxJG2cexDQe7eA58M8jbJQdwDAICGBanJPXvZwXYNFxNBljfebyaz
	GDkNjLyJfN/yI0/K8NRjHgoaGwBFy8znE9WGBL2E/Rgfco/kZsv78lBb/ngqg/tLIu0PfkkduY/0H
	4MTNgOrFbKbrp0BPFRfUZbFAm3+XCBDBhEltXzIMKb67kUjytNt9nXd/BKUNoKl16688f8lB2+0AP
	YUOq/BcbYCSWYLzJT1vmaZ/2Hx3f8dgunFbDqPc5UL5dEqXhqhULs3BzVcFlyq4as6B3yDQ/aoHpD
	SX/x/ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1uw-003rj5-0p;
	Wed, 20 Sep 2023 18:27:18 +0000
Received: from mail-dm6nam11on20705.outbound.protection.outlook.com ([2a01:111:f400:7eaa::705] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1us-003rhw-15
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 18:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPXpoKuRwtPxuSKIdqGDbL1QIjTLuz70vHtbdjCR1tuwrjxxvSzlMDRmjErA3lskOTv/QOq6heQat0/NN6o8abWOjnpNHqXKBA/IgVNYB6ILUaC/wHb8wU2ppl789EF7Va0WwSXq1teAcfkB/TPOJrqF5FKNnX8GNyxHe4YmmllSSVXYValof9DcR1ygZy6QfoSnYyZxEHrfR3z5+m9vmqHEmb+4PYUP/ICNyulWqsrQhDXT0HQeFN7+8TJyUyygbtH+/6G7GD0iwl0t5TOTygTYeY+CywN59YEZfxQsZOfHEyAXXbaL5NZzDkEopjWvljP2IZBape2towTivLGo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKwg4oNO7rocIxrmF6x7NVv1jHCzFgtMJo9u4CAqf6s=;
 b=ldVdzC7C+7v9Z5ojvtkvrEzW7k5yLCPAJHK4HctKTuu4r0GgQIBRlCJDMPaGsmc5DLAAjuBRUvtPFGu1WFnLw58M8tIJyniiEb9TCXo2Nrv403bH5mYt/KkL4Y4UN+yuWYRtuw/RWXt28Eb5uTdKwxwGDi679yL0ichPoDngNyZP7XAjVH61qGwtk5OyUlHraDcyBLx3ljLYCIkODEMfJxCyvspNZPOq9UukWbiOp60wZfBTMrM71VenaUwb2hoZM3D/4PGvIeEC+FRRmUgaQ51l7Oh6g384sZB8WcbdRwsXxnu4lnQuDr7vp87FutkCmLlyeVlRZ2fsLCgyaIJCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=locusrobotics.com; dmarc=pass action=none
 header.from=locusrobotics.com; dkim=pass header.d=locusrobotics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=locusrobotics.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKwg4oNO7rocIxrmF6x7NVv1jHCzFgtMJo9u4CAqf6s=;
 b=oFHRmXcpUfEQAlGJJjR99+93SFIsODNh4vonfHzPZ5VqUIwX8TYV/6PYT7PhKH7mOGcOclzXdTJievDZJAfeZsa+uuTqJ1DwAAvL7UjhHq9X8NValEniRSVPao12lHDHtI+baC3af+07XvTO+9E95U418qOWpS74X2RAese81/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=locusrobotics.com;
Received: from BL3PR10MB6163.namprd10.prod.outlook.com (2603:10b6:208:3be::9)
 by LV3PR10MB7867.namprd10.prod.outlook.com (2603:10b6:408:1b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 18:27:07 +0000
Received: from BL3PR10MB6163.namprd10.prod.outlook.com
 ([fe80::1fb9:6bdf:cfce:7096]) by BL3PR10MB6163.namprd10.prod.outlook.com
 ([fe80::1fb9:6bdf:cfce:7096%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 18:27:06 +0000
Message-ID: <4a02dd43-c629-4c7c-83fe-256e6d444d60@locusrobotics.com>
Date: Wed, 20 Sep 2023 11:27:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
Content-Language: en-US
To: ath10k@lists.infradead.org
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
 <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
 <87h7mktjgi.fsf@codeaurora.org>
 <db4cd172-6121-a0b7-6c3f-f95baae1c1ed@linuxfoundation.org>
 <87wnvesv8t.fsf@codeaurora.org>
 <82e3e0a2-d95b-cffb-4fa7-2eaa4513dd48@linuxfoundation.org>
Cc: linux-wireless@vger.kernel.org, skhan@linuxfoundation.org,
 wgong@codeaurora.org, kvalo@codeaurora.org
From: James Prestwood <jprestwood@locusrobotics.com>
In-Reply-To: <82e3e0a2-d95b-cffb-4fa7-2eaa4513dd48@linuxfoundation.org>
X-ClientProxiedBy: CH0PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:610:118::31) To BL3PR10MB6163.namprd10.prod.outlook.com
 (2603:10b6:208:3be::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR10MB6163:EE_|LV3PR10MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 91480537-1c1d-4aac-3feb-08dbba0731d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vEzA7iOLuy/gimr9AdgH8WPwC0sX8L4YErs1iuvm2qMCy/Tbi2zzwZwF8NGWFs0VdrGyEyA1gFeZLlLlGAF5a/96xl7yBvf6I8mEB19RcWgCnQzw7Np6FkHIi94ITHQGs0m6z1cwVTvvApiVy9KGiSa74ARstxJs5zIWuQTPTQin2SLtM6nYDD831cv9r5LRRxgIooxcwpER0JOY+8ksD/0/2GYVMy6FP7ANWGuQg8vQn9H3yo7qQCY/w0FVypiCjny0jJvF1Tvx7f2o87GUMrcw5catYq6CWJbh8UTA41fqC2jLouRLV6hp5z/s1FP91IKjzSzRWOFJK05X8q/6Kx02z24z8lfDbKvZmrvYBw1/Fr0D9QuS9ttFOenH90msyvgSevcpZnuh49SvY2kQ/YSdgjS1v0NK8Zx92ENk4iXfxOTW+Foqc7VjGipg/p5w+NxLXAXyzIeHZERJW2+61ft5c9KmbJT0ctO5FHZ+u+kFXRf1/cV8UKflgLRe4bs55+4XpKwoRRTz8SsYe/SFr1PPa7fcQljhFh8psizPFCCWkDJGlclM6//DzdOx0UaCYO3zwxIEmnKTu072jNTLJQAPo3Ybe/9tIhaWl+ocjOIG9KsGQHkB1HWcU0pAb4uzoZg81q+8wQ2yK4DP13GWZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR10MB6163.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39850400004)(376002)(366004)(186009)(1800799009)(451199024)(2906002)(5660300002)(15650500001)(26005)(41300700001)(6916009)(66476007)(66556008)(66946007)(316002)(966005)(478600001)(8936002)(8676002)(4326008)(31686004)(6486002)(6506007)(53546011)(6512007)(2616005)(36756003)(6666004)(86362001)(31696002)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDhtWmlIR3VHckxUajVmcDRISXhIR3NsdWV5cmw3MlV0Y3pERDNxS0NMM1dr?=
 =?utf-8?B?TFREQnJJaVN6MjFldTRyTHg2c0trYUxWaGlnR0VnNWw4YzBaSm5iTkRWUVZ3?=
 =?utf-8?B?bkQrNzF3NGtiT1pVMkYwOEdiTEVEalhsdUlBc09pODJXQzVHcHVCY3E2T0FQ?=
 =?utf-8?B?MlZLbndFd3A4TTlGT0Vzbisyb1VjbHRuM045NVVZTGNFNkw1YStDYkdYMHNj?=
 =?utf-8?B?OW5JWG9lOTAvVFgvQ3p3UTFwQzRxMHppU3FUV2xCRXlrMTcrVWNBb0dkODRy?=
 =?utf-8?B?RkkrSzJKbEZ3VmtWOXZ5V244Z1h2Yy8zTVNYMjRkNG4va2pocElsSG0ySlVy?=
 =?utf-8?B?Y2RSSXBwdEZCZGJ6aEVwQ3FOVU8xSElwbFRYT2hmVzU1N24yS3hCVklFWjBj?=
 =?utf-8?B?aHp2TldmUzJLNGN3bUpMcHVIV0dwZmJ5RktWTklMaHp3QWdtb0VrT1N3TmRE?=
 =?utf-8?B?QVB6OGZML3ZEUWsybHFGZmtqN0lua25yYU9pSGpjbmQ0V25tWVFOaEhWbW9S?=
 =?utf-8?B?VVJTUllEcFA3RVRZRG4vQU1kUUIwOHhCcTMvYnljRjBwdU5EYTZxeExFcEpH?=
 =?utf-8?B?VlgvTmdQOWYweU9SZGFNNEg2VkpER3ZSRmNvWDBkTENZallGNjNrbnFPMDli?=
 =?utf-8?B?KzV0WmVVWDU1WklsV25Yb2NQbEU4SjFxdEVJa1g3aGJ5Umpya1B4aURZdTdh?=
 =?utf-8?B?MnltcEI4TXdpRGpxTjdDZWwxUlBaSGppUDN6bjZHaWc5TUhOaFRMZGVqdi9L?=
 =?utf-8?B?aWJuTUZERDFGdThSZk9vYXA5V0NjZnA3U2lweUhrTHFOK1dvUnR2MWIxUmFu?=
 =?utf-8?B?ekVwSGRTLzhRalpTeWMwSmJCREEvNXAwVURSZC9GekkvWlRwbzFVQnFsT3lU?=
 =?utf-8?B?Q2orWEloLzZMSlJFNWVjWnZQV25iZ1BscWtYbzAzRVVjcFdCMUJ2Q0NqN1ZY?=
 =?utf-8?B?SEdWWjJTb091SkRDQUdjejNhRWlBMTNKdlB3d2V2Z1htUlhFdmc1RkZiY2E1?=
 =?utf-8?B?bDdibnJwTjRJNlIzMyswczZDcE90VVd3Q3YwWVN2czNpUjFWQitHNlVQYS9h?=
 =?utf-8?B?em81dDhGL1RrUk9PSkZCNjE1LzFocHhEc2JNTjEwbFI4T1g3V3U3UEhCS09G?=
 =?utf-8?B?OXBxVmhiVktuK1pDSElVWGxyVEJyY1gxTXRRcHc1d1RNVklLbUM1cllyVmtK?=
 =?utf-8?B?c0Z1VGVSKy9ac1FBdEdGU2pFYlZJYm50N1ZRalpQaWNsUTBuYWk2cU9lclFi?=
 =?utf-8?B?dlRCeUo5N0k5SGkyNzdmdktVcms2NTNjdTBTeWVjdXh6Q3d4aDdvQ1lLYWJx?=
 =?utf-8?B?MTY4ZDR0T3FxRytnVHIxdzdDNEI4cnlnNDlsSE03WXptS2YvaVhiMjg4YTdR?=
 =?utf-8?B?UExpcWp4azUxeFFiMW4wVWt0SDFnRERPbVBSNDJLYU0rMXp4U2lycFNJM1Nm?=
 =?utf-8?B?RzVyc2t3UHdsYVc2QytTUnJLN0JyMEJQcWJ5cnI2eElMRUhnczRiQTBQYWtu?=
 =?utf-8?B?WklEa2RzNWM1eWpaTGVHSEZkVFo0SjlnWXNKN2hjUGh1NEwxVmNoN2xVcnVG?=
 =?utf-8?B?SGIydmlxZFlwVFJQdEIwUVVrVm8wZi9QTDhqdDhzd0haL1RwdHBFZW9NUjQ1?=
 =?utf-8?B?ZmVsTmNucnVOc0s5Z1h2OTF6TzZaY1JtRlN1MG9EQWhZa1N3c0lPZTFEbzhJ?=
 =?utf-8?B?TXYxYityL2djZzhDT2xGUk9mUStBMk0yUWVxS2daU1ppRER0WFNIWUFMdklJ?=
 =?utf-8?B?aDNVdE0wVFRkSFIvRFZBN2JKZm5YUWt2dklwbVFxTktMZkVzV3Y4T01Fd1FD?=
 =?utf-8?B?cmFkQnBIK29QaGlCYXFDaXlBM2k1MjNLaUI4V0N6T3M3M3VQSEJYaVB4alV1?=
 =?utf-8?B?TkNkT2RGVFVUTVNnbHBuQjVDd3FZSGlGRTRTYmxUd2RtZTNJMnVEQU9jbHhU?=
 =?utf-8?B?dGRLU3RSZm5oalhrN1J6MUNIUzRCN2lINWhTZ0hWamxXR1hJVUIwL2pCSHM3?=
 =?utf-8?B?c3Y0RkJqMFl3QVhJclFFMHk5YVBkZFk2RTdVTHM5eDMrQ0trRndhWlpGbU5W?=
 =?utf-8?B?aExmSFZzWWVxVGtucFhlcTlUVWJXNWl4b1lTWG05NTRCeW1QaTY5Yi9COGI5?=
 =?utf-8?B?bDdtNStMbUN1bUluOEtuZjhMVUovaDc3OXVzOHVrZmNuc3lyWXJCOGU2NGpE?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: locusrobotics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91480537-1c1d-4aac-3feb-08dbba0731d2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR10MB6163.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 18:27:06.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 068f275f-67fa-4977-a33b-80fe854a9590
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvN/rRM2VbLSxBK9YgqgKxPIQXTi+s1sItzJlJqOrtkbHa00V9EDTrfuMK2Eh+6Rsqj4qWWeCMANRDr6BgiqpjzVNg4gsNlUZDTlGwCA2Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_112714_487293_0CDED4B1 
X-CRM114-Status: GOOD (  25.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gMi8yNi8yMSAxMDowMSBBTSwgU2h1YWggS2hhbiB3cm90ZToKPiBPbiAyLzExLzIxIDQ6MjQg
QU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyaXRlczoKPj4KPj4+IE9uIDIvMTAvMjEgMToyOCBBTSwgS2FsbGUgVmFsbyB3cm90
ZToKPj4+PiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4+Pgo+Pj4+
PiBPbiAyMDIxLTAyLTEwIDA4OjQyLCBTaHVhaCBLaGFuIHdyb3RlOgo+Pj4+Pj4gYXRoMTBrX21h
Y19nZXRfcmF0ZV9mbGFnc19odCgpIGZsb29kcyBkbWVzZyB3aXRoIHRoZSBmb2xsb3dpbmcKPj4+
Pj4+IG1lc3NhZ2VzLAo+Pj4+Pj4gd2hlbiBpdCBmYWlscyB0byBmaW5kIGEgbWF0Y2ggZm9yIG1j
cz03IGFuZCByYXRlPTE0NDAuCj4+Pj4+Pgo+Pj4+Pj4gc3VwcG9ydGVkX2h0X21jc19yYXRlX25z
czI6Cj4+Pj4+PiB7NyzCoCB7MTMwMCwgMjcwMCwgMTQ0NCwgMzAwMH0gfQo+Pj4+Pj4KPj4+Pj4+
IGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBpbnZhbGlkIGh0IHBhcmFtcyByYXRlIDE0NDAgMTAw
a2JwcyBuc3MgMgo+Pj4+Pj4gbWNzIDcKPj4+Pj4+Cj4+Pj4+PiBkZXZfd2Fybl9yYXRlbGltaXRl
ZCgpIGlzbid0IGhlbHBpbmcgdGhlIG5vaXNlLiBVc2UgZGV2X3dhcm5fb25jZSgpCj4+Pj4+PiBp
bnN0ZWFkLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNodWFoIEtoYW4gPHNraGFuQGxp
bnV4Zm91bmRhdGlvbi5vcmc+Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgwqAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9tYWMuYyB8IDUgKysrLS0KPj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYwo+Pj4+Pj4gYi9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4+Pj4+PiBpbmRleCAzNTQ1Y2U3ZGNl
MGEuLjI3NjMyMWYwY2ZkZCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvbWFjLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvbWFjLmMKPj4+Pj4+IEBAIC04OTcwLDggKzg5NzAsOSBAQCBzdGF0aWMgdm9pZCAKPj4+
Pj4+IGF0aDEwa19tYWNfZ2V0X3JhdGVfZmxhZ3NfaHQoc3RydWN0Cj4+Pj4+PiBhdGgxMGsgKmFy
LCB1MzIgcmF0ZSwgdTggbnNzLCB1OAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmJ3IHw9
IFJBVEVfSU5GT19CV180MDsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICpmbGFncyB8PSBS
QVRFX0lORk9fRkxBR1NfU0hPUlRfR0k7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoCBhdGgxMGtfd2FybihhciwgImludmFsaWQgaHQgcGFyYW1zIHJh
dGUgJWQgMTAwa2JwcyBuc3MgCj4+Pj4+PiAlZCBtY3MgJWQiLAo+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByYXRlLCBuc3MsIG1jcyk7Cj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgZGV2X3dhcm5fb25jZShhci0+ZGV2LAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgImludmFsaWQgaHQgcGFyYW1zIHJhdGUgJWQgMTAwa2JwcyBuc3MgJWQgbWNz
IAo+Pj4+Pj4gJWQiLAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmF0ZSwgbnNzLCBtY3MpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4+IMKgwqAgfQo+Pj4+
Pgo+Pj4+PiBUaGUgezcswqAgezEzMDAsIDI3MDAsIDE0NDQsIDMwMDB9IH0gaXMgYSBjb3JyZWN0
IHZhbHVlLgo+Pj4+PiBUaGUgMTQ0MCBpcyByZXBvcnQgZnJvbSBmaXJtd2FyZSwgaXRzIGEgd3Jv
bmcgdmFsdWUsIGl0IGhhcyBmaXhlZCBpbgo+Pj4+PiBmaXJtd2FyZS4KPj4+Pgo+Pj4+IEluIHdo
YXQgdmVyc2lvbj8KPj4+Pgo+Pj4KPj4+IEhlcmUgaXMgdGhlIGluZm86Cj4+Pgo+Pj4gYXRoMTBr
X3BjaSAwMDAwOjAyOjAwLjA6IHFjYTYxNzQgaHczLjIgdGFyZ2V0IDB4MDUwMzAwMDAgY2hpcF9p
ZAo+Pj4gMHgwMDM0MGFmZiBzdWIgMTdhYTowODI3Cj4+Pgo+Pj4gYXRoMTBrX3BjaSAwMDAwOjAy
OjAwLjA6IGZpcm13YXJlIHZlciBXTEFOLlJNLjQuNC4xLTAwMTQwLVFDQVJNU1dQWi0xCj4+PiBh
cGkgNiBmZWF0dXJlcyB3b3dsYW4saWdub3JlLW90cCxtZnAgY3JjMzIgMjllYjhjYTEKPj4+Cj4+
PiBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogYm9hcmRfZmlsZSBhcGkgMiBibWlfaWQgTi9BIGNy
YzMyIDRhYzA4ODliCj4+Pgo+Pj4gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGh0dC12ZXIgMy42
MCB3bWktb3AgNCBodHQtb3AgMyBjYWwgb3RwCj4+PiBtYXgtc3RhIDMyIHJhdyAwIGh3Y3J5cHRv
IDEKPj4+Cj4+Pj4+IElmIGNoYW5nZSBpdCB0byBkZXZfd2Fybl9vbmNlLCB0aGVuIGl0IHdpbGwg
aGF2ZSBubyBjaGFuY2UgdG8gZmluZCAKPj4+Pj4gdGhlCj4+Pj4+IG90aGVyIHdyb25nIHZhbHVl
cyB3aGljaCByZXBvcnQgYnkgZmlybXdhcmUsIGFuZCBpdCBpbmRpY2F0ZQo+Pj4+PiBhIHdyb25n
IHZhbHVlIHRvIG1hYzgwMjExL2NmZzgwMjExIGFuZCBsZWFkICJpdyB3bGFuMCBzdGF0aW9uIGR1
bXAiCj4+Pj4+IGdldCBhIHdyb25nIGJpdHJhdGUuCj4+Pj4KPj4+Cj4+PiBBZ3JlZWQuCj4+Pgo+
Pj4+IEkgYWdyZWUsIHdlIHNob3VsZCBrZWVwIHRoaXMgd2FybmluZy4gSWYgdGhlIGZpcm13YXJl
IHN0aWxsIGtlZXBzCj4+Pj4gc2VuZGluZyBpbnZhbGlkIHJhdGVzIHdlIHNob3VsZCBhZGQgYSBz
cGVjaWZpYyBjaGVjayB0byBpZ25vcmUgdGhlIAo+Pj4+IGtub3duCj4+Pj4gaW52YWxpZCB2YWx1
ZXMsIGJ1dCBub3QgYWxsIG9mIHRoZW0uCj4+Pj4KPj4+Cj4+PiBXb3VsZCBpdCBiZSBoZWxwZnVs
IHRvIGFkanVzdCB0aGUgZGVmYXVsdCByYXRlIGxpbWl0cyBhbmQgc2V0IHRoZSB0bwo+Pj4gYSBo
aWdoZXIgdmFsdWUgaW5zdGVhZC4gSXQgbWlnaHQgYmUgZGlmZmljdWx0IHRvIGFjY291bnQgYWxs
IHBvc3NpYmxlCj4+PiBpbnZhbGlkIHZhbHVlcz8KPj4+Cj4+PiBTb21ldGhpbmcgbGlrZSwgYXRo
MTBrX3dhcm5fcmF0ZWxpbWl0ZWQoKSB0byBhZGp1c3QgdGhlCj4+Pgo+Pj4gREVGQVVMVF9SQVRF
TElNSVRfSU5URVJWQUwgYW5kIERFRkFVTFRfUkFURUxJTUlUX0JVUlNUIHVzaW5nCj4+PiBERUZJ
TkVfUkFURUxJTUlUX1NUQVRFCj4+Pgo+Pj4gTGV0IG1lIGtub3cgaWYgeW91IGxpa2UgdGhpcyBp
ZGVhLiBJIGNhbiBzZW5kIGEgcGF0Y2ggaW4gdG8gZG8gdGhpcy4KPj4+IEkgd2lsbCBoYW5nIG9u
IHRvIHRoaXMgZmlybXdhcmUgdmVyc2lvbiBmb3IgYSBsaXR0bGUgYnV0IGxvbmdlciwgc28KPj4+
IHdlIGhhdmUgYSB0ZXN0IGNhc2UuIDopCj4+Cj4+IEkgd291bGQgcmF0aGVyIGZpcnN0IHRyeSB0
byBmaXggdGhlIHJvb3QgY2F1c2UsIHdoaWNoIGlzIHRoZSBmaXJtd2FyZQo+PiBzZW5kaW5nIGlu
dmFsaWQgcmF0ZXMuIFdlbiwgeW91IG1lbnRpb25lZCB0aGVyZSdzIGEgZml4IGluIGZpcm13YXJl
LiBEbwo+PiB5b3Uga25vdyB3aGljaCBmaXJtd2FyZSB2ZXJzaW9uIChhbmQgYnJhbmNoKSBoYXMg
dGhlIGZpeD8KPj4KPgo+IFBpY2tpbmcgdGhpcyBiYWNrIHVwLiBXZW4sIHdoaWNoIGZpcm13YXJl
IHZlcnNpb24gaGFzIHRoaXMgZml4PyBJIGNhbgo+IHRlc3QgdGhpcyBvbiBteSBzeXN0ZW0gYW5k
IGdldCByaWQgb2YgdGhlIG5vaXN5IG1lc3NhZ2VzLiA6KQo+Cj4gdGhhbmtzLAo+IC0tIFNodWFo
CgpJIGtub3cgaXRzIGJlZW4geWVhcnMsIGJ1dCByZWFkaW5nIHRocm91Z2ggdGhpcyBXZW4gbWVu
dGlvbmVkIHRoZXJlIGlzIGEgCmZpeCBpbiB0aGUgZmlybXdhcmU/IEkgaGF2ZW4ndCB0cmllZCBh
bGwgb2YgdGhlIGZpcm13YXJlIGJpbmFyaWVzIGluIApLYWxsZSdzIHRyZWUgYnV0IHRoZSBtb3N0
IHJlY2VudCBkZWZpbml0ZWx5IHN0aWxsIHNwYW0gdGhlIGxvZ3Mgd2l0aCAKdGhpcyBtZXNzYWdl
LiBJcyB0aGVyZSBhIHNwZWNpZmljIHZlcnNpb24gSSBjYW4gdXNlIHRvIGdldCByaWQgb2YgdGhl
c2U/CgpPbmUgdGhpbmcgdG8gbm90ZSBpcyB0aGUgb2xkZXIgImZpcm13YXJlLTQuYmluIiBkaWQg
bm90IGhhdmUgdGhpcyAKcHJvYmxlbSwgYnV0IHdhcyBtZXQgd2l0aCB3b3JzZSBwcm9ibGVtcyBs
aWtlIGRyaXZlci9maXJtd2FyZSBjcmFzaGVzLgoKVGhhbmtzLAoKSmFtZXMKCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGF0aDEwayBtYWlsaW5n
IGxpc3QKPiBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
