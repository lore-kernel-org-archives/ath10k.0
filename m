Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E98D70DFA
	for <ath10k@archiver.kernel.org>; Thu, 28 Nov 2024 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs7IUd4aPpVjB/EWOvFe5TLzFbl/KdK8UGt+zBEwXuE=; b=oFrzHeP/GHVp7U8/kWreoHBFH3
	m/NX7u5dOwKXrHaXCLWeHxvro9JpbkLwRIpdkjKddSKxvhSCX88uEJDFK3xK8nx8+LycXbktBC/zD
	eM3s/hb5ybHdq9Nz3uEO1piyVbvQNDAWM99fGfK6ljNOMgF3dDiDqAi9TBY4qOJqpymBIkGOa+Uo3
	toeTAcQgHTDwPYStHx+p/+KKOzHU1gYgQjUWNGHdb3vOx0rQJYnt7hPBC5OqHp0X4Oc7mO0Sh390R
	RnlKC77pBpZH/rxL6JQJWFfVbVi5bFG8yfk9Jb4fyqDnjzxY4rLho2mQ4tXb7cZbpPbh/ukU48GiX
	uOgZ56nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGnWl-0000000GXic-3ckP;
	Thu, 28 Nov 2024 23:02:27 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGnWh-0000000GXhu-1zmE
	for ath10k@lists.infradead.org;
	Thu, 28 Nov 2024 23:02:25 +0000
Received: from [192.168.0.2] (ip5f5af40d.dynamic.kabel-deutschland.de [95.90.244.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 33CAF61E5FE05;
	Fri, 29 Nov 2024 00:01:56 +0100 (CET)
Message-ID: <5c9bf757-a035-499c-a1ef-ac33c1c6e75b@molgen.mpg.de>
Date: Fri, 29 Nov 2024 00:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: drivers/net/wireless/ath/ath10k/mac.c:8750
 ath10k_mac_update_vif_chan+0x237/0x2e0 [ath10k_core]
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
References: <637c5bb4-5278-44be-9ac3-9c0ef9297162@molgen.mpg.de>
 <8734jcx60e.fsf@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <8734jcx60e.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_150224_121396_262982FC 
X-CRM114-Status: GOOD (  11.70  )
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

Dear Kalle,


Thank you for your reply.


Am 27.11.24 um 12:36 schrieb Kalle Valo:
> Paul Menzel writes:
> 
>> On the Dell XPS 13 9360 with Linux 6.12.0-08446-g228a1157fb9f, I
>> noticed the trace below:
> 
> For others, commit 228a1157fb9f is from current merge window so the
> first release will be in v6.13-rc1.
> 
>> [16805.002289] ------------[ cut here ]------------
>> [16805.002296] WARNING: CPU: 3 PID: 65835 at drivers/net/wireless/ath/ath10k/mac.c:8750 ath10k_mac_update_vif_chan+0x237/0x2e0 [ath10k_core]
> 
> [...]
> 
>> I do not see such a message in the logs since September 19th, so I
>> believe it’s a regression.
> 
> Have you seen it only this one time or multiple times?

I have seen it only this one time.

> What kernels have you been testing prior? I'm trying to pinpoint what
> versions kernel version work and what have this warning.
Before I ran 6.12.0-07749-g28eb75e178d3 without seeing this. As it only 
occurred once, that does not give any pointer though.


Kind regards,

Paul


PS:

$ last reboot
reboot   system boot  6.12.0-10296-gaa Thu Nov 28 22:42 - still running
reboot   system boot  6.12-rc6-amd64   Wed Nov 27 14:04 - 22:42 (1+08:37)
reboot   system boot  6.12.0-10296-gaa Wed Nov 27 13:21 - 14:02  (00:40)
reboot   system boot  6.12.0-09568-g2f Tue Nov 26 18:41 - crash
reboot   system boot  6.12.0-08446-g22 Sat Nov 23 12:27 - 18:40 (3+06:13)
reboot   system boot  6.12.0-07749-g28 Fri Nov 22 10:14 - 10:24 (1+00:09)
reboot   system boot  6.12.0           Wed Nov 20 09:24 - crash
reboot   system boot  6.12.0-rc7       Wed Nov 20 09:22 - 09:23  (00:01)
reboot   system boot  6.12.0-rc7       Tue Nov 12 08:19 - 23:27 (7+15:08)
reboot   system boot  6.12.0-rc7       Mon Nov 11 21:54 - 00:16  (02:21)
reboot   system boot  6.11-amd64       Mon Nov 11 21:52 - crash
reboot   system boot  6.12.0-rc7       Mon Nov 11 20:43 - 21:52  (01:08)
reboot   system boot  6.12.0-rc7       Mon Nov 11 17:51 - 17:52  (00:01)
reboot   system boot  6.12.0-rc6-00077 Fri Nov  8 08:39 - 17:50 (3+09:11)
reboot   system boot  6.12.0-rc6-00077 Thu Nov  7 07:26 - 23:24  (15:58)
reboot   system boot  6.12.0-rc5-00047 Mon Nov  4 08:26 - crash
reboot   system boot  6.12.0-rc5-00047 Mon Nov  4 05:42 - 05:43  (00:00)
reboot   system boot  6.12.0-rc5-00047 Sun Nov  3 06:54 - 22:10  (15:15)
reboot   system boot  6.12.0-rc5-00047 Sat Nov  2 07:34 - 22:05  (14:31)

