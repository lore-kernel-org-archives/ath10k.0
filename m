Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zw8jt-0008Nh-0d
 for ath10k@lists.infradead.org; Tue, 10 Nov 2015 13:13:34 +0000
Received: by lffu14 with SMTP id u14so27452437lff.1
 for <ath10k@lists.infradead.org>; Tue, 10 Nov 2015 05:13:11 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 7/9] ath10k: fix tx header parsing
Date: Tue, 10 Nov 2015 14:10:53 +0100
Message-Id: <1447161055-2283-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1447161055-2283-1-git-send-email-michal.kazior@tieto.com>
References: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
 <1447161055-2283-1-git-send-email-michal.kazior@tieto.com>
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

Frames are not guaranteed to be 802.11 frames in
ath10k_htt_tx() and the tx completion handler.
In some cases, like TDLS, they can be Ethernet.
Hence checking, e.g. frame_control could yield
bogus results and behavior.

Fortunately this wasn't a real problem so far
because there's no FW/HW combination to encounter
this problem.

However it is good to fix this in advance.

Fixes: 75d85fd9993c ("ath10k: introduce basic tdls functionality")
Fixes: eebc67fef3ee ("ath10k: fix pmf for wmi-tlv on qca6174")
Fixes: 7b7da0a02192 ("ath10k: drop probe responses when too many are queued")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * introduced

 drivers/net/wireless/ath/ath10k/core.h | 1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 drivers/net/wireless/ath/ath10k/txrx.c | 8 ++------
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1e8b5adeac37..b9137b1f76d1 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -85,6 +85,7 @@ enum ath10k_skb_flags {
 	ATH10K_SKB_F_NO_HWCRYPT = BIT(0),
 	ATH10K_SKB_F_DTIM_ZERO = BIT(1),
 	ATH10K_SKB_F_DELIVER_CAB = BIT(2),
+	ATH10K_SKB_F_MGMT = BIT(3),
 };
 
 struct ath10k_skb_cb {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 07b67c9132f6..2f99552acad4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3685,6 +3685,9 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	if (!ath10k_tx_h_use_hwcrypto(vif, skb))
 		skb_cb->flags |= ATH10K_SKB_F_NO_HWCRYPT;
 
+	if (ieee80211_is_mgmt(hdr->frame_control))
+		skb_cb->flags |= ATH10K_SKB_F_MGMT;
+
 	skb_cb->htt.tid = ath10k_tx_h_get_tid(hdr);
 	skb_cb->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
 
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 655947bef6cc..f3bbe41f3ff7 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -57,8 +57,6 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	struct ieee80211_tx_info *info;
 	struct ath10k_skb_cb *skb_cb;
 	struct sk_buff *msdu;
-	struct ieee80211_hdr *hdr;
-	__le16 fc;
 	bool limit_mgmt_desc = false;
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
@@ -81,10 +79,9 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 		return;
 	}
 
-	hdr = (struct ieee80211_hdr *)msdu->data;
-	fc = hdr->frame_control;
+	skb_cb = ATH10K_SKB_CB(msdu);
 
-	if (unlikely(ieee80211_is_mgmt(fc)) &&
+	if (unlikely(skb_cb->flags & ATH10K_SKB_F_MGMT) &&
 	    ar->hw_params.max_probe_resp_desc_thres)
 		limit_mgmt_desc = true;
 
@@ -94,7 +91,6 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 		wake_up(&htt->empty_tx_wq);
 	spin_unlock_bh(&htt->tx_lock);
 
-	skb_cb = ATH10K_SKB_CB(msdu);
 	dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ath10k_report_offchan_tx(htt->ar, msdu);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
