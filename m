Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YH70m-0006UP-UF
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 08:33:10 +0000
Received: by mail-we0-f178.google.com with SMTP id k48so25739313wev.9
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 00:32:40 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: defer AP self-peer removal wait
Date: Fri, 30 Jan 2015 09:31:22 +0100
Message-Id: <1422606682-12121-1-git-send-email-michal.kazior@tieto.com>
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

Some firmware revisions don't notify host about
self-bss-peer removal until after associated vdev
is deleted. This has been observed with qca6174
WLAN.RM.2.0-00073 firmware.

This patch fixes AP teardown slowdowns and
prevents delays and warnings:

 ath10k_pci 0000:00:05.0: failed to remove peer for AP vdev 0: -110
 ath10k_pci 0000:00:05.0: removing stale peer xx:xx:xx:xx:xx:xx from vdev_id 0
 ath10k_pci 0000:00:05.0: peer-unmap-event: unknown peer id 24
 ath10k_pci 0000:00:05.0: peer-unmap-event: unknown peer id 8

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 15e47f4..75f2564 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3377,9 +3377,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	list_del(&arvif->list);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
-		ret = ath10k_peer_delete(arvif->ar, arvif->vdev_id, vif->addr);
+		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
+					     vif->addr);
 		if (ret)
-			ath10k_warn(ar, "failed to remove peer for AP vdev %i: %d\n",
+			ath10k_warn(ar, "failed to submit AP self-peer removal on vdev %i: %d\n",
 				    arvif->vdev_id, ret);
 
 		kfree(arvif->u.ap.noa_data);
@@ -3393,6 +3394,21 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to delete WMI vdev %i: %d\n",
 			    arvif->vdev_id, ret);
 
+	/* Some firmware revisions don't notify host about self-peer removal
+	 * until after associated vdev is deleted.
+	 */
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		ret = ath10k_wait_for_peer_deleted(ar, arvif->vdev_id,
+						   vif->addr);
+		if (ret)
+			ath10k_warn(ar, "failed to remove AP self-peer on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+
+		spin_lock_bh(&ar->data_lock);
+		ar->num_peers--;
+		spin_unlock_bh(&ar->data_lock);
+	}
+
 	ath10k_peer_cleanup(ar, arvif->vdev_id);
 
 	mutex_unlock(&ar->conf_mutex);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
