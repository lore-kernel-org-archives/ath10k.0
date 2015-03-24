Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaOhp-0006bl-DY
 for ath10k@lists.infradead.org; Tue, 24 Mar 2015 13:17:18 +0000
Received: by lagg8 with SMTP id g8so159146132lag.1
 for <ath10k@lists.infradead.org>; Tue, 24 Mar 2015 06:16:54 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix IBSS scanning on wmi-tlv and qca6174
Date: Tue, 24 Mar 2015 13:14:03 +0000
Message-Id: <1427202843-9172-1-git-send-email-michal.kazior@tieto.com>
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

WLAN.RM.2.0-00073 firmware requires self-peer to
be created prior to issuing scan command. Without
this wmi-tlv with qca6174 firmware crashes after
submitting a scan request.

Creating the peer as soon as add_interface()
shouldn't be a problem.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    (based on pending branch)

 drivers/net/wireless/ath/ath10k/mac.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5f9705deb430..4646837c7f8e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1400,11 +1400,6 @@ static void ath10k_control_ibss(struct ath10k_vif *arvif,
 	lockdep_assert_held(&arvif->ar->conf_mutex);
 
 	if (!info->ibss_joined) {
-		ret = ath10k_peer_delete(arvif->ar, arvif->vdev_id, self_peer);
-		if (ret)
-			ath10k_warn(ar, "failed to delete IBSS self peer %pM for vdev %d: %d\n",
-				    self_peer, arvif->vdev_id, ret);
-
 		if (is_zero_ether_addr(arvif->bssid))
 			return;
 
@@ -1413,14 +1408,6 @@ static void ath10k_control_ibss(struct ath10k_vif *arvif,
 		return;
 	}
 
-	ret = ath10k_peer_create(arvif->ar, arvif->vdev_id, self_peer,
-				 WMI_PEER_TYPE_DEFAULT);
-	if (ret) {
-		ath10k_warn(ar, "failed to create IBSS self peer %pM for vdev %d: %d\n",
-			    self_peer, arvif->vdev_id, ret);
-		return;
-	}
-
 	vdev_param = arvif->ar->wmi.vdev_param->atim_window;
 	ret = ath10k_wmi_vdev_set_param(arvif->ar, arvif->vdev_id, vdev_param,
 					ATH10K_DEFAULT_ATIM);
@@ -3815,15 +3802,18 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
+	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
 		ret = ath10k_peer_create(ar, arvif->vdev_id, vif->addr,
 					 WMI_PEER_TYPE_DEFAULT);
 		if (ret) {
-			ath10k_warn(ar, "failed to create vdev %i peer for AP: %d\n",
+			ath10k_warn(ar, "failed to create vdev %i peer for AP/IBSS: %d\n",
 				    arvif->vdev_id, ret);
 			goto err_vdev_delete;
 		}
+	}
 
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath10k_mac_set_kickout(arvif);
 		if (ret) {
 			ath10k_warn(ar, "failed to set vdev %i kickout parameters: %d\n",
@@ -3883,7 +3873,8 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	return 0;
 
 err_peer_delete:
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP)
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
+	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS)
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 
 err_vdev_delete:
@@ -3927,11 +3918,12 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
 	list_del(&arvif->list);
 
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
+	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)
-			ath10k_warn(ar, "failed to submit AP self-peer removal on vdev %i: %d\n",
+			ath10k_warn(ar, "failed to submit AP/IBSS self-peer removal on vdev %i: %d\n",
 				    arvif->vdev_id, ret);
 
 		kfree(arvif->u.ap.noa_data);
@@ -3948,7 +3940,8 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	/* Some firmware revisions don't notify host about self-peer removal
 	 * until after associated vdev is deleted.
 	 */
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
+	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
 		ret = ath10k_wait_for_peer_deleted(ar, arvif->vdev_id,
 						   vif->addr);
 		if (ret)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
