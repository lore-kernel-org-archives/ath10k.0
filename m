Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb8AQ-0007d3-CC
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 13:17:35 +0000
Subject: [PATCH] ath10k: add missing '\n' to warning and error messages
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 06 Oct 2014 16:17:08 +0300
Message-ID: <20141006131708.3639.18609.stgit@potku.adurom.net>
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

All warning and error messages should end with '\n', fix that.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c   |   10 +++++-----
 drivers/net/wireless/ath/ath10k/debug.c  |    2 +-
 drivers/net/wireless/ath/ath10k/htc.c    |    4 ++--
 drivers/net/wireless/ath/ath10k/htt_tx.c |    2 +-
 drivers/net/wireless/ath/ath10k/pci.c    |    2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 37e31665628c..dce2eeaa20c8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -251,7 +251,7 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot otp execute result %d\n", result);
 
 	if (result != 0) {
-		ath10k_err(ar, "otp calibration failed: %d", result);
+		ath10k_err(ar, "otp calibration failed: %d\n", result);
 		return -EINVAL;
 	}
 
@@ -331,7 +331,7 @@ static int ath10k_core_fetch_firmware_api_1(struct ath10k *ar)
 	}
 
 	if (ar->hw_params.fw.board == NULL) {
-		ath10k_err(ar, "board data file not defined");
+		ath10k_err(ar, "board data file not defined\n");
 		return -EINVAL;
 	}
 
@@ -525,14 +525,14 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features) &&
 	    !test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
-		ath10k_err(ar, "feature bits corrupted: 10.2 feature requires 10.x feature to be set as well");
+		ath10k_err(ar, "feature bits corrupted: 10.2 feature requires 10.x feature to be set as well\n");
 		ret = -EINVAL;
 		goto err;
 	}
 
 	/* now fetch the board file */
 	if (ar->hw_params.fw.board == NULL) {
-		ath10k_err(ar, "board data file not defined");
+		ath10k_err(ar, "board data file not defined\n");
 		ret = -EINVAL;
 		goto err;
 	}
@@ -809,7 +809,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 	if (mode == ATH10K_FIRMWARE_MODE_NORMAL) {
 		status = ath10k_wmi_wait_for_service_ready(ar);
 		if (status <= 0) {
-			ath10k_warn(ar, "wmi service ready event not received");
+			ath10k_warn(ar, "wmi service ready event not received\n");
 			status = -ETIMEDOUT;
 			goto err_hif_stop;
 		}
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 0d94febbb360..e1cb150353c8 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1392,7 +1392,7 @@ int ath10k_debug_start(struct ath10k *ar)
 		ret = ath10k_wmi_dbglog_cfg(ar, ar->debug.fw_dbglog_mask);
 		if (ret)
 			/* not serious */
-			ath10k_warn(ar, "failed to enable dbglog during start: %d",
+			ath10k_warn(ar, "failed to enable dbglog during start: %d\n",
 				    ret);
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 676bd4ed969b..2394d9901957 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -227,7 +227,7 @@ ath10k_htc_process_credit_report(struct ath10k_htc *htc,
 	int i, n_reports;
 
 	if (len % sizeof(*report))
-		ath10k_warn(ar, "Uneven credit report len %d", len);
+		ath10k_warn(ar, "Uneven credit report len %d\n", len);
 
 	n_reports = len / sizeof(*report);
 
@@ -716,7 +716,7 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 	if ((message_id != ATH10K_HTC_MSG_CONNECT_SERVICE_RESP_ID) ||
 	    (htc->control_resp_len < sizeof(msg->hdr) +
 	     sizeof(msg->connect_service_response))) {
-		ath10k_err(ar, "Invalid resp message ID 0x%x", message_id);
+		ath10k_err(ar, "Invalid resp message ID 0x%x\n", message_id);
 		return -EPROTO;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index fdfb1713b173..1524ff447e8b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -222,7 +222,7 @@ int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie)
 
 	ret = ath10k_htc_send(&htt->ar->htc, htt->eid, skb);
 	if (ret) {
-		ath10k_warn(ar, "failed to send htt type stats request: %d",
+		ath10k_warn(ar, "failed to send htt type stats request: %d\n",
 			    ret);
 		dev_kfree_skb_any(skb);
 		return ret;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8a04904cccee..8a3f4df83523 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -862,7 +862,7 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 				 max_nbytes, DMA_FROM_DEVICE);
 
 		if (unlikely(max_nbytes < nbytes)) {
-			ath10k_warn(ar, "rxed more than expected (nbytes %d, max %d)",
+			ath10k_warn(ar, "rxed more than expected (nbytes %d, max %d)\n",
 				    nbytes, max_nbytes);
 			dev_kfree_skb_any(skb);
 			continue;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
