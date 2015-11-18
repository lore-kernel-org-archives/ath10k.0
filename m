Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1Zyvmh-0000YX-PM
 for ath10k@lists.infradead.org; Wed, 18 Nov 2015 06:00:00 +0000
Received: by lffu14 with SMTP id u14so19584726lff.1
 for <ath10k@lists.infradead.org>; Tue, 17 Nov 2015 21:59:37 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 6/9] ath10k: pack up flags in skb_cb
Date: Wed, 18 Nov 2015 06:59:20 +0100
Message-Id: <1447826363-16818-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
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

It was wasteful to have all the flags as separate
bools.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h   | 13 +++++++------
 drivers/net/wireless/ath/ath10k/htt_tx.c |  4 ++--
 drivers/net/wireless/ath/ath10k/mac.c    | 10 +++++++---
 drivers/net/wireless/ath/ath10k/wmi.c    | 12 ++++++++----
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 804fd2e5bc38..6b9b37329621 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -81,22 +81,23 @@ static inline const char *ath10k_bus_str(enum ath10k_bus bus)
 	return "unknown";
 }
 
+enum ath10k_skb_flags {
+	ATH10K_SKB_F_NO_HWCRYPT = BIT(0),
+	ATH10K_SKB_F_DTIM_ZERO = BIT(1),
+	ATH10K_SKB_F_DELIVER_CAB = BIT(2),
+};
+
 struct ath10k_skb_cb {
 	dma_addr_t paddr;
+	u8 flags;
 	u8 eid;
 	u8 vdev_id;
 
 	struct {
 		u8 tid;
-		bool nohwcrypt;
 		struct ath10k_htt_txbuf *txbuf;
 		u32 txbuf_paddr;
 	} __packed htt;
-
-	struct {
-		bool dtim_zero;
-		bool deliver_cab;
-	} bcn;
 } __packed;
 
 struct ath10k_skb_rxcb {
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index a7d8798b2f37..c955c6b6ea9d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -586,7 +586,7 @@ int ath10k_htt_tx(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
 	     ieee80211_is_disassoc(hdr->frame_control)) &&
 	     ieee80211_has_protected(hdr->frame_control)) {
 		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
-	} else if (!skb_cb->htt.nohwcrypt &&
+	} else if (!(skb_cb->flags & ATH10K_SKB_F_NO_HWCRYPT) &&
 		   txmode == ATH10K_HW_TXRX_RAW &&
 		   ieee80211_has_protected(hdr->frame_control)) {
 		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
@@ -666,7 +666,7 @@ int ath10k_htt_tx(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
 			prefetch_len);
 	skb_cb->htt.txbuf->htc_hdr.flags = 0;
 
-	if (skb_cb->htt.nohwcrypt)
+	if (skb_cb->flags & ATH10K_SKB_F_NO_HWCRYPT)
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_NO_ENCRYPT;
 
 	flags1 |= SM((u16)vdev_id, HTT_DATA_TX_DESC_FLAGS1_VDEV_ID);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0ca5d5bea509..38c241596965 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3672,6 +3672,7 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 		      struct sk_buff *skb)
 {
 	struct ath10k *ar = hw->priv;
+	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(skb);
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	struct ieee80211_sta *sta = control->sta;
@@ -3684,9 +3685,12 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 
 	txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta, skb);
 
-	ATH10K_SKB_CB(skb)->htt.tid = ath10k_tx_h_get_tid(hdr);
-	ATH10K_SKB_CB(skb)->htt.nohwcrypt = !ath10k_tx_h_use_hwcrypto(vif, skb);
-	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
+	skb_cb->flags = 0;
+	if (!ath10k_tx_h_use_hwcrypto(vif, skb))
+		skb_cb->flags |= ATH10K_SKB_F_NO_HWCRYPT;
+
+	skb_cb->htt.tid = ath10k_tx_h_get_tid(hdr);
+	skb_cb->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
 
 	switch (txmode) {
 	case ATH10K_HW_TXRX_MGMT:
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 902107934edd..6028a598c199 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1715,6 +1715,8 @@ static void ath10k_wmi_tx_beacon_nowait(struct ath10k_vif *arvif)
 	struct ath10k *ar = arvif->ar;
 	struct ath10k_skb_cb *cb;
 	struct sk_buff *bcn;
+	bool dtim_zero;
+	bool deliver_cab;
 	int ret;
 
 	spin_lock_bh(&ar->data_lock);
@@ -1734,12 +1736,14 @@ static void ath10k_wmi_tx_beacon_nowait(struct ath10k_vif *arvif)
 		arvif->beacon_state = ATH10K_BEACON_SENDING;
 		spin_unlock_bh(&ar->data_lock);
 
+		dtim_zero = !!(cb->flags & ATH10K_SKB_F_DTIM_ZERO);
+		deliver_cab = !!(cb->flags & ATH10K_SKB_F_DELIVER_CAB);
 		ret = ath10k_wmi_beacon_send_ref_nowait(arvif->ar,
 							arvif->vdev_id,
 							bcn->data, bcn->len,
 							cb->paddr,
-							cb->bcn.dtim_zero,
-							cb->bcn.deliver_cab);
+							dtim_zero,
+							deliver_cab);
 
 		spin_lock_bh(&ar->data_lock);
 
@@ -3157,10 +3161,10 @@ static void ath10k_wmi_update_tim(struct ath10k *ar,
 	memcpy(tim->virtual_map, arvif->u.ap.tim_bitmap, pvm_len);
 
 	if (tim->dtim_count == 0) {
-		ATH10K_SKB_CB(bcn)->bcn.dtim_zero = true;
+		ATH10K_SKB_CB(bcn)->flags |= ATH10K_SKB_F_DTIM_ZERO;
 
 		if (__le32_to_cpu(tim_info->tim_mcast) == 1)
-			ATH10K_SKB_CB(bcn)->bcn.deliver_cab = true;
+			ATH10K_SKB_CB(bcn)->flags |= ATH10K_SKB_F_DELIVER_CAB;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_MGMT, "dtim %d/%d mcast %d pvmlen %d\n",
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
