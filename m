Return-Path: <SRS0=agdb=PR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D12C433FE
	for <ath10k@archiver.kernel.org>; Fri, 29 Oct 2021 09:08:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42933610CB
	for <ath10k@archiver.kernel.org>; Fri, 29 Oct 2021 09:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42933610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx+HSg559HozYt/9/LqgnYqp6hZiQSjS0BmB5Cj1AG0=; b=eWc9joaWBOecE/
	mDWwEnNyfGfyYyvCwj7U80GfZxy4RJO+C5PZJYS2iZIYyB2PaVMKBrt0Hksq2iaUMGHw4T7XKxBRQ
	1+p4pweDFiVDnjL0RpDwGPPRZs/Yv/yKJ6UQuQw2GNEsFuaCWbnp53f3hgIYl3T1+7eW/rltm/IpJ
	8rbxztPjcxnMibIPUDX3yEBjn3dGYXJOLkgEb9HnTM2g8znPc/7yAHsFWcQ+agqG2Lb62FGkeTRdr
	6hz49+seecHLZRCspnSpTaN7AfoSoJnViuq7YI5OOv5tx7TnSQVH8pAmtJK92+i5RCDVzz+K0XWgA
	QZVv4Uhtb/5OCdgHd2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgNrJ-00ARjO-2I; Fri, 29 Oct 2021 09:07:33 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgNrE-00ARg7-59
 for ath10k@lists.infradead.org; Fri, 29 Oct 2021 09:07:30 +0000
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mgNr9-00029N-Ei; Fri, 29 Oct 2021 11:07:23 +0200
Message-ID: <e355589e-3162-76ed-edec-5cffc1f77356@leemhuis.info>
Date: Fri, 29 Oct 2021 11:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BS
To: Kalle Valo <kvalo@codeaurora.org>,
 Francesco Magliocca <franciman12@gmail.com>
Cc: ath10k@lists.infradead.org,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com>
 <87o88muvvz.fsf@codeaurora.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Bug in Memory Layout of rx_desc for QCA6174
In-Reply-To: <87o88muvvz.fsf@codeaurora.org>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1635498448;
 f0cf750a; 
X-HE-SMSGID: 1mgNr9-00029N-Ei
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_020728_393286_796FF283 
X-CRM114-Status: GOOD (  30.53  )
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

On 21.09.21 11:21, Kalle Valo wrote:
> (adding linux-wireless and regression lists)

thx for that, this made be add the regression to regzbot
(https://linux-regtracking.leemhuis.info/regzbot/mainline/ ). That's why
I noticed there hasn't been any recent activity wrt to this regression
-- at least in this thread. Was progress made somewhere else? If not:
what can be done to get things moving again? Sure, it's an old
regression, but nevertheless it would be nice to get it fixed.

Ciao, Thorsten

#regzbot ignore-activity

> Francesco Magliocca <franciman12@gmail.com> writes:
> 
>> Hello everyone,
>> I have a QCA6174 PCIe board, I am using linux kernel 5.12.10.
>> The firmware loaded is:
>>> [ 4.483131] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000
>>> chip_id 0x00340aff sub 1a56:143a
>>> [ 4.483136] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1
>>> tracing 0 dfs 0 testmode 0
>>> [ 4.483567] ath10k_pci 0000:02:00.0: firmware ver
>>> WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp
>>> crc32 90eebefb
>>> [    4.572730] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 318825bf
>>> [ 4.665592] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3
>>> cal otp max-sta 32 raw 0 hwcrypto 1
>>
>> around six months ago I reported a bug which is still haunting me:
>> When I am connected to my home's Wi-Fi network and my father's Huawei
>> smartphone is connected too
>> my Wi-Fi card hangs and gets stuck, I have to force restart of the device.
>>
>> Note that this problem does not happen if my pc and the smartphone are
>> connected to different networks (for example
>> I tried connecting my pc to the 2.4GHz network and the smartphone to
>> the 5GHz network, and the bug does not appear).
>>
>> Now, I tried bisecting driver changes, and I found the faulty one,
>> it is the commit: e3def6f7ddf88636febb12e1e3e86387a4ce5452
> 
> Ok, so this is the commit:
> 
> commit e3def6f7ddf88636febb12e1e3e86387a4ce5452
> Author:     Govind Singh <govinds@qti.qualcomm.com>
> AuthorDate: Thu Dec 21 14:30:51 2017 +0530
> Commit:     Kalle Valo <kvalo@qca.qualcomm.com>
> CommitDate: Wed Dec 27 12:05:35 2017 +0200
> 
>     ath10k: Update rx descriptor for WCN3990 target
>     
>     WCN3990 rx descriptor uses different offset of msdu start, msdu end,
>     ppdu end, rx pkt end and rx frag info.
>     To accommodate different offsets, define respective fields in
>     rx descriptor of WCN3990 target.
>     
>     Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
>     Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> 
>> It adds some fields to structures like rx_msdu_start, rx_frag_info, etc..
>> The changes modify the size of these structures!
>>
>> If I revert this commit changes, the bug does not happen
>> (I tested it for two weeks, while the bug happens at least once in 2-3 hours
>> from when the smartphone is connected to the wifi network).
> 
> Good, I was just about to ask about that.
> 
>> Also, if I selectively remove some of the changes introduced by the
>> faulty commit, the bug does not go away, so it looks like the problem
>> is in the change of size of the data structures.
> 
> Heh, I was also about to ask about that as well :) The firmware is
> supposed to handle length differences but clearly it's not.
> 
>> Now, I'd like to ask you what we can do to fix this problem... Is
>> there something I am doing wrong? Or is there a bug in the firmware?
>>
>> If the firmware can't be easily fixed, I was thinking that we can
>> abstract the htt_rx_desc (in the same way we do with ops in other
>> parts of the driver) to have two versions: one for 32-bit descriptors
>> (like my QCA6174) and one for 64-bit descriptors (i.e. WCN3990, which
>> was the cause of this change).
>>
>> I'd be really happy to help, but I am not sure I fully understand what
>> is going on, so what do you think is happening and what should we do?
> 
> Getting the firmware fixed is difficult. I would first try abstracting
> the htt_rx_desc, can you send a patch?
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
