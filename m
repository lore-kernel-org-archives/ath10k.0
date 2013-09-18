Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMH6r-0000gj-UM
 for ath10k@lists.infradead.org; Wed, 18 Sep 2013 12:43:59 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/5] ath10k: avoid needless memset on TX path
Date: Wed, 18 Sep 2013 14:43:19 +0200
Message-ID: <1379508202-9660-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1379508202-9660-1-git-send-email-michal.kazior@tieto.com>
References: <1379508202-9660-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This reduces number of memory accesses and
hopefully contributes to better performance in the
future.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c    |    2 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |    4 +++-
 drivers/net/wireless/ath/ath10k/mac.c    |    4 +++-
 drivers/net/wireless/ath/ath10k/txrx.c   |    1 -
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index d0d7212..3118d75 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -103,10 +103,10 @@ static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 	struct ath10k_htc_hdr *hdr;
 
 	hdr = (struct ath10k_htc_hdr *)skb->data;
-	memset(hdr, 0, sizeof(*hdr));
 
 	hdr->eid = ep->eid;
 	hdr->len = __cpu_to_le16(skb->len - sizeof(*hdr));
+	hdr->flags = 0;
 
 	spin_lock_bh(&ep->htc->tx_lock);
 	hdr->seq_no = ep->seq_no++;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 4548128..c4bbf74 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -384,9 +384,11 @@ int ath10k_htt_mgmt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	/* refcount is decremented by HTC and HTT completions until it reaches
 	 * zero and is freed */
 	skb_cb = ATH10K_SKB_CB(txdesc);
+	skb_cb->htt.is_conf = false;
 	skb_cb->htt.msdu_id = msdu_id;
 	skb_cb->htt.refcount = 2;
 	skb_cb->htt.msdu = msdu;
+	skb_cb->htt.txfrag = NULL;
 
 	res = ath10k_htc_send(&htt->ar->htc, htt->eid, txdesc);
 	if (res)
@@ -505,7 +507,6 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 
 	skb_put(txdesc, desc_len);
 	cmd = (struct htt_cmd *)txdesc->data;
-	memset(cmd, 0, desc_len);
 
 	tid = ATH10K_SKB_CB(msdu)->htt.tid;
 
@@ -555,6 +556,7 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	/* refcount is decremented by HTC and HTT completions until it reaches
 	 * zero and is freed */
 	skb_cb = ATH10K_SKB_CB(txdesc);
+	skb_cb->htt.is_conf = false;
 	skb_cb->htt.msdu_id = msdu_id;
 	skb_cb->htt.refcount = 2;
 	skb_cb->htt.txfrag = txfrag;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5a56833..0d367e4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1757,7 +1757,9 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 		ath10k_tx_h_seq_no(skb);
 	}
 
-	memset(ATH10K_SKB_CB(skb), 0, sizeof(*ATH10K_SKB_CB(skb)));
+	ATH10K_SKB_CB(skb)->is_mapped = false;
+	ATH10K_SKB_CB(skb)->is_aborted = false;
+	ATH10K_SKB_CB(skb)->htt.is_offchan = false;
 	ATH10K_SKB_CB(skb)->htt.vdev_id = vdev_id;
 	ATH10K_SKB_CB(skb)->htt.tid = tid;
 
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 37b8196..f6fed31 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -75,7 +75,6 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt, struct sk_buff *txdesc)
 	ath10k_report_offchan_tx(htt->ar, msdu);
 
 	info = IEEE80211_SKB_CB(msdu);
-	memset(&info->status, 0, sizeof(info->status));
 
 	if (ATH10K_SKB_CB(txdesc)->htt.discard) {
 		ieee80211_free_txskb(htt->ar->hw, msdu);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
