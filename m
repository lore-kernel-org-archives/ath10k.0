Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSB2I-0003jI-JQ
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 20:32:11 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id B365318876A
 for <ath10k@lists.infradead.org>; Thu, 11 Sep 2014 23:31:47 +0300 (EEST)
Subject: [RFC PATCH 2/3] ath10k: add diag_read() to hif ops
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 11 Sep 2014 23:31:47 +0300
Message-ID: <20140911203147.12514.84857.stgit@potku.adurom.net>
In-Reply-To: <20140911202926.12514.79908.stgit@potku.adurom.net>
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

diag_read() is used for reading from firmware memory via the diagnose window.
First user will be cal_data debugfs file.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hif.h |   10 ++++++++++
 drivers/net/wireless/ath/ath10k/pci.c |    8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 2ac7beacddca..0a8877d33f1f 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -43,6 +43,10 @@ struct ath10k_hif_ops {
 	int (*tx_sg)(struct ath10k *ar, u8 pipe_id,
 		     struct ath10k_hif_sg_item *items, int n_items);
 
+	/* read firmware memory through the diagnose interface */
+	int (*diag_read)(struct ath10k *ar, u32 address, void *buf,
+			 size_t buf_len);
+
 	/*
 	 * API to handle HIF-specific BMI message exchanges, this API is
 	 * synchronous and only allowed to be called from a context that
@@ -99,6 +103,12 @@ static inline int ath10k_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	return ar->hif.ops->tx_sg(ar, pipe_id, items, n_items);
 }
 
+static inline int ath10k_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
+				       size_t buf_len)
+{
+	return ar->hif.ops->diag_read(ar, address, buf, buf_len);
+}
+
 static inline int ath10k_hif_exchange_bmi_msg(struct ath10k *ar,
 					      void *request, u32 request_len,
 					      void *response, u32 *response_len)
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 154451ab3e3c..d3c51079034e 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -941,6 +941,13 @@ err:
 	return err;
 }
 
+static int ath10k_pci_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
+				    size_t buf_len)
+{
+	/* FIXME: locking */
+	return ath10k_pci_diag_read_mem(ar, address, buf, buf_len);
+}
+
 static u16 ath10k_pci_hif_get_free_queue_number(struct ath10k *ar, u8 pipe)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
@@ -1926,6 +1933,7 @@ static int ath10k_pci_hif_resume(struct ath10k *ar)
 
 static const struct ath10k_hif_ops ath10k_pci_hif_ops = {
 	.tx_sg			= ath10k_pci_hif_tx_sg,
+	.diag_read		= ath10k_pci_hif_diag_read,
 	.exchange_bmi_msg	= ath10k_pci_hif_exchange_bmi_msg,
 	.start			= ath10k_pci_hif_start,
 	.stop			= ath10k_pci_hif_stop,


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
