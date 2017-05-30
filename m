Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFoEC-0007xe-Do
 for ath10k@lists.infradead.org; Tue, 30 May 2017 20:58:58 +0000
From: <ryanhsu@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix the logic of limiting tdls peer counts
Date: Tue, 30 May 2017 13:58:29 -0700
Message-ID: <1496177909-5579-1-git-send-email-ryanhsu@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qti.qualcomm.com, kaliu@qti.qualcomm.com, yintang@qti.qualcomm.com

From: Ryan Hsu <ryanhsu@qti.qualcomm.com>

The original idea is to limit the maximum TDLS peer link, but the logic
is always false, and never be able to restrict the number of TDLS peer
creation.

Fix the logic here and also move the checking earlier, so that it could
avoid to handle the failure case, e.g disable the tdls peer, delete the
peer and also vdev count cleanup.

Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 49 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4674ff3..48418f9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6073,6 +6073,20 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			   ar->num_stations + 1, ar->max_num_stations,
 			   ar->num_peers + 1, ar->max_num_peers);
 
+		num_tdls_stations = ath10k_mac_tdls_vif_stations_count(hw, vif);
+		num_tdls_vifs = ath10k_mac_tdls_vifs_count(hw);
+
+		if (sta->tdls) {
+			if (num_tdls_stations >= ar->max_num_tdls_vdevs) {
+				ath10k_warn(ar, "vdev %i exceeded maximum number of tdls vdevs %i\n",
+					    arvif->vdev_id,
+					    ar->max_num_tdls_vdevs);
+				ret = -ELNRNG;
+				goto exit;
+			}
+			peer_type = WMI_PEER_TYPE_TDLS;
+		}
+
 		ret = ath10k_mac_inc_num_stations(arvif, sta);
 		if (ret) {
 			ath10k_warn(ar, "refusing to associate station: too many connected already (%d)\n",
@@ -6080,9 +6094,6 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			goto exit;
 		}
 
-		if (sta->tdls)
-			peer_type = WMI_PEER_TYPE_TDLS;
-
 		ret = ath10k_peer_create(ar, vif, sta, arvif->vdev_id,
 					 sta->addr, peer_type);
 		if (ret) {
@@ -6113,35 +6124,17 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		if (!sta->tdls)
 			goto exit;
 
-		num_tdls_stations = ath10k_mac_tdls_vif_stations_count(hw, vif);
-		num_tdls_vifs = ath10k_mac_tdls_vifs_count(hw);
-
-		if (num_tdls_vifs >= ar->max_num_tdls_vdevs &&
-		    num_tdls_stations == 0) {
-			ath10k_warn(ar, "vdev %i exceeded maximum number of tdls vdevs %i\n",
-				    arvif->vdev_id, ar->max_num_tdls_vdevs);
-			ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
+		ret = ath10k_wmi_update_fw_tdls_state(ar, arvif->vdev_id,
+						      WMI_TDLS_ENABLE_ACTIVE);
+		if (ret) {
+			ath10k_warn(ar, "failed to update fw tdls state on vdev %i: %i\n",
+				    arvif->vdev_id, ret);
+			ath10k_peer_delete(ar, arvif->vdev_id,
+					   sta->addr);
 			ath10k_mac_dec_num_stations(arvif, sta);
-			ret = -ENOBUFS;
 			goto exit;
 		}
 
-		if (num_tdls_stations == 0) {
-			/* This is the first tdls peer in current vif */
-			enum wmi_tdls_state state = WMI_TDLS_ENABLE_ACTIVE;
-
-			ret = ath10k_wmi_update_fw_tdls_state(ar, arvif->vdev_id,
-							      state);
-			if (ret) {
-				ath10k_warn(ar, "failed to update fw tdls state on vdev %i: %i\n",
-					    arvif->vdev_id, ret);
-				ath10k_peer_delete(ar, arvif->vdev_id,
-						   sta->addr);
-				ath10k_mac_dec_num_stations(arvif, sta);
-				goto exit;
-			}
-		}
-
 		ret = ath10k_mac_tdls_peer_update(ar, arvif->vdev_id, sta,
 						  WMI_TDLS_PEER_STATE_PEERING);
 		if (ret) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
