Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F90F483F8
	for <ath10k@archiver.kernel.org>; Mon, 23 Mar 2026 21:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O8Ct7EmEiAjSfCA94IsWE2SXpxg6XMozjcDy2gT6rYY=; b=o/OOtv3jYhmph2
	hMG6iJ2oOWRBZmt3sNUWiv+Fi3ra1HF8qPS23yiTOEVEPW3cXh6oiX+e+2knQwkx439p1nG7+AxJR
	VJ/Qp08/zv0yQXQsIrl10SAZbq2p28w3GXEphbVQlZXF8C5K1QVFMTYW2QNDZDSJ8p6RVLGVbdn54
	1PLeFXaIFERQCWsuiU4pg1OuC4Ky+rFmP7J/VJBeVYR89q7CqKwNnbTLPrfD1pTvZ8D0u6dcQFLvk
	aZpHk0yfp3JmZf4GAjmh4bsaHjWWW7i0lD2okvPK/Wk2IHgnErtwLxNqNjUS3usew3pOPPQgpSTjB
	RwXa+PnLeX1UTx7XzM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mgS-000000000Xm-0pLD;
	Mon, 23 Mar 2026 21:19:36 +0000
Received: from mail-westus3azolkn19011070.outbound.protection.outlook.com ([52.103.23.70] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mgP-000000000XT-2fOS
	for ath10k@lists.infradead.org;
	Mon, 23 Mar 2026 21:19:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSKOSq+F+VLMt1OYxPvWzLzL61hkFMoRD1vHx8AUJAN5UJVGVwljgttLwZrPQogHAlOtiPmrLhf64QN+YB9yqcuOZm+8GKpcu5CdxH5zJAr/YcitzpbX7SCYYQlTf9C1JqqGQe1mOk1vaSV+7OI0in9zyPLJz84fvg4UTr0sr5n933a5AHlCNX7xn/VMrQ+iaqUyIHMEXpGkmVelDChEPsTuSdWT7TQzdawEUsxVNtRmRiG9zWIwvgdzTojYgjL5BCoyZ0hHzGw//xsVBBA6unBnX374flc9QEQaYg/s5cSmXuV/6oKYsBwuzRDv8Oxyod7XwigCUgSp2IQMawIoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8Ct7EmEiAjSfCA94IsWE2SXpxg6XMozjcDy2gT6rYY=;
 b=AevdduQT84ifod3je46Rs49bF2rFhxCvk7C5dTGr8UYzH9Lde23U6s2iRhk7rePYOwab5rtB5SxZfF8pHxfnd+/KkVWcl+Dyk15gnyyvBgfsfGcsqtaG6F/IvHck2Jc1ezGLEMMEWEv+3GNCXrO+JyNmXDhNoWh+wR6NIurhyAs9nZQxR5nrxQO7Dx+gvJt5BwLrsmp2st+bHuMQzpNNaVm7DsIeWim0M+22O7R2kLEgDe+j8SP4CgPfudSm3cjCZiuK56yERLnN9nPwrYnKCVEVBeOLGrklTBAL3ebvUN0ajyx/ay92Hd/AoKozafepnTadBxgctjlW3tE/yhBVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8Ct7EmEiAjSfCA94IsWE2SXpxg6XMozjcDy2gT6rYY=;
 b=W0TCbyCCI4XIi9+ONrAOwEn8xbZN0dRsCPf/6/kcHZrWWv7bCqZJjPTS0Hmwh2U4JIqIHMWvEil6BeHjH9tGv7Oe+/ZD/StGxKxVsNK+6VmT/FlG7sC5kHvH+0bs5sRM9Kmfl0RcFn/RLbW+nQTe+oXBljpp9Tq1ijPF7wCWmTlxohhPKPewl/w17WN5sxq/BmKXEGOiyxRXhVZoRGCY1a/P0K5T5et/1r/K843ywmTejzUWsACCJ/V+ptiPESscTHKDn8lbB94F9oYWB7vZIR1LJvNT98xjOvkr133B8VoMLokmsCT5eAVCxDHaLDCoZds4p5HjaI4JRmKXOANatw==
Received: from LV2PR01MB7574.prod.exchangelabs.com (2603:10b6:408:17e::14) by
 DM4PR01MB7596.prod.exchangelabs.com (2603:10b6:8:60::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Mon, 23 Mar 2026 21:19:24 +0000
Received: from LV2PR01MB7574.prod.exchangelabs.com
 ([fe80::c33a:4272:fb68:bdae]) by LV2PR01MB7574.prod.exchangelabs.com
 ([fe80::c33a:4272:fb68:bdae%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 21:19:26 +0000
From: Lena Schwekendiek <lena.protechinsights@outlook.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: RE: Unlock authentic professionals fueling strategies from NAB 2026
Thread-Topic: RE: Unlock authentic professionals fueling strategies from NAB
 2026
Thread-Index: Ady7Cro4BcNVsPWoQSaUiALR+5hTwA==
Date: Mon, 23 Mar 2026 21:19:26 +0000
Message-ID: <LV2PR01MB75748A58D53C62529E82F0EF964BA@LV2PR01MB7574.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR01MB7574:EE_|DM4PR01MB7596:EE_
x-ms-office365-filtering-correlation-id: cafb2dcc-59e2-4c08-d199-08de8921dcb4
x-microsoft-antispam: BCL:0;ARA:14566002|31061999003|41001999006|19110799012|15080799012|13091999003|8060799015|8062599012|461199028|37011999003|24121999003|22091999003|39105399006|20031999003|24071999003|3412199025|440099028|102099032|40105399003;
x-microsoft-antispam-message-info: =?us-ascii?Q?o+ioTXTb5WwB1g/fHJgcPaAEqHbMGCmTtdJpfCcOHwjdHno1eVUqafIFe+CD?=
 =?us-ascii?Q?WUF9WBVOCeB8UEB6hoWYGEKfd+hjGbDBqiiwqzf/lIbZ3jiqae4ckmWy77nt?=
 =?us-ascii?Q?d0+wPUQaRAaczW11PXvHX/sitw+Lfhxg3+rArs7QKNKVfVbFJgZvXIA1BO3j?=
 =?us-ascii?Q?xWh1UD/Ix7+6lAtR5rY9AkhvDS0DLwVZG/1mw6uCqgk3rrD7n+u76sdTb18P?=
 =?us-ascii?Q?MUnFIQkX6sbDKHlNJ5vNKVJyE5h+PeiAV689Rk9E85mIO7SXUSBhfOtBEHLP?=
 =?us-ascii?Q?97avzmRvvNkZG+FfcclktpY+8JhvoXffQQz4u3WCLQWWgTtrwYvp5JgvZe8G?=
 =?us-ascii?Q?1cMx48XI3uVtYYFT7qxpETA/AZsVLbEjY4TXohSTuMRa5QFoxz3Y8RyTGBWs?=
 =?us-ascii?Q?eHWCE8RUeDMcu47fL9hvE1tWQ+tGXTo27HDAVPKFavqdzKNc6220rcj+Qlw4?=
 =?us-ascii?Q?O3DYGQdcDVcPr+X6NW5uKvY0bTse0EZmzCMAXPXzyfSBNowpmsTLTiPWphEj?=
 =?us-ascii?Q?9/B6tHVgkJSFIfHlYHYPLnxgboGtR7rCt4pbM2mPqGwEWwjaMWD84DYNAc73?=
 =?us-ascii?Q?mcQ6RQ1QHedbnGbyFvLjIjhKhwz01qJknNvGGH0HPbJF2Pqi0kKBmmq4suJr?=
 =?us-ascii?Q?aaQju5m4h5ur4IW+Lk1XDeHEBHZ4fDjqWQOZXpVoQih434eV0AtjcmE5s8vC?=
 =?us-ascii?Q?YR5mDbs3qd1NfqgjJL0TOXESeR6+NVCZjyMCIgqbJwHUUXpz6WnYjWCpaamv?=
 =?us-ascii?Q?pW+6u9P5HUDQUBhJwlSlk/UOKNccQYYbv29gMJ1PU9HkoAs2DtrY8mR3vbaC?=
 =?us-ascii?Q?0GIzl5V/CGH+yFRWA6LA9F87UPDymINk2qH/M/vqjf13Ei1Y8Fg/l7SX/oRQ?=
 =?us-ascii?Q?t3MntNk5vvmDTNEYwBHzVlYJ+dHLZsNWOwOhKRhFmlUQc+/2Yn6uUWwsCGQe?=
 =?us-ascii?Q?ZeaDqkh+x/AW16IS8sfELJPT/IQmRkkMSmu7Z50uvfqD/pkpCZb9gkCGeZDq?=
 =?us-ascii?Q?oj5Bq9Y+chPi7mLa5ycz4ojtrfbF0zgsTTVWxlRMZzgwlbUrNjMdWWDZzLd7?=
 =?us-ascii?Q?DOznIM/ADD9ZSKZIrXGeTIIBS4jngxKMWF1i3Xn144kYy3P77KnoxiisKM/G?=
 =?us-ascii?Q?diP/gXq9jRd7?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SfwWHlCBqd1tR6XCNWxbY7rPX3IytIGrWTi6rrcGhRvYzjeVI7uFsGS8+9Q6?=
 =?us-ascii?Q?WheIFSWfNiGcjj8rjp9WJuMM9GkHnDPbWxYRTPLPAK0BHJkZSaK1vC6C5tuS?=
 =?us-ascii?Q?zDf0wkvAhQAWzLgaJSybsADn2hxy2HK1UZC6tKVAE4fBpaoeChsMbyZIaVA+?=
 =?us-ascii?Q?Z4Y60v9NPMYQc4s7fGAb6sfd9et4DirMduOvvjwuiKpzUe82XFD22klny2uP?=
 =?us-ascii?Q?9/OQ5v2x98wZDLSLhjHm6eRgA0KgqPIOjOvne7UPPIOaImEP9i5P073axYZ5?=
 =?us-ascii?Q?kIG243/j+1fj8VqyTkQEJAqGG3+A5Jf4u+3UvyiX0alITHrtImeQotGWg3KE?=
 =?us-ascii?Q?SMNHqN8AoVRTfyJHe+YQ3Rw07RvijLnM+ud3tHOH3y0RDWi8XFJn1v90TnJV?=
 =?us-ascii?Q?U1JgEBc3n4qf2yT1zLFym7C3oiAfGrpzAKvbvrE6b2tHxQOxE8fUHiFRJC2/?=
 =?us-ascii?Q?mtlU4S75pq2V915NqwDRWeZZn2hoYCRhsJ7kJb02mzK7VeaJEfD0anEp/ZDM?=
 =?us-ascii?Q?qLXuA2jIXxiO1dMvHi/QbejDkWmxfWS2eNRpcC/9RFAfBowCU2cZYCGglmKo?=
 =?us-ascii?Q?xbTiGMdR4lIPaKT1V9RznO13Igv66wH3E3ylBtguiEtv90Cl2zCNDEkEFOAG?=
 =?us-ascii?Q?qhr+AMZdgnveFSTwf30FXkXac2KLU0gpHsfWZaIBWMXpBhlC6/J9ja6XqQUs?=
 =?us-ascii?Q?X18kLDT+Dsoy133pKac9/kRgtKxJMaye/Zmb2y0J6fPviGKzgvWztWK5MEBU?=
 =?us-ascii?Q?RX1VaMcLk7z/oTBX+Sr9r4IX7sI4MzdRZCO/1mDBqO+7nkH+VDXarrm1Fgim?=
 =?us-ascii?Q?gZj+FzJFjuyttt/NY+OnfQQi4ywgDcqXqO/rP9sSLbHPufCLiy8FPvxhomb5?=
 =?us-ascii?Q?QVQLRJANvNzxhHP2YKUSxa+l4oTmhpyrNr6W1UX28ygC0OffYDT/DQpY+ii5?=
 =?us-ascii?Q?wqavOLWlBNai25iCEFPrjCSssgsCIrIHKlMPQIqunmyXSmUkHfFGrry4togR?=
 =?us-ascii?Q?gis90bs6bC8jElxJQDlK4XvR/nL+5wL2JeyLtDgIbhcKw81KGqzkJlaGseHV?=
 =?us-ascii?Q?OAR0IQai9hcJFKs/+gSV6Nl78jGMhKLkY/C1fwy866nmPbDKbIajFu0F2VZ/?=
 =?us-ascii?Q?qzVsPVrn1ZtFd7jCEXP0htv16+9b71vyzbcwKPkJDaofcn+lwBhU3CO9NT3I?=
 =?us-ascii?Q?SRPDmBpuiTn+ZQV4H79LHXc1Eg6xjjH9XgweYHdxy9mnV6esp4CqXwcZ64j9?=
 =?us-ascii?Q?z+hL7KUDsqtNR7PRD0YcYWb7lrlu9lAPUYrz5e8jnDRNoF9eUGN/1eXxV8Y/?=
 =?us-ascii?Q?dSLuGVTtMY2GVids2j3U/93pqvMoPJu/kOo6WqRpCS6+HUYPgh+b8Er8XsNl?=
 =?us-ascii?Q?QuEfaeguPkfnyui5PENYWz814CBabaaUWt6HJvQ5z5gmBYNJwpt32qLfZqGI?=
 =?us-ascii?Q?SHgI4im4OxAOgRKzP1rKezbKMAswkX2VXAbu9WCWtknhxJiv8ZVx1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7574.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cafb2dcc-59e2-4c08-d199-08de8921dcb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 21:19:26.2018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7596
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_141933_685929_331A486F 
X-CRM114-Status: UNSURE (   1.98  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi ,

I hope my previous email reached you and you've had the chance to read it.

If more insights on the figures and pricing would be useful, I'm happy to a=
ssist.

Regards
Lena
Marketing Manager
Pro Tech Insights.,

Please reply with REMOVE if you don't wish to receive further emails

-----Original Message-----
From: Lena Schwekendiek
Subject: Unlock authentic professionals fueling strategies from NAB 2026

Hi ,

Hoping all is well in your world.

Would you consider obtaining the NAB Show 2026 attendees information to imp=
rove your marketing approaches?

Expo Name: National Association of Broadcasters Show 2026
Total Number of records: 41,500 records
List includes: Company Name, Contact Name, Job Title, Mailing Address, Phon=
e, Emails, etc.

Enhance marketing impact with our outstanding B2B data solutions.

Do you want to know the cost of these leads for your campaigns? Reach out, =
and I'll share pricing.

I await your prompt reply.

Regards,
Lena
Marketing Manager
Pro Tech Insights.,

Please respond with an Remove if you don't wish to receive further emails.=

