Return-Path: <SRS0=F6w2=IX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EA0C433C1
	for <ath10k@archiver.kernel.org>; Thu, 25 Mar 2021 09:46:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328BD61A1D
	for <ath10k@archiver.kernel.org>; Thu, 25 Mar 2021 09:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328BD61A1D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IFRfqctUVEuFbaEAR4lX+u8q7nt5FIiU3lquGGHvvNw=; b=KuqLprffGbrxoiu/ntwoqmy6W
	phFAIVO7duiNUrwmnSkw7LFTvoFKTaT2R13CQEkqtLwtpCUcfQbZ4gLEegoawM3jY/Favg5LxNHjt
	3vwQegR6nH6wVTyQmxUju6uEnTncf7b7+To5DXNvaXqCsNQp8AgdA+EHeyGJPxAV5GMVGCMHrQghs
	W3AAzwFkpnm4+bUckwWUB9F4JnY0CAUw0m8M+dqWdkoxeHv8YYrYG1WgUGfV0vvFportM8MZ1TTHP
	gtcqguEdGKVhl2HKEf49PY9GdUD7FQrjejtRKeDSC17UrlR3tLnQBwKtgyK2ENvCEM/+uI5KAzkFz
	UEULz9p6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMZG-0018nD-8n; Thu, 25 Mar 2021 09:46:18 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPMZ7-0018kJ-LP
 for ath10k@lists.infradead.org; Thu, 25 Mar 2021 09:46:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616665569; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=xLZMPOc+Bf0JSFPQICytoPaldsUvFtyL1tpTNNRZGmo=;
 b=Nz0KrxpJkuMjTGGER28g8GBY8sSTbfkJMUMdgNF2/YZQSyukxG6/XTvi8t+s8k/LVnvjc1iO
 R0DRftqpiuJBJ0FLAql76R6aiopIedC9MtrAVCwKzsUePLW+2HVKkqj/8QaRIhZbblhCV3BG
 Livv33g+RKlRXqr9H0gQi3WcA+w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 605c5bd2ea04121f0374a8ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 09:45:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 084BAC43461; Thu, 25 Mar 2021 09:45:54 +0000 (UTC)
