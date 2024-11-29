Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E721D6EBF0
	for <ath10k@archiver.kernel.org>; Fri, 29 Nov 2024 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVGsv9clmeIoNQ5Jg08/jl5FNSBOtS33uzApsGNDV+c=; b=zPioS0ApAjpa4aoxDdNE3+qqK3
	anohzw2pwGEn0FJZBCRpFxgq0Nm89PF9k9LKJ412VvxaP0Gu3q0ibYoazvv4qHS2MWPpN00kDpVqf
	o2xBKC+8aOiQsOuQzActjWXbm/58dcfAJe0i2BR6VYxaguL7mk4rjfNbhCVexG5aWDkX71BQnF4eX
	jaEUfiuze6CcAcDTlYKSzV8dekqCHlQtbnpgrsEcX4dU7dqEmPyEDuSv7DQgagrmJ2F5sVstMJ/t4
	IDU5K6PNq093BhSWBFyE4T4RcQfUuSr5gmHlLlzhsKzckEr7LhvTzepFUasq3FaBdxJ29A3LX5ZMZ
	snnmkLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwoB-0000000HFuY-050g;
	Fri, 29 Nov 2024 08:57:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwl7-0000000HFIq-1Xof
	for ath10k@lists.infradead.org;
	Fri, 29 Nov 2024 08:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F00D5A43DC8;
	Fri, 29 Nov 2024 08:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DED1C4CED2;
	Fri, 29 Nov 2024 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732870432;
	bh=PWjGAU76nJzuPec0ckBdi9FcYElbQvNbyAFXD40o/MY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VBLEKQrV000Q1wZNquGeBb4ypPUKC6cnNAoJnOtXORzuqE+c+xHNqnMjNFZ5C4QXX
	 qMakgu6HRuTKDtUoCeFQrHRewR25vEepbHPN/x1nJgjC5Dea0i77fXr2Uhdim16Ibg
	 0qGcskpXexy+GBIp7FYhjJB6e4psoTb3vMht7kcWszhJcSb16eE0QUYQ+natd8BNJI
	 jWIiIdvGSQxLCCzb//wiuvaNaO13RsAcBtI+hfLwDjz+TKRGbAaAs6L2ubufayHT7z
	 Hok3kGlV9/GeWTHrfUU5QXnXyK7mc6pA/Zytl4BUzoY4R4zMw+QNKgL5TOupHxuuiV
	 Igl4NeIyQfxwA==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  LKML
 <linux-kernel@vger.kernel.org>,  regressions@lists.linux.dev
Subject: Re: WARNING: drivers/net/wireless/ath/ath10k/mac.c:8750
 ath10k_mac_update_vif_chan+0x237/0x2e0 [ath10k_core]
References: <637c5bb4-5278-44be-9ac3-9c0ef9297162@molgen.mpg.de>
	<8734jcx60e.fsf@kernel.org>
	<5c9bf757-a035-499c-a1ef-ac33c1c6e75b@molgen.mpg.de>
Date: Fri, 29 Nov 2024 10:53:48 +0200
In-Reply-To: <5c9bf757-a035-499c-a1ef-ac33c1c6e75b@molgen.mpg.de> (Paul
	Menzel's message of "Fri, 29 Nov 2024 00:01:55 +0100")
Message-ID: <8734jav2sj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_005353_554424_66784425 
X-CRM114-Status: GOOD (  15.33  )
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

Paul Menzel <pmenzel@molgen.mpg.de> writes:

> Dear Kalle,
>
>
> Thank you for your reply.
>
>
> Am 27.11.24 um 12:36 schrieb Kalle Valo:
>> Paul Menzel writes:
>>=20
>>> On the Dell XPS 13 9360 with Linux 6.12.0-08446-g228a1157fb9f, I
>>> noticed the trace below:
>> For others, commit 228a1157fb9f is from current merge window so the
>> first release will be in v6.13-rc1.
>>=20
>>> [16805.002289] ------------[ cut here ]------------
>>> [16805.002296] WARNING: CPU: 3 PID: 65835 at drivers/net/wireless/ath/a=
th10k/mac.c:8750 ath10k_mac_update_vif_chan+0x237/0x2e0 [ath10k_core]
>> [...]
>>=20
>>> I do not see such a message in the logs since September 19th, so I
>>> believe it=E2=80=99s a regression.
>> Have you seen it only this one time or multiple times?
>
> I have seen it only this one time.

Ok. Was it a network you regularly connect to or a new network? That
could also make a difference.

>> What kernels have you been testing prior? I'm trying to pinpoint what
>> versions kernel version work and what have this warning.
>
> Before I ran 6.12.0-07749-g28eb75e178d3 without seeing this. As it
> only occurred once, that does not give any pointer though.

Yeah, if you have seen it only once it is difficult to make any
conclusions. It could be as well an older bug which happens rarely. If
you see it again, let us know.

> PS:
>
> $ last reboot
> reboot   system boot  6.12.0-10296-gaa Thu Nov 28 22:42 - still running
> reboot   system boot  6.12-rc6-amd64   Wed Nov 27 14:04 - 22:42 (1+08:37)
> reboot   system boot  6.12.0-10296-gaa Wed Nov 27 13:21 - 14:02  (00:40)
> reboot   system boot  6.12.0-09568-g2f Tue Nov 26 18:41 - crash
> reboot   system boot  6.12.0-08446-g22 Sat Nov 23 12:27 - 18:40 (3+06:13)
> reboot   system boot  6.12.0-07749-g28 Fri Nov 22 10:14 - 10:24 (1+00:09)
> reboot   system boot  6.12.0           Wed Nov 20 09:24 - crash
> reboot   system boot  6.12.0-rc7       Wed Nov 20 09:22 - 09:23  (00:01)
> reboot   system boot  6.12.0-rc7       Tue Nov 12 08:19 - 23:27 (7+15:08)
> reboot   system boot  6.12.0-rc7       Mon Nov 11 21:54 - 00:16  (02:21)
> reboot   system boot  6.11-amd64       Mon Nov 11 21:52 - crash
> reboot   system boot  6.12.0-rc7       Mon Nov 11 20:43 - 21:52  (01:08)
> reboot   system boot  6.12.0-rc7       Mon Nov 11 17:51 - 17:52  (00:01)
> reboot   system boot  6.12.0-rc6-00077 Fri Nov  8 08:39 - 17:50 (3+09:11)
> reboot   system boot  6.12.0-rc6-00077 Thu Nov  7 07:26 - 23:24  (15:58)
> reboot   system boot  6.12.0-rc5-00047 Mon Nov  4 08:26 - crash
> reboot   system boot  6.12.0-rc5-00047 Mon Nov  4 05:42 - 05:43  (00:00)
> reboot   system boot  6.12.0-rc5-00047 Sun Nov  3 06:54 - 22:10  (15:15)
> reboot   system boot  6.12.0-rc5-00047 Sat Nov  2 07:34 - 22:05  (14:31)

Oh nice, looks really useful. I need to install that.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

