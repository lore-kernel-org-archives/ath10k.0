Return-Path: <SRS0=Hvwv=IV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EE3C433DB
	for <ath10k@archiver.kernel.org>; Tue, 23 Mar 2021 07:47:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE54A6191F
	for <ath10k@archiver.kernel.org>; Tue, 23 Mar 2021 07:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE54A6191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=feDVrWuylf0Ofxcm/nKUXxlpfi33C96G3is2jniNrIU=; b=YTiIJPWsNvCmriwrlRTncj79/
	oogw46V8pX9mc1QqE4f90v381zq64gssLx/1kyR06ohyG3Bao6E0zy65NqJT8BZCW/SBFfjqCzxYR
	UUJ+twz5we80Y98k7tIPBKTJpV8Rwz54uk1g1Ba/dTVM9rCnaDZ8nODwOk4NsaZyx4jfyB+HoDuGr
	YmHnoPMM+DnPHnrce2fg9lkDLKm03eVaUB63UlFRemUzfLn0FUe5xZ1tMDlMJJP2u2oasy4CWJ6Ss
	DvNS/WBxOF5x8qDG7VxmIBXg9QZMOYg0l4YyZKspZgkyWLUTc5kYnaSGDba6JfEm4V5mP+nsRpxti
	rS3EhA+tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lObk9-00ECmL-K5; Tue, 23 Mar 2021 07:46:25 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lObjx-00ECjC-Ln
 for ath10k@lists.infradead.org; Tue, 23 Mar 2021 07:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O18FJ1N2ZnMBsuKWvbeujuurm5C2kQ1VBxSCMJvGcZY=; b=cWPKqUjpsMjCIpmkK6qCc5RlZ9
 BUO/fZSsBt5FneHlsDo3pLwn/HMORTIIWKHOnhzQP9rJU1dAqvzO/oX7owDaZDbGlu8APesldHFlg
 6daNHdlLmQufWP8Vcj8XAbgpdQhQ/ckKqplvta8DeHh+9uO8vCb15iGT2dwsu2VYSDK4=;
Received: from p4ff13c8d.dip0.t-ipconnect.de ([79.241.60.141] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lObjl-0002Ce-18; Tue, 23 Mar 2021 08:46:01 +0100
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
To: Ben Greear <greearb@candelatech.com>,
 Brian Norris <briannorris@chromium.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 Rakesh Pillai <pillair@codeaurora.org>, ath10k <ath10k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Doug Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
 <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
 <06a4f84b-a0d4-3f90-40bb-f02f365460ec@candelatech.com>
 <CA+ASDXOotYHmtqOvSwBES6_95bnbAbEu6F7gQ5TjacJWUKdaPw@mail.gmail.com>
 <47d8be60-14ce-0223-bdf3-c34dc2451945@candelatech.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <633feaed-7f34-15d3-1899-81eb1d6ae14f@nbd.name>
Date: Tue, 23 Mar 2021 08:45:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <47d8be60-14ce-0223-bdf3-c34dc2451945@candelatech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_074614_483795_B400EBCA 
X-CRM114-Status: GOOD (  16.22  )
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


On 2021-03-23 04:01, Ben Greear wrote:
> On 3/22/21 6:20 PM, Brian Norris wrote:
>> On Mon, Mar 22, 2021 at 4:58 PM Ben Greear <greearb@candelatech.com> wrote:
>>> On 7/22/20 6:00 AM, Felix Fietkau wrote:
>>>> On 2020-07-22 14:55, Johannes Berg wrote:
>>>>> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
>>>>>
>>>>>> I'm considering testing a different approach (with mt76 initially):
>>>>>> - Add a mac80211 rx function that puts processed skbs into a list
>>>>>> instead of handing them to the network stack directly.
>>>>>
>>>>> Would this be *after* all the mac80211 processing, i.e. in place of the
>>>>> rx-up-to-stack?
>>>> Yes, it would run all the rx handlers normally and then put the
>>>> resulting skbs into a list instead of calling netif_receive_skb or
>>>> napi_gro_frags.
>>>
>>> Whatever came of this?  I realized I'm running Felix's patch since his mt76
>>> driver needs it.  Any chance it will go upstream?
>> 
>> If you're asking about $subject (moving NAPI/RX to a thread), this
>> landed upstream recently:
>> http://git.kernel.org/linus/adbb4fb028452b1b0488a1a7b66ab856cdf20715
>> 
>> It needs a bit of coaxing to work on a WiFi driver (including: WiFi
>> drivers tend to have a different netdev for NAPI than they expose to
>> /sys/class/net/), but it's there.
>> 
>> I'm not sure if people had something else in mind in the stuff you're
>> quoting though.
> 
> No, I got it confused with something Felix did:
> 
> https://github.com/greearb/mt76/blob/master/patches/0001-net-add-support-for-threaded-NAPI-polling.patch
> 
> Maybe the NAPI/RX to a thread thing superceded Felix's patch?
Yes, it did and it's in linux-next already.
I sent the following change to make mt76 use it:
https://github.com/nbd168/wireless/commit/1d4ff31437e5aaa999bd7a

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
