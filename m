Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtFij-0005Dc-IO
 for ath10k@lists.infradead.org; Mon, 02 Nov 2015 14:04:27 +0000
Received: by lfbn126 with SMTP id n126so61800701lfb.2
 for <ath10k@lists.infradead.org>; Mon, 02 Nov 2015 06:04:02 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/8] ath10k: merge is_protected with nohwcrypt
Date: Mon,  2 Nov 2015 15:03:01 +0100
Message-Id: <1446472988-2603-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
References: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
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

It was wasteful to have two flags describing
the same thing.

While at it fix code style of
ath10k_tx_h_use_hwcrypto().

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h   |  1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c |  3 ---
 drivers/net/wireless/ath/ath10k/mac.c    | 14 ++++++++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4a2301589902..64d9a63e6b48 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -86,7 +86,6 @@ struct ath10k_skb_cb {
 	u8 eid;
 	u8 vdev_id;
 	enum ath10k_hw_txrx_mode txmode;
-	bool is_protected;
 
 	struct {
 		u8 tid;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 16823970dbfd..eaa9263f6151 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -656,9 +656,6 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	if (skb_cb->htt.nohwcrypt)
 		flags0 |= HTT_DATA_TX_DESC_FLAGS0_NO_ENCRYPT;
 
-	if (!skb_cb->is_protected)
-		flags0 |= HTT_DATA_TX_DESC_FLAGS0_NO_ENCRYPT;
-
 	flags1 |= SM((u16)vdev_id, HTT_DATA_TX_DESC_FLAGS1_VDEV_ID);
 	flags1 |= SM((u16)tid, HTT_DATA_TX_DESC_FLAGS1_EXT_TID);
 	if (msdu->ip_summed == CHECKSUM_PARTIAL &&
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a7411fe90cc4..58230cd04174 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3190,14 +3190,22 @@ ath10k_tx_h_get_txmode(struct ath10k *ar, struct ieee80211_vif *vif,
 }
 
 static bool ath10k_tx_h_use_hwcrypto(struct ieee80211_vif *vif,
-				     struct sk_buff *skb) {
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+				     struct sk_buff *skb)
+{
+	const struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	const struct ieee80211_hdr *hdr = (void *)skb->data;
 	const u32 mask = IEEE80211_TX_INTFL_DONT_ENCRYPT |
 			 IEEE80211_TX_CTL_INJECTED;
+
+	if (!ieee80211_has_protected(hdr->frame_control))
+		return false;
+
 	if ((info->flags & mask) == mask)
 		return false;
+
 	if (vif)
 		return !ath10k_vif_to_arvif(vif)->nohwcrypt;
+
 	return true;
 }
 
@@ -3635,7 +3643,6 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	struct ieee80211_vif *vif = info->control.vif;
 	struct ieee80211_sta *sta = control->sta;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
-	__le16 fc = hdr->frame_control;
 
 	/* We should disable CCK RATE due to P2P */
 	if (info->flags & IEEE80211_TX_CTL_NO_CCK_RATE)
@@ -3647,7 +3654,6 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	ATH10K_SKB_CB(skb)->htt.nohwcrypt = !ath10k_tx_h_use_hwcrypto(vif, skb);
 	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
 	ATH10K_SKB_CB(skb)->txmode = ath10k_tx_h_get_txmode(ar, vif, sta, skb);
-	ATH10K_SKB_CB(skb)->is_protected = ieee80211_has_protected(fc);
 
 	switch (ATH10K_SKB_CB(skb)->txmode) {
 	case ATH10K_HW_TXRX_MGMT:
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
