Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zw8jn-0008Na-3S
 for ath10k@lists.infradead.org; Tue, 10 Nov 2015 13:13:28 +0000
Received: by lbbcs9 with SMTP id cs9so14111496lbb.1
 for <ath10k@lists.infradead.org>; Tue, 10 Nov 2015 05:13:03 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/9] ath10k: rename function to adhere to naming convention
Date: Tue, 10 Nov 2015 14:10:48 +0100
Message-Id: <1447161055-2283-3-git-send-email-michal.kazior@tieto.com>
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

All functions should have ath10k_{filename}_
prefixes.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2eb647913a9f..374187e25f2d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3146,8 +3146,10 @@ static u8 ath10k_tx_h_get_vdev_id(struct ath10k *ar, struct ieee80211_vif *vif)
 }
 
 static enum ath10k_hw_txrx_mode
-ath10k_tx_h_get_txmode(struct ath10k *ar, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta, struct sk_buff *skb)
+ath10k_mac_tx_h_get_txmode(struct ath10k *ar,
+			   struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   struct sk_buff *skb)
 {
 	const struct ieee80211_hdr *hdr = (void *)skb->data;
 	__le16 fc = hdr->frame_control;
@@ -3660,7 +3662,8 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 	ATH10K_SKB_CB(skb)->htt.tid = ath10k_tx_h_get_tid(hdr);
 	ATH10K_SKB_CB(skb)->htt.nohwcrypt = !ath10k_tx_h_use_hwcrypto(vif, skb);
 	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
-	ATH10K_SKB_CB(skb)->txmode = ath10k_tx_h_get_txmode(ar, vif, sta, skb);
+	ATH10K_SKB_CB(skb)->txmode = ath10k_mac_tx_h_get_txmode(ar, vif, sta,
+								skb);
 
 	switch (ATH10K_SKB_CB(skb)->txmode) {
 	case ATH10K_HW_TXRX_MGMT:
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
