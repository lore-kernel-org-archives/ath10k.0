Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdNoq-00012M-2u
 for ath10k@lists.infradead.org; Mon, 04 Nov 2013 17:20:04 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k: Add logging to better determine some VIF/STA creation
 failures.
Date: Mon,  4 Nov 2013 09:19:34 -0800
Message-Id: <1383585574-17779-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

---
 drivers/net/wireless/ath/ath10k/mac.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f45eca0..93e52c5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -322,12 +322,16 @@ static int ath10k_peer_create(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 	lockdep_assert_held(&ar->conf_mutex);
 
 	ret = ath10k_wmi_peer_create(ar, vdev_id, addr);
-	if (ret)
+	if (ret) {
+		ath10k_dbg(ATH10K_DBG_WMI, "wmi_peer_create failed: %i\n", ret);
 		return ret;
+	}
 
 	ret = ath10k_wait_for_peer_created(ar, vdev_id, addr);
-	if (ret)
+	if (ret) {
+		ath10k_dbg(ATH10K_DBG_WMI, "wmi_wait_for_peer_created failed: %i\n", ret);
 		return ret;
+	}
 
 	return 0;
 }
@@ -2404,8 +2408,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 			ret = ath10k_peer_create(ar, arvif->vdev_id,
 						 info->bssid);
 			if (ret)
-				ath10k_warn("Failed to add peer: %pM for VDEV: %d\n",
-					    info->bssid, arvif->vdev_id);
+				ath10k_warn("Failed to add peer: %pM for VDEV: %d ret: %i\n",
+					    info->bssid, arvif->vdev_id, ret);
 
 			if (vif->type == NL80211_IFTYPE_STATION) {
 				/*
@@ -2687,8 +2691,8 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 
 		ret = ath10k_peer_create(ar, arvif->vdev_id, sta->addr);
 		if (ret)
-			ath10k_warn("Failed to add peer: %pM for VDEV: %d\n",
-				    sta->addr, arvif->vdev_id);
+			ath10k_warn("Failed to add peer: %pM for VDEV: %d, ret: %i\n",
+				    sta->addr, arvif->vdev_id, ret);
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
 		/*
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
