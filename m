Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E92BC433FE
	for <ath10k@archiver.kernel.org>; Wed, 19 Oct 2022 05:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F39gUQedNiyPS8/rDkJa2HfDR+W2GRPBa4nvtwALvEo=; b=sMn/xUQ0YujQun
	rFjFZmRFNSdc4NDMop2vXqFNesiz1vHmTtl9lFrH80UYRuevQAThFyPctmuFH8aE/B58opyZ08mTL
	S/gc9gweXgy8Msb67H0IPgoqmOG4l7Q+ZXpAd0PzxA+q5NTAV/gCesBK42Nw617AItldXBrLW2bNz
	TLEdYFcdQR7SHTPooR6MES0ibWINqLK9d+1liFIqi6Oh44cmgXvKOPTwZkLRK8njJ4jgA+0+EYwGT
	UgrLIEUNKUxAPZYD1nzQ7pEzGBgPoLUhm8jH7lMF+zSpy0kpJopTR/JJHCfvMLQsPsAY1W3j6UK12
	UQvbqxCYtfB0TDZoZOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol1sz-00FDAh-Qq; Wed, 19 Oct 2022 05:45:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol1sm-00FD8x-Sr
	for ath10k@lists.infradead.org; Wed, 19 Oct 2022 05:44:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5877A6176C;
	Wed, 19 Oct 2022 05:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9F7C433D7;
	Wed, 19 Oct 2022 05:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666158285;
	bh=E8UeC0WUnxsuYD3yKW5jYAZL9kBreTcaaWUL/RKE5Mc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Tm5M5aZeCspKAgAE40+Z7Eonk0w7qN17zV3XqKPpQWOQGLKM7rzHYw15e1nNtNnKq
	 ZeryNqk31iy9TKufis/saWf0Ye1HDevE4231iZ96WhnPyUmHrBKdaRSepHUya01eKi
	 8S2XsZXLiFsj4wi8iyxjQymFLKspZ3pd5lbwOzJU0HdaCLYLt/kYuavq+SXMrovYcP
	 uRl3lxgN5fnr3aw/wd04bZvwkXY/YybNjG5Gre/eEJuF0yFz4UYfotpkc/A/P90age
	 8Q/cfzYQ2RBl9Qr41mgu/+MMl5t3x9wkQqOfA3feyMKwUjt5laiBlTmY41l1RVYLIw
	 n/h57mAiRkxOw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath10k: Delay the unmapping of the buffer
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221012142733.32420-1-quic_youghand@quicinc.com>
References: <20221012142733.32420-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Youghandhar Chintala <quic_youghand@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166615828224.31701.17876502388354120236.kvalo@kernel.org>
Date: Wed, 19 Oct 2022 05:44:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_224449_391781_0106335F 
X-CRM114-Status: GOOD (  16.55  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> On WCN3990, we are seeing a rare scenario where copy engine hardware is
> sending a copy complete interrupt to the host driver while still
> processing the buffer that the driver has sent, this is leading into an
> SMMU fault triggering kernel panic. This is happening on copy engine
> channel 3 (CE3) where the driver normally enqueues WMI commands to the
> firmware. Upon receiving a copy complete interrupt, host driver will
> immediately unmap and frees the buffer presuming that hardware has
> processed the buffer. In the issue case, upon receiving copy complete
> interrupt, host driver will unmap and free the buffer but since hardware
> is still accessing the buffer (which in this case got unmapped in
> parallel), SMMU hardware will trigger an SMMU fault resulting in a
> kernel panic.
> 
> In order to avoid this, as a work around, add a delay before unmapping
> the copy engine source DMA buffer. This is conditionally done for
> WCN3990 and only for the CE3 channel where issue is seen.
> 
> Below is the crash signature:
> 
> wifi smmu error: kernel: [ 10.120965] arm-smmu 15000000.iommu: Unhandled
> context fault: fsr=0x402, iova=0x7fdfd8ac0,
> fsynr=0x500003,cbfrsynra=0xc1, cb=6 arm-smmu 15000000.iommu: Unhandled
> context fault:fsr=0x402, iova=0x7fe06fdc0, fsynr=0x710003,
> cbfrsynra=0xc1, cb=6 qcom-q6v5-mss 4080000.remoteproc: fatal error
> received: err_qdi.c:1040:EF:wlan_process:0x1:WLAN RT:0x2091:
> cmnos_thread.c:3998:Asserted in copy_engine.c:AXI_ERROR_DETECTED:2149
> remoteproc remoteproc0: crash detected in
> 4080000.remoteproc: type fatal error <3> remoteproc remoteproc0:
> handling crash #1 in 4080000.remoteproc
> 
> pc : __arm_lpae_unmap+0x500/0x514
> lr : __arm_lpae_unmap+0x4bc/0x514
> sp : ffffffc011ffb530
> x29: ffffffc011ffb590 x28: 0000000000000000
> x27: 0000000000000000 x26: 0000000000000004
> x25: 0000000000000003 x24: ffffffc011ffb890
> x23: ffffffa762ef9be0 x22: ffffffa77244ef00
> x21: 0000000000000009 x20: 00000007fff7c000
> x19: 0000000000000003 x18: 0000000000000000
> x17: 0000000000000004 x16: ffffffd7a357d9f0
> x15: 0000000000000000 x14: 00fd5d4fa7ffffff
> x13: 000000000000000e x12: 0000000000000000
> x11: 00000000ffffffff x10: 00000000fffffe00
> x9 : 000000000000017c x8 : 000000000000000c
> x7 : 0000000000000000 x6 : ffffffa762ef9000
> x5 : 0000000000000003 x4 : 0000000000000004
> x3 : 0000000000001000 x2 : 00000007fff7c000
> x1 : ffffffc011ffb890 x0 : 0000000000000000 Call trace:
> __arm_lpae_unmap+0x500/0x514
> __arm_lpae_unmap+0x4bc/0x514
> __arm_lpae_unmap+0x4bc/0x514
> arm_lpae_unmap_pages+0x78/0xa4
> arm_smmu_unmap_pages+0x78/0x104
> __iommu_unmap+0xc8/0x1e4
> iommu_unmap_fast+0x38/0x48
> __iommu_dma_unmap+0x84/0x104
> iommu_dma_free+0x34/0x50
> dma_free_attrs+0xa4/0xd0
> ath10k_htt_rx_free+0xc4/0xf4 [ath10k_core] ath10k_core_stop+0x64/0x7c
> [ath10k_core]
> ath10k_halt+0x11c/0x180 [ath10k_core]
> ath10k_stop+0x54/0x94 [ath10k_core]
> drv_stop+0x48/0x1c8 [mac80211]
> ieee80211_do_open+0x638/0x77c [mac80211] ieee80211_open+0x48/0x5c
> [mac80211]
> __dev_open+0xb4/0x174
> __dev_change_flags+0xc4/0x1dc
> dev_change_flags+0x3c/0x7c
> devinet_ioctl+0x2b4/0x580
> inet_ioctl+0xb0/0x1b4
> sock_do_ioctl+0x4c/0x16c
> compat_ifreq_ioctl+0x1cc/0x35c
> compat_sock_ioctl+0x110/0x2ac
> __arm64_compat_sys_ioctl+0xf4/0x3e0
> el0_svc_common+0xb4/0x17c
> el0_svc_compat_handler+0x2c/0x58
> el0_svc_compat+0x8/0x2c
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> 
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

acd4324e5f1f wifi: ath10k: Delay the unmapping of the buffer

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221012142733.32420-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
