Return-Path: <SRS0=Hvwv=IV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A14C433C1
	for <ath10k@archiver.kernel.org>; Tue, 23 Mar 2021 03:02:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E24C60200
	for <ath10k@archiver.kernel.org>; Tue, 23 Mar 2021 03:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E24C60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9zjwdQ/fYAiA2lqjv7vCpEyyKE8k0ckNRopTp5mkkTk=; b=p7vyKXG4hx07DxtBBtKWGipiF
	1IpKF5mUjO/grTToOHYF+g6DIJL0MP3LonqpEv+WjbWl5EGblbX9hkUErURzTbt3VYtZg5WHDaeDX
	3kPtIU2jcdc0es456LEzlTQciSq1X7Zn8VcQzXixe7BFLnIT3xd8ucT9ELD61DCDVEVGePRcx48ls
	xp/ONiLlWbuLjHLEs6NAP9EcA4G7k7ltJwaM1pA7JDBot06SO27vDsPv4tqEYyRl1Ze9ia+C3yN8h
	pTljci7wgSFHm4g+aytf2RnF0MwxujVvRsDwvj0LTs3Ln0dna8dVQ2OYKI8h7XmYnMZw/w0P+oEIT
	OVzhhWTEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOXIU-00DUXD-EO; Tue, 23 Mar 2021 03:01:34 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lOXIP-00DUV9-E4
 for ath10k@lists.infradead.org; Tue, 23 Mar 2021 03:01:31 +0000
Received: from [192.168.254.6] (unknown [50.34.172.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 1A1BB13C2B4;
 Mon, 22 Mar 2021 20:01:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 1A1BB13C2B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1616468487;
 bh=rQIz9Srsbox3KK9ITKyPEVOOf772HvkSawM6/pJCdiI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PgLrrxDwb6/rrdkZpHooO/DJHyiKBUD10HUxwKQW+Zfr6JxuUtbr1EEmZscxShfD2
 vTzeKS0R6Bbu4keJr0Sv/b1l80xRuO1ulLXGvlUw5VKB9nRZpugvys2jenD7RkKsbf
 TnZeoQXOAIkiSdFdarsp02lGDrE3KL4KenmiBaYY=
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
To: Brian Norris <briannorris@chromium.org>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
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
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <47d8be60-14ce-0223-bdf3-c34dc2451945@candelatech.com>
Date: Mon, 22 Mar 2021 20:01:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CA+ASDXOotYHmtqOvSwBES6_95bnbAbEu6F7gQ5TjacJWUKdaPw@mail.gmail.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_030129_808289_D849F43F 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 3/22/21 6:20 PM, Brian Norris wrote:
> On Mon, Mar 22, 2021 at 4:58 PM Ben Greear <greearb@candelatech.com> wrote:
>> On 7/22/20 6:00 AM, Felix Fietkau wrote:
>>> On 2020-07-22 14:55, Johannes Berg wrote:
>>>> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
>>>>
>>>>> I'm considering testing a different approach (with mt76 initially):
>>>>> - Add a mac80211 rx function that puts processed skbs into a list
>>>>> instead of handing them to the network stack directly.
>>>>
>>>> Would this be *after* all the mac80211 processing, i.e. in place of the
>>>> rx-up-to-stack?
>>> Yes, it would run all the rx handlers normally and then put the
>>> resulting skbs into a list instead of calling netif_receive_skb or
>>> napi_gro_frags.
>>
>> Whatever came of this?  I realized I'm running Felix's patch since his mt76
>> driver needs it.  Any chance it will go upstream?
> 
> If you're asking about $subject (moving NAPI/RX to a thread), this
> landed upstream recently:
> http://git.kernel.org/linus/adbb4fb028452b1b0488a1a7b66ab856cdf20715
> 
> It needs a bit of coaxing to work on a WiFi driver (including: WiFi
> drivers tend to have a different netdev for NAPI than they expose to
> /sys/class/net/), but it's there.
> 
> I'm not sure if people had something else in mind in the stuff you're
> quoting though.

No, I got it confused with something Felix did:

https://github.com/greearb/mt76/blob/master/patches/0001-net-add-support-for-threaded-NAPI-polling.patch

Maybe the NAPI/RX to a thread thing superceded Felix's patch?

Thanks,
Ben

> 
> Brian
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
