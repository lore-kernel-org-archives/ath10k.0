Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x233.google.com ([2a00:1450:4013:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WktIZ-000840-75
 for ath10k@lists.infradead.org; Thu, 15 May 2014 10:54:04 +0000
Received: by mail-ee0-f51.google.com with SMTP id e51so527320eek.38
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 03:53:39 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 1/2] ath10k: add implementation for configure max amsdu, ampdu
Date: Thu, 15 May 2014 12:53:05 +0200
Message-Id: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, while1eq1@gmail.com, markaswift@gmail.com

Allow to setup maximum subframes for AMSDU and AMPDU aggregation.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
Please check this patches, if help when MacBook Pro Retina used.

 drivers/net/wireless/ath/ath10k/htt.h    |   15 +++++-----
 drivers/net/wireless/ath/ath10k/htt_tx.c |   44 ++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 645a563..3ad0e09 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -240,16 +240,14 @@ struct htt_oob_sync_req {
 	__le16 rsvd0;
 } __packed;
 
-#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_MASK 0x1F
-#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_LSB  0
+#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_MASK 0x1F00
+#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_LSB  8
+#define HTT_AGGR_CONF_MAX_NUM_AMPDU_SUBFRAMES_MASK 0xFF
+#define HTT_AGGR_CONF_MAX_NUM_AMPDU_SUBFRAMES_LSB  0
 
 struct htt_aggr_conf {
 	u8 max_num_ampdu_subframes;
-	union {
-		/* dont use bitfields; undefined behaviour */
-		u8 flags; /* see %HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_ */
-		u8 max_num_amsdu_subframes:5;
-	} __packed;
+	u8 max_num_amsdu_subframes;
 } __packed;
 
 #define HTT_MGMT_FRM_HDR_DOWNLOAD_LEN 32
@@ -1341,6 +1339,9 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt);
 int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie);
 int ath10k_htt_send_rx_ring_cfg_ll(struct ath10k_htt *htt);
+int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
+				u8 max_subfrms_ampdu,
+				u8 max_subfrms_amsdu);
 
 void __ath10k_htt_tx_dec_pending(struct ath10k_htt *htt);
 int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 7a3e2e4..c3ec9d1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -307,6 +307,50 @@ int ath10k_htt_send_rx_ring_cfg_ll(struct ath10k_htt *htt)
 	return 0;
 }
 
+int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
+				u8 max_subfrms_ampdu,
+				u8 max_subfrms_amsdu)
+{
+	struct htt_aggr_conf *aggr_conf;
+	struct sk_buff *skb;
+	struct htt_cmd *cmd;
+	int len = 0;
+	int ret;
+
+	/* By default FW setup amsdu = 3 and ampdu = 64 */
+	if (max_subfrms_ampdu == 0 || max_subfrms_ampdu > 64)
+		return -EINVAL;
+	if (max_subfrms_amsdu == 0 || max_subfrms_amsdu > 31)
+		return -EINVAL;
+
+	len += sizeof(cmd->hdr);
+	len += sizeof(cmd->aggr_conf);
+
+	skb = ath10k_htc_alloc_skb(len);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put(skb, len);
+	cmd = (struct htt_cmd *)skb->data;
+	cmd->hdr.msg_type = HTT_H2T_MSG_TYPE_AGGR_CFG;
+
+	aggr_conf = &cmd->aggr_conf;
+	aggr_conf->max_num_ampdu_subframes = max_subfrms_ampdu;
+	aggr_conf->max_num_amsdu_subframes = max_subfrms_amsdu;
+
+	ath10k_dbg(ATH10K_DBG_HTT, "htt h2t aggr cfg msg ampdu %d, amsdu %d",
+		   aggr_conf->max_num_ampdu_subframes,
+		   aggr_conf->max_num_ampdu_subframes);
+
+	ret = ath10k_htc_send(&htt->ar->htc, htt->eid, skb);
+	if (ret) {
+		dev_kfree_skb_any(skb);
+		return ret;
+	}
+
+	return 0;
+}
+
 int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 {
 	struct device *dev = htt->ar->dev;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
