Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuVkY-00070G-RF
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 04:37:10 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/2] ath10k: Enable pktlog for WCN3990 target
Date: Tue, 28 Aug 2018 10:06:42 +0530
Message-Id: <20180828043642.14890-3-govinds@codeaurora.org>
In-Reply-To: <20180828043642.14890-1-govinds@codeaurora.org>
References: <20180828043642.14890-1-govinds@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 target uses separate htc service for pktlog.
Add pktlog service request and support for pktlog
rx path handling.

Testing:
    Tested on WCN3990 and QCA6174 HW.
    Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1,
               WLAN.RM.4.4.1-00109-QCARMSWPZ-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htc.c  | 63 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 13 +++++-
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 8902720b4e49..ff91061cb3a9 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -803,8 +803,11 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 						ep->service_id,
 						&ep->ul_pipe_id,
 						&ep->dl_pipe_id);
-	if (status)
+	if (status) {
+		ath10k_warn(ar, "unsupported HTC service id: %d\n",
+			    ep->service_id);
 		return status;
+	}
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "boot htc service '%s' ul pipe %d dl pipe %d eid %d ready\n",
@@ -838,6 +841,56 @@ struct sk_buff *ath10k_htc_alloc_skb(struct ath10k *ar, int size)
 	return skb;
 }
 
+static void ath10k_htc_pktlog_process_rx(struct ath10k *ar, struct sk_buff *skb)
+{
+	trace_ath10k_htt_pktlog(ar, skb->data, skb->len);
+	dev_kfree_skb_any(skb);
+}
+
+static int ath10k_htc_pktlog_connect(struct ath10k *ar)
+{
+	struct ath10k_htc_svc_conn_resp conn_resp;
+	struct ath10k_htc_svc_conn_req conn_req;
+	int status;
+
+	memset(&conn_req, 0, sizeof(conn_req));
+	memset(&conn_resp, 0, sizeof(conn_resp));
+
+	conn_req.ep_ops.ep_tx_complete = NULL;
+	conn_req.ep_ops.ep_rx_complete = ath10k_htc_pktlog_process_rx;
+	conn_req.ep_ops.ep_tx_credits = NULL;
+
+	/* connect to control service */
+	conn_req.service_id = ATH10K_HTC_SVC_ID_HTT_LOG_MSG;
+	status = ath10k_htc_connect_service(&ar->htc, &conn_req, &conn_resp);
+	if (status) {
+		ath10k_warn(ar, "failed to connect to PKTLOG service: %d\n",
+			    status);
+		return status;
+	}
+
+	return 0;
+}
+
+bool ath10k_htc_pktlog_svc_supported(struct ath10k *ar)
+{
+	u8 ul_pipe_id;
+	u8 dl_pipe_id;
+	int status;
+
+	status = ath10k_hif_map_service_to_pipe(ar, ATH10K_HTC_SVC_ID_HTT_LOG_MSG,
+						&ul_pipe_id,
+						&dl_pipe_id);
+	if (status) {
+		ath10k_warn(ar, "unsupported HTC service id: %d\n",
+			    ATH10K_HTC_SVC_ID_HTT_LOG_MSG);
+
+		return false;
+	}
+
+	return true;
+}
+
 int ath10k_htc_start(struct ath10k_htc *htc)
 {
 	struct ath10k *ar = htc->ar;
@@ -871,6 +924,14 @@ int ath10k_htc_start(struct ath10k_htc *htc)
 		return status;
 	}
 
+	if (ath10k_htc_pktlog_svc_supported(ar)) {
+		status = ath10k_htc_pktlog_connect(ar);
+		if (status) {
+			ath10k_err(ar, "failed to connect to pktlog: %d\n", status);
+			return status;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 62fb16a4fa63..8816bcbaebad 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1839,7 +1839,7 @@ int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar, u16 service_id,
 		}
 	}
 
-	if (WARN_ON(!ul_set || !dl_set))
+	if (!ul_set || !dl_set)
 		return -ENOENT;
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index e9a6b3dc0c11..5a9c8faaed0e 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -62,6 +62,7 @@ static void ath10k_snoc_htt_tx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_snoc_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_snoc_htt_rx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_snoc_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
+static void ath10k_snoc_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
 
 static const struct ath10k_snoc_drv_priv drv_priv = {
 	.hw_rev = ATH10K_HW_WCN3990,
@@ -237,7 +238,7 @@ static struct ce_attr host_ce_config_wlan[] = {
 		.src_nentries = 0,
 		.src_sz_max = 2048,
 		.dest_nentries = 512,
-		.recv_cb = ath10k_snoc_htt_htc_rx_cb,
+		.recv_cb = ath10k_snoc_pktlog_rx_cb,
 	},
 };
 
@@ -624,6 +625,14 @@ static void ath10k_snoc_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state)
 	ath10k_snoc_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
 }
 
+/* Called by lower (CE) layer when data is received from the Target.
+ * WCN3990 firmware uses separate CE(CE11) to transfer pktlog data.
+ */
+static void ath10k_snoc_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state)
+{
+	ath10k_snoc_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
+}
+
 static void ath10k_snoc_htt_rx_deliver(struct ath10k *ar, struct sk_buff *skb)
 {
 	skb_pull(skb, sizeof(struct ath10k_htc_hdr));
@@ -804,7 +813,7 @@ static int ath10k_snoc_hif_map_service_to_pipe(struct ath10k *ar,
 		}
 	}
 
-	if (WARN_ON(!ul_set || !dl_set))
+	if (!ul_set || !dl_set)
 		return -ENOENT;
 
 	return 0;
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
