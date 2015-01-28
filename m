Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGPmO-0005Tt-Kn
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 10:23:25 +0000
Received: by mail-we0-f170.google.com with SMTP id w55so14435877wes.1
 for <ath10k@lists.infradead.org>; Wed, 28 Jan 2015 02:23:01 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/2] ath10k: fix beacon deadlock
Date: Wed, 28 Jan 2015 11:22:05 +0100
Message-Id: <1422440525-11115-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1422440525-11115-1-git-send-email-michal.kazior@tieto.com>
References: <1421412811-6387-1-git-send-email-michal.kazior@tieto.com>
 <1422440525-11115-1-git-send-email-michal.kazior@tieto.com>
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

This should fix a very rare occurrence of the following deadlock:

  [<ffffffffa018265e>] ath10k_wmi_tx_beacons_nowait+0x1e/0x50 [ath10k_core]
  [<ffffffffa01829b6>] ath10k_wmi_op_ep_tx_credits+0x16/0x40 [ath10k_core]
  [<ffffffffa017d685>] ath10k_htc_send+0x285/0x3d0 [ath10k_core]
  [<ffffffffa0184b81>] ath10k_wmi_cmd_send_nowait+0x81/0x110 [ath10k_core]
  [<ffffffffa0184c61>] ath10k_wmi_tx_beacon_nowait.part.33+0x51/0x90 [ath10k_core]
  [<ffffffffa0184cd0>] ath10k_wmi_tx_beacons_iter+0x30/0x40 [ath10k_core]
  [<ffffffff81882246>] __iterate_active_interfaces+0xa6/0x100
  [<ffffffffa0184ca0>] ? ath10k_wmi_tx_beacon_nowait.part.33+0x90/0x90 [ath10k_core]
  [<ffffffff818822ae>] ieee80211_iterate_active_interfaces_atomic+0xe/0x10
  [<ffffffffa0182676>] ath10k_wmi_tx_beacons_nowait+0x36/0x50 [ath10k_core]
  [<ffffffffa01829b6>] ath10k_wmi_op_ep_tx_credits+0x16/0x40 [ath10k_core]
  [<ffffffffa017d140>] ath10k_htc_rx+0x280/0x410 [ath10k_core]
  [<ffffffffa01bcbf0>] ? ath10k_ce_completed_recv_next+0x60/0x80 [ath10k_pci]
  [<ffffffffa01bc6ab>] ath10k_pci_ce_recv_data+0x11b/0x1d0 [ath10k_pci]
  [<ffffffffa01bcf44>] ath10k_ce_per_engine_service+0x64/0xc0 [ath10k_pci]
  [<ffffffffa01bcfc2>] ath10k_ce_per_engine_service_any+0x22/0x50 [ath10k_pci]
  [<ffffffffa01bc4d0>] ath10k_pci_tasklet+0x30/0x90 [ath10k_pci]
  [<ffffffff81055a55>] tasklet_action+0xc5/0x100

