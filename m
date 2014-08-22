Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKjoC-0006Kr-5Y
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 08:02:53 +0000
Received: by mail-la0-f44.google.com with SMTP id el20so9708025lab.31
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 01:02:29 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC] ath10k: use raw tx
Date: Fri, 22 Aug 2014 09:52:45 +0200
Message-Id: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>

This is just a reference for anyone interested in
getting injection working with ath10k.

This just switches to raw tx mode instead of nwifi
for regular operation. Injection doesn't work yet.

I've tested this on 999.999.0.636, 10.1.467.2-1
and 10.2-00082-4. The 10.1.467.2-1 crashes as soon
as first tx completion comes in. The other two
seem to work but don't work with A-MSDU so it is
necessary to disable it:

Be sure to run:
 echo 1 64 > /sys/kernel/debug/ieee80211/phy*/ath10k/htt_max_amsdu_ampdu

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h   |  1 +
 drivers/net/wireless/ath/ath10k/htt_tx.c | 25 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/mac.c    |  9 ++++++---
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index cca6060..503cfca 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -68,6 +68,7 @@ struct ath10k_skb_cb {
 	struct {
 		u8 tid;
 		bool is_offchan;
+		bool is_raw;
 		struct ath10k_htt_txbuf *txbuf;
 		u32 txbuf_paddr;
 	} __packed htt;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 8b27bfc..4fefea8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -434,6 +434,7 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
 	struct ath10k_hif_sg_item sg_items[2];
 	struct htt_data_tx_desc_frag *frags;
+	__le16 fc = hdr->frame_control;
 	u8 vdev_id = skb_cb->vdev_id;
 	u8 tid = skb_cb->htt.tid;
 	int prefetch_len;
@@ -465,6 +466,7 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	 * of mgmt tx using TX_FRM there is not tx fragment list. Instead of tx
 	 * fragment list host driver specifies directly frame pointer. */
 	use_frags = htt->target_version_major < 3 ||
+		    skb_cb->htt.is_raw ||
 		    !ieee80211_is_mgmt(hdr->frame_control);
 
 	skb_cb->htt.txbuf = dma_pool_alloc(htt->tx_pool, GFP_ATOMIC,
@@ -487,8 +489,12 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 		frags[1].paddr = 0;
 		frags[1].len = 0;
 
-		flags0 |= SM(ATH10K_HW_TXRX_NATIVE_WIFI,
-			     HTT_DATA_TX_DESC_FLAGS0_PKT_TYPE);
+		if (skb_cb->htt.is_raw)
+			flags0 |= SM(ATH10K_HW_TXRX_RAW,
+				     HTT_DATA_TX_DESC_FLAGS0_PKT_TYPE);
+		else
+			flags0 |= SM(ATH10K_HW_TXRX_NATIVE_WIFI,
+				     HTT_DATA_TX_DESC_FLAGS0_PKT_TYPE);
 
 		frags_paddr = skb_cb->htt.txbuf_paddr;
 	} else {
@@ -528,8 +534,6 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 
 	flags1 |= SM((u16)vdev_id, HTT_DATA_TX_DESC_FLAGS1_VDEV_ID);
 	flags1 |= SM((u16)tid, HTT_DATA_TX_DESC_FLAGS1_EXT_TID);
-	flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L3_OFFLOAD;
-	flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L4_OFFLOAD;
 
 	/* Prevent firmware from sending up tx inspection requests. There's
 	 * nothing ath10k can do with frames requested for inspection so force
@@ -540,7 +544,18 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	skb_cb->htt.txbuf->cmd_hdr.msg_type = HTT_H2T_MSG_TYPE_TX_FRM;
 	skb_cb->htt.txbuf->cmd_tx.flags0 = flags0;
 	skb_cb->htt.txbuf->cmd_tx.flags1 = __cpu_to_le16(flags1);
-	skb_cb->htt.txbuf->cmd_tx.len = __cpu_to_le16(msdu->len);
+
+	/* Firmware has a buggy raw tx mode and it assumes packet is a 802.3
+	 * frame. If length here isn't properly fixed up frames xmited on the
+	 * air contain garbage at the end and have incorrect length.
+	 */
+	if (skb_cb->htt.is_raw)
+		skb_cb->htt.txbuf->cmd_tx.len = __cpu_to_le16(msdu->len -
+							ieee80211_hdrlen(fc) +
+							sizeof(struct ethhdr));
+	else
+		skb_cb->htt.txbuf->cmd_tx.len = __cpu_to_le16(msdu->len);
+
 	skb_cb->htt.txbuf->cmd_tx.id = __cpu_to_le16(msdu_id);
 	skb_cb->htt.txbuf->cmd_tx.frags_paddr = __cpu_to_le32(frags_paddr);
 	skb_cb->htt.txbuf->cmd_tx.peerid = __cpu_to_le32(HTT_INVALID_PEERID);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e568882..1aa748b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2316,13 +2316,18 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	if (info->flags & IEEE80211_TX_CTL_NO_CCK_RATE)
 		ath10k_dbg(ATH10K_DBG_MAC, "IEEE80211_TX_CTL_NO_CCK_RATE\n");
 
+	ATH10K_SKB_CB(skb)->htt.is_raw = false;
 	ATH10K_SKB_CB(skb)->htt.is_offchan = false;
 	ATH10K_SKB_CB(skb)->htt.tid = ath10k_tx_h_get_tid(hdr);
 	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, info);
 
+	/* For testing purposes. */
+	ATH10K_SKB_CB(skb)->htt.is_raw = true;
+
 	/* it makes no sense to process injected frames like that */
 	if (vif && vif->type != NL80211_IFTYPE_MONITOR) {
-		ath10k_tx_h_nwifi(hw, skb);
+		if (!ATH10K_SKB_CB(skb)->htt.is_raw)
+			ath10k_tx_h_nwifi(hw, skb);
 		ath10k_tx_h_update_wep_key(vif, key, skb);
 		ath10k_tx_h_add_p2p_noa_ie(ar, vif, skb);
 		ath10k_tx_h_seq_no(vif, skb);
@@ -4876,8 +4881,6 @@ int ath10k_mac_register(struct ath10k *ar)
 		ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC);
 	}
 
-	ar->hw->netdev_features = NETIF_F_HW_CSUM;
-
 	if (config_enabled(CONFIG_ATH10K_DFS_CERTIFIED)) {
 		/* Init ath dfs pattern detector */
 		ar->ath_common.debug_mask = ATH_DBG_DFS;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
