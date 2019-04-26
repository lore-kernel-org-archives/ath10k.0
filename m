Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJuXw-0007Y1-2G
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 06:41:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/5] ath10k: add handler for HTT_T2H_MSG_TYPE_SEC_IND event
Date: Fri, 26 Apr 2019 09:41:08 +0300
Message-Id: <1556260871-2919-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
References: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

From: Wen Gong <wgong@codeaurora.org>

Add the handler for HTT_T2H_MSG_TYPE_SEC_IND event from firmware, which stores
PN for replay check implemented in the following patch.

Tested on QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f22840bbc389..cc2875d73bf0 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3267,6 +3267,51 @@ static void ath10k_fetch_10_2_tx_stats(struct ath10k *ar, u8 *data)
 	rcu_read_unlock();
 }
 
+static int ath10k_htt_rx_pn_len(enum htt_security_types sec_type)
+{
+	switch (sec_type) {
+	case HTT_SECURITY_TKIP:
+	case HTT_SECURITY_TKIP_NOMIC:
+	case HTT_SECURITY_AES_CCMP:
+		return 48;
+	default:
+		return 0;
+	}
+}
+
+static void ath10k_htt_rx_sec_ind_handler(struct ath10k *ar,
+					  struct htt_security_indication *ev)
+{
+	enum htt_txrx_sec_cast_type sec_index;
+	enum htt_security_types sec_type;
+	struct ath10k_peer *peer;
+
+	spin_lock_bh(&ar->data_lock);
+
+	peer = ath10k_peer_find_by_id(ar, __le16_to_cpu(ev->peer_id));
+	if (!peer) {
+		ath10k_warn(ar, "failed to find peer id %d for security indication",
+			    __le16_to_cpu(ev->peer_id));
+		goto out;
+	}
+
+	sec_type = MS(ev->flags, HTT_SECURITY_TYPE);
+
+	if (ev->flags & HTT_SECURITY_IS_UNICAST)
+		sec_index = HTT_TXRX_SEC_UCAST;
+	else
+		sec_index = HTT_TXRX_SEC_MCAST;
+
+	peer->rx_pn[sec_index].sec_type = sec_type;
+	peer->rx_pn[sec_index].pn_len = ath10k_htt_rx_pn_len(sec_type);
+
+	memset(peer->tids_last_pn_valid, 0, sizeof(peer->tids_last_pn_valid));
+	memset(peer->tids_last_pn, 0, sizeof(peer->tids_last_pn));
+
+out:
+	spin_unlock_bh(&ar->data_lock);
+}
+
 bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct ath10k_htt *htt = &ar->htt;
@@ -3360,6 +3405,7 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		struct ath10k *ar = htt->ar;
 		struct htt_security_indication *ev = &resp->security_indication;
 
+		ath10k_htt_rx_sec_ind_handler(ar, ev);
 		ath10k_dbg(ar, ATH10K_DBG_HTT,
 			   "sec ind peer_id %d unicast %d type %d\n",
 			  __le16_to_cpu(ev->peer_id),
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
