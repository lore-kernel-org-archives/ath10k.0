Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOVJ1-0006DQ-Mq
 for ath10k@lists.infradead.org; Wed, 27 Jan 2016 18:59:04 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 3/4] ath10k: use vif->type and vif->p2p for P2P_GO check
Date: Wed, 27 Jan 2016 10:55:56 -0800
Message-ID: <1453920957-9908-4-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
References: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Interface type P2P_GO can be checked by either arvif->vdev_type
and arvif->vdev_subtype or vif->type and vif->p2p.
Use later one to avoid more cpu consumption that could happen
when subtype abstraction layer change is introduced.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++------
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6bf5c91..2940b00 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1358,10 +1358,7 @@ static int ath10k_mac_setup_bcn_p2p_ie(struct ath10k_vif *arvif,
 	const u8 *p2p_ie;
 	int ret;
 
-	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
-		return 0;
-
-	if (arvif->vdev_subtype != WMI_VDEV_SUBTYPE_P2P_GO)
+	if (arvif->vif->type != NL80211_IFTYPE_AP || !arvif->vif->p2p)
 		return 0;
 
 	mgmt = (void *)bcn->data;
@@ -3259,8 +3256,7 @@ static void ath10k_tx_h_add_p2p_noa_ie(struct ath10k *ar,
 	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
 
 	/* This is case only for P2P_GO */
-	if (arvif->vdev_type != WMI_VDEV_TYPE_AP ||
-	    arvif->vdev_subtype != WMI_VDEV_SUBTYPE_P2P_GO)
+	if (vif->type != NL80211_IFTYPE_AP || !vif->p2p)
 		return;
 
 	if (unlikely(ieee80211_is_probe_resp(hdr->frame_control))) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index a7c3d29..723fb9bc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3184,7 +3184,7 @@ static void ath10k_wmi_update_noa(struct ath10k *ar, struct ath10k_vif *arvif,
 				  struct sk_buff *bcn,
 				  const struct wmi_p2p_noa_info *noa)
 {
-	if (arvif->vdev_subtype != WMI_VDEV_SUBTYPE_P2P_GO)
+	if (!arvif->vif->p2p)
 		return;
 
 	ath10k_dbg(ar, ATH10K_DBG_MGMT, "noa changed: %d\n", noa->changed);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
