Return-Path: <SRS0=uzqH=HK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01824C433E0
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 20:50:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9D464E75
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 20:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9D464E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FXOEj5aQfMDpO0Qs0rJTPjqIhaWIaKj/A8inzdFlCtI=; b=cheSZAAY1JBEvdxO6YkRd4H4n
	O+hdQUAPFTPdjRHEo3pmeIsZhbUn/PlX2BCtQjZ9P0tOBJiByU/zyYpGo6kkcDmYJPm2sgXPCe1cS
	STBs1UX4zWIELkIq1nbtE0jr7ide9NY6IwSNRpn+iHP5HkFVTOGlLeVsy2xFxpNiiVHXNLEZM3TVw
	T3PoqQVERWws+luMfEoKPfmP98ZJz8LjUXdMfJVdr2eJ2WpK5nHuIa9+EAc45nOCgamDS5841W5Oc
	F9QMAo28anwFfMTtUe+nr0AY8YUwK/GQJQaJ75AVSruMIIlydAgoMfCeYeSuLr4PXRKdhnfElmpJn
	HmHqoMltQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9DUD-0006CJ-DW; Mon, 08 Feb 2021 20:50:21 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9DU9-0006BV-6e
 for ath10k@lists.infradead.org; Mon, 08 Feb 2021 20:50:19 +0000
Received: from [192.168.254.6] (unknown [50.34.172.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 1B0EF13C2B0;
 Mon,  8 Feb 2021 12:50:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 1B0EF13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1612817415;
 bh=jJDmkVMJcc3nCByNIL2Qh2mWHCTIt5gxga+EqJSpOy0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=khYeEW2iPLIehs8rCDKjBETnT7kS4B0O2VXqHpB8PwdEOgpDHLpLCFOkTWL5lv9LP
 U/9/gsTJKPYdgBvbi13nVd+5/5fcc7bEmEgSiGGxumxPmSqUFbGGzVVpLwpWj8ruPr
 KkN85qguVC/BnJSfOjhWaFwk8mzO4Km8TsdGLqrc=
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>
References: <268706864.fOQeQAt3TZ@ripper> <2516016.JH6pyVjoBS@sven-edge>
 <fe6fa272-30ac-9588-d2a2-c89647beefbb@candelatech.com>
 <1794774.apFX3RtQK2@ripper>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <501ef679-f5ac-2caa-09aa-ae28f8f06b5b@candelatech.com>
Date: Mon, 8 Feb 2021 12:50:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1794774.apFX3RtQK2@ripper>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_155017_585895_092F8E00 
X-CRM114-Status: GOOD (  32.69  )
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
Cc: ath10k@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/8/21 12:32 PM, Sven Eckelmann wrote:
> On Sunday, 7 February 2021 18:42:42 CET Ben Greear wrote:
>> Somewhere along the way I fixed up raw transmit in my firmware, so possibly
>> only then will vlans really have a chance of working.
> 
> The first step was to disable the check which enables AP_VLAN conditional and
> just enable it all the time.

I appreciate the work you put into this.  Looks like it is at least not a regression
in code that I added, but I guess I'll need to fix whatever bug/feature upstream
added to get it working.

I think I'll have a way to set up a testbed for this sometime soon, as part
of work on another project, so I'll try to debug it then.

Thanks,
Ben

> 
> I've started testing with firmware-5-full-community-commit-0317-cf4991294.bin
> but it doesn't provide the raw support + per packet swcrypto. So I've tried to
> switch to firmware-5-full-community-commit-1187-774502ee5.bin but it has
> exactly the same with the raw mode - but at least advertises
> WMI_SERVICE_PER_PACKET_SW_ENCRYPT.
> 
> So my first target was to figure out what was the first firmware with
> WMI_SERVICE_PER_PACKET_SW_ENCRYPT. So you would guess that bisect would be
> suitable for this - but no, the first step directly found a crashing version.
> I should not complain so much -- just have to skip more and have no extra test
> results regarding the mcast support for them. Here is the log until I found the
> first one which is supposed to support WMI_SERVICE_PER_PACKET_SW_ENCRYPT:
> 
> # has_sw_encrypt:              firmware-5-full-community-commit-1187-774502ee5.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-0317-cf4991294.bin
> # skip:                        firmware-5-full-community-commit-0775-bb7462f22.bin
> # skip:                        firmware-5-full-community-commit-0782-c66b3495b.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-0533-4597878a6.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-0885-2d9cfe00b.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-1045-817be3ee8.bin
> # has_sw_encrypt:              firmware-5-full-community-commit-1112-68b46f73e.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-1077-44c74a25a.bin
> # has_sw_encrypt:              firmware-5-full-community-commit-1093-3c7065550.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-1085-c1d37213a.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-1089-1fbfebf26.bin
> # has_sw_encrypt:              firmware-5-full-community-commit-1091-3aa26dbdd.bin
> # no_sw_encrypt:               firmware-5-full-community-commit-1090-7cfbf3e6a.bin
> # first has_sw_encrypt commit: firmware-5-full-community-commit-1091-3aa26dbdd.bin
> 
> None of the firmware version seem to have working multicast tx.
> 
> 
> And here are some (not so random) picked ones (just so nobody can say that I
> didn't check in the other direction):
> 
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0425-a422b044f.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0371-157623ac0.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0344-8b9e4442a.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0331-5259fada9.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0324-e6723f0f6.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0321-814d9dc06.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0319-ef95e743e.bin
> # no_per_patcket_sw_encrypt_no_mcast: firmware-5-full-community-commit-0318-51cd44bdd.bin
> 
> I didn't do a complete sweep of the builds but at the moment it looks a
> little bit like there might not be a single one which supports multicast over
> this setup. If you think there is a specific firmware version which I should
> test then just say which version.
> 
> So I've decided to try the ath10k firmware blobs from Kalle's repository to
> provide at least something useful for someone who also has this problem
> and searches for a compatible version:
> 
> firmware blob                                 | works | PER_PACKET_SW_ENCRYPT
> ----------------------------------------------+-------+----------------------
> 3.2/firmware-5.bin_10.4-3.2-00080             | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00004         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00005         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00007         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00015         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00018         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00023         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00024         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00026         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00028         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00029         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00031         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00033         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00037         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00042         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00044         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00047         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00050         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00051         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00053         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00058         | N     | N
> 3.2.1/firmware-5.bin_10.4-3.2.1-00060         | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00009     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00017     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00019     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00021     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00022     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00025     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00028     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00031     | N     | N
> 3.2.1.1/firmware-5.bin_10.4-3.2.1.1-00032     | N     | N
> 3.4/firmware-5.bin_10.4-3.4-00074             | N     | N
> 3.4/firmware-5.bin_10.4-3.4-00082             | N     | N
> 3.4/firmware-5.bin_10.4-3.4-00104             | N     | N
> 3.5.3/firmware-5.bin_10.4-3.5.3-00053         | N     | N
> 3.5.3/firmware-5.bin_10.4-3.5.3-00057         | Y     | Y
> 3.5.3/firmware-5.bin_10.4-3.5.3-00078         | Y     | Y
> 3.6/firmware-5.bin_10.4-3.6-00140             | Y     | Y
> 
> Kind regards,
> 	Sven
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
