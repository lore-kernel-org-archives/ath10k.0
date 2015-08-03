Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMBrL-0004Vn-CL
 for ath10k@lists.infradead.org; Mon, 03 Aug 2015 09:16:43 +0000
Received: by lbbud7 with SMTP id ud7so70412207lbb.3
 for <ath10k@lists.infradead.org>; Mon, 03 Aug 2015 02:16:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: remove futile fragmentation threshold config
Date: Mon,  3 Aug 2015 11:16:42 +0200
Message-Id: <1438593403-316-1-git-send-email-michal.kazior@tieto.com>
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

Commit 1010ba4c5d1c ("ath10k: unregister and
remove frag_threshold callback") didn't remove all
instances of (futile) fragmentation threshold
configuration. No known firmware supports the
parameter so don't even bother setting it.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index acd222f3b899..879af9c3bd4a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -678,20 +678,6 @@ static int ath10k_mac_set_rts(struct ath10k_vif *arvif, u32 value)
 	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param, value);
 }
 
-static int ath10k_mac_set_frag(struct ath10k_vif *arvif, u32 value)
-{
-	struct ath10k *ar = arvif->ar;
-	u32 vdev_param;
-
-	if (value != 0xFFFFFFFF)
-		value = clamp_t(u32, arvif->ar->hw->wiphy->frag_threshold,
-				ATH10K_FRAGMT_THRESHOLD_MIN,
-				ATH10K_FRAGMT_THRESHOLD_MAX);
-
-	vdev_param = ar->wmi.vdev_param->fragmentation_threshold;
-	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param, value);
-}
-
 static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 {
 	int ret;
@@ -4276,13 +4262,6 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err_peer_delete;
 	}
 
-	ret = ath10k_mac_set_frag(arvif, ar->hw->wiphy->frag_threshold);
-	if (ret) {
-		ath10k_warn(ar, "failed to set frag threshold for vdev %d: %d\n",
-			    arvif->vdev_id, ret);
-		goto err_peer_delete;
-	}
-
 	arvif->txpower = vif->bss_conf.txpower;
 	ret = ath10k_mac_txpower_recalc(ar);
 	if (ret) {
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
