Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9XX6-0006Uq-Od
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 11:15:13 +0000
Received: by mail-we0-f177.google.com with SMTP id q59so7352390wes.8
 for <ath10k@lists.infradead.org>; Fri, 09 Jan 2015 03:14:50 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 5/8] ath10k: protect ar->arvifs linking with data_lock
Date: Fri,  9 Jan 2015 12:14:06 +0100
Message-Id: <1420802049-11962-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1420802049-11962-1-git-send-email-michal.kazior@tieto.com>
References: <1420802049-11962-1-git-send-email-michal.kazior@tieto.com>
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
index b175827..fed8cc9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3283,7 +3283,10 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	}
 
 	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
+
+	spin_lock_bh(&ar->data_lock);
 	list_add(&arvif->list, &ar->arvifs);
+	spin_unlock_bh(&ar->data_lock);
 
 	vdev_param = ar->wmi.vdev_param->def_keyid;
 	ret = ath10k_wmi_vdev_set_param(ar, 0, vdev_param,
@@ -3400,7 +3403,9 @@ err_peer_delete:
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
+	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 err:
 	if (arvif->beacon_buf) {
@@ -3435,7 +3440,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
+
+	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
