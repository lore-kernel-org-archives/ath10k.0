Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6J2d-0005CY-7i
 for ath10k@lists.infradead.org; Fri, 27 May 2016 14:47:12 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/5] ath10k: remove unused phy_mode_to_band
Date: Fri, 27 May 2016 20:15:56 +0530
Message-ID: <20160527144559.4053-2-rmanohar@qti.qualcomm.com>
In-Reply-To: <20160527144559.4053-1-rmanohar@qti.qualcomm.com>
References: <20160527144559.4053-1-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Remove unused inline function phy_mode_to_band.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 7bf1909402c0..3b35c7ab5680 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2183,34 +2183,6 @@ static void ath10k_htt_rx_tx_mode_switch_ind(struct ath10k *ar,
 	ath10k_mac_tx_push_pending(ar);
 }
 
-static inline enum nl80211_band phy_mode_to_band(u32 phy_mode)
-{
-	enum nl80211_band band;
-
-	switch (phy_mode) {
-	case MODE_11A:
-	case MODE_11NA_HT20:
-	case MODE_11NA_HT40:
-	case MODE_11AC_VHT20:
-	case MODE_11AC_VHT40:
-	case MODE_11AC_VHT80:
-		band = NL80211_BAND_5GHZ;
-		break;
-	case MODE_11G:
-	case MODE_11B:
-	case MODE_11GONLY:
-	case MODE_11NG_HT20:
-	case MODE_11NG_HT40:
-	case MODE_11AC_VHT20_2G:
-	case MODE_11AC_VHT40_2G:
-	case MODE_11AC_VHT80_2G:
-	default:
-		band = NL80211_BAND_2GHZ;
-	}
-
-	return band;
-}
-
 void ath10k_htt_htc_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 {
 	bool release;
-- 
2.8.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
