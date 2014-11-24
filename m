Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsuuW-0006Ql-V3
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:46:41 +0000
Received: by mail-wi0-f176.google.com with SMTP id ex7so5904462wid.9
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 06:46:18 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: don't drop corrupted mgmt frames
Date: Mon, 24 Nov 2014 15:34:08 +0100
Message-Id: <1416839648-31803-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Some firmware revisions don't seem to deilver
management frames with FCS error via WMI so narrow
down the HTT rule to not drop corrupted management
frames.

This basically increases number of frames ath10k
reports while sniffing.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 13 +++++++++++--
 drivers/net/wireless/ath/ath10k/wmi.c    |  7 +++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 75b2293..85910b2 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1381,6 +1381,8 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
 {
 	struct sk_buff *msdu;
 	struct htt_rx_desc *rxd;
+	bool is_mgmt;
+	bool has_fcs_err;
 
 	msdu = skb_peek(amsdu);
 	rxd = (void *)msdu->data - sizeof(*rxd);
@@ -1394,12 +1396,19 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
 		return false;
 	}
 
+	is_mgmt = !!(rxd->attention.flags &
+		     __cpu_to_le32(RX_ATTENTION_FLAGS_MGMT_TYPE));
+	has_fcs_err = !!(rxd->attention.flags &
+			 __cpu_to_le32(RX_ATTENTION_FLAGS_FCS_ERR));
+
 	/* Management frames are handled via WMI events. The pros of such
 	 * approach is that channel is explicitly provided in WMI events
 	 * whereas HTT doesn't provide channel information for Rxed frames.
+	 *
+	 * However some firmware revisions don't report corrupted frames via
+	 * WMI so don't drop them.
 	 */
-	if (rxd->attention.flags &
-	    __cpu_to_le32(RX_ATTENTION_FLAGS_MGMT_TYPE)) {
+	if (is_mgmt && !has_fcs_err) {
 		ath10k_dbg(ar, ATH10K_DBG_HTT, "htt rx mgmt ctrl\n");
 		return false;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c2bc828..df948a4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1166,8 +1166,11 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 		return 0;
 	}
 
-	if (rx_status & WMI_RX_STATUS_ERR_CRC)
-		status->flag |= RX_FLAG_FAILED_FCS_CRC;
+	if (rx_status & WMI_RX_STATUS_ERR_CRC) {
+		dev_kfree_skb(skb);
+		return 0;
+	}
+
 	if (rx_status & WMI_RX_STATUS_ERR_MIC)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
