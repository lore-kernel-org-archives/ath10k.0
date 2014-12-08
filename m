Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy1wf-0000Ds-MJ
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 17:18:02 +0000
Subject: [HACK PATCH 3/4] ath10k: rx
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 8 Dec 2014 19:17:22 +0200
Message-ID: <20141208171722.1001.88864.stgit@potku.adurom.net>
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
 drivers/net/wireless/ath/ath10k/core.h   |    2 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c |   40 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c    |    8 ++++++
 drivers/net/wireless/ath/ath10k/wmi.c    |    9 +++++++
 4 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 613355cc6895..f4a4d3c346aa 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -540,6 +540,8 @@ struct ath10k {
 	/* current operating channel definition */
 	struct cfg80211_chan_def chandef;
 
+	struct ieee80211_vif *vif;
+
 	unsigned long long free_vdev_map;
 	bool monitor;
 	int monitor_vdev_id;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9c782a42665e..deb7e1bcb08e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -804,6 +804,12 @@ static void ath10k_process_rx(struct ath10k *ar,
 	trace_ath10k_rx_hdr(ar, skb->data, skb->len);
 	trace_ath10k_rx_payload(ar, skb->data, skb->len);
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	skb->dev = ar->vif;
+	skb_set_mac_header(skb, 0);
+	skb_set_network_header(skb, 0);
+#endif
+
 	ieee80211_rx(ar->hw, skb);
 }
 
@@ -895,6 +901,7 @@ static void ath10k_htt_rx_h_undecap_nwifi(struct ath10k *ar,
 	size_t hdr_len;
 	u8 da[ETH_ALEN];
 	u8 sa[ETH_ALEN];
+	struct ethhdr eth;
 
 	/* Delivered decapped frame:
 	 * [nwifi 802.11 header] <-- replaced with 802.11 hdr
@@ -910,6 +917,20 @@ static void ath10k_htt_rx_h_undecap_nwifi(struct ath10k *ar,
 	/* pull decapped header and copy SA & DA */
 	hdr = (struct ieee80211_hdr *)msdu->data;
 	hdr_len = ath10k_htt_rx_nwifi_hdrlen(hdr);
+
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	memcpy(eth.h_dest, ieee80211_get_DA(hdr), ETH_ALEN);
+	memcpy(eth.h_source, ieee80211_get_SA(hdr), ETH_ALEN);
+
+	/* leave out snap_type as it matches h_proto */
+	skb_pull(msdu, hdr_len + 6);
+
+	/* copy just source/dest; h_proto is from snap_type */
+	memcpy(skb_push(msdu, ETH_ALEN * 2), &eth, ETH_ALEN * 2);
+
+	return;
+#endif
+
 	ether_addr_copy(da, ieee80211_get_DA(hdr));
 	ether_addr_copy(sa, ieee80211_get_SA(hdr));
 	skb_pull(msdu, hdr_len);
@@ -975,6 +996,10 @@ static void ath10k_htt_rx_h_undecap_eth(struct ath10k *ar,
 	u8 da[ETH_ALEN];
 	u8 sa[ETH_ALEN];
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	return;
+#endif
+
 	/* Delivered decapped frame:
 	 * [eth header] <-- replaced with 802.11 hdr & rfc1042/llc
 	 * [payload]
@@ -1020,6 +1045,21 @@ static void ath10k_htt_rx_h_undecap_snap(struct ath10k *ar,
 	 * [rfc1042/llc]
 	 * [payload]
 	 */
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	struct amsdu_subframe_hdr *ahdr = (void *)msdu->data;
+	struct ethhdr eth;
+
+	memcpy(eth.h_dest, ahdr->dst, ETH_ALEN);
+	memcpy(eth.h_source, ahdr->src, ETH_ALEN);
+
+	// leave snap_type as h_proto
+	skb_pull(msdu, sizeof(*ahdr) + 6);
+	// copy just source/dest; h_proto is from snap_type
+	memcpy(skb_push(msdu, ETH_ALEN * 2),
+	       &eth, ETH_ALEN * 2);
+
+	return;
+#endif
 
 	skb_pull(msdu, sizeof(struct amsdu_subframe_hdr));
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5475f0fbbe41..3ab09470438f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2880,6 +2880,10 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	arvif->ar = ar;
 	arvif->vif = vif;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	ar->vif = vif;
+#endif
+
 	INIT_WORK(&arvif->wep_key_work, ath10k_tx_wep_key_work);
 	INIT_LIST_HEAD(&arvif->list);
 
@@ -3105,6 +3109,10 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	ar->vif = NULL;
+#endif
+
 	spin_lock_bh(&ar->data_lock);
 	ath10k_mac_vif_beacon_cleanup(arvif);
 	spin_unlock_bh(&ar->data_lock);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fa486f69cce7..be70f044a53e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1319,6 +1319,15 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 		   status->freq, status->band, status->signal,
 		   status->rate_idx);
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	/*
+	 * packets from HTC come aligned to 4byte boundaries
+	 * because they can originally come in along with a trailer
+	 */
+	skb_trim(skb, buf_len);
+	skb->dev = NULL;
+#endif
+
 	ieee80211_rx(ar->hw, skb);
 	return 0;
 }


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
