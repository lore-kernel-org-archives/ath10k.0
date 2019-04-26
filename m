Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJuXz-0007bh-LC
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 06:41:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/5] ath10k: add fragmentation handler for high latency devices
Date: Fri, 26 Apr 2019 09:41:10 +0300
Message-Id: <1556260871-2919-5-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
References: <1556260871-2919-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Wen Gong <wgong@codeaurora.org>

From: Wen Gong <wgong@codeaurora.org>

On high latency devices (SDIO, USB) ath10k did not handle fragmented frames and
all fragmented frames on receive path were lost in ath10k. Even a simple ping
test failed with fragmentation.

The fragmented packets are decapsulated based on the security mode, then the PN
is checked and the fragmented frame is passed to mac80211.  mac80211 in
ieee80211_rx_h_defragment() will then combine the fragment frames and forward
to upper layers.

Tested on QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt.h    |  13 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 230 +++++++++++++++++++++++++++++++
 2 files changed, 243 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index fb5cb9169073..b28c167cb5b4 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -2092,6 +2092,9 @@ struct ath10k_htt_rx_ops {
 				    int idx);
 	void* (*htt_get_vaddr_ring)(struct ath10k_htt *htt);
 	void (*htt_reset_paddrs_ring)(struct ath10k_htt *htt, int idx);
+	bool (*htt_rx_proc_rx_frag_ind)(struct ath10k_htt *htt,
+					struct htt_rx_fragment_indication *rx,
+					struct sk_buff *skb);
 };
 
 static inline size_t ath10k_htt_get_rx_ring_size(struct ath10k_htt *htt)
@@ -2131,6 +2134,16 @@ static inline void ath10k_htt_reset_paddrs_ring(struct ath10k_htt *htt, int idx)
 		htt->rx_ops->htt_reset_paddrs_ring(htt, idx);
 }
 
