Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEACBCD343A
	for <ath10k@archiver.kernel.org>; Tue, 19 Sep 2023 04:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r0G+vUQv2hb9w2oIJ9z6nbpRRviZBi0R3b7doebDhsk=; b=vXPCJYA6n6WVaR
	5nZ8uCGM8oCxmLTZXTqH2LCrxLdu5MNhoYhJQH5FGX7T1WrcG68QD1hqeszvr/uRKz1SF/fytH6Mm
	dQU1TseHUy9UtEJ9nlFKB+PGpvH6lBFLanUnq+MMJeLfPrXgt67YsEJB4unNHur6Vh8CCjIXsyJQ4
	NObofQBPYP0bUHaD+5zP2AF1ZfhQwEivYgrRlm6NtvHBbS7qgk7NbBzhdi6rR8SzUgcfinHGiWE/y
	gPeXxVkgTxlUyxwXiw+OZt11HDaKiL5I6YuYwtEBeILz+3+0w2ikcRgR2taOuI9Sd+j/ujboDYPy5
	vFL6KIKUqrobxpA7C9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiSi2-00Gz6N-0G;
	Tue, 19 Sep 2023 04:51:38 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiShz-00Gz5i-0N
	for ath10k@lists.infradead.org;
	Tue, 19 Sep 2023 04:51:36 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 3E1BD602F96CC;
	Tue, 19 Sep 2023 12:51:32 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Wu Yunchuan <yunchuan@nfschina.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Wu Yunchuan <yunchuan@nfschina.com>
Subject: [PATCH v2 wireless-next 6/9] wifi: ath10k: Remove unnecessary (void*) conversions
Date: Tue, 19 Sep 2023 12:50:56 +0800
Message-Id: <20230919045056.523958-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_215135_345445_5D535D44 
X-CRM114-Status: UNSURE (   5.96  )
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

No need cast (void*) to (struct htt_rx_ring_setup_ring32 *),
(struct htt_rx_ring_setup_ring64 *). Change the prototype to
remove the local variable.

Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>
Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index bd603feb7953..be4d4536aaa8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -796,20 +796,16 @@ static int ath10k_htt_send_frag_desc_bank_cfg_64(struct ath10k_htt *htt)
 	return 0;
 }
 
-static void ath10k_htt_fill_rx_desc_offset_32(struct ath10k_hw_params *hw, void *rx_ring)
+static void ath10k_htt_fill_rx_desc_offset_32(struct ath10k_hw_params *hw,
+					      struct htt_rx_ring_setup_ring32 *rx_ring)
 {
-	struct htt_rx_ring_setup_ring32 *ring =
-			(struct htt_rx_ring_setup_ring32 *)rx_ring;
-
-	ath10k_htt_rx_desc_get_offsets(hw, &ring->offsets);
+	ath10k_htt_rx_desc_get_offsets(hw, &rx_ring->offsets);
 }
 
-static void ath10k_htt_fill_rx_desc_offset_64(struct ath10k_hw_params *hw, void *rx_ring)
+static void ath10k_htt_fill_rx_desc_offset_64(struct ath10k_hw_params *hw,
+					      struct htt_rx_ring_setup_ring64 *rx_ring)
 {
-	struct htt_rx_ring_setup_ring64 *ring =
-			(struct htt_rx_ring_setup_ring64 *)rx_ring;
-
-	ath10k_htt_rx_desc_get_offsets(hw, &ring->offsets);
+	ath10k_htt_rx_desc_get_offsets(hw, &rx_ring->offsets);
 }
 
 static int ath10k_htt_send_rx_ring_cfg_32(struct ath10k_htt *htt)
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