Received: from Pillair (unknown [103.149.159.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: pillair)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 770E0C433CA;
 Thu, 25 Mar 2021 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 770E0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pillair@codeaurora.org
From: "Rakesh Pillai" <pillair@codeaurora.org>
To: "'Felix Fietkau'" <nbd@nbd.name>, "'Ben Greear'" <greearb@candelatech.com>,
 "'Brian Norris'" <briannorris@chromium.org>
Cc: "'Johannes Berg'" <johannes@sipsolutions.net>,
 "'Rajkumar Manoharan'" <rmanohar@codeaurora.org>,
 "'ath10k'" <ath10k@lists.infradead.org>,
 "'linux-wireless'" <linux-wireless@vger.kernel.org>,
 "'Linux Kernel'" <linux-kernel@vger.kernel.org>,
 "'Kalle Valo'" <kvalo@codeaurora.org>,
 "'David S. Miller'" <davem@davemloft.net>,
 "'Jakub Kicinski'" <kuba@kernel.org>, <netdev@vger.kernel.org>,
 "'Doug Anderson'" <dianders@chromium.org>,
 "'Evan Green'" <evgreen@chromium.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
 <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
 <06a4f84b-a0d4-3f90-40bb-f02f365460ec@candelatech.com>
 <CA+ASDXOotYHmtqOvSwBES6_95bnbAbEu6F7gQ5TjacJWUKdaPw@mail.gmail.com>
 <47d8be60-14ce-0223-bdf3-c34dc2451945@candelatech.com>
 <633feaed-7f34-15d3-1899-81eb1d6ae14f@nbd.name>
In-Reply-To: <633feaed-7f34-15d3-1899-81eb1d6ae14f@nbd.name>
Subject: RE: [RFC 2/7] ath10k: Add support to process rx packet in thread
Date: Thu, 25 Mar 2021 15:15:44 +0530
Message-ID: <003701d7215b$a44ae030$ece0a090$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG1Bu1FBYi7G1oVhHY/01uT1gSslwH2O/GCAtCmWRoBYxlAVQH0T8LwAZ17l3YBXZ7u8AIxJEyGAbYhhCACZ7wzuKpNZQxQ
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_094610_278344_BF8417FD 
X-CRM114-Status: GOOD (  27.78  )
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



> -----Original Message-----
> From: Felix Fietkau <nbd@nbd.name>
> Sent: Tuesday, March 23, 2021 1:16 PM
> To: Ben Greear <greearb@candelatech.com>; Brian Norris
> <briannorris@chromium.org>
> Cc: Johannes Berg <johannes@sipsolutions.net>; Rajkumar Manoharan
> <rmanohar@codeaurora.org>; Rakesh Pillai <pillair@codeaurora.org>; ath10k
> <ath10k@lists.infradead.org>; linux-wireless <linux-
> wireless@vger.kernel.org>; Linux Kernel <linux-kernel@vger.kernel.org>;
> Kalle Valo <kvalo@codeaurora.org>; David S. Miller
> <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>;
> netdev@vger.kernel.org; Doug Anderson <dianders@chromium.org>; Evan
> Green <evgreen@chromium.org>
> Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
> 
> 
> On 2021-03-23 04:01, Ben Greear wrote:
> > On 3/22/21 6:20 PM, Brian Norris wrote:
> >> On Mon, Mar 22, 2021 at 4:58 PM Ben Greear
> <greearb@candelatech.com> wrote:
> >>> On 7/22/20 6:00 AM, Felix Fietkau wrote:
> >>>> On 2020-07-22 14:55, Johannes Berg wrote:
> >>>>> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
> >>>>>
> >>>>>> I'm considering testing a different approach (with mt76 initially):
> >>>>>> - Add a mac80211 rx function that puts processed skbs into a list
> >>>>>> instead of handing them to the network stack directly.
> >>>>>
> >>>>> Would this be *after* all the mac80211 processing, i.e. in place of the
> >>>>> rx-up-to-stack?
> >>>> Yes, it would run all the rx handlers normally and then put the
> >>>> resulting skbs into a list instead of calling netif_receive_skb or
> >>>> napi_gro_frags.
> >>>
> >>> Whatever came of this?  I realized I'm running Felix's patch since his mt76
> >>> driver needs it.  Any chance it will go upstream?
> >>
> >> If you're asking about $subject (moving NAPI/RX to a thread), this
> >> landed upstream recently:
> >> http://git.kernel.org/linus/adbb4fb028452b1b0488a1a7b66ab856cdf20715
> >>
> >> It needs a bit of coaxing to work on a WiFi driver (including: WiFi
> >> drivers tend to have a different netdev for NAPI than they expose to
> >> /sys/class/net/), but it's there.
> >>
> >> I'm not sure if people had something else in mind in the stuff you're
> >> quoting though.
> >
> > No, I got it confused with something Felix did:
> >
> > https://github.com/greearb/mt76/blob/master/patches/0001-net-add-
> support-for-threaded-NAPI-polling.patch
> >
> > Maybe the NAPI/RX to a thread thing superceded Felix's patch?
> Yes, it did and it's in linux-next already.
> I sent the following change to make mt76 use it:
> https://github.com/nbd168/wireless/commit/1d4ff31437e5aaa999bd7a

Hi Felix / Ben,

In case of ath10k (snoc based targets), we have a lot of processing in the NAPI context.
Even moving this to threaded NAPI is not helping much due to the load.

Breaking the tasks into multiple context (with the patch series I posted) is helping in improving the throughput.
With the current rx_thread based approach, the rx processing is broken into two parallel contexts
1) reaping the packets from the HW
2) processing these packets list and handing it over to mac80211 (and later to the network stack)

This is the primary reason for choosing the rx thread approach.

Thanks,
Rakesh.

> 
> - Felix


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