+static inline bool ath10k_htt_rx_proc_rx_frag_ind(struct ath10k_htt *htt,
+						  struct htt_rx_fragment_indication *rx,
+						  struct sk_buff *skb)
+{
+	if (!htt->rx_ops->htt_rx_proc_rx_frag_ind)
+		return true;
+
+	return htt->rx_ops->htt_rx_proc_rx_frag_ind(htt, rx, skb);
+}
+
 #define RX_HTT_HDR_STATUS_LEN 64
 
 /* This structure layout is programmed via rx ring setup
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 961e14633320..45f4eecc3839 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2266,6 +2266,231 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 	return true;
 }
 
+static int ath10k_htt_rx_frag_tkip_decap_nomic(struct sk_buff *skb,
+					       u16 head_len,
+					       u16 hdr_len)
+{
+	u8 *ivp, *orig_hdr;
+
+	orig_hdr = skb->data;
+	ivp = orig_hdr + hdr_len + head_len;
+
+	/* the ExtIV bit is always set to 1 for TKIP */
+	if (!(ivp[IEEE80211_WEP_IV_LEN - 1] & ATH10K_IEEE80211_EXTIV))
+		return -EINVAL;
+
+	memmove(orig_hdr + IEEE80211_TKIP_IV_LEN, orig_hdr, head_len + hdr_len);
+	skb_pull(skb, IEEE80211_TKIP_IV_LEN);
+	skb_trim(skb, skb->len - ATH10K_IEEE80211_TKIP_MICLEN);
+	return 0;
+}
+
+static int ath10k_htt_rx_frag_tkip_decap_withmic(struct sk_buff *skb,
+						 u16 head_len,
+						 u16 hdr_len)
+{
+	u8 *ivp, *orig_hdr;
+
+	orig_hdr = skb->data;
+	ivp = orig_hdr + hdr_len + head_len;
+
+	/* the ExtIV bit is always set to 1 for TKIP */
+	if (!(ivp[IEEE80211_WEP_IV_LEN - 1] & ATH10K_IEEE80211_EXTIV))
+		return -EINVAL;
+
+	memmove(orig_hdr + IEEE80211_TKIP_IV_LEN, orig_hdr, head_len + hdr_len);
+	skb_pull(skb, IEEE80211_TKIP_IV_LEN);
+	skb_trim(skb, skb->len - IEEE80211_TKIP_ICV_LEN);
+	return 0;
+}
+
+static int ath10k_htt_rx_frag_ccmp_decap(struct sk_buff *skb,
+					 u16 head_len,
+					 u16 hdr_len)
+{
+	u8 *ivp, *orig_hdr;
+
+	orig_hdr = skb->data;
+	ivp = orig_hdr + hdr_len + head_len;
+
+	/* the ExtIV bit is always set to 1 for CCMP */
+	if (!(ivp[IEEE80211_WEP_IV_LEN - 1] & ATH10K_IEEE80211_EXTIV))
+		return -EINVAL;
+
+	skb_trim(skb, skb->len - IEEE80211_CCMP_MIC_LEN);
+	memmove(orig_hdr + IEEE80211_CCMP_HDR_LEN, orig_hdr, head_len + hdr_len);
+	skb_pull(skb, IEEE80211_CCMP_HDR_LEN);
+	return 0;
+}
+
+static int ath10k_htt_rx_frag_wep_decap(struct sk_buff *skb,
+					u16 head_len,
+					u16 hdr_len)
+{
+	u8 *orig_hdr;
+
+	orig_hdr = skb->data;
+
+	memmove(orig_hdr + IEEE80211_WEP_IV_LEN,
+		orig_hdr, head_len + hdr_len);
+	skb_pull(skb, IEEE80211_WEP_IV_LEN);
+	skb_trim(skb, skb->len - IEEE80211_WEP_ICV_LEN);
+	return 0;
+}
+
+static bool ath10k_htt_rx_proc_rx_frag_ind_hl(struct ath10k_htt *htt,
+					      struct htt_rx_fragment_indication *rx,
+					      struct sk_buff *skb)
+{
+	struct ath10k *ar = htt->ar;
+	enum htt_rx_tkip_demic_type tkip_mic = HTT_RX_NON_TKIP_MIC;
+	enum htt_txrx_sec_cast_type sec_index;
+	struct htt_rx_indication_hl *rx_hl;
+	enum htt_security_types sec_type;
+	u32 tid, frag, seq, rx_desc_info;
+	union htt_rx_pn_t new_pn = {0};
+	struct htt_hl_rx_desc *rx_desc;
+	u16 peer_id, sc, hdr_space;
+	union htt_rx_pn_t *last_pn;
+	struct ieee80211_hdr *hdr;
+	int ret, num_mpdu_ranges;
+	struct ath10k_peer *peer;
+	struct htt_resp *resp;
+	size_t tot_hdr_len;
+
+	resp = (struct htt_resp *)(skb->data + HTT_RX_FRAG_IND_INFO0_HEADER_LEN);
+	skb_pull(skb, HTT_RX_FRAG_IND_INFO0_HEADER_LEN);
+	skb_trim(skb, skb->len - FCS_LEN);
+
+	peer_id = __le16_to_cpu(rx->peer_id);
+	rx_hl = (struct htt_rx_indication_hl *)(&resp->rx_ind_hl);
+
+	spin_lock_bh(&ar->data_lock);
+	peer = ath10k_peer_find_by_id(ar, peer_id);
+	if (!peer) {
+		ath10k_dbg(ar, ATH10K_DBG_HTT, "invalid peer: %u\n", peer_id);
+		goto err;
+	}
+
+	num_mpdu_ranges = MS(__le32_to_cpu(rx_hl->hdr.info1),
+			     HTT_RX_INDICATION_INFO1_NUM_MPDU_RANGES);
+
+	tot_hdr_len = sizeof(struct htt_resp_hdr) +
+		      sizeof(rx_hl->hdr) +
+		      sizeof(rx_hl->ppdu) +
+		      sizeof(rx_hl->prefix) +
+		      sizeof(rx_hl->fw_desc) +
+		      sizeof(struct htt_rx_indication_mpdu_range) * num_mpdu_ranges;
+
+	tid =  MS(rx_hl->hdr.info0, HTT_RX_INDICATION_INFO0_EXT_TID);
+	rx_desc = (struct htt_hl_rx_desc *)(skb->data + tot_hdr_len);
+	rx_desc_info = __le32_to_cpu(rx_desc->info);
+
+	if (!MS(rx_desc_info, HTT_RX_DESC_HL_INFO_ENCRYPTED)) {
+		spin_unlock_bh(&ar->data_lock);
+		return ath10k_htt_rx_proc_rx_ind_hl(htt, &resp->rx_ind_hl, skb,
+						    HTT_RX_NON_PN_CHECK,
+						    HTT_RX_NON_TKIP_MIC);
+	}
+
+	hdr = (struct ieee80211_hdr *)((u8 *)rx_desc + rx_hl->fw_desc.len);
+
+	if (ieee80211_has_retry(hdr->frame_control))
+		goto err;
+
+	hdr_space = ieee80211_hdrlen(hdr->frame_control);
+	sc = __le16_to_cpu(hdr->seq_ctrl);
+	seq = (sc & IEEE80211_SCTL_SEQ) >> 4;
+	frag = sc & IEEE80211_SCTL_FRAG;
+
+	sec_index = MS(rx_desc_info, HTT_RX_DESC_HL_INFO_MCAST_BCAST) ?
+		    HTT_TXRX_SEC_MCAST : HTT_TXRX_SEC_UCAST;
+	sec_type = peer->rx_pn[sec_index].sec_type;
+	ath10k_htt_rx_mpdu_desc_pn_hl(rx_desc, &new_pn, peer->rx_pn[sec_index].pn_len);
+
+	switch (sec_type) {
+	case HTT_SECURITY_TKIP:
+		tkip_mic = HTT_RX_TKIP_MIC;
+		ret = ath10k_htt_rx_frag_tkip_decap_withmic(skb,
+							    tot_hdr_len +
+							    rx_hl->fw_desc.len,
+							    hdr_space);
+		if (ret)
+			goto err;
+		break;
+	case HTT_SECURITY_TKIP_NOMIC:
+		ret = ath10k_htt_rx_frag_tkip_decap_nomic(skb,
+							  tot_hdr_len +
+							  rx_hl->fw_desc.len,
+							  hdr_space);
+		if (ret)
+			goto err;
+		break;
+	case HTT_SECURITY_AES_CCMP:
+		ret = ath10k_htt_rx_frag_ccmp_decap(skb,
+						    tot_hdr_len + rx_hl->fw_desc.len,
+						    hdr_space);
+		if (ret)
+			goto err;
+		break;
+	case HTT_SECURITY_WEP128:
+	case HTT_SECURITY_WEP104:
+	case HTT_SECURITY_WEP40:
+		ret = ath10k_htt_rx_frag_wep_decap(skb,
+						   tot_hdr_len + rx_hl->fw_desc.len,
+						   hdr_space);
+		if (ret)
+			goto err;
+		break;
+	default:
+		break;
+	}
+
+	resp = (struct htt_resp *)(skb->data);
+
+	if (sec_type != HTT_SECURITY_AES_CCMP &&
+	    sec_type != HTT_SECURITY_TKIP &&
+	    sec_type != HTT_SECURITY_TKIP_NOMIC) {
+		spin_unlock_bh(&ar->data_lock);
+		return ath10k_htt_rx_proc_rx_ind_hl(htt, &resp->rx_ind_hl, skb,
+						    HTT_RX_NON_PN_CHECK,
+						    HTT_RX_NON_TKIP_MIC);
+	}
+
+	last_pn = &peer->frag_tids_last_pn[tid];
+
+	if (frag == 0) {
+		if (ath10k_htt_rx_pn_check_replay_hl(ar, peer, &resp->rx_ind_hl))
+			goto err;
+
+		last_pn->pn48 = new_pn.pn48;
+		peer->frag_tids_seq[tid] = seq;
+	} else if (sec_type == HTT_SECURITY_AES_CCMP) {
+		if (seq != peer->frag_tids_seq[tid])
+			goto err;
+
+		if (new_pn.pn48 != last_pn->pn48 + 1)
+			goto err;
+
+		last_pn->pn48 = new_pn.pn48;
+		last_pn = &peer->tids_last_pn[tid];
+		last_pn->pn48 = new_pn.pn48;
+	}
+
+	spin_unlock_bh(&ar->data_lock);
+
+	return ath10k_htt_rx_proc_rx_ind_hl(htt, &resp->rx_ind_hl, skb,
+					    HTT_RX_NON_PN_CHECK, tkip_mic);
+
+err:
+	spin_unlock_bh(&ar->data_lock);
+
+	/* Tell the caller that it must free the skb since we have not
+	 * consumed it
+	 */
+	return true;
+}
+
 static void ath10k_htt_rx_proc_rx_ind_ll(struct ath10k_htt *htt,
 					 struct htt_rx_indication *rx)
 {
@@ -3511,6 +3736,10 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt event: ",
 				skb->data, skb->len);
 		atomic_inc(&htt->num_mpdus_ready);
+
+		return ath10k_htt_rx_proc_rx_frag_ind(htt,
+						      &resp->rx_frag_ind,
+						      skb);
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_TEST:
@@ -3724,6 +3953,7 @@ static const struct ath10k_htt_rx_ops htt_rx_ops_64 = {
 };
 
 static const struct ath10k_htt_rx_ops htt_rx_ops_hl = {
+	.htt_rx_proc_rx_frag_ind = ath10k_htt_rx_proc_rx_frag_ind_hl,
 };
 
 void ath10k_htt_set_rx_ops(struct ath10k_htt *htt)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
