Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwEj-0002vD-31
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:28:58 +0000
Subject: [PATCH 5/6] ath10k: htt: support MSDU ids with SDIO
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 12 Apr 2019 16:28:52 +0300
Message-ID: <155507573152.32018.18267130026274436463.stgit@potku.adurom.net>
In-Reply-To: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
References: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Alagu Sankar <alagusankar@silex-india.com>

Transmit completion for SDIO is similar to PCIe, modify the high
latency path to allow SDIO modules to use the msdu id.

kvalo: the original patch from Alagu enabled this only for SDIO but I'm not
sure should we also enable this with USB. I'll use bus params to enable this
for so that it's easy to enable also for USB later.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Co-developed-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Wen Gong <wgong@codeaurora.org>.
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h   |    1 +
 drivers/net/wireless/ath/ath10k/htt_tx.c |   13 ++++++++++++-
 drivers/net/wireless/ath/ath10k/sdio.c   |    2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e08a17b01e03..f22cb3f49034 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -919,6 +919,7 @@ struct ath10k_bus_params {
 	u32 chip_id;
 	enum ath10k_dev_type dev_type;
 	bool link_can_suspend;
+	bool hl_msdu_ids;
 };
 
 struct ath10k {
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d8e9cc0bb772..88f880b601d8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1244,6 +1244,7 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	u8 tid = ath10k_htt_tx_get_tid(msdu, is_eth);
 	u8 flags0 = 0;
 	u16 flags1 = 0;
+	u16 msdu_id = 0;
 
 	data_len = msdu->len;
 
@@ -1291,6 +1292,16 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		}
 	}
 
+	if (ar->bus_param.hl_msdu_ids) {
+		flags1 |= HTT_DATA_TX_DESC_FLAGS1_POSTPONED;
+		res = ath10k_htt_tx_alloc_msdu_id(htt, msdu);
+		if (res < 0) {
+			ath10k_err(ar, "msdu_id allocation failed %d\n", res);
+			goto out;
+		}
+		msdu_id = res;
+	}
+
 	skb_push(msdu, sizeof(*cmd_hdr));
 	skb_push(msdu, sizeof(*tx_desc));
 	cmd_hdr = (struct htt_cmd_hdr *)msdu->data;
@@ -1300,7 +1311,7 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->flags0 = flags0;
 	tx_desc->flags1 = __cpu_to_le16(flags1);
 	tx_desc->len = __cpu_to_le16(data_len);
-	tx_desc->id = 0;
+	tx_desc->id = __cpu_to_le16(msdu_id);
 	tx_desc->frags_paddr = 0; /* always zero */
 	/* Initialize peer_id to INVALID_PEER because this is NOT
 	 * Reinjection path
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index bbfdc4d7cf5f..d5073fac9509 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2045,6 +2045,8 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	bus_params.dev_type = ATH10K_DEV_TYPE_HL;
 	/* TODO: don't know yet how to get chip_id with SDIO */
 	bus_params.chip_id = 0;
+	bus_params.hl_msdu_ids = true;
+
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
 		ath10k_err(ar, "failed to register driver core: %d\n", ret);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
