Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy1wt-0000JI-Jq
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 17:18:16 +0000
Subject: [HACK PATCH 4/4] ath10k: tx
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 8 Dec 2014 19:17:37 +0200
Message-ID: <20141208171737.1001.63200.stgit@potku.adurom.net>
In-Reply-To: <20141208170804.1001.1804.stgit@potku.adurom.net>
References: <20141208170804.1001.1804.stgit@potku.adurom.net>
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

From: Michal Kazior <michal.kazior@tieto.com>

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/Kconfig  |    8 ++++++++
 drivers/net/wireless/ath/ath10k/core.h   |    4 ++++
 drivers/net/wireless/ath/ath10k/htt_tx.c |   12 ++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c    |   21 +++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 72acb822bb11..1bac2e94c3a9 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -45,3 +45,11 @@ config ATH10K_DFS_CERTIFIED
 	---help---
 	This option enables DFS support for initiating radiation on
 	ath10k.
+
+config ATH10K_802_3_FORMAT
+	bool "ath10k 802.3 frame format"
+	depends on ATH10K
+	default n
+	---help---
+	This option enables HIGHLY EXPERIMENTAL 802.3 frame format 
+	support in ath10k. If it breaks, you get to keep both pieces.
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index f4a4d3c346aa..c5c33a56a03e 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -82,6 +82,10 @@ struct ath10k_skb_cb {
 	u8 eid;
 	u8 vdev_id;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	bool is_8023;
+#endif
+
 	struct {
 		u8 tid;
 		u16 freq;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index a1bda41fb543..a340444bc64c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -467,11 +467,15 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	prefetch_len = min(htt->prefetch_len, msdu->len);
 	prefetch_len = roundup(prefetch_len, 4);
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	use_frags = true;
+#else
 	/* Since HTT 3.0 there is no separate mgmt tx command. However in case
 	 * of mgmt tx using TX_FRM there is not tx fragment list. Instead of tx
 	 * fragment list host driver specifies directly frame pointer. */
 	use_frags = htt->target_version_major < 3 ||
 		    !ieee80211_is_mgmt(hdr->frame_control);
+#endif
 
 	skb_cb->htt.txbuf = dma_pool_alloc(htt->tx_pool, GFP_ATOMIC,
 					   &paddr);
@@ -527,8 +531,16 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 			prefetch_len);
 	skb_cb->htt.txbuf->htc_hdr.flags = 0;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	flags0 |= SM(ATH10K_HW_TXRX_ETHERNET,
+		     HTT_DATA_TX_DESC_FLAGS0_PKT_TYPE);
+	flags0 |= HTT_DATA_TX_DESC_FLAGS0_NO_ENCRYPT;
+
+#else
+
 	if (!ieee80211_has_protected(hdr->frame_control))
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_NO_ENCRYPT;
+#endif
 
 	flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3ab09470438f..d7ccb0531a48 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2364,6 +2364,23 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	struct ieee80211_key_conf *key = info->control.hw_key;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	if (likely(info->is_8023)) {
+		int ret;
+
+		ATH10K_SKB_CB(skb)->vdev_id = 0;
+		ATH10K_SKB_CB(skb)->is_8023 = true;
+		ATH10K_SKB_CB(skb)->htt.is_offchan = false;
+		ATH10K_SKB_CB(skb)->htt.tid = skb->priority &
+					      IEEE80211_QOS_CTL_TAG1D_MASK;
+
+		ret = ath10k_htt_tx(&ar->htt, skb);
+		if (unlikely(ret < 0))
+			ieee80211_free_txskb(hw, skb);
+		return;
+	}
+#endif
+
 	/* We should disable CCK RATE due to P2P */
 	if (info->flags & IEEE80211_TX_CTL_NO_CCK_RATE)
 		ath10k_dbg(ar, ATH10K_DBG_MAC, "IEEE80211_TX_CTL_NO_CCK_RATE\n");
@@ -2372,6 +2389,10 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	ATH10K_SKB_CB(skb)->htt.tid = ath10k_tx_h_get_tid(hdr);
 	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	ATH10K_SKB_CB(skb)->is_8023 = false;
+#endif
+
 	/* it makes no sense to process injected frames like that */
 	if (vif && vif->type != NL80211_IFTYPE_MONITOR) {
 		ath10k_tx_h_nwifi(hw, skb);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
