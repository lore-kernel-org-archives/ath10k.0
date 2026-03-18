Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D35D1077612
	for <ath10k@archiver.kernel.org>; Wed, 18 Mar 2026 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3pRp8mu8Vce9NxgsYu1jvxSfQMrOpkFQPpK34jG+IrQ=; b=dDzP5XUmKcE/Sf
	U9lxAcqrPg4rru0NtV4IYl7HV7Mvpb8KZs426g4XhI8hFFEhb3clVvTzo8sC3AWFC9Ycom2x/Q5m/
	mY3hLKBcBoGFQezA6p2rBHuzOTwCvGjjG64V8T0ldwf3TNBIxMfcl2y2wPKvHj2ptPhUrqHfTlgF+
	lpureIRFxBdMhaamoK2piVX64RETdB2oH0xZ+gJSCV4MYy174oalw4oWR3qFh86qUhDrOSdwR0QP7
	xkNMakSQ5FyW1uWDkCKYOlbfq6dgRkM45iUdylRg0yDkaN+yCWnlLWB3Tj4D5xyPW/0yMPZ8P9oYC
	yqegW/JuOhxVzmukPMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xid-00000009Jog-0t76;
	Wed, 18 Mar 2026 20:42:19 +0000
Received: from mail-southcentralusazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d10c::1] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xia-00000009Jnq-0biq
	for ath10k@lists.infradead.org;
	Wed, 18 Mar 2026 20:42:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8IxN43e6kCynjr73Wb81DFDPcIfCcyY5LAnYEg5Qz2ZWViiFS3SPnn1+zqrtvLo0ZXUDkMyBjgFH9t81Srkq+LHjjFbjvJmXLrLH8q2niM9rJ3Yh+Yfo1+SyUfaYiEeSs6vU4iVVroF5MgMJBARCX2n0IAaD9631BRtDDYIf5kN3HdfTEC10nwYEvD6DNwIO161nfyzyVKEJ8nmijcW4l49nFejNZpmQJlyQqDaA1LiKqm4QbaWRyi23TjeLnrXc4KnqnVv9SgmTTwP7WZiA9PFjscFI+dTb3vc3+AEPdij62dC9fxPZcL0mJKFDIpiZviG9U6jXjhiKPRqsAxBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pRp8mu8Vce9NxgsYu1jvxSfQMrOpkFQPpK34jG+IrQ=;
 b=o6NYrSPrDd9z0Kxl/D133eQzEPKXVHPyoV8WMKfwoxDLPiZR18ivxtBdpmX5b5KXbM3nMoFfiAAUWZG96uD0kJklTaChyBUpI34SEIiL7jvJl8XN1COnzLa/P1Zgq1GKSp863htQLz2qS8SL+AmF9scgxQDz3oRdjlkaSvQ985r3BFtuRgURZ8dVwASqAVV95CO1k4hh84XK2AuNTttLArRb6YvBzYVdvnvGactEDHLtdivR9qIVreYzuvMh77l/HtK9J1EedhwmskriW8ss/YGwQ2T91se3Ny1xIvcS4kGajEZZDUteQRXfdxy0mintfD82Kx5plAzPvV84IGUflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pRp8mu8Vce9NxgsYu1jvxSfQMrOpkFQPpK34jG+IrQ=;
 b=B3d9cqp7tKUiqcwg0ag3bol8jgWITBUsobx8VAIRAw2WOQa122gEvQE43p9qFKRppbYe9MKm64S9qleEBo/Hdzl8Ci97R9KunCo5iF8c9qC+C1RjT4OYYFU3FdaIKXJfB78UFfLOXEc5ga4JaiU8DmZZcph4Uh4b3d6nYd+OQb8Px/veDbmfq6EXtluOWQTPfns0VbN1Jo8ZyxAHwwOySstjFeFNrrM82sAHX+bI+w3aOzspp5k6xiqRhzkN1hFtRDgCCZfEj1DexAJ+OW8cBNQNz/VKCBraoH5UQ3tf2Cok/vaKkfkcpycBLqPRzsAVENlThLw5XPBgOKK97/6H0A==
