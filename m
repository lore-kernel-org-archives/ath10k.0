Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJhdx-0004yh-Si
 for ath10k@lists.infradead.org; Fri, 06 Feb 2015 12:04:18 +0000
Received: by mail-wg0-f41.google.com with SMTP id a1so13167192wgh.0
 for <ath10k@lists.infradead.org>; Fri, 06 Feb 2015 04:03:56 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 4/7] ath10k: protect ar->arvifs linking with data_lock
Date: Fri,  6 Feb 2015 13:02:51 +0100
Message-Id: <1423224174-24764-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1423224174-24764-1-git-send-email-michal.kazior@tieto.com>
References: <1423224174-24764-1-git-send-email-michal.kazior@tieto.com>
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

This will make it possible to iterate over
interface list while in an atomic context,
i.e. tasklet.

Caller should still be careful with accessing
arvif structures though.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2348f8b..1d7e0ae 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3314,7 +3314,10 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	}
 
 	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
+
+	spin_lock_bh(&ar->data_lock);
 	list_add(&arvif->list, &ar->arvifs);
+	spin_unlock_bh(&ar->data_lock);
 
 	/* It makes no sense to have firmware do keepalives. mac80211 already
 	 * takes care of this with idle connection polling.
@@ -3434,7 +3437,9 @@ err_peer_delete:
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
+	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 err:
 	if (arvif->beacon_buf) {
@@ -3467,7 +3472,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
+
+	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath10k_peer_delete(arvif->ar, arvif->vdev_id, vif->addr);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
