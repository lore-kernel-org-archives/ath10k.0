Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV2Yg-0003fm-6k
 for ath10k@lists.infradead.org; Fri, 19 Sep 2014 18:05:26 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/3] ath10k:  use 64-bit vdev map.
Date: Fri, 19 Sep 2014 11:04:48 -0700
Message-Id: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

This can allow more than 32 stations to be supported
without over-running the bitmap.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  4 ++--
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 21 ++++++++++++---------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index cee18c8..37e3166 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -846,9 +846,9 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 		goto err_hif_stop;
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
-		ar->free_vdev_map = (1 << TARGET_10X_NUM_VDEVS) - 1;
+		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS) - 1;
 	else
-		ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
+		ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;
 
 	INIT_LIST_HEAD(&ar->arvifs);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index fe531ea..20c5e40 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -482,7 +482,7 @@ struct ath10k {
 	/* current operating channel definition */
 	struct cfg80211_chan_def chandef;
 
-	int free_vdev_map;
+	unsigned long long free_vdev_map;
 	bool monitor;
 	int monitor_vdev_id;
 	bool monitor_started;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4670930..e1ddac4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -590,9 +590,9 @@ static int ath10k_monitor_vdev_create(struct ath10k *ar)
 		return -ENOMEM;
 	}
 
-	bit = ffs(ar->free_vdev_map);
+	bit = __ffs64(ar->free_vdev_map);
 
-	ar->monitor_vdev_id = bit - 1;
+	ar->monitor_vdev_id = bit;
 
 	ret = ath10k_wmi_vdev_create(ar, ar->monitor_vdev_id,
 				     WMI_VDEV_TYPE_MONITOR,
@@ -603,7 +603,7 @@ static int ath10k_monitor_vdev_create(struct ath10k *ar)
 		return ret;
 	}
 
-	ar->free_vdev_map &= ~(1 << ar->monitor_vdev_id);
+	ar->free_vdev_map &= ~(1LL << ar->monitor_vdev_id);
 	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac monitor vdev %d created\n",
 		   ar->monitor_vdev_id);
 
@@ -623,7 +623,7 @@ static int ath10k_monitor_vdev_delete(struct ath10k *ar)
 		return ret;
 	}
 
-	ar->free_vdev_map |= 1 << ar->monitor_vdev_id;
+	ar->free_vdev_map |= 1LL << ar->monitor_vdev_id;
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac monitor vdev %d deleted\n",
 		   ar->monitor_vdev_id);
@@ -2772,9 +2772,12 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		ret = -EBUSY;
 		goto err;
 	}
-	bit = ffs(ar->free_vdev_map);
+	bit = __ffs64(ar->free_vdev_map);
 
-	arvif->vdev_id = bit - 1;
+	ath10k_warn(ar, "Creating vdev id: %i  map: %llu\n",
+		    bit, ar->free_vdev_map);
+
+	arvif->vdev_id = bit;
 	arvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
 
 	if (ar->p2p)
@@ -2815,7 +2818,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err;
 	}
 
-	ar->free_vdev_map &= ~(1 << arvif->vdev_id);
+	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
 	list_add(&arvif->list, &ar->arvifs);
 
 	vdev_param = ar->wmi.vdev_param->def_keyid;
@@ -2908,7 +2911,7 @@ err_peer_delete:
 
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
-	ar->free_vdev_map |= 1 << arvif->vdev_id;
+	ar->free_vdev_map |= 1LL << arvif->vdev_id;
 	list_del(&arvif->list);
 
 err:
@@ -2944,7 +2947,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to stop spectral for vdev %i: %d\n",
 			    arvif->vdev_id, ret);
 
-	ar->free_vdev_map |= 1 << arvif->vdev_id;
+	ar->free_vdev_map |= 1LL << arvif->vdev_id;
 	list_del(&arvif->list);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
