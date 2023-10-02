Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD62CE784B0
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GF6IPQ/Kgtzp4nJBqVs4sfFc8og1IDCYTOKs+P0BO2A=; b=qmiISwih3IPlwS
	jSCJ31L3H1jlbX6+wvTHdrY/3gwV/uiuJM0+vm9tRcwbMPzUm4PV+3IF7GWpfuoYXQp0zHZLOug+/
	N2T3YVdmE1zG8GpXwKAmD0xY1hENChUKHfpvhCZhNs7tLVEWgjcYiHuWcPzArPFUIt2gHIYwOl2dB
	nSjB7jpqaRFMi9k9goOXCNcKpA/ozztTt2Kj5K+KYCDNRQksRt9xqPJryENoVm0ApCJLR9tk7MUWs
	L8B8NJrEQ5q90yxfSP9Ann/1VhDgJXTbw281PgKvM4DsSGH/hrWrhLA4WLyjnd7zXjvW5jk4xwSvP
	eQb1fyU7nRYfiQR3VvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMDB-00D6iS-16;
	Mon, 02 Oct 2023 16:56:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMD8-00D6hz-1E
	for ath10k@lists.infradead.org;
	Mon, 02 Oct 2023 16:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A40760F96;
	Mon,  2 Oct 2023 16:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D83C433C9;
	Mon,  2 Oct 2023 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696265756;
	bh=sPlHNmzUSdBxnJ8yitiqY23idbEgXus5Y1nrmAkWweQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=sARPa3QNqo2ddqMiMCByHiNP+YQvPz19V1/oiSd/ZW2tmwUsrFzKXIwm1/cu9mqZL
	 NUiibzUjfgDoNeu7m5NOb/Fjk2Dt6Pb5tbdbR5KEpoLeW1s+Hnk0yU7jOz1OIb/6oS
	 AwNccwIzlqbjaB/ET75fjRwmnFmbZjQTB9L+k0KunjRNCGy+nRK3BBCNObY7dqjQtP
	 NTa9sPQkcoJRfBi/Tr2uK9k2qADCz4DBf3P+ttoUGUt/KK9ymYILx4w5p+MqdELYlw
	 eFEdIXCSvegwaflyLsYSrS3/I+U17/QEGDtiEV5zL6DKmha6zPE2EfPmudjLng+1FK
	 A6VOaEoUq/L1Q==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Don't touch the CE interrupt registers after
 power up
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
References: <20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid>
To: Douglas Anderson <dianders@chromium.org>
Cc: ath10k@lists.infradead.org, Abhishek Kumar <kuabhs@chromium.org>,
 Youghandhar Chintala <quic_youghand@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626575295.3936351.833023194847155734.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:55:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_095558_503431_D8869BD5 
X-CRM114-Status: GOOD (  14.86  )
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

Douglas Anderson <dianders@chromium.org> wrote:

> As talked about in commit d66d24ac300c ("ath10k: Keep track of which
> interrupts fired, don't poll them"), if we access the copy engine
> register at a bad time then ath10k can go boom. However, it's not
> necessarily easy to know when it's safe to access them.
> 
> The ChromeOS test labs saw a crash that looked like this at
> shutdown/reboot time (on a chromeos-5.15 kernel, but likely the
> problem could also reproduce upstream):
> 
> Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> ...
> CPU: 4 PID: 6168 Comm: reboot Not tainted 5.15.111-lockdep-19350-g1d624fe6758f #1 010b9b233ab055c27c6dc88efb0be2f4e9e86f51
> Hardware name: Google Kingoftown (DT)
> ...
> pc : ath10k_snoc_read32+0x50/0x74 [ath10k_snoc]
> lr : ath10k_snoc_read32+0x24/0x74 [ath10k_snoc]
> ...
> Call trace:
> ath10k_snoc_read32+0x50/0x74 [ath10k_snoc ...]
> ath10k_ce_disable_interrupt+0x190/0x65c [ath10k_core ...]
> ath10k_ce_disable_interrupts+0x8c/0x120 [ath10k_core ...]
> ath10k_snoc_hif_stop+0x78/0x660 [ath10k_snoc ...]
> ath10k_core_stop+0x13c/0x1ec [ath10k_core ...]
> ath10k_halt+0x398/0x5b0 [ath10k_core ...]
> ath10k_stop+0xfc/0x1a8 [ath10k_core ...]
> drv_stop+0x148/0x6b4 [mac80211 ...]
> ieee80211_stop_device+0x70/0x80 [mac80211 ...]
> ieee80211_do_stop+0x10d8/0x15b0 [mac80211 ...]
> ieee80211_stop+0x144/0x1a0 [mac80211 ...]
> __dev_close_many+0x1e8/0x2c0
> dev_close_many+0x198/0x33c
> dev_close+0x140/0x210
> cfg80211_shutdown_all_interfaces+0xc8/0x1e0 [cfg80211 ...]
> ieee80211_remove_interfaces+0x118/0x5c4 [mac80211 ...]
> ieee80211_unregister_hw+0x64/0x1f4 [mac80211 ...]
> ath10k_mac_unregister+0x4c/0xf0 [ath10k_core ...]
> ath10k_core_unregister+0x80/0xb0 [ath10k_core ...]
> ath10k_snoc_free_resources+0xb8/0x1ec [ath10k_snoc ...]
> ath10k_snoc_shutdown+0x98/0xd0 [ath10k_snoc ...]
> platform_shutdown+0x7c/0xa0
> device_shutdown+0x3e0/0x58c
> kernel_restart_prepare+0x68/0xa0
> kernel_restart+0x28/0x7c
> 
> Though there's no known way to reproduce the problem, it makes sense
> that it would be the same issue where we're trying to access copy
> engine registers when it's not allowed.
> 
> Let's fix this by changing how we "disable" the interrupts. Instead of
> tweaking the copy engine registers we'll just use disable_irq() and
> enable_irq(). Then we'll configure the interrupts once at power up
> time.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

170c75d43a77 wifi: ath10k: Don't touch the CE interrupt registers after power up

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230630151842.1.If764ede23c4e09a43a842771c2ddf99608f25f8e@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
