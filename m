Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHQ10-0003RC-Hu
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 05:22:55 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH] ath10k: Extend struct htt_mgmt_tx_dec for qca99x0
Date: Tue, 21 Jul 2015 10:52:00 +0530
Message-ID: <1437456121-7800-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

HTT_H2T_MSG_TYPE_MGMT_TX msg in 10.4 firmware carries additional
4 byte in htt_mgmt_tx_desc where it tells to firmware that at what
rate mgmt frame has to go out in the air. It's an optional parameter,
setting this field to zero will force firmware to choose auto rate
and send the frame out.

Those 4 byte info is missed out in the current code and 10.4 firmware
ended up reading some junk in those 4 byte and sometime malfunctioning.

Fix it by adding 4 byte in struct htt_mgmt_tx_desc. Non 10.4 firmware
will not process those four byte. So, adding 4 byte at the end of
struct htt_mgmt_tx_desc will not create any impact on other chipset.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    | 6 ++++++
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 8bdf1e7..d4b6415 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -260,6 +260,9 @@ struct htt_aggr_conf {
 } __packed;
 
 #define HTT_MGMT_FRM_HDR_DOWNLOAD_LEN 32
+struct htt_mgmt_tx_desc_qca99x0 {
+	__le32 rate;
+} __packed;
 
 struct htt_mgmt_tx_desc {
 	u8 pad[sizeof(u32) - sizeof(struct htt_cmd_hdr)];
@@ -268,6 +271,9 @@ struct htt_mgmt_tx_desc {
 	__le32 len;
 	__le32 vdev_id;
 	u8 hdr[HTT_MGMT_FRM_HDR_DOWNLOAD_LEN];
+	union {
+		struct htt_mgmt_tx_desc_qca99x0 qca99x0;
+	} __packed;
 } __packed;
 
 enum htt_mgmt_tx_status {
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 148d5b6..73b0c42 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -448,6 +448,8 @@ int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 
 	skb_put(txdesc, len);
 	cmd = (struct htt_cmd *)txdesc->data;
+	memset(cmd, 0, len);
+
 	cmd->hdr.msg_type         = HTT_H2T_MSG_TYPE_MGMT_TX;
 	cmd->mgmt_tx.msdu_paddr = __cpu_to_le32(ATH10K_SKB_CB(msdu)->paddr);
 	cmd->mgmt_tx.len        = __cpu_to_le32(msdu->len);
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
