Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL8Ta-00020v-OG
 for ath10k@lists.infradead.org; Wed, 05 Mar 2014 09:50:59 +0000
Received: by mail-pa0-f50.google.com with SMTP id kq14so882066pab.9
 for <ath10k@lists.infradead.org>; Wed, 05 Mar 2014 01:50:37 -0800 (PST)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: allow the supported rate change by reassociate peer
Date: Wed,  5 Mar 2014 17:50:26 +0800
Message-Id: <1394013026-8426-1-git-send-email-yeohchunyeow@gmail.com>
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
To: linux-wireless@vger.kernel.org
Cc: kvalo@qca.qualcomm.com, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, ath10k@lists.infradead.org

IBSS mode requires the changing of supported rate. Do this
by reassociate the peer. The investigation shows that if move
from legacy to HT, the rate control won't work after changing
the supported rate. But once changing the supported rate to HT,
user can assign the TxRate in HT mode.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   24 +++++++++++++-----------
 drivers/net/wireless/ath/ath10k/wmi.c |    5 +++--
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 511a2f8..9ad1869 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1524,7 +1524,7 @@ static void ath10k_bss_disassoc(struct ieee80211_hw *hw,
 }
 
 static int ath10k_station_assoc(struct ath10k *ar, struct ath10k_vif *arvif,
-				struct ieee80211_sta *sta)
+				struct ieee80211_sta *sta, bool reassoc)
 {
 	struct wmi_peer_assoc_complete_arg peer_arg;
 	int ret = 0;
@@ -1538,6 +1538,7 @@ static int ath10k_station_assoc(struct ath10k *ar, struct ath10k_vif *arvif,
 		return ret;
 	}
 
+	peer_arg.peer_reassoc = reassoc;
 	ret = ath10k_wmi_peer_assoc(ar, &peer_arg);
 	if (ret) {
 		ath10k_warn("Peer assoc failed for STA %pM vdev %i: %d\n",
@@ -3195,6 +3196,16 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 				    sta->addr, smps, err);
 	}
 
+	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED) {
+		ath10k_dbg(ATH10K_DBG_MAC, "mac update sta %pM supp rates\n",
+			   sta->addr);
+
+		err = ath10k_station_assoc(ar, arvif, sta, true);
+		if (err)
+			ath10k_warn("Failed to reassociate station: %pM\n",
+				    sta->addr);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
@@ -3275,7 +3286,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		ath10k_dbg(ATH10K_DBG_MAC, "mac sta %pM associated\n",
 			   sta->addr);
 
-		ret = ath10k_station_assoc(ar, arvif, sta);
+		ret = ath10k_station_assoc(ar, arvif, sta, false);
 		if (ret)
 			ath10k_warn("Failed to associate station %pM for vdev %i: %i\n",
 				    sta->addr, arvif->vdev_id, ret);
@@ -4108,15 +4119,6 @@ static void ath10k_sta_rc_update(struct ieee80211_hw *hw,
 		arsta->smps = smps;
 	}
 
-	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED) {
-		/* FIXME: Not implemented. Probably the only way to do it would
-		 * be to re-assoc the peer. */
-		changed &= ~IEEE80211_RC_SUPP_RATES_CHANGED;
-		ath10k_dbg(ATH10K_DBG_MAC,
-			   "mac sta rc update for %pM: changing supported rates not implemented\n",
-			   sta->addr);
-	}
-
 	arsta->changed |= changed;
 
 	spin_unlock_bh(&ar->data_lock);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 478e7f6..efb0cf2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3457,8 +3457,9 @@ int ath10k_wmi_peer_assoc(struct ath10k *ar,
 		__cpu_to_le32(arg->peer_vht_rates.tx_mcs_set);
 
 	ath10k_dbg(ATH10K_DBG_WMI,
-		   "wmi peer assoc vdev %d addr %pM\n",
-		   arg->vdev_id, arg->addr);
+		   "wmi peer assoc vdev %d addr %pM (%s)\n",
+		   arg->vdev_id, arg->addr,
+		   arg->peer_reassoc ? "reassociate" : "new");
 	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->peer_assoc_cmdid);
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
