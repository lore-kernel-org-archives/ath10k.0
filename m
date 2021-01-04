Return-Path: <SRS0=WYzE=GH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672AEC433DB
	for <ath10k@archiver.kernel.org>; Mon,  4 Jan 2021 12:10:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FADA21E92
	for <ath10k@archiver.kernel.org>; Mon,  4 Jan 2021 12:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FADA21E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pLu/ft9ev71q/upBG8kMbsESq7ZUlrKXQ4KPfB9Vnuk=; b=AWNtJMquACb/KnDctUcjhYF/t
	tl8QXmEZDPHWKmURhji+L/YhxltLvNytX4lmvk8nBZ/kCeZHzafTHwYgECZWTYpdkflR9ElOGcPp5
	vNLwe2CecVHhZVzJO/LzXf7MDcMmmasX2BtICjGIO86r4wNAnKsDMv3djHjNYGKmyoczqO0+TnqEG
	3GRsN4w5/IhPzF9r2enqhjVmQj71En/YaOcMiCd13gg2qu5IFQiPOfkrsq2FlYmkdJdliAZUerr/8
	foNZ0zazGdkMqZTt/DKnnwJwOsMWt36272giQTRbBeh4LirUGX6QOSa+pe6rNmXxe8Py9Q+XTQ0M0
	XJV1rfkjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwOgt-0000Jp-Md; Mon, 04 Jan 2021 12:10:27 +0000
