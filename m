Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133EAC433F5
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0wlgoiOIvpWkeNTqHtbCujPp7pyVyz1xkWPOkNzVjiY=; b=ZhecF8bebr+v4s
	RaN43MkKsizFLQNz8bSbuBtOA7I5Zg5GlJEJ0EwMLF1RfgpuIn23GK7IVyR6/o0QqcS8vNGQUt7K4
	nDjrG1fJPx4aUF7rnQJdxxghvczCBIvLClftYxoRDC6eHCRSsJUHpQ4MVmjAAzEowxemIEY+NyAg3
	EsimhJqke7BQSv7D862TwUOBPo3GBeNPRTKQggl//sdFCzgRIUv8qEPLCQ6Jk4q3E1IEKlxK6wVj6
	DqO0xItEapCzWLLc1NSOwOAKiuen2GYzSnDtlUNvOCE1M/miTwDwQdcuCTUyifxnn8YG6Lb88CuhP
	2Ss+ANappKS2JyZQ0D6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxGUB-00Fy2p-Mo; Tue, 14 Dec 2021 22:41:27 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxGU8-00Fy1n-SW
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 22:41:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id l10so7498275pgm.7
 for <ath10k@lists.infradead.org>; Tue, 14 Dec 2021 14:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDsV3k9UGAVfHIwefuiXTCNNU/bOVVB2dV1ONTQPwYs=;
 b=YrT6Ax+RE1E9xOKx1/vSZs/CcExWra/gZCqKhlAVfclLv9T0FocQjL7NYCSEq+BTp9
 OUt+/qXIW7v58IGs1LUkhOQ5/AmciYchCTpv68onhApcLvu1jzc4qCrWgaZ0n0AJ4HVg
 MuGEEkGA7Wf2Mb+80scI4AkSBKWHENsY0LXbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDsV3k9UGAVfHIwefuiXTCNNU/bOVVB2dV1ONTQPwYs=;
 b=v91e42yWdQ2iyoo1UlPYHWmenytJ5yM1XknFGDTwYiagHJKGVHmW5nVSlAZWRBAsXX
 RKv9JdPP692CrhR2+TJQlyHFF5QW2+/oU7TqIL0xPJthG89o0DPqoY4EhMrD4g0yyg1W
 mX3JjmwQj5AVeCw9R5mXaWccMdqeiDGkjRxksSg56Y2d6TemyslAN45WLWipfPIxSZ1o
 S22BuHeK5HV5heIhkS5FD0//yCE9xOnfeJch+zXVLZlwVG9dlUB9sT0F1DoPigXyroaU
 +z1HoM4y29Sxuc1np/V/NsVdQRQQB63zmGcmfaUcjd1Uf7OdowuaB4OtXsmQTOZiNdfv
 a7Uw==
X-Gm-Message-State: AOAM531hWpKsUrdsr1nzp2kiNrXpIF+eaq034ro7WOPEgfnUHCzhK9fw
 8UjfQsI5OOZ7KfTD/MQreTnM5wma7FXLJQ==
X-Google-Smtp-Source: ABdhPJz3uI/F6ZLy7YDpsYuhsITDzYb4JFBnxud7ZTVkuR/XKrsKVpLM26sB1yYVYIQSqCV82fsBGQ==
X-Received: by 2002:a65:6819:: with SMTP id l25mr5622069pgt.506.1639521683205; 
 Tue, 14 Dec 2021 14:41:23 -0800 (PST)
Received: from kuabhs-cdev.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id g1sm122576pfv.19.2021.12.14.14.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:41:22 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@codeaurora.org,
	briannorris@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 dianders@chromium.org, kuabhs@chromium.org, pillair@codeaurora.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH] ath10k: enable threaded napi on ath10k driver
Date: Tue, 14 Dec 2021 22:39:36 +0000
Message-Id: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_144124_958438_48E3D0B8 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

NAPI poll can be done in threaded context along with soft irq
context. Threaded context can be scheduled efficiently, thus
creating less of bottleneck during Rx processing. This patch is
to enable threaded NAPI on ath10k driver.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

 drivers/net/wireless/ath/ath10k/pci.c  | 1 +
 drivers/net/wireless/ath/ath10k/sdio.c | 1 +
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4d4e2f91e15c..584307574d99 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1958,6 +1958,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif start\n");
 
+	dev_set_threaded(&ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
 
 	ath10k_pci_irq_enable(ar);
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 63e1c2d783c5..52ef74d9811a 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1862,6 +1862,7 @@ static int ath10k_sdio_hif_start(struct ath10k *ar)
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	int ret;
 
+	dev_set_threaded(&ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
 
 	/* Sleep 20 ms before HIF interrupts are disabled.
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 9513ab696fff..e7d12dbb3fa5 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -926,7 +926,7 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
-
+	dev_set_threaded(&ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
