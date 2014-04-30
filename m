Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfZAV-0008M2-ME
 for ath10k@lists.infradead.org; Wed, 30 Apr 2014 18:23:44 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  improve vdev map handling.
Date: Wed, 30 Apr 2014 11:22:59 -0700
Message-Id: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

Check vdev map has space before calling ffs,
fix invalid cleanup in failure to create vdev
case.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

This is compile-tested only.

 drivers/net/wireless/ath/ath10k/mac.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e2c01dc..d461f05 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -594,14 +594,14 @@ static int ath10k_monitor_vdev_create(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	bit = ffs(ar->free_vdev_map);
-	if (bit == 0) {
+	if (!ar->free_vdev_map) {
 		ath10k_warn("failed to find free vdev id for monitor vdev\n");
 		return -ENOMEM;
 	}
 
+	bit = ffs(ar->free_vdev_map);
+
 	ar->monitor_vdev_id = bit - 1;
-	ar->free_vdev_map &= ~(1 << ar->monitor_vdev_id);
 
 	ret = ath10k_wmi_vdev_create(ar, ar->monitor_vdev_id,
 				     WMI_VDEV_TYPE_MONITOR,
@@ -609,20 +609,14 @@ static int ath10k_monitor_vdev_create(struct ath10k *ar)
 	if (ret) {
 		ath10k_warn("failed to request monitor vdev %i creation: %d\n",
 			    ar->monitor_vdev_id, ret);
-		goto vdev_fail;
+		return ret;
 	}
 
+	ar->free_vdev_map &= ~(1 << ar->monitor_vdev_id);
 	ath10k_dbg(ATH10K_DBG_MAC, "mac monitor vdev %d created\n",
 		   ar->monitor_vdev_id);
 
 	return 0;
-
-vdev_fail:
-	/*
-	 * Restore the ID to the global map.
-	 */
-	ar->free_vdev_map |= 1 << (ar->monitor_vdev_id);
-	return ret;
 }
 
 static int ath10k_monitor_vdev_delete(struct ath10k *ar)
@@ -638,7 +632,7 @@ static int ath10k_monitor_vdev_delete(struct ath10k *ar)
 		return ret;
 	}
 
-	ar->free_vdev_map |= 1 << (ar->monitor_vdev_id);
+	ar->free_vdev_map |= (1 << ar->monitor_vdev_id);
 
 	ath10k_dbg(ATH10K_DBG_MAC, "mac monitor vdev %d deleted\n",
 		   ar->monitor_vdev_id);
@@ -2622,11 +2616,12 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	INIT_WORK(&arvif->wep_key_work, ath10k_tx_wep_key_work);
 	INIT_LIST_HEAD(&arvif->list);
 
-	bit = ffs(ar->free_vdev_map);
-	if (bit == 0) {
+	if (!ar->free_vdev_map) {
+		ath10k_warn("Free vdev map is empty, no more interfaces allowed.\n");
 		ret = -EBUSY;
 		goto err;
 	}
+	bit = ffs(ar->free_vdev_map);
 
 	arvif->vdev_id = bit - 1;
 	arvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
@@ -2669,7 +2664,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err;
 	}
 
-	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
+	ar->free_vdev_map &= ~(1 << arvif->vdev_id);
 	list_add(&arvif->list, &ar->arvifs);
 
 	vdev_param = ar->wmi.vdev_param->def_keyid;
@@ -2762,7 +2757,7 @@ err_peer_delete:
 
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
-	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
+	ar->free_vdev_map |= (1 << arvif->vdev_id);
 	list_del(&arvif->list);
 
 err:
@@ -2792,7 +2787,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	}
 	spin_unlock_bh(&ar->data_lock);
 
-	ar->free_vdev_map |= 1 << (arvif->vdev_id);
+	ar->free_vdev_map |= (1 << arvif->vdev_id);
 	list_del(&arvif->list);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