Received: from mail-eopbgr20129.outbound.protection.outlook.com
 ([40.107.2.129] helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwOgq-0000Ht-QR
 for ath10k@lists.infradead.org; Mon, 04 Jan 2021 12:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOX4sntgh4kw1FOIhyQFWv3hjLH97J/tjCqxKjbb3D31VBIvlWg5MiYJVCYm9MMreFzNXabdT1ZgEoCvMFzEkY+Xzdl3gDcrJnmN11Cn1XvbNy7MR508OzGbBH4GQa0pjHb4JaafHKhzaKf1QsdzbFR4PaYt0wltaUk6oGqoOqo+3ORrD8GJJ5f9zEuYOO+lG3j8fqryGD7vDCozqlwpegkUIStjWxE2e/z4gpbER4hrUnGinnAixiz4kwFRTfCnQyVZceXxIxNS3UGa8oRjudOTq+ihFzrGxgSPIydpbxyY7wkp408jf4jDTzlUsMQxkYGPvUHtILXvcS3aKpiiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0lE8Ln0U/c2DsqsTvzi+x1uI44lVixs0+R80AFWGR8=;
 b=gFZUZreM6nBraHu7haJ6PuzjdqwZ8Dgq11ikMk/4Kxq2FSvWKfyIJ+TFKG2cNm2xU8nKDrnz4PA6mqcBbeUmge/lLi2ToV1g1lxX/MWlRWPrdXbOfgLkwyyVaID6ukY3vAY7tmOuWei/NS8rXENfzbRehzoOu4Crb6BJEeM7jI02i411/V0YE1XI71TBma5xX/oEPDFNfP+xJVHtVSNTKf6srN8PfK/krlTDzAo9J+nQfv8ehA/KSGd3TYX+PC8Fld1erU7ASitFHl/HzO5V6My5cO7gsQcfJSdN9GgIfDJN+ObY0dq/AK2sFtYO1cu9WJortWOlVjfydiqLDyDenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0lE8Ln0U/c2DsqsTvzi+x1uI44lVixs0+R80AFWGR8=;
 b=RtWpKJ5acbGP6UbV2tn6On0ULiwFWspQcqK9/1OVnD7VF/CWwFm5beo5u+5k9nLvBNSJYqelODr030TPRmrZ3hKLQXFlAiq+VrhYE6JW01L2Hf743tFVhJ8YXbnGmL1F7PIkGbNlfuBGjK9CMc+67f0cAMxz4OmCIv0JDJz5pyM=
Received: from VI1PR03MB3166.eurprd03.prod.outlook.com (2603:10a6:802:32::30)
 by VI1PR0301MB2399.eurprd03.prod.outlook.com (2603:10a6:800:64::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 12:10:20 +0000
Received: from VI1PR03MB3166.eurprd03.prod.outlook.com
 ([fe80::41f1:9e49:1cd0:55c8]) by VI1PR03MB3166.eurprd03.prod.outlook.com
 ([fe80::41f1:9e49:1cd0:55c8%5]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 12:10:20 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Kalle Valo <kvalo@codeaurora.org>, Brian Norris
 <briannorris@chromium.org>, Jouni Malinen <jkmalinen@gmail.com>
Subject: Re: [PATCH] ath: add support for special 0x0 regulatory domain
Thread-Topic: [PATCH] ath: add support for special 0x0 regulatory domain
Thread-Index: AQHW2BS9rW9W/2Q9MEK639XsC4M4yKoDcOKAgAEVmyWAEu58gA==
Date: Mon, 4 Jan 2021 12:10:20 +0000
Message-ID: <9fd934ec-0b45-4da2-fce4-901bed46c4fb@bang-olufsen.dk>
References: <0BEB3EB4-E3AF-4236-BACC-E42CE2D094B7@adcubum.com>
 <3a3815a68576f1715fcc6db590099b84@codeaurora.org>
 <CA+ASDXP8NoGACT4OBEwMvj9B6KsBYBAwMhxSApb7D-fCvfxwTg@mail.gmail.com>
 <87czz06b2e.fsf@codeaurora.org>
In-Reply-To: <87czz06b2e.fsf@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=bang-olufsen.dk;
x-originating-ip: [193.89.194.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e62b965c-d536-45ac-7bc4-08d8b0a9b4ea
x-ms-traffictypediagnostic: VI1PR0301MB2399:
x-microsoft-antispam-prvs: <VI1PR0301MB2399C8FD71BA403EA84D369183D20@VI1PR0301MB2399.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zIv7rL2Mk8EiCJeBgUxD5jJphf0iHjr1ou84RhW6OMAun2XPS8VcFiseR6l4rbBw53TffIe86927FqXlD4VN0jvCyHPbgpGw19SZ52X+UpRcycPNw3rvzgpTZSld6M059HNK90SbPykJQlXYWWn/KRYtrLjSV7ri4bajGe9BTDQEhw6W+FxAupegNoQ7T1REgu52SmASVP80tNmu1W9l2ZXgUhfui2zQIH6yclcUO4Uhxj+e7iVbQAbQxmbplk5tsqZUxCLVaogg9xC5M+aMQzx74znKEX7PD6E7qg/OOzGfLoxCYalNOFiH9MmTqMrQwM94986037xs1HrSNI6geLIdbY63wTiRkqqTIk3kg/cTgdlizhh47+6Ph+HMwJVwlhyyean+SQlNEuoYOmI2Ne64ubU6z5htrSF3agTegHNuvVGSdM4Lr96t4QfCIxXQzTzSuUJL/qorvq8iafLDLcAPXWM1ICBwTxaxe/ydd8Y3xEvyzpBpy4DAvz9QkWumBKwRG8b2yG1SrBAuwGdQli8ggdwmg46UqUk/99MZ8vIuSrbPOj1e2lHVxDlkW/CB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3166.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(346002)(396003)(366004)(136003)(86362001)(85182001)(110136005)(8976002)(6512007)(31686004)(4326008)(6506007)(15650500001)(53546011)(85202003)(83380400001)(31696002)(5660300002)(36756003)(66946007)(966005)(71200400001)(6486002)(66446008)(8936002)(91956017)(64756008)(66476007)(66556008)(54906003)(4001150100001)(186003)(316002)(2906002)(76116006)(478600001)(8676002)(2616005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RHpTS3JzWHgxdUdsVlhITk52dnJlNGw3c0toR0lGbUxZNEhDMXRZbEt4R2dl?=
 =?utf-8?B?bXlzYk03WjMrLzI3bkxBdmlXYU10SVFCNzNlS3FtNU9ZTkdjWlZvNXdzQmx3?=
 =?utf-8?B?TGtncHFZbjVzNzNla1ZHTHA2eTNmaWVRZkhnWlM3cUNHNnlhd1ZoK1pDbnAx?=
 =?utf-8?B?QVFwU1g5VGczbHBjMFJ2VG9iVDN3OFd1UmJWSC9GUlBVZ01EaytjY29lUkdH?=
 =?utf-8?B?RW5ZeXpPNG4wejBrOTBZUVIvWFVZNlNuSVV2NFdjZmk2N0ZCWmFXRkdoZGRS?=
 =?utf-8?B?aGdYSXVoSERLUDdudVlQUDNCTy93S0kxc0w3N1Rhb0l2QXZGelZhdFMyek9n?=
 =?utf-8?B?WTlGUG9ReWd5OUhlU3JqMXFmZUtQaGUrSWFmNVMzZzRITG5QWGxWb2JiSmdj?=
 =?utf-8?B?ZjljZ0w0NnlJc2UvRkN4TWR6b1JGeFJtaENNNm15QlhDZmZ0NkNzbnJqUFZm?=
 =?utf-8?B?TjhVMjc3Unl6QTVVUkNuNG5EbHRHSG4rMUNQaWUvdGg1MWxKZFIxc2dJQXRF?=
 =?utf-8?B?N2t3OHJjdWdVVkZROVhmQkRERExqLy9DV1lCcktJSldOM3ZmWXZ6OUMxaEw5?=
 =?utf-8?B?bCswejdUZExNbkxaV1FoNUJoWU5QZ0dXZE1VakYzQUVTeTBHcUl6Ym9mTlMx?=
 =?utf-8?B?WEpiUXFva3FWa25tdUQreHhSMU1mNXB4dzg5Nlo2aFVnYlA4TVZaR2dmeFdX?=
 =?utf-8?B?RklQYkIybEVHd2M4MU1KUHhUa1YwU2Iyd0pyRmZjM2NQamkwU2hXbTJ2UHlI?=
 =?utf-8?B?V2ZkRk91VU1SaEpwdlY0YmJ6YWI2NzdnS1NDNk83ejQrNjFIb2dMNUp6QlYz?=
 =?utf-8?B?dzdNb0lPQnRxQW1qU0IxRUFmYi81dzhOUWlWRzhmSHRCUEl1MzNEN1c0Y2M3?=
 =?utf-8?B?V0ljUTBIdzRRL2JZWGVPcEZ6VE9qZWg1YVZxQzZiUldja0RxREJQK3hvOXJo?=
 =?utf-8?B?cFpoc2lyYmRsR3IvUzlGdDY2ekxWN3B2NEdsRFY4VU40MUtRcWFCR2Fka1hm?=
 =?utf-8?B?c0N4d2EwTlFrOFVLd0d5cnZJRmNJNyt0Q0RPWk84WkdqVXIvdlVBaWxqYUk0?=
 =?utf-8?B?WmtVbVplc251UnNGd3hIU2JkbnNZSHRCV3UxanZhRUQ1VnZ3TkVrUXZBSzVB?=
 =?utf-8?B?QTFKQkgrenA1SEMyZXhuckhGTkEzak9oZzR2M3FKNnQxQXNEdHFsZXRtdXUx?=
 =?utf-8?B?TTI2ODJBcnRXRzBVMXNHZlIzUk9tUnNvYUhEWWpmZnNRc1RGK2RCcFFOcGtM?=
 =?utf-8?B?cTZZMCszWmhUV1FLM1NIL2lJd3J2Y1FuR1NRNlNrZE1Od0tVVmpIREYyYm9t?=
 =?utf-8?Q?WQL6hHqLIDDY1KljS2arPMBxtmsf4YlFb2?=
x-ms-exchange-transport-forked: True
Content-ID: <30B096C814EC5442A77427977589F8F9@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3166.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62b965c-d536-45ac-7bc4-08d8b0a9b4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 12:10:20.3463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99sA5Mj93mCN17tAz2djul8KSlkUIgUidF0N3rGHgPy4mMX7jkKDn4/N/3r76CjYUWlWownS8G0T27BUXRHO/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB2399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_071025_024142_06444FFC 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Sustek Goran <goran.sustek@adcubum.com>,
 ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 12/23/20 12:01 PM, Kalle Valo wrote:
> Brian Norris <briannorris@chromium.org> writes:
> 
>> On Mon, Dec 21, 2020 at 7:43 PM Wen Gong <wgong@codeaurora.org> wrote:
>>>
>>> On 2020-12-21 05:06, Sustek Goran wrote:
>>>> Hi, on my ath10k Chipset,
>>>> QCA9984(https://compex.com.sg/shop/wifi-module/802-11ac-wave-2/wle1216v5-20-2/)
>>>> afetr this patch i can not longer to initialize my card.
>>>>
>>>> my dmesg log: So i need to revert this patch! Is my card need
>>>> aditional support? Can you please guide what to do for my card to ahve
>>>> OOB support in streamline kernels?
>>>>
>>>
>>> If this patch introduce issue to you,
>>> I think you can try to revert this patch.
>>
>> Kalle is still planning on applying my revert patch someday, I think:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20200527165718.129307-1-briannorris@chromium.org/
>>
>> We just have to wait.
> 
> Actually I don't see how I could apply the revert due to the regulatory
> problems explained by Jouni[1]. We cannot break regulatory rules.
> 
> [1] https://lore.kernel.org/ath10k/CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com/

Forgive me for insisting on this particular revert, but it still seems 
to me that the premise of the original patch is not correct. I tried to 
explain this in a reply[1] to Jouni's message that you linked, but I 
have not got a reply to that. Could you please clarify so that we can 
settle the issue and clarify what users can do (if anything)?

As it stands there are multiple reports of regression on the mailing 
list and only cursory discussion regarding the regulatory correctness of 
the patch. In the absence of such correctness (which I am trying to 
clarify) the regressions must surely be enough grounds for a revert?

As Brian mentioned in his revert patch[2] the original problem was 
resolved in firmware, and Wen has also agreed[3] that the patch should 
be reverted.

Kind regards,
Alvin

P.S. Sorry if the links in my mail are mangled - my employer's 
mailserver tends to vandalise incoming/outgoing mail.

[1] 
https://lore.kernel.org/ath10k/6a7e3314-6f91-cedb-1ffc-55ae9189dcf4@bang-olufsen.dk/
[2] 
https://lore.kernel.org/ath10k/20200527165718.129307-1-briannorris@chromium.org/
[3] 
https://lore.kernel.org/ath10k/9cc7efbb3c9b29e4553a427e6f58725f@codeaurora.org/
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
