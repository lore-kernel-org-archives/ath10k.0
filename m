Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btbSq-0008KI-KP
 for ath10k@lists.infradead.org; Mon, 10 Oct 2016 14:22:01 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix kernel panic due to race in accessing arvif list
Date: Mon, 10 Oct 2016 19:51:18 +0530
Message-ID: <1476109278-7957-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

arvifs list is traversed within data_lock spin_lock in tasklet
context to fill channel information from the corresponding vif.
This means any access to arvifs list for add/del operations
should also be protected with the same spin_lock to avoid the
race. Fix this by performing list add/del on arvfis within the
data_lock. This could fix kernel panic something like the below.

 LR is at ath10k_htt_rx_pktlog_completion_handler+0x100/0xb6c [ath10k_core]
 PC is at ath10k_htt_rx_pktlog_completion_handler+0x1c0/0xb6c [ath10k_core]
 Internal error: Oops: 17 [#1] PREEMPT SMP ARM
 [<bf4857f4>] (ath10k_htt_rx_pktlog_completion_handler+0x2f4/0xb6c [ath10k_core])
 [<bf487540>] (ath10k_htt_txrx_compl_task+0x8b4/0x1188 [ath10k_core])
 [<c00312d4>] (tasklet_action+0x8c/0xec)
 [<c00309a8>] (__do_softirq+0xdc/0x208)
 [<c0030d6c>] (irq_exit+0x84/0xe0)
 [<c005db04>] (__handle_domain_irq+0x80/0xa0)
 [<c00085c4>] (gic_handle_irq+0x38/0x5c)
 [<c0009640>] (__irq_svc+0x40/0x74)

(gdb) list *(ath10k_htt_rx_pktlog_completion_handler+0x1c0)
0x136c0 is in ath10k_htt_rx_h_channel (drivers/net/wireless/ath/ath10k/htt_rx.c:769)
764		struct cfg80211_chan_def def;
765
766		lockdep_assert_held(&ar->data_lock);
767
768		list_for_each_entry(arvif, &ar->arvifs, list) {
769			if (arvif->vdev_id == vdev_id &&
770			    ath10k_mac_vif_chan(arvif->vif, &def) == 0)
771				return def.chan;
772		}
773

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2e5d2ca..691b7b5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4931,7 +4931,9 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	}
 
 	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
+	spin_lock_bh(&ar->data_lock);
 	list_add(&arvif->list, &ar->arvifs);
+	spin_unlock_bh(&ar->data_lock);
 
 	/* It makes no sense to have firmware do keepalives. mac80211 already
 	 * takes care of this with idle connection polling.
@@ -5082,7 +5084,9 @@ err_peer_delete:
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
+	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 err:
 	if (arvif->beacon_buf) {
@@ -5128,7 +5132,9 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 
 	ar->free_vdev_map |= 1LL << arvif->vdev_id;
+	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
+	spin_unlock_bh(&ar->data_lock);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
