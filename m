Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EB8C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 15:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C76F6104F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 15:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C76F6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jqGktqtyDUClM/87/0fGP3IMNezwOVZHr6hM0V4q1wM=; b=S1sNefPSXiNXIZ
	Cmn1N9J944DrYT2DR2kXeX0eqIvZWuKPdoRktLCXDxo6P1vSTfyc4RRDD2AoIjWEix64QRGd/dABg
	6/OGy/nBPaRQkX2yzQVEzzFxSa6mc4ooj0C2enxNlXOC80TnAOkhod7KFXqBn+3xfBLCIxibNUdjp
	BE0XkKDz/03vhoeCr8DZUitHn0udd9e4sGVuO1O/48alxizL8wVPT8xVb8ngmNGKjqtXKTgSwF5vZ
	hDjJglEBFiX9DTITSJ6kntkuhK2wUh/fX1hEQPDnHabqVg8LYQqaiXpxkuBBc7RULbl2Fr4xmsua4
	oKadAHpEVEd3Wq7cq1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNCj-005zoH-2T; Wed, 18 Aug 2021 15:10:09 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNCd-005zmd-K3
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 15:10:07 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:609d:5443:34fc:77bc])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DF5368023C;
 Wed, 18 Aug 2021 17:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1629299399;
 bh=V3aIwBjPDSwQvWYn3MTxVSL+3+CQ6L5vEo6cTcG4ITw=;
 h=From:To:Cc:Subject:Date:From;
 b=tm0U1B+9FVLv5V7tM+4OKtWQr0bp05d1xfbai/h1Hw6GLJFrixLLLIPVCYPmyQU4u
 c0n/fDYiI5kVgjLdtCb+bVh35Vqi/OobOHJDTgFnBPJkVDXao9Rx6qskeOroUlT3ld
 SnCC7m9dBGFpSyUCEMohiYcRah0GYAA1Jl9QwH1H4C3FKV5dUlkoYkVvSqgMuh4/XD
 fKhIRWVbqQR+927L+d9GwbUCPfjayHoSs4IOMY1Xd10y0V0lzFOezjiDBWPlb7zS55
 DfIvYiW8k42ZaMWYj7rp78SCNz+0l8LE7e4epuiZh3hJdCbZZUMr9NAYbJ541kdAuj
 kKjNjKE+UAp9Q==
From: Fabio Estevam <festevam@denx.de>
To: kvalo@codeaurora.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, hch@lst.de,
 erik.stromdahl@gmail.com, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ath10k: Do not call dma_alloc_coherent() for SDIO and USB
Date: Wed, 18 Aug 2021 12:09:43 -0300
Message-Id: <20210818150943.1630199-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_081004_048812_38EBEEFA 
X-CRM114-Status: GOOD (  15.93  )
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

When running the "hostapd" application on a i.MX7-based board with
an ath10k device connected via SDIO, the following warning is seen:

------------[ cut here ]------------
 WARNING: CPU: 0 PID: 489 at kernel/dma/mapping.c:427 dma_alloc_attrs+0xd0/0x114
 Modules linked in: ath10k_sdio ath10k_core ath
 CPU: 0 PID: 489 Comm: hostapd Not tainted 5.10.48-stable-standard #1
 Hardware name: Freescale i.MX7 Dual (Device Tree)
 [<c0111378>] (unwind_backtrace) from [<c010bc04>] (show_stack+0x10/0x14)
 [<c010bc04>] (show_stack) from [<c0e26094>] (dump_stack+0xdc/0x104)
 [<c0e26094>] (dump_stack) from [<c0125574>] (__warn+0xd8/0x114)
 [<c0125574>] (__warn) from [<c0e20ecc>] (warn_slowpath_fmt+0x60/0xbc)
 [<c0e20ecc>] (warn_slowpath_fmt) from [<c01b9eac>] (dma_alloc_attrs+0xd0/0x114)
 [<c01b9eac>] (dma_alloc_attrs) from [<bf01373c>] (ath10k_add_interface+0x2f0/0x1094 [ath10k_core])
 [<bf01373c>] (ath10k_add_interface [ath10k_core]) from [<c0d94470>] (drv_add_interface+0x88/0x2fc)
 
As explained by Christoph Hellwig:

"Looking at the ath10k code ar->dev is set by ath10k_core_create, which
has multiple callers.

For ath10k_pci_probe it is a pci_dev, which should always have a
dma_mask.

For ath10k_ahb_probe is a device tree probed platform_device,
which should have a dma mask.

For ath10k_sdio_probe it is a sdio_func, which from my understanding is
a virtual device can't do DMA itself.

For ath10k_snoc_probe it is a platform device with an explicit
dma_set_mask_and_coherent and above so the dma_mask is set.

For ath10k_usb_probe it is an usb device which can't do USB."

Fix the problem by not calling dma_alloc_coherent() when the device
is not DMA capable, such as SDIO and USB.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Hi,

I am not certain about the proper commit to include in the Fixes tag.

Any suggestions?

Thanks

 drivers/net/wireless/ath/ath10k/mac.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c272b290fa73..e85c3f107d2e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5576,15 +5576,17 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	if (vif->type == NL80211_IFTYPE_ADHOC ||
 	    vif->type == NL80211_IFTYPE_MESH_POINT ||
 	    vif->type == NL80211_IFTYPE_AP) {
-		arvif->beacon_buf = dma_alloc_coherent(ar->dev,
-						       IEEE80211_MAX_FRAME_LEN,
-						       &arvif->beacon_paddr,
-						       GFP_ATOMIC);
-		if (!arvif->beacon_buf) {
-			ret = -ENOMEM;
-			ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
-				    ret);
-			goto err;
+		if (!(ar->hif.bus == ATH10K_BUS_SDIO) && !(ar->hif.bus == ATH10K_BUS_USB)) {
+			arvif->beacon_buf = dma_alloc_coherent(ar->dev,
+							       IEEE80211_MAX_FRAME_LEN,
+							       &arvif->beacon_paddr,
+							       GFP_ATOMIC);
+			if (!arvif->beacon_buf) {
+				ret = -ENOMEM;
+				ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
+					    ret);
+				goto err;
+			}
 		}
 	}
 	if (test_bit(ATH10K_FLAG_HW_CRYPTO_DISABLED, &ar->dev_flags))
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
