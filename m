Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bftoY-0006WZ-Bl
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 19:07:47 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  ensure pdev sta kickout threshold is set.
Date: Fri,  2 Sep 2016 12:06:42 -0700
Message-Id: <1472843202-12428-1-git-send-email-greearb@candelatech.com>
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

The station kickout threshold is a pdev value, not per vdev,
so it should be set all the time, not just when vdev is an
AP.  This should fix setting the station kickout threshold
when using ibss interfaces.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 27 ++++++++++++++++++---------
 drivers/net/wireless/ath/ath10k/mac.h |  2 ++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 39fcdad..4aa0736 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -744,21 +744,26 @@ static int ath10k_peer_create(struct ath10k *ar,
 	return 0;
 }
 
+int ath10k_mac_set_pdev_kickout(struct ath10k *ar)
+{
+	u32 param = ar->wmi.pdev_param->sta_kickout_th;
+	int rv;
+
+	rv = ath10k_wmi_pdev_set_param(ar, param,
+				       ar->sta_xretry_kickout_thresh);
+	if (rv) {
+		ath10k_warn(ar, "failed to set sta kickout threshold to %d: %d\n",
+			    ar->sta_xretry_kickout_thresh, rv);
+	}
+	return rv;
+}
+
 static int ath10k_mac_set_kickout(struct ath10k_vif *arvif)
 {
 	struct ath10k *ar = arvif->ar;
 	u32 param;
 	int ret;
 
-	param = ar->wmi.pdev_param->sta_kickout_th;
-	ret = ath10k_wmi_pdev_set_param(ar, param,
-					ar->sta_xretry_kickout_thresh);
-	if (ret) {
-		ath10k_warn(ar, "failed to set kickout threshold on vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		return ret;
-	}
-
 	param = ar->wmi.vdev_param->ap_keepalive_min_idle_inactive_time_secs;
 	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
 					ATH10K_KEEPALIVE_MIN_IDLE);
@@ -5427,6 +5432,10 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		arvif->peer_id = HTT_INVALID_PEERID;
 	}
 
+	ret = ath10k_mac_set_pdev_kickout(ar);
+	if (ret)
+		return ret;
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath10k_mac_set_kickout(arvif);
 		if (ret) {
diff --git a/drivers/net/wireless/ath/ath10k/mac.h b/drivers/net/wireless/ath/ath10k/mac.h
index 5f027ec..1a34cab 100644
--- a/drivers/net/wireless/ath/ath10k/mac.h
+++ b/drivers/net/wireless/ath/ath10k/mac.h
@@ -113,4 +113,6 @@ static inline void ath10k_tx_h_seq_no(struct ieee80211_vif *vif,
 	}
 }
 
+int ath10k_mac_set_pdev_kickout(struct ath10k *ar);
+
 #endif /* _MAC_H_ */
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
