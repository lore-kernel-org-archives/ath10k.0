Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jospP-0000Lm-7f
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 18:11:56 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Pause the tx queues when firmware is down
Date: Fri, 26 Jun 2020 23:41:39 +0530
Message-Id: <1593195100-24654-2-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593195100-24654-1-git-send-email-pillair@codeaurora.org>
References: <1593195100-24654-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

When the FW goes down, the transmission of
packets cannot be done. Currently we are not
pausing the tx queues, hence there will be too
many attempts to trasmit packets and each of
them resulting in failure and thereby logging
unwanted failure messages onto the console,
as shown below

[   60.842192] ath10k_snoc 18800000.wifi: failed to transmit packet, dropping: -108
[   60.850181] ath10k_snoc 18800000.wifi: failed to submit frame: -108
[   60.857058] ath10k_snoc 18800000.wifi: failed to push frame: -108
[   60.936217] ath10k_snoc 18800000.wifi: failed to transmit packet, dropping: -108
[   60.944496] ath10k_snoc 18800000.wifi: failed to submit frame: -108
[   60.951265] ath10k_snoc 18800000.wifi: failed to push frame: -108
[   61.976589] ath10k_snoc 18800000.wifi: failed to transmit packet, dropping: -108

Stop the tx queues when the wlan firmware is
down and also remove the unwanted duplicate/extra
logging in the packet transmission path.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 18 ++++++++++--------
 drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 62b1502..040053a 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -900,6 +900,7 @@ static inline const char *ath10k_scan_state_str(enum ath10k_scan_state state)
 
 enum ath10k_tx_pause_reason {
 	ATH10K_TX_PAUSE_Q_FULL,
+	ATH10K_TX_PAUSE_FW_DOWN,
 	ATH10K_TX_PAUSE_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3e38962..dc7befc 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3348,6 +3348,7 @@ void ath10k_mac_tx_lock(struct ath10k *ar, int reason)
 	ar->tx_paused |= BIT(reason);
 	ieee80211_stop_queues(ar->hw);
 }
+EXPORT_SYMBOL(ath10k_mac_tx_lock);
 
 static void ath10k_mac_tx_unlock_iter(void *data, u8 *mac,
 				      struct ieee80211_vif *vif)
@@ -3378,6 +3379,7 @@ void ath10k_mac_tx_unlock(struct ath10k *ar, int reason)
 
 	ieee80211_wake_queue(ar->hw, ar->hw->offchannel_tx_hw_queue);
 }
+EXPORT_SYMBOL(ath10k_mac_tx_unlock);
 
 void ath10k_mac_vif_tx_lock(struct ath10k_vif *arvif, int reason)
 {
@@ -3748,11 +3750,8 @@ static int ath10k_mac_tx_submit(struct ath10k *ar,
 		break;
 	}
 
-	if (ret) {
-		ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
-			    ret);
+	if (ret)
 		ieee80211_free_txskb(ar->hw, skb);
-	}
 
 	return ret;
 }
@@ -3806,10 +3805,8 @@ static int ath10k_mac_tx(struct ath10k *ar,
 	}
 
 	ret = ath10k_mac_tx_submit(ar, txmode, txpath, skb);
-	if (ret) {
-		ath10k_warn(ar, "failed to submit frame: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
@@ -4441,7 +4438,12 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 
 	ret = ath10k_mac_tx(ar, vif, txmode, txpath, skb, false);
 	if (ret) {
-		ath10k_warn(ar, "failed to transmit frame: %d\n", ret);
+		if (ret == -ESHUTDOWN)
+			ath10k_dbg(ar, ATH10K_DBG_MAC, "failed to transmit frame: %d\n",
+				   ret);
+		else
+			ath10k_warn(ar, "failed to transmit frame: %d\n", ret);
+
 		if (is_htt) {
 			spin_lock_bh(&ar->htt.tx_lock);
 			ath10k_htt_tx_dec_pending(htt);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 407a074..8440e64 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -20,6 +20,7 @@
 #include "hif.h"
 #include "htc.h"
 #include "snoc.h"
+#include "mac.h"
 
 #define ATH10K_SNOC_RX_POST_RETRY_MS 50
 #define CE_POLL_PIPE 4
@@ -1296,6 +1297,7 @@ int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
 	switch (type) {
 	case ATH10K_QMI_EVENT_FW_READY_IND:
 		if (test_bit(ATH10K_SNOC_FLAG_REGISTERED, &ar_snoc->flags)) {
+			ath10k_mac_tx_unlock(ar, ATH10K_TX_PAUSE_FW_DOWN);
 			queue_work(ar->workqueue, &ar->restart_work);
 			break;
 		}
@@ -1313,6 +1315,7 @@ int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
 	case ATH10K_QMI_EVENT_FW_DOWN_IND:
 		set_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);
 		set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+		ath10k_mac_tx_lock(ar, ATH10K_TX_PAUSE_FW_DOWN);
 		break;
 	default:
 		ath10k_err(ar, "invalid fw indication: %llx\n", type);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
