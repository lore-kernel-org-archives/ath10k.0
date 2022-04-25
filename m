Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A6C433F5
	for <ath10k@archiver.kernel.org>; Mon, 25 Apr 2022 06:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSwXOG+471EAq+QpnfUg7CO90mjrpkdHKUXagjeoeF8=; b=jsKX9cd/e0k1mU
	CD6zeUgSVx63JcVeYPEGo8pl+8fZl0jifbdzg6QkUFnfF4+KjaoAOV7PZWcDlkKtBm/4qiDqC02vn
	AIDij8tOMr2oONG1vZvLTonyWD5HkQQ5R1n1yZ2/PNMi4gdJ520qZJl4XVqf8gEzaR2KMuyeuKG26
	dqwAFKALXLmuIWUPaJdrGp6PWjCvsMBFmySZs8luVbpf7iEE080tkjzYohaSV6XUX0hnmOS4JugyG
	tePuuGVR853HGM6BjJShcaHTo3tSoyyOWRWmScjvy1n7DuZlLvYMjZuVXeO65ujE3Jg4jO7JUKMc4
	lTZESjSQhEJ29rtPhmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nirzm-008SXA-Uk; Mon, 25 Apr 2022 06:14:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nirzh-008SWP-Rk
 for ath10k@lists.infradead.org; Mon, 25 Apr 2022 06:14:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A6576121B;
 Mon, 25 Apr 2022 06:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C040C385A7;
 Mon, 25 Apr 2022 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650867284;
 bh=v1EEYhgeaIQehOy9KLNLh1/yZgwgLJde8BVe9q6sido=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=G/5U+XQ+siL3PwDWE7pVK6lRwMeGdekI4S0QO4Jgwibm4BTPBl36fOsZhdAaiUiS+
 QDYwwySq/DiTevAda0978gAVWybNzmFckKkVJBlIvcPQkgLSmijnXL/3HxkR7F2axV
 LCJu3Vlsu+Fy0OuTCbOPZtHf9AcH24ghHQMKXxS64fZ/c6tJ4eMufpKdFrn4qb6tM6
 jp6P/AQbgdRw5Ow7OM8lwuxG0XS/utCLgTSKc9t/kEEqgZCOvl4em1P8FW0j39a9+r
 qpbUNb5niBm3ECIm2e53Zk+pdWZ4Du4pnhdKoGnNN/9i0MJHILy7r/S8MgSxMZK//P
 /yoQw5eO1SGbg==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 briannorris@chromium.org, ath10k@lists.infradead.org, netdev@vger.kernel.org,
 Wen Gong <quic_wgong@quicinc.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
Date: Mon, 25 Apr 2022 09:14:37 +0300
In-Reply-To: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 (Abhishek Kumar's message of "Mon, 25 Apr 2022 02:15:20 +0000")
Message-ID: <87czh5k7ua.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_231446_010646_C6412509 
X-CRM114-Status: GOOD (  17.65  )
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

Abhishek Kumar <kuabhs@chromium.org> writes:

> Double free crash is observed when FW recovery(caused by wmi
> timeout/crash) is followed by immediate suspend event. The FW recovery
> is triggered by ath10k_core_restart() which calls driver clean up via
> ath10k_halt(). When the suspend event occurs between the FW recovery,
> the restart worker thread is put into frozen state until suspend completes.
> The suspend event triggers ath10k_stop() which again triggers ath10k_halt()
> The double invocation of ath10k_halt() causes ath10k_htt_rx_free() to be
> called twice(Note: ath10k_htt_rx_alloc was not called by restart worker
> thread because of its frozen state), causing the crash.
>
> To fix this, during the suspend flow, skip call to ath10k_halt() in
> ath10k_stop() when the current driver state is ATH10K_STATE_RESTARTING.
> Also, for driver state ATH10K_STATE_RESTARTING, call
> ath10k_wait_for_suspend() in ath10k_stop(). This is because call to
> ath10k_wait_for_suspend() is skipped later in
> [ath10k_halt() > ath10k_core_stop()] for the driver state
> ATH10K_STATE_RESTARTING.
>
> The frozen restart worker thread will be cancelled during resume when the
> device comes out of suspend.
>
> Below is the crash stack for reference:
>
> [  428.469167] ------------[ cut here ]------------
> [  428.469180] kernel BUG at mm/slub.c:4150!
> [  428.469193] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [  428.469219] Workqueue: events_unbound async_run_entry_fn
> [  428.469230] RIP: 0010:kfree+0x319/0x31b
> [  428.469241] RSP: 0018:ffffa1fac015fc30 EFLAGS: 00010246
> [  428.469247] RAX: ffffedb10419d108 RBX: ffff8c05262b0000
> [  428.469252] RDX: ffff8c04a8c07000 RSI: 0000000000000000
> [  428.469256] RBP: ffffa1fac015fc78 R08: 0000000000000000
> [  428.469276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  428.469285] Call Trace:
> [  428.469295]  ? dma_free_attrs+0x5f/0x7d
> [  428.469320]  ath10k_core_stop+0x5b/0x6f
> [  428.469336]  ath10k_halt+0x126/0x177
> [  428.469352]  ath10k_stop+0x41/0x7e
> [  428.469387]  drv_stop+0x88/0x10e
> [  428.469410]  __ieee80211_suspend+0x297/0x411
> [  428.469441]  rdev_suspend+0x6e/0xd0
> [  428.469462]  wiphy_suspend+0xb1/0x105
> [  428.469483]  ? name_show+0x2d/0x2d
> [  428.469490]  dpm_run_callback+0x8c/0x126
> [  428.469511]  ? name_show+0x2d/0x2d
> [  428.469517]  __device_suspend+0x2e7/0x41b
> [  428.469523]  async_suspend+0x1f/0x93
> [  428.469529]  async_run_entry_fn+0x3d/0xd1
> [  428.469535]  process_one_work+0x1b1/0x329
> [  428.469541]  worker_thread+0x213/0x372
> [  428.469547]  kthread+0x150/0x15f
> [  428.469552]  ? pr_cont_work+0x58/0x58
> [  428.469558]  ? kthread_blkcg+0x31/0x31
>
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Tested-on tag missing, but I can add it if you provide it.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
