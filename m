Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3608C7EE2C
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/YitkP3wPTCdL/ZFujh/imU1YhQztBjMF2O64ZjN3M=; b=y+jMyz74y2FWmx
	mYf6RPEPf2e3VjzgSYqns4tKI9xrScbfE2SpGZQ/OytWqmXsXsY25CqUdLbktdIsseRTxcQROzGT8
	4oTlL800sBnb56jaI7BHy+2sCitH+Aokxaa4Og17vbuKoN55KqefpVtf6DU5ErW5BfR2qKA1k+hXY
	4s5/pcofOlQjplrYo+SR9fvSewMb9+dHW5mk9x4AUmmXFR1wifylKudHs8BtH5TTLe4nDqL7XMi+L
	CRk+Agr7qM0DKu9UloFLEABuQQMMWNBNOpu6UqAGw/uqI0+m1Y3TDsXS8qTaSaHPy9+iOHc1wvXts
	yoRTki3ppsTcV1e39Hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IV-002GxJ-1i;
	Thu, 24 Aug 2023 05:54:23 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IP-002GuI-35
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 05:54:20 +0000
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:287:0:640:7dd6:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id 95C4B60066;
	Thu, 24 Aug 2023 08:54:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3sDNeg0WnqM0-mityzO2w;
	Thu, 24 Aug 2023 08:54:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692856445;
	bh=v89yO4m1iVXQ5m9RPsFn12Fiawgpo1r61rjyfLEXziM=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=M/FBLPGoz+O3/9N5ib0zNE9YXLjrD9xvVHVdS4YbgsbYHrbuxqk1sQ8V5VH2DRBBk
	 nf2Ck8TDUFu2YpS/v5nHBmj6zdJ3mqaSiRjP9EQes8bEWFQxKeCWegFwE+n5dbnU5G
	 bzJkkkRn2p5UhgA5FE6DHs7VZ1QViixs4hfKgv58=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/6] [v3] wifi: ath10k: simplify ath10k_ce_init_pipe()
Date: Thu, 24 Aug 2023 08:51:07 +0300
Message-ID: <20230824055117.42309-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_225418_217678_9628AA76 
X-CRM114-Status: GOOD (  12.58  )
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

Convert 'ath10k_ce_init_pipe()' to return 'void' and thus
simplify 'ath10k_pci_init_pipes()' and 'ath10k_snoc_init_pipes()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: split from the larger v2 patch
---
 drivers/net/wireless/ath/ath10k/ce.c   |  6 ++----
 drivers/net/wireless/ath/ath10k/ce.h   |  4 ++--
 drivers/net/wireless/ath/ath10k/pci.c  | 12 +++---------
 drivers/net/wireless/ath/ath10k/snoc.c | 12 +++---------
 4 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index ace92c636733..73aa3632b23c 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1655,16 +1655,14 @@ ath10k_ce_alloc_dest_ring_64(struct ath10k *ar, unsigned int ce_id,
  * initialization. It may be that only one side or the other is
  * initialized by software/firmware.
  */
-int ath10k_ce_init_pipe(struct ath10k *ar, unsigned int ce_id,
-			const struct ce_attr *attr)
+void ath10k_ce_init_pipe(struct ath10k *ar, unsigned int ce_id,
+			 const struct ce_attr *attr)
 {
 	if (attr->src_nentries)
 		ath10k_ce_init_src_ring(ar, ce_id, attr);
 
 	if (attr->dest_nentries)
 		ath10k_ce_init_dest_ring(ar, ce_id, attr);
-
-	return 0;
 }
 EXPORT_SYMBOL(ath10k_ce_init_pipe);
 
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 666ce384a1d8..a0b408176f7f 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -220,8 +220,8 @@ int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
 
 /*==================CE Engine Initialization=======================*/
 
-int ath10k_ce_init_pipe(struct ath10k *ar, unsigned int ce_id,
-			const struct ce_attr *attr);
+void ath10k_ce_init_pipe(struct ath10k *ar, unsigned int ce_id,
+			 const struct ce_attr *attr);
 void ath10k_ce_deinit_pipe(struct ath10k *ar, unsigned int ce_id);
 int ath10k_ce_alloc_pipe(struct ath10k *ar, int ce_id,
 			 const struct ce_attr *attr);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index a7f44f6335fb..8e05326400bb 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2527,16 +2527,10 @@ void ath10k_pci_free_pipes(struct ath10k *ar)
 int ath10k_pci_init_pipes(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int i, ret;
+	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
-		ret = ath10k_ce_init_pipe(ar, i, &ar_pci->attr[i]);
-		if (ret) {
-			ath10k_err(ar, "failed to initialize copy engine pipe %d: %d\n",
-				   i, ret);
-			return ret;
-		}
-	}
+	for (i = 0; i < CE_COUNT; i++)
+		ath10k_ce_init_pipe(ar, i, &ar_pci->attr[i]);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 26214c00cd0d..4f835ad60080 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -941,16 +941,10 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 
 static int ath10k_snoc_init_pipes(struct ath10k *ar)
 {
-	int i, ret;
+	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
-		ret = ath10k_ce_init_pipe(ar, i, &host_ce_config_wlan[i]);
-		if (ret) {
-			ath10k_err(ar, "failed to initialize copy engine pipe %d: %d\n",
-				   i, ret);
-			return ret;
-		}
-	}
+	for (i = 0; i < CE_COUNT; i++)
+		ath10k_ce_init_pipe(ar, i, &host_ce_config_wlan[i]);
 
 	return 0;
 }
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