Received: from LV2PR01MB7574.prod.exchangelabs.com (2603:10b6:408:17e::14) by
 MW4PR01MB6308.prod.exchangelabs.com (2603:10b6:303:7e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 20:42:08 +0000
Received: from LV2PR01MB7574.prod.exchangelabs.com
 ([fe80::c33a:4272:fb68:bdae]) by LV2PR01MB7574.prod.exchangelabs.com
 ([fe80::c33a:4272:fb68:bdae%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 20:42:08 +0000
From: Lena Schwekendiek <lena.protechinsights@outlook.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Unlock authentic professionals fueling strategies from NAB 2026
Thread-Topic: Unlock authentic professionals fueling strategies from NAB 2026
Thread-Index: Ady3F6xg0p8TBtIVSBCw52qYrCwUbg==
Date: Wed, 18 Mar 2026 20:42:08 +0000
Message-ID: <LV2PR01MB7574E2DAA7D843B647D2CC56964EA@LV2PR01MB7574.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR01MB7574:EE_|MW4PR01MB6308:EE_
x-ms-office365-filtering-correlation-id: 5967305d-a33a-403d-f54e-08de852ed2f9
x-microsoft-antispam: BCL:0;ARA:14566002|13091999003|20031999003|39105399006|19110799012|8062599012|8060799015|15080799012|41001999006|461199028|31061999003|22091999003|24121999003|24071999003|37011999003|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?VX/uhanLDrsaAlgWwNInOdAlel2HTEU0tG/tbbDkfp0zWSUR5PAi3d3WBiR+?=
 =?us-ascii?Q?Dov1aNquXmjrSrevmS5LOJA3/i6xsJIJTT0Y+bLD2BKQdOf8G85wrRckT75z?=
 =?us-ascii?Q?PGzI5g59mmKzRn4w3U/A4WbIpkXlBMwN8ODu+cecC020A67cU/uGidrhWfnu?=
 =?us-ascii?Q?4z2264wa32iO/IlXTl5XvxwJRJXHOoZI4XymYVRhiFLLohfus7B1FUHJanOp?=
 =?us-ascii?Q?ajgRlP4n6sYPDsIxWgRQReDEkHgZ70sLCBH+J6WJ6rKYH/SoeNSnUv2bPNCN?=
 =?us-ascii?Q?gfWSjbOhCo7zA/1B9iEmRlz0tJJ3gT9QqHy1b/jEfORBKA2r2WoJgEG8l30t?=
 =?us-ascii?Q?bPoBa+dC2YEWVJBdnr6Kx/gCOU5Rr73Wep1al7OSzW6TUsE1Ku+YoQCw98te?=
 =?us-ascii?Q?lt8E7M2P4mUvouTVYF1TM16FDlv3isEpVuwwHh7h6tJgB1pMVFUQUT5b5xdU?=
 =?us-ascii?Q?8b2YAT7JDyCmtVaK5bg1PkHmv3D004HuBWlYQyuVH1pGnDplqLLjqh2+Hbxy?=
 =?us-ascii?Q?StnySZU+VGBDlxF+YbacD7MvogsYB/YLnUtQ/EstIXzStPF9azpJfd9eyABE?=
 =?us-ascii?Q?MxaXI4fQDa0G91IGJn+xLmPRJPQazOQHAdiSkzgdLlczoxfHGhMMG8xkb5o+?=
 =?us-ascii?Q?2P6cmoGOWJfbGBxp6Zti2XrL6RPTza8dTv9JqZ0ULAUnnM81ZKfd5K6H6+O4?=
 =?us-ascii?Q?aydfUTLqstJ6uLZfJ0aYv7vDJu2isS7cZUQMLNworyL4v0+1K0lZAGPU0xaw?=
 =?us-ascii?Q?j6Pmt1kDXOVsZKlEJfS8s9rOSIXI4z8zW/l6mPcp16JsEZsCnguW3JdE3xV9?=
 =?us-ascii?Q?ognaflAKs/I7m6ep2evg5mYfAeG5wsfUHNcnk01NGo8FrGnkZDYiCdoZ2zd1?=
 =?us-ascii?Q?J82eT+Oy73hcRFrhqDGNJN9U6FgjsT7T59MUV4iaT1VlmzmBfFaJOiz5d+Pa?=
 =?us-ascii?Q?XQO2SdfUxKDhcgpbCJgmpQfboO6eXRWjORCfZWNCv3Cu63N0UpP4Qi7liaYl?=
 =?us-ascii?Q?gKWO7SHkgbTNu57Tv0eNYtw4eSH5eANjLPMgoROGbOp1VEPXAcBlTf/xIMvr?=
 =?us-ascii?Q?GvFnBT6nsQHeypb7TQ//Rx8ux6BehLJphBU3bDVvn/w1O4djJ0amyXfxeGMy?=
 =?us-ascii?Q?9Zsow0v0rwKk?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eWngS652npUdnF3FOOJiW73xP6HiYGZuTfoDKHiZv6OlOzIgJW7LZRPnxnGn?=
 =?us-ascii?Q?thwYUWZydHnmytA0X+6vPcjfHlQLZgwdN06OyWRjcM+m616jPxWGh5JMDtrV?=
 =?us-ascii?Q?+CIYtAIWg52jl5x1Vs8JEWv7LSi5DDKD5rMWIqS1dg9RpijpkXJo97PwblLU?=
 =?us-ascii?Q?hpISuWAXIjUhKXnpS9jiK/Go4rXhUc+RMWf9BzShOiSsJXiRJ/ratYLBw5Db?=
 =?us-ascii?Q?MvPW2ehWJJG/+kf59mqYDM+V8nVkfpn0e4VgPMfZHBBwhUQCQpmHsZcJb2jv?=
 =?us-ascii?Q?B883PyWqVi/RyU0IN7CukdwZVW4mu17useufY3gTI9spDDFWccNg3bej0yre?=
 =?us-ascii?Q?W8BvzoG0XF5qvn4Pv1E63b+1O9JNiBag1J3S2zBc1z7hwsA7bssEYsSqNEMH?=
 =?us-ascii?Q?rBQorp3wb9Rtdks87CKAGt82kgsN3nk44pss48IWtB/L3eYMu/6o+gABpObZ?=
 =?us-ascii?Q?XKVkIY1Il6sZdKhiFFqbVEVynbxEV+mChsmUsBQ2AV+8nA5wLKvmgWsUeDJo?=
 =?us-ascii?Q?01NpNqvP/NFy8JdfdO+q7+wgmtQergydOa4vDxEyV4EPoXE5/2Emk6fVumW/?=
 =?us-ascii?Q?Cyo73YQbhlfyH7je14b2iguRnjbDu3g307dBjZw57b/zl7tYCt8KRK4QCb5l?=
 =?us-ascii?Q?l7oVYPpU6huLaiR3cl764MuUtZaCkCTEaXrl/izflMop36XLNWhTpHKuEUPp?=
 =?us-ascii?Q?duqoN/MhHeRGv9w9V9lSP20VeradPXVY5yAIwZyLNC96ymJLLnVkG6+T+oW+?=
 =?us-ascii?Q?63NGff6mTsOPur1hpvyE693IyzglBUgG5IVdhhdmlPD82+iU1hQbfIfDyhBq?=
 =?us-ascii?Q?50Yne3z9watpZSmshLsachDkZha+cI7ksjoirRckC/21cAOQGw5JclxowRIa?=
 =?us-ascii?Q?UmlWLkv1W/c8sYyWrJQcB1IaQnge8zfzsXSGiNA8fzhf/h2jzss31zbmR3ga?=
 =?us-ascii?Q?rVSj8YQNKWkx9+g7IYTPLLQoBQfpt1f/+7H/jBXQw6EpNhQL4Up2zofmdyrx?=
 =?us-ascii?Q?1sk7O6QXBdnyxa/FYwQnOSPqFoRD7QrWRxh/sh+Xcfs0AHRvg9kwjacCPrpL?=
 =?us-ascii?Q?QLS/FZAcNRvqJ3axRetbOAyx965IBKut+mXrWqtkKzrHgwhaEomOepjI5AKF?=
 =?us-ascii?Q?1mXQ/0XtPZMmdrd7WkBbnkTLdgHys9UvJYLJaemne0cBKm3wASMT72rq727m?=
 =?us-ascii?Q?t70G6szddRXoyDwjnxplW+k6SIMaNuF35ImNDBaBAgr9YQRv11gzlmVUUTg/?=
 =?us-ascii?Q?O5Xy8yVNPPS18qNaGbUjqsCyjyUZI3qyEsa7EBfEBahh1mvV8VaMXB+R0VLJ?=
 =?us-ascii?Q?9QK351EzIrSxYEKX5ub9YN2T0xutvZ/N7lbTLSMWLTGvEGkiGDxDr70W/YTT?=
 =?us-ascii?Q?khDYxOh8/b4PP3FEpyVmwrXmRtRlzrMT0jYhN1PfsfTxUzIe2cfdyji5rOL/?=
 =?us-ascii?Q?Jn8Wa4Y8VdAZxJj/NIYdzpSpNIvr4S9P8wRxyV/9ZjoVpDGuODie9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7574.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5967305d-a33a-403d-f54e-08de852ed2f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 20:42:08.7334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_134216_188339_49E35BE3 
X-CRM114-Status: UNSURE (   1.79  )
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