To prevent this make sure to release ar->data_lock
while calling to ath10k_wmi_beacon_send_ref_nowait().

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |  8 +++-
 drivers/net/wireless/ath/ath10k/mac.c  |  6 ++-
 drivers/net/wireless/ath/ath10k/wmi.c  | 68 +++++++++++++++++++++++-----------
 3 files changed, 58 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2d9f871..67e6b46 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -262,6 +262,12 @@ struct ath10k_sta {
 
 #define ATH10K_VDEV_SETUP_TIMEOUT_HZ (5*HZ)
 
+enum ath10k_beacon_state {
+	ATH10K_BEACON_SCHEDULED = 0,
+	ATH10K_BEACON_SENDING,
+	ATH10K_BEACON_SENT,
+};
+
 struct ath10k_vif {
 	struct list_head list;
 
@@ -272,7 +278,7 @@ struct ath10k_vif {
 	u32 dtim_period;
 	struct sk_buff *beacon;
 	/* protected by data_lock */
-	bool beacon_sent;
+	enum ath10k_beacon_state beacon_state;
 	void *beacon_buf;
 	dma_addr_t beacon_paddr;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4ff6dd0..2a51f0e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -521,10 +521,14 @@ void ath10k_mac_vif_beacon_free(struct ath10k_vif *arvif)
 		dma_unmap_single(ar->dev, ATH10K_SKB_CB(arvif->beacon)->paddr,
 				 arvif->beacon->len, DMA_TO_DEVICE);
 
+	if (WARN_ON(arvif->beacon_state != ATH10K_BEACON_SCHEDULED &&
+		    arvif->beacon_state != ATH10K_BEACON_SENT))
+		return;
+
 	dev_kfree_skb_any(arvif->beacon);
 
 	arvif->beacon = NULL;
-	arvif->beacon_sent = false;
+	arvif->beacon_state = ATH10K_BEACON_SCHEDULED;
 }
 
 static void ath10k_mac_vif_beacon_cleanup(struct ath10k_vif *arvif)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 459b203..a398193 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -956,30 +956,45 @@ err_pull:
 
 static void ath10k_wmi_tx_beacon_nowait(struct ath10k_vif *arvif)
 {
-	struct sk_buff *bcn;
+	struct ath10k *ar = arvif->ar;
 	struct ath10k_skb_cb *cb;
+	struct sk_buff *bcn;
 	int ret;
 
-	lockdep_assert_held(&arvif->ar->data_lock);
+	spin_lock_bh(&ar->data_lock);
 
-	if (arvif->beacon == NULL)
-		return;
+	bcn = arvif->beacon;
 
-	if (arvif->beacon_sent)
-		return;
+	if (!bcn)
+		goto unlock;
 
-	bcn = arvif->beacon;
 	cb = ATH10K_SKB_CB(bcn);
-	ret = ath10k_wmi_beacon_send_ref_nowait(arvif->ar, arvif->vdev_id,
-						bcn->data, bcn->len, cb->paddr,
-						cb->bcn.dtim_zero,
-						cb->bcn.deliver_cab);
-	if (ret)
-		return;
 
-	/* We need to retain the arvif->beacon reference for DMA unmapping and
-	 * freeing the skbuff later. */
-	arvif->beacon_sent = true;
+	switch (arvif->beacon_state) {
+	case ATH10K_BEACON_SENDING:
+	case ATH10K_BEACON_SENT:
+		break;
+	case ATH10K_BEACON_SCHEDULED:
+		arvif->beacon_state = ATH10K_BEACON_SENDING;
+		spin_unlock_bh(&ar->data_lock);
+
+		ret = ath10k_wmi_beacon_send_ref_nowait(arvif->ar,
+							arvif->vdev_id,
+							bcn->data, bcn->len,
+							cb->paddr,
+							cb->bcn.dtim_zero,
+							cb->bcn.deliver_cab);
+
+		spin_lock_bh(&ar->data_lock);
+
+		if (ret == 0)
+			arvif->beacon_state = ATH10K_BEACON_SENT;
+		else
+			arvif->beacon_state = ATH10K_BEACON_SCHEDULED;
+	}
+
+unlock:
+	spin_unlock_bh(&ar->data_lock);
 }
 
 static void ath10k_wmi_tx_beacons_iter(void *data, u8 *mac,
@@ -992,12 +1007,10 @@ static void ath10k_wmi_tx_beacons_iter(void *data, u8 *mac,
 
 static void ath10k_wmi_tx_beacons_nowait(struct ath10k *ar)
 {
-	spin_lock_bh(&ar->data_lock);
 	ieee80211_iterate_active_interfaces_atomic(ar->hw,
 						   IEEE80211_IFACE_ITER_NORMAL,
 						   ath10k_wmi_tx_beacons_iter,
 						   NULL);
-	spin_unlock_bh(&ar->data_lock);
 }
 
 static void ath10k_wmi_op_ep_tx_credits(struct ath10k *ar)
@@ -2459,9 +2472,19 @@ void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 		spin_lock_bh(&ar->data_lock);
 
 		if (arvif->beacon) {
-			if (!arvif->beacon_sent)
-				ath10k_warn(ar, "SWBA overrun on vdev %d\n",
+			switch (arvif->beacon_state) {
+			case ATH10K_BEACON_SENT:
+				break;
+			case ATH10K_BEACON_SCHEDULED:
+				ath10k_warn(ar, "SWBA overrun on vdev %d, skipped old beacon\n",
+					    arvif->vdev_id);
+				break;
+			case ATH10K_BEACON_SENDING:
+				ath10k_warn(ar, "SWBA overrun on vdev %d, skipped new beacon\n",
 					    arvif->vdev_id);
+				dev_kfree_skb(bcn);
+				goto skip;
+			}
 
 			ath10k_mac_vif_beacon_free(arvif);
 		}
@@ -2489,15 +2512,16 @@ void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 		}
 
 		arvif->beacon = bcn;
-		arvif->beacon_sent = false;
+		arvif->beacon_state = ATH10K_BEACON_SCHEDULED;
 
 		trace_ath10k_tx_hdr(ar, bcn->data, bcn->len);
 		trace_ath10k_tx_payload(ar, bcn->data, bcn->len);
 
-		ath10k_wmi_tx_beacon_nowait(arvif);
 skip:
 		spin_unlock_bh(&ar->data_lock);
 	}
+
+	ath10k_wmi_tx_beacons_nowait(ar);
 }
 
 void ath10k_wmi_event_tbttoffset_update(struct ath10k *ar, struct sk_buff *skb)
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
