Return-Path: <SRS0=hYFH=GI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961A0C433E0
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 00:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD412255F
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD412255F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=adapt-ip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8zMQ+Pm1Mz28Ke9iNL7QqGng8rRSVC6l15Nq70+Prmc=; b=orbHehy7M8+GFeVxpJR1mTDLb
	mHxLj8MOkBTulW3WZNvAz1/1ta092i06twoSQFw7LAC7LfuF/ZbswyZnzCpgmtg99zloYsOHmoUNo
	KA9Uk65EPgEqjhveaO9zR4augQAQlzJImxs2z5ZL8a11JPuO9WJpJyXV3tO18BYI9iG+kkXLJGIaj
	mOFF/JNHpOQaA0RZ317Gu5rOFDkLbqaxcSQONfxWl+7MQLeZBzcEpjjN4UeQEim/v68ncnsT5ebcT
	LhA7QtZzE5/mUkouBO8SWtUYKZHTiK5U7XHpXc6ROVT+r1ZUZM5l3ry+abkcb16SsKjBHlvcWmrJz
	S/2kri4gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwa9x-0007ai-T8; Tue, 05 Jan 2021 00:25:13 +0000
Received: from mail.adapt-ip.com ([173.164.178.19] helo=web.adapt-ip.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwa9t-0007ND-UT
 for ath10k@lists.infradead.org; Tue, 05 Jan 2021 00:25:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by web.adapt-ip.com (Postfix) with ESMTP id C98184FB575;
 Tue,  5 Jan 2021 00:25:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at web.adapt-ip.com
Received: from web.adapt-ip.com ([127.0.0.1])
 by localhost (web.adapt-ip.com [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id YNKD848N7Z3Z; Tue,  5 Jan 2021 00:25:01 +0000 (UTC)
Received: from mail.ibsgaard.io (c-73-223-60-234.hsd1.ca.comcast.net
 [73.223.60.234]) (Authenticated sender: thomas@adapt-ip.com)
 by web.adapt-ip.com (Postfix) with ESMTPSA id DD05D4FB3F3;
 Tue,  5 Jan 2021 00:25:00 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 04 Jan 2021 16:25:00 -0800
From: Thomas Pedersen <thomas@adapt-ip.com>
To: Ben Greear <greearb@candelatech.com>
Subject: Re: RX rate is wrong in 5.10? (bisected to: mac80211: receive and
 process S1G beacons)
In-Reply-To: <5dc86950-1672-6900-dad4-3b437f4959c5@candelatech.com>
References: <584816e2-ed18-3d5e-651e-293637222148@candelatech.com>
 <5dc86950-1672-6900-dad4-3b437f4959c5@candelatech.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <772a3a0517eb4d4cc6cee975e5fde100@adapt-ip.com>
X-Sender: thomas@adapt-ip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_192510_139639_F587AE75 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Ben,

On 2021-01-04 16:18, Ben Greear wrote:
> On 1/4/21 8:18 AM, Ben Greear wrote:
>> Hello,
>> 
>> I noticed that RX rate is always 6Mbps when I use -ct firmware and -ct 
>> driver in
>> 5.10, and on stock 5.10.0 driver and stock firmware, rx-rate does not 
>> show up at
>> all in 'iw dev wlan1 station dump'.
>> 
>> I'm using 9984 NIC...
>> 
>> Anyone else see this?
> 
> After a bisect, the first bad commit shows this:
> 
> commit 09a740ce352e1a1d16b9984115514ba9a4f4704b (refs/bisect/bad)
> Author: Thomas Pedersen <thomas@adapt-ip.com>
> Date:   Mon Sep 21 19:28:14 2020 -0700
> 
>     mac80211: receive and process S1G beacons
> 
>     S1G beacons are 802.11 Extension Frames, so the fixed
>     header part differs from regular beacons.
> 
>     Add a handler to process S1G beacons and abstract out the
>     fetching of BSSID and element start locations in the
>     beacon body handler.
> 
>     Signed-off-by: Thomas Pedersen <thomas@adapt-ip.com>
>     Link: 
> https://lore.kernel.org/r/20200922022818.15855-14-thomas@adapt-ip.com
>     [don't rename, small coding style cleanups]
>     Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> 
> From a glance through the diff, I'm at a loss as to why it causes the
> symptom.  I manually
> double-checked the bisect, an it appears correct.
> 
> What I see is that in the commit before this, I see a useful rx rate
> (1.3Gbps for instance)
> in 'iw dev wlan1 station dump', but in this bad commit, both show
> 6Mbps rate.  (Tx rate
> in ath10k is probably broken for other reasons, so I only bisected the
> rx side issue.)
> 
> I'm using ath10k 9984 radio with firmware 10.4-3.9.0.2-00070 in station 
> mode.
> 
> AP is an ath11k Hawkeye...
> 
> I'm using a 1Mbps UDP packet 'download' stream to make sure I'm seeing
> rates for data frames
> and not just management frames.

Sorry about that.

> Any idea what might be the issue?

It may be fixed by 
https://patchwork.kernel.org/project/linux-wireless/patch/1607483189-3891-1-git-send-email-wgong@codeaurora.org/

-- 
thomas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
