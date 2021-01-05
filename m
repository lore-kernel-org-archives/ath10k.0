Return-Path: <SRS0=hYFH=GI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AA3C433E9
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 00:19:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3CB2255F
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 00:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3CB2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2UQXH5ie4J7XpDairTSdRwBPNCWpVwEMNMTVeDcpI5w=; b=K/lrpWvAmmbppc1wHDvV3eolA
	YJPPY1BmCTtTGEr+/LTQnT0WE3d+H1dZIeDToOQj6EEo7qcgxj2cjrkciciBHqOETIaoVfcYo9cZS
	tmTkvY9Rf7Y8VHuNCI2711mbOtLfPtR7pKdG5Rta4CHBcc8se3GPLkofg63j1RuLcpm8CdtAPt5DF
	KTvJQXmf6omzPQJ4yXUipCPEfN5boKz1wbbkVSVRhwW/xwUopaQ9nyATNDoGJijMxnp8EYpUdcDVW
	jEKyfnu+m4B2swxkMDRgzItV1K3DwsXyHcjJY1H2/eS4y7Ce4cJoIK4aM/dbnSz5Geawq9eEXnSUz
	gU/CAGdVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwa3o-0006ng-QS; Tue, 05 Jan 2021 00:18:52 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwa3k-0006mw-Ce
 for ath10k@lists.infradead.org; Tue, 05 Jan 2021 00:18:51 +0000
Received: from [192.168.254.6] (unknown [50.46.152.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 1A3F013C2B0;
 Mon,  4 Jan 2021 16:18:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 1A3F013C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1609805927;
 bh=BgBvQ3tngIKZfMOStwU79haJSNRA7/wJGpW6iPo6NVY=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=oc3z+RckfgNIgraoev2Fa09WXm/jr3QvMLOA2r8joxrNq9pedQTIScGBM4ZlsaD8C
 nvyt4ok3ZqWPcwkoG+IG6JQtii51+x8563QUqkvRL8WeB8KHQr42wkNpON+QCI8z6i
 D9HUGou13ykfXmHRL/w7etZtzPphIn8q1s3AjVi4=
Subject: Re: RX rate is wrong in 5.10? (bisected to: mac80211: receive and
 process S1G beacons)
From: Ben Greear <greearb@candelatech.com>
To: ath10k <ath10k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Thomas Pedersen <thomas@adapt-ip.com>
References: <584816e2-ed18-3d5e-651e-293637222148@candelatech.com>
Organization: Candela Technologies
Message-ID: <5dc86950-1672-6900-dad4-3b437f4959c5@candelatech.com>
Date: Mon, 4 Jan 2021 16:18:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <584816e2-ed18-3d5e-651e-293637222148@candelatech.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_191848_599778_2B86B3F4 
X-CRM114-Status: GOOD (  15.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 1/4/21 8:18 AM, Ben Greear wrote:
> Hello,
> 
> I noticed that RX rate is always 6Mbps when I use -ct firmware and -ct driver in
> 5.10, and on stock 5.10.0 driver and stock firmware, rx-rate does not show up at
> all in 'iw dev wlan1 station dump'.
> 
> I'm using 9984 NIC...
> 
> Anyone else see this?

After a bisect, the first bad commit shows this:

commit 09a740ce352e1a1d16b9984115514ba9a4f4704b (refs/bisect/bad)
Author: Thomas Pedersen <thomas@adapt-ip.com>
Date:   Mon Sep 21 19:28:14 2020 -0700

     mac80211: receive and process S1G beacons

     S1G beacons are 802.11 Extension Frames, so the fixed
     header part differs from regular beacons.

     Add a handler to process S1G beacons and abstract out the
     fetching of BSSID and element start locations in the
     beacon body handler.

     Signed-off-by: Thomas Pedersen <thomas@adapt-ip.com>
     Link: https://lore.kernel.org/r/20200922022818.15855-14-thomas@adapt-ip.com
     [don't rename, small coding style cleanups]
     Signed-off-by: Johannes Berg <johannes.berg@intel.com>

 From a glance through the diff, I'm at a loss as to why it causes the symptom.  I manually
double-checked the bisect, an it appears correct.

What I see is that in the commit before this, I see a useful rx rate (1.3Gbps for instance)
in 'iw dev wlan1 station dump', but in this bad commit, both show 6Mbps rate.  (Tx rate
in ath10k is probably broken for other reasons, so I only bisected the rx side issue.)

I'm using ath10k 9984 radio with firmware 10.4-3.9.0.2-00070 in station mode.

AP is an ath11k Hawkeye...

I'm using a 1Mbps UDP packet 'download' stream to make sure I'm seeing rates for data frames
and not just management frames.

Any idea what might be the issue?

Thanks,
Ben



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
