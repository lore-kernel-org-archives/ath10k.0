Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1oO5-0006Vd-9u
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 06:51:44 +0000
From: <mpubbise@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: handle tdls peer events
Date: Tue, 10 Oct 2017 12:20:02 +0530
Message-ID: <1507618202-25473-3-git-send-email-mpubbise@qti.qualcomm.com>
In-Reply-To: <1507618202-25473-1-git-send-email-mpubbise@qti.qualcomm.com>
References: <1507618202-25473-1-git-send-email-mpubbise@qti.qualcomm.com>
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
Cc: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>

Handle tdls peer events from the target. TDLS events for the peer
could be discover, teardown, etc. As of now, adding the logic to
handle tdls teardown events alone.

Teardown due to peer traffic indication(PTR) timeout is one such
teardown event from the target.

Tested this change on QCA9888 with 10.4-3.5.1-00018 fw version.

Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |   59 +++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 38a9708..344f19c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -29,6 +29,7 @@
 #include "p2p.h"
 #include "hw.h"
 #include "hif.h"
+#include "txrx.h"
 
 #define ATH10K_WMI_BARRIER_ECHO_ID 0xBA991E9
 #define ATH10K_WMI_BARRIER_TIMEOUT_HZ (3 * HZ)
@@ -4456,6 +4457,61 @@ void ath10k_wmi_event_pdev_tpc_config(struct ath10k *ar, struct sk_buff *skb)
 		   __le32_to_cpu(ev->rate_max));
 }
 
+void ath10k_wmi_handle_tdls_peer_event(struct ath10k *ar, struct sk_buff *skb)
+{
+	struct wmi_tdls_peer_event *ev;
+	struct ath10k_peer *peer;
+	struct ath10k_vif *arvif;
+	u8 reason;
+
+	ev = (struct wmi_tdls_peer_event *)skb->data;
+
+	spin_lock_bh(&ar->data_lock);
+	peer = ath10k_peer_find(ar, ev->vdev_id, ev->peer_macaddr.addr);
+	spin_unlock_bh(&ar->data_lock);
+
+	if (!peer) {
+		ath10k_warn(ar, "failed to find peer entry for %pM\n",
+			    ev->peer_macaddr.addr);
+		return;
+	}
+
+	switch (ev->peer_status) {
+	case WMI_TDLS_SHOULD_TEARDOWN:
+		switch (ev->peer_reason) {
+		case WMI_TDLS_TEARDOWN_REASON_PTR_TIMEOUT:
+		case WMI_TDLS_TEARDOWN_REASON_NO_RESPONSE:
+		case WMI_TDLS_TEARDOWN_REASON_RSSI:
+			reason = WLAN_REASON_TDLS_TEARDOWN_UNREACHABLE;
+			break;
+		default:
+			reason = WLAN_REASON_TDLS_TEARDOWN_UNSPECIFIED;
+			break;
+		}
+
+		arvif = ath10k_get_arvif(ar, ev->vdev_id);
+		if (!arvif) {
+			ath10k_warn(ar, "received tdls peer event for invalid vdev id %u\n",
+				    ev->vdev_id);
+			return;
+		}
+
+		ieee80211_tdls_oper_request(arvif->vif, ev->peer_macaddr.addr,
+					    NL80211_TDLS_TEARDOWN, reason,
+					    GFP_ATOMIC);
+
+		ath10k_dbg(ar, ATH10K_DBG_WMI,
+			   "received tdls teardown event for peer %pM reason %u\n",
+			   ev->peer_macaddr.addr, ev->peer_reason);
+		break;
+	default:
+		ath10k_dbg(ar, ATH10K_DBG_WMI,
+			   "received unknown tdls peer event %u\n",
+			   ev->peer_status);
+		break;
+	}
+}
+
 void ath10k_wmi_event_pdev_ftm_intg(struct ath10k *ar, struct sk_buff *skb)
 {
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_PDEV_FTM_INTG_EVENTID\n");
@@ -5477,6 +5533,9 @@ static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_10_4_PDEV_TPC_CONFIG_EVENTID:
 		ath10k_wmi_event_pdev_tpc_config(ar, skb);
 		break;
+	case WMI_10_4_TDLS_PEER_EVENTID:
+		ath10k_wmi_handle_tdls_peer_event(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
