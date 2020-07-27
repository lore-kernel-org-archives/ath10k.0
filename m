Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k08rN-0005Yz-CN
 for ath10k@lists.infradead.org; Mon, 27 Jul 2020 19:32:30 +0000
Date: Mon, 27 Jul 2020 14:38:21 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] ath10k: Use fallthrough pseudo-keyword
Message-ID: <20200727193821.GA981@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath10k/core.c   |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c |  2 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  6 +++---
 drivers/net/wireless/ath/ath10k/mac.c    | 18 +++++++++---------
 drivers/net/wireless/ath/ath10k/wow.c    |  2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 340ce327ac14..8afb1d5fc9b5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2320,7 +2320,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		break;
 	case ATH10K_STATE_RESTARTED:
 		ar->state = ATH10K_STATE_WEDGED;
-		/* fall through */
+		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index d787cbead56a..56e227f2e096 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3017,7 +3017,7 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 			ath10k_htt_rx_h_enqueue(ar, &amsdu, status);
 			break;
 		case -EAGAIN:
-			/* fall through */
+			fallthrough;
 		default:
 			/* Should not happen. */
 			ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index bbe869575855..1fc0a312ab58 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1314,7 +1314,7 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	case ATH10K_HW_TXRX_RAW:
 	case ATH10K_HW_TXRX_NATIVE_WIFI:
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
-		/* fall through */
+		fallthrough;
 	case ATH10K_HW_TXRX_ETHERNET:
 		flags0 |= SM(txmode, HTT_DATA_TX_DESC_FLAGS0_PKT_TYPE);
 		break;
@@ -1460,7 +1460,7 @@ static int ath10k_htt_tx_32(struct ath10k_htt *htt,
 	case ATH10K_HW_TXRX_RAW:
 	case ATH10K_HW_TXRX_NATIVE_WIFI:
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
-		/* fall through */
+		fallthrough;
 	case ATH10K_HW_TXRX_ETHERNET:
 		if (ar->hw_params.continuous_frag_desc) {
 			ext_desc_t = htt->frag_desc.vaddr_desc_32;
@@ -1662,7 +1662,7 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 	case ATH10K_HW_TXRX_RAW:
 	case ATH10K_HW_TXRX_NATIVE_WIFI:
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
-		/* fall through */
+		fallthrough;
 	case ATH10K_HW_TXRX_ETHERNET:
 		if (ar->hw_params.continuous_frag_desc) {
 			ext_desc_t = htt->frag_desc.vaddr_desc_64;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 919d15584d4a..7dd2b019f673 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2473,17 +2473,17 @@ ath10k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 			idx_limit = -1;
 
 		switch (idx_limit) {
-		case 0: /* fall through */
-		case 1: /* fall through */
-		case 2: /* fall through */
-		case 3: /* fall through */
-		case 4: /* fall through */
-		case 5: /* fall through */
-		case 6: /* fall through */
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 5:
+		case 6:
 		default:
 			/* see ath10k_mac_can_set_bitrate_mask() */
 			WARN_ON(1);
-			/* fall through */
+			fallthrough;
 		case -1:
 			mcs = IEEE80211_VHT_MCS_NOT_SUPPORTED;
 			break;
@@ -4243,7 +4243,7 @@ void __ath10k_scan_finish(struct ath10k *ar)
 		} else if (ar->scan.roc_notify) {
 			ieee80211_remain_on_channel_expired(ar->hw);
 		}
-		/* fall through */
+		fallthrough;
 	case ATH10K_SCAN_STARTING:
 		ar->scan.state = ATH10K_SCAN_IDLE;
 		ar->scan_channel = NULL;
diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index 8c26adddd034..7d65c115669f 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -275,7 +275,7 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_vif *arvif,
 	switch (arvif->vdev_type) {
 	case WMI_VDEV_TYPE_IBSS:
 		__set_bit(WOW_BEACON_EVENT, &wow_mask);
-		 /* fall through */
+		fallthrough;
 	case WMI_VDEV_TYPE_AP:
 		__set_bit(WOW_DEAUTH_RECVD_EVENT, &wow_mask);
 		__set_bit(WOW_DISASSOC_RECVD_EVENT, &wow_mask);
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
