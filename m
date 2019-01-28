Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9GC-0007M6-6r
 for ath10k@lists.infradead.org; Mon, 28 Jan 2019 15:55:46 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 242/304] ath10k: fix tx_stats memory leak
Date: Mon, 28 Jan 2019 10:42:39 -0500
Message-Id: <20190128154341.47195-242-sashal@kernel.org>
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Zhi Chen <zhichen@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Zhi Chen <zhichen@codeaurora.org>

[ Upstream commit 386f97e3b201d18578abb0e7037b85a1ae50c0a3 ]

Memory of tx_stats was allocated when a STA was added. But it's not freed
if the STA failed to be added to driver. This issue could be seen in MDK3
attack case when STA number reached the limit.

Tested: QCA9984 with firmware ver 10.4-3.9.0.1-00005
Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6436dc229be5..400495858e4e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6293,15 +6293,6 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			   ar->num_stations + 1, ar->max_num_stations,
 			   ar->num_peers + 1, ar->max_num_peers);
 
-		if (ath10k_debug_is_extd_tx_stats_enabled(ar)) {
-			arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats),
-						  GFP_KERNEL);
-			if (!arsta->tx_stats) {
-				ret = -ENOMEM;
-				goto exit;
-			}
-		}
-
 		num_tdls_stations = ath10k_mac_tdls_vif_stations_count(hw, vif);
 		num_tdls_vifs = ath10k_mac_tdls_vifs_count(hw);
 
@@ -6323,12 +6314,22 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			goto exit;
 		}
 
+		if (ath10k_debug_is_extd_tx_stats_enabled(ar)) {
+			arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats),
+						  GFP_KERNEL);
+			if (!arsta->tx_stats) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+		}
+
 		ret = ath10k_peer_create(ar, vif, sta, arvif->vdev_id,
 					 sta->addr, peer_type);
 		if (ret) {
 			ath10k_warn(ar, "failed to add peer %pM for vdev %d when adding a new sta: %i\n",
 				    sta->addr, arvif->vdev_id, ret);
 			ath10k_mac_dec_num_stations(arvif, sta);
+			kfree(arsta->tx_stats);
 			goto exit;
 		}
 
@@ -6341,6 +6342,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			spin_unlock_bh(&ar->data_lock);
 			ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
 			ath10k_mac_dec_num_stations(arvif, sta);
+			kfree(arsta->tx_stats);
 			ret = -ENOENT;
 			goto exit;
 		}
@@ -6361,6 +6363,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			ath10k_peer_delete(ar, arvif->vdev_id,
 					   sta->addr);
 			ath10k_mac_dec_num_stations(arvif, sta);
+			kfree(arsta->tx_stats);
 			goto exit;
 		}
 
@@ -6372,6 +6375,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 				    sta->addr, arvif->vdev_id, ret);
 			ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
 			ath10k_mac_dec_num_stations(arvif, sta);
+			kfree(arsta->tx_stats);
 
 			if (num_tdls_stations != 0)
 				goto exit;
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
