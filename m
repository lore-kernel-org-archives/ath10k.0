Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7CDC433FE
	for <ath10k@archiver.kernel.org>; Mon, 30 May 2022 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=087l3DORBUtR+tB+J8t0O+YwYYDDcfrGwhqDVqAz06c=; b=ej1iXBtICfv+0X
	xhEpRsgM89nRl662eW5kxDIFaWTvLQULD2bNMrOajlgWvkjREm0JzcQEdlxTDdEA8kwQz6QLXe1az
	FuYIjn+z21kw8I3T5zGjkHqbqOoHfvwixEkPdvBlTzBl0vz8cr9CrCeXYorD7MYyk08McuS01iXro
	QNdhx+wHiD0LE4nWS8SdAuXsEqNfRuwngSp7igsFpPKn7h5kCtx8pZVjdTyZRWSZ9/E7WQsVlMlKm
	fyXGoKbEc8Km7AH/1/9J2PqRNu6XncBUnr5bQC1uK41nDV5K5LiAE52lR4N6TlpiWD6IOgRnd/NVh
	BH1fet50NnpgRlDgpvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdXH-006Klv-Up; Mon, 30 May 2022 11:26:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdXD-006Kke-Sd
	for ath10k@lists.infradead.org; Mon, 30 May 2022 11:26:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7202761157;
	Mon, 30 May 2022 11:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48F3C385B8;
	Mon, 30 May 2022 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653909966;
	bh=oPHilKQIe5gLHuQN2VeXrTQUijPOh1oH+Vyh0JO1fl0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=R4WZGMLltXB7FBGy7tauO0EfwCdU50Z8qCzJHahPBpAIwg7adLWN3u2CM+AqjdBE/
	 nFBGgabMKpKi0cwCjPwvLN53xR0SO4Tca37pNAnytz2JwCKBEs1nuWgXHycIipk2Lx
	 zJLLuDvZg02dZ85euYlVyZniTpI+J+oo29brW4nY3nwrAQKbPB13NmpeVDIAEIFkBH
	 x82Bvs9A9XtY1X6kM0m09qxsuiL89+kF3erLY+PDnAjmLrDOaNtZ46lvtkkg9tUx2C
	 b9XUFyYCEPbrgFzml+1ZjTDHd3Bkh2zNecnc8kDQi7QcBm4ebffP3c4EQxutF7KDCo
	 iJINGN8nR9YMg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix regdomain info of iw reg set/get
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220525132247.23459-1-quic_wgong@quicinc.com>
References: <20220525132247.23459-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165390996386.3436.14401468326254017675.kvalo@kernel.org>
Date: Mon, 30 May 2022 11:26:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_042608_054124_10E4A2B0 
X-CRM114-Status: GOOD (  18.83  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When wlan load, firmware report the reg code with 0x6C for QCA6174,
> it is world reg which checked by ath_is_world_regd(), then the reg
> will be save into reg_world_copy of ath_common in ath_regd_init().
> Later the regulatory of ath_common is updated to another country
> code such as "US" in ath_reg_notifier_apply() by below call stack.
> After that, regulatory_hint() is called in ath10k_mac_register()
> and it lead "iw reg get" show two regdomain info as below.
> 
> global
> country US: DFS-FCC
>         (2400 - 2472 @ 40), (N/A, 30), (N/A)
>         (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5730 - 5850 @ 80), (N/A, 30), (N/A)
>         (57240 - 71000 @ 2160), (N/A, 40), (N/A)
> 
> phy#0
> country US: DFS-FCC
>         (2400 - 2472 @ 40), (N/A, 30), (N/A)
>         (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5730 - 5850 @ 80), (N/A, 30), (N/A)
>         (57240 - 71000 @ 2160), (N/A, 40), (N/A)
> 
> [ 4255.704975] Call Trace:
> [ 4255.704983]  ath_reg_notifier_apply+0xa6/0xc5 [ath]
> [ 4255.704991]  ath10k_reg_notifier+0x2f/0xd2 [ath10k_core]
> [ 4255.705010]  wiphy_regulatory_register+0x5f/0x69 [cfg80211]
> [ 4255.705020]  wiphy_register+0x459/0x8f0 [cfg80211]
> [ 4255.705042]  ? ieee80211_register_hw+0x3a6/0x7d1 [mac80211]
> [ 4255.705049]  ? __kmalloc+0xf4/0x218
> [ 4255.705058]  ? ieee80211_register_hw+0x3a6/0x7d1 [mac80211]
> [ 4255.705066]  ? ath10k_mac_register+0x70/0xaab [ath10k_core]
> [ 4255.705075]  ieee80211_register_hw+0x51a/0x7d1 [mac80211]
> [ 4255.705084]  ath10k_mac_register+0x8b4/0xaab [ath10k_core]
> [ 4255.705094]  ath10k_core_register_work+0xa5e/0xb45 [ath10k_core]
> [ 4255.705100]  ? __schedule+0x61f/0x7d3
> [ 4255.705105]  process_one_work+0x1b7/0x392
> [ 4255.705109]  worker_thread+0x271/0x35d
> [ 4255.705112]  ? pr_cont_work+0x58/0x58
> [ 4255.705116]  kthread+0x13f/0x147
> [ 4255.705119]  ? pr_cont_work+0x58/0x58
> [ 4255.705123]  ? kthread_destroy_worker+0x62/0x62
> [ 4255.705126]  ret_from_fork+0x22/0x40
> 
> At this moment, the two regdomain info is same, when run "iw reg set KR",
> the global regdomain info changed to KR, but the regdomain of phy#0
> does not change again. It leads inconsistent values between global and
> phy#0 as below.
> 
> global
> country KR: DFS-JP
>         (2402 - 2482 @ 40), (N/A, 13), (N/A)
>         (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
>         (5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>         (57000 - 66000 @ 2160), (N/A, 43), (N/A)
> 
> phy#0
> country US: DFS-FCC
>         (2400 - 2472 @ 40), (N/A, 30), (N/A)
>         (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5730 - 5850 @ 80), (N/A, 30), (N/A)
>         (57240 - 71000 @ 2160), (N/A, 40), (N/A)
> 
> The initial reg code is 0x6C which saved in reg_world_copy of ath_common,
> and the code US is updated from cfg80211 later, so ath10k should also
> check the initial reg code before regulatory_hint().
> 
> After this fix, regdomain info is same between "iw reg get" and "iw reg
> set xx", it does not have the regdomain info of phy#0 again.
> 
> global
> country KR: DFS-JP
>         (2402 - 2482 @ 40), (N/A, 13), (N/A)
>         (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
>         (5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>         (57000 - 66000 @ 2160), (N/A, 43), (N/A)
> 
> This does not effect the channel list and power which ath10k used.
> When the country code for regulatory_hint() in ath10k_mac_register()
> is same with the global country code, then reg_set_rd_driver() of
> cfg80211 called from crda which return -EALREADY to set_regdom() and
> then update_all_wiphy_regulatory() will not be called while wlan load.
> When run "iw reg set xx", reg_get_regdomain() which used by function
> handle_channel() in net/wirelss/reg.c always use the regdomain
> returned by get_cfg80211_regdom() because the initiator of last
> regulatory_request is NL80211_REGDOM_SET_BY_USER, get_cfg80211_regdom()
> is the global regdomain, then all the ieee80211_channel info is updated
> in handle_channel() with the global regdomain.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> Tested-on: QCA9984 hw1.0 PCI 10.4-3.6-00104
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8723750e2753 ath10k: fix regdomain info of iw reg set/get

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220525132247.23459-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
