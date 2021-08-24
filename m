Return-Path: <SRS0=2rbV=NP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81AAC4338F
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 08:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2996610FB
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 08:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2996610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GH5gKQIBFtFqnppWQz30OKtGxg97mVr5aQTDiGRrUyQ=; b=Re8mCN/8oax3FH
	9FZjXVkIB4BGwJ1pTLj7p0tuxnvQXuNFa4GNuAXBmuSTgPM0GYES14894+f6SwDkmX7mDf7lr54LY
	rGL2feP6909YcMlw7Zy0QtL69jRGGDtpUPhya1xODsEJYn9zWcSXxawVm7YIx6Tgh5EmBJV52386h
	xAjLx2sqWE1WoZce66XPkVjGJ88houmggVf3BLZYjNLHCj7ojfw40A929zZjuDeSnA0QwJdDzKXrO
	19OA3vzjIrOb++Sm5Z1Ky6f0xBB5F/shTVcBA6tnYIVbPu5PXH9e3IGHzOojRcgH5GHgtXvww/tl6
	dq11FDFlBfTW525rPUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIRMt-0027R3-Gw; Tue, 24 Aug 2021 08:01:11 +0000
Received: from mail-eopbgr80127.outbound.protection.outlook.com
 ([40.107.8.127] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIRMo-0027ON-7g
 for ath10k@lists.infradead.org; Tue, 24 Aug 2021 08:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZhApgoHcIAC69rO5/gse4COemh9rBQBDzHn5AS5nPHEolaM1jIFyiIUBrv5zCb/3qV1OJpe3oynGFVZT5F6AXpR/lI5xJlrPHLZ3kXdtp1aQT0qG4+mL2gJVI8vwa+x8xjGWUkH2kdbdb5YP9yNYnxIAT60YYp+0tRxr/oEkCEOqVR8LCS7SXVPFzbv2WvOVIHBGvXjzTox46vp6fWsf/0mhMHpAE+u25rDKJm3aGu3hSqgUHTNdJ864OHATuyq1DH0hYkX893ek0lfGjYoyG7AGHDn0rcwZA0Rs1eS83go9WAljO3JTYbgTN+LdZaRpQLFlduOMHt53K9oQg9W4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Foprh5Yyv1acjr9EcF5yQCSIgQ/99aNd8ooNEGfUDRc=;
 b=P2k0RF6MThqlIutZCe4VALoEB+JZgHgbmEWvvoAa4BPQWirRfk4lPYreeogrw5PQoh4sL/RI494ihBUAWPGWB4PNnKao4rQH6xHHqyqYzgcfY+vMc+4H0eNvT0IAkNYkro38CkljYVsOhH5lfYOXfcEEDH/jkd0CbdHarXDTWyCqE0SO3YVbDzjIuNqU4SNRrsxWYUsYGir34cnl3cCjBEvxAZAUmBy8kWx3DXNaFm0Sil7A5v5s80IC5Eu8grVwdmipmOJiIbNxjjeFCP7SetbqhZuM4ie5a7wxbPlyw/MPDUYqFawBQVPbd//+2puf1/mB/JrAmwDc19eltmzbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Foprh5Yyv1acjr9EcF5yQCSIgQ/99aNd8ooNEGfUDRc=;
 b=PHbC7uWEHP1g6To2MEnv6PyE5GOr8iTehTl2DtAyhHiV5tRyuDr5gF/Hq1PQ0MBz8g+sevhtqRzvEHdkdQK0zBL63QekTW60yo842xGeVBPr+sddRp20S6v5HbpBVVd/sBWv0/0ikoHa9SIbVJNs3eEWn/zW5Xq+GW+KqWqMUf8=
Received: from HE1PR03MB3114.eurprd03.prod.outlook.com (2603:10a6:7:60::18) by
 HE1PR03MB3164.eurprd03.prod.outlook.com (2603:10a6:7:5d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Tue, 24 Aug 2021 08:00:55 +0000
Received: from HE1PR03MB3114.eurprd03.prod.outlook.com
 ([fe80::7cc8:2d4:32b3:320f]) by HE1PR03MB3114.eurprd03.prod.outlook.com
 ([fe80::7cc8:2d4:32b3:320f%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:00:55 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Brian Norris <briannorris@chromium.org>, Andrey Skvortsov
 <andrej.skvortzov@gmail.com>
CC: linux-wireless <linux-wireless@vger.kernel.org>, ath10k
 <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>, Kalle Valo
 <kvalo@codeaurora.org>, Julian Calaby <julian.calaby@gmail.com>, svp
 <svpm@yandex.ru>, "felix+debian@gueux.org" <felix+debian@gueux.org>, Massimo
 Maggi <me@massimo-maggi.eu>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
Thread-Topic: Revert: ath: add support for special 0x0 regulatory domain
Thread-Index: AQHXl3XA7B6urwS4+0SNCV8LjkYaTauBWEmAgAAxNoCAAA0dgIAAtssA
Date: Tue, 24 Aug 2021 08:00:54 +0000
Message-ID: <4c44fdc2-8dde-8a98-8dd4-4b7e6b57a090@bang-olufsen.dk>
References: <YSJ//ki/A1EgfLga@skv.local>
 <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
 <YSQC32TygIq2SHJR@skv.local>
 <CA+ASDXPi0RRd0gFYcON=XLu8ABwKKcRXf0j0QoCRnvDwGa0VyQ@mail.gmail.com>
In-Reply-To: <CA+ASDXPi0RRd0gFYcON=XLu8ABwKKcRXf0j0QoCRnvDwGa0VyQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none
 header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fa4cf23-50fc-4c66-9a65-08d966d54ccf
x-ms-traffictypediagnostic: HE1PR03MB3164:
x-microsoft-antispam-prvs: <HE1PR03MB31647CDB51980CC1D90CF93983C59@HE1PR03MB3164.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8MWjKL2rUdLcxx1jayWqEr7GxOyQRl5AuYv+YB3vv57BMJax0g6hOZJk9H+XlhqXa+fDBzFr4zEGqxAz3+gMqLrCcUSWZJZcOeXAfiZRnD7N3PoP32+v2GPrLGH1s7Ml1J/e1ZS4RUKbxYYdLqeP7kqwO76eQYrxx8IaEf7GKjYe5jtPokbIjMmTLNjT4Qqq1RfOhMM6HuDaStjjAWPZqGmTPJVAEmGnNeeC0GkyeIlJVxI3nyYb2Pb005Dj87GQwWWiLLkU6Jn3mWRyKhBJ+O2966sOKmnqXELSWObX+BmCZplb/7J2+BpIDIUkYDKnTaGI05fHYZOYvVcbNzhFdaxoRm23YHnQQpg4FWxVezi8P/XP1sjV5Rtqdkcvef/vr9nb2nzzyGULGxl8eC3UTwBlH7guQxJjfGhiJ/P9uhbLb1Mg39vzaXJlAplJ20pxvozz9U9+Y1VyWSgIkWkObIkTh2It6/n0qhkKeJKsLs1FrloKMTjPYjpkdBr9fwzR4107xwzIeQjiQCtWQ0+RNJtCLPPkKFLWQa+sgwyvD1NFC/ddeIwNhK1j5p/gS0Mw3ObDKHtho/tCixDJWeq/dDzgh8UmnSXlBQejWf0wKWku6sH9UCbJaAW2ExC1Si1PBMvi9x89CI8iigF6Le6RP1Uxr2Q0bjIKGlEqw26FEYU5XuwsHYBxihCg8Ji9QRvz0FDJiUdxm5IOGcP+wlxa5IaTJX1dmF8WBWkI3oXAL5RmOcGiYvzco8CkLzOuJAToEXPZJtrz7q7c9lG2LPwGTdsfmmDroRkkhidV/0M6lB9XH6E5MMLz/fyvqWKqhdRCSNs4dajtRPMeLj4st0OEv7x99Eo+DlYN0dYmwniqzXM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3114.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(86362001)(85202003)(4326008)(31686004)(8936002)(71200400001)(53546011)(6506007)(8976002)(8676002)(15650500001)(316002)(2906002)(31696002)(508600001)(85182001)(76116006)(26005)(6486002)(966005)(2616005)(186003)(83380400001)(6512007)(122000001)(38070700005)(66556008)(5660300002)(54906003)(66446008)(64756008)(38100700002)(66946007)(66476007)(91956017)(110136005)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHZKTDh0WFplb2FBNlliY2NWei9hcHFVQ3FWeGFiVW5nSVk3dDBTdVc2V09n?=
 =?utf-8?B?VzV6bVFiRVUrT3BBV1lPcjRWR1dKVUFYcmVlUEZuUllOWWN6MW9JUEc4aG5O?=
 =?utf-8?B?Zkc2WExmVUpYZWpJazRyRGx6cm1uQndwK0JXTnBjTFN3MHYvSW00dmcvNmJL?=
 =?utf-8?B?NzcvWTZJSVBGRG8zeEVwQXUwUEo4RytMODdyZnFldE9tZ2xyREk3cXJPYTdJ?=
 =?utf-8?B?TGRPRE9ubXBDamVzRFhDMlB1b1pZUlpnRWhEc0ZQalZ1NTMrYlVqUmVSVHQv?=
 =?utf-8?B?enFxRW9WRW5wblhuYUxnaHdYNUJKL0F3Q1M5SGQ4VWVFNnVLek9sWjNWYTZJ?=
 =?utf-8?B?NFpRR1JwUEZDKzNLZUZJb21CeWxXZmNVVUk2L1V4Rzk3YXBiUVkxSENIZTFi?=
 =?utf-8?B?TVo0clJzVXd6b2IwSFJYUGhNbHpTS1BGYWxodjRMcURldm1RS1hWUXcyaW5H?=
 =?utf-8?B?UXpPQTNrL3k2dnNVbFNJWStxWTg1dkEydS9MRVVUSzZPUmVOUlRDSXlJVEJJ?=
 =?utf-8?B?Ky8wVTA1R0N5QXk4Q1dKcVFpaVVJRDU3UzkxTXJyVkUvOVk0QU4zejFTK1lq?=
 =?utf-8?B?T2JiaGpveDYxVlN4dHQyeGhhU2xvSE9hcDB0OENWakRFaDRyODlPVDZTRTBy?=
 =?utf-8?B?Z3JTZERrTXdtd1pPcGg4M3V3UUdYR3UySTZpT21iT3Urd3dmMWhKUmVNMnRT?=
 =?utf-8?B?cXBKUzc3MUM0NjZKMXFTcnc1d0Q4aThBNmJVaTVWeUlVTmhEQUtMdzNycHR6?=
 =?utf-8?B?MXVWRFpZNVJGYVQ2RFdIbkV5L1E5TER0My93MjRUK05rTnMzc21kSHV0N2dN?=
 =?utf-8?B?eSszNmZRN013VFpOOStKZXpXYjEzRnZFTFVJYnVMazRtd3N0QTBLUHpzN2Vm?=
 =?utf-8?B?UEZuLysxVkV4ZFBQZE9IbXBpNk50MXhNdHlhN2JiK1FVVC9rWmswUnQvM0Vu?=
 =?utf-8?B?NUNXemlOT2dVN0RIL2pBUFBEY3Y3V2FRZjNhYVVNRE1BNWRadWc1d1pmd0lV?=
 =?utf-8?B?NUtMOFFmL3ZkS1FmMWZFK2tGRFYyRnhDbFJlYW5DOHd3Ukh3RWdTdmhSaUpo?=
 =?utf-8?B?aWFkNlc2VjN1ejVFaEFpeVFKSjNYQWQ4Tk02bXgzbzBKNDQ3c3lxSTVqZHBW?=
 =?utf-8?B?d05TeERKSEF4RXlqTUpwUUtVSmlxTHQrUzByblNJTUlMRFJJUUNqSE1iSC9Z?=
 =?utf-8?B?cFZSQUc2MHlXWERqUlBSU3NiekhjRHUrM1VmTWJpak9GMnFVN0Qxc2lGSmNP?=
 =?utf-8?B?ZFVHTTR5cVhqRDBGdXh6R2kyUkg4bktVOTJLeVR6LzFEWFQxbnl2Ky9DOEtl?=
 =?utf-8?B?OEcwdVAvWnVBT1JkUUIyR0R2Vmt0MDFQNHpic3RYWnRSSFpEVC85TEFNbFZi?=
 =?utf-8?B?cm5WbUo0TWJTdEkzUEdhQzJYTVpEbVVWa3d0TFlOK1RNS0Q4ajVqL2pDWFJ6?=
 =?utf-8?B?SjdPSmdpb05EdzMzbHZMb2R5Y0haaHpEcisremRRL3F1SEUzSXpPWVBYdHow?=
 =?utf-8?B?dVQxd0pybWxHUTNNMlcramp5QklEZFV6SUZKSkkvVC9Idyt4K1hMWUR6Wm1B?=
 =?utf-8?B?dXhrV2VFd3YwRXRRYW4wZXpuTDVlYm1oTmNvV3lOK1VlT3FUcEhDQ1NadFZP?=
 =?utf-8?B?Q1J4SUxzNFpla0JYcWh6STAvQWhlM2RmaThWcWsyaE9rVDRpdnB4Z1lKTGNm?=
 =?utf-8?B?alBmelIvSTRVd2pqNDdwRkF0ZmNnSlF0Q3JES3R0TEZYVC9pRENXM2NidHNj?=
 =?utf-8?Q?nCw4noxLS6K46Vq2KW43xS39G69IXJAbfcXGmc6?=
x-ms-exchange-transport-forked: True
Content-ID: <D670AD28A0818443AE3005385599FEF6@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3114.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa4cf23-50fc-4c66-9a65-08d966d54ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 08:00:54.9908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+P+4AV15JnBBddDaM0W0ZD8uH6WxhxNCSehY4/iEYdpCKEHGYErIUAHCWFhGMi4pLmjOHM+plIB15oUZnpp6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_010106_444275_907441A1 
X-CRM114-Status: GOOD (  19.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 8/23/21 11:06 PM, Brian Norris wrote:
> On Mon, Aug 23, 2021 at 1:19 PM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
>> On 21-08-23 10:23, Brian Norris wrote:
>>> Maybe it needs an Nth person to submit a revert?
>>
>> Later (Dec 23, 2020) said "Actually I don't see how I could apply the
>> revert due to the regulatory problems explained by Jouni". [1]
>> I think this could be the date when your patch was marked as Rejected.
>>
>> 1. http://lists.infradead.org/pipermail/ath10k/2020-December/012370.html>> 
> Oh wow, I almost forgot about that... Too many threads. I also forgot
> that I already replied, expressing my disagreement:
> http://lists.infradead.org/pipermail/ath10k/2020-December/012372.html>> 
> But I guess it's not really expected that mainline Linux really works
> as-is on most products, unfortunately, and the maintainers don't have
> enough time or energy to provide constructive paths forward on real
> issues like this :(

Jouni gave a good explanation for why the offending patch is correct, 
but it hinges on an interpretation of country code 0x0 which seems to be 
incorrect. I followed up on that almost a year ago here[1] but the 
thread went cold after that.

Numerous people - myself included - have cited sources clearly 
indicating that 0x0 = US, NOT unset. See the same post[1] for more info.

I still think this patch should be reverted unless somebody can provide 
a source to the contrary, re: the meaning of 0x0.

It's unfortunate that this is still affecting users, particularly when 
the original author of the patch even asked for it to be reverted.[2]

	Alvin

[1] https://lists.infradead.org/pipermail/ath10k/2021-January/012374.html
[2] 
https://lore.kernel.org/ath10k/9cc7efbb3c9b29e4553a427e6f58725f@codeaurora.org/
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
