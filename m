Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9CuY-0003df-L8
 for ath10k@lists.infradead.org; Wed, 27 Mar 2019 18:04:28 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.0 079/262] ath10k: don't report unset rssi values to
 mac80211
Date: Wed, 27 Mar 2019 13:58:54 -0400
Message-Id: <20190327180158.10245-79-sashal@kernel.org>
In-Reply-To: <20190327180158.10245-1-sashal@kernel.org>
References: <20190327180158.10245-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, Alagu Sankar <alagusankar@silex-india.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Alagu Sankar <alagusankar@silex-india.com>

[ Upstream commit 7d444522303177f3a3c09b9abb104ddeea470a70 ]

The SDIO firmware does not provide RSSI value to the host, it's only set to
zero. In that case don't report the value to mac80211. One risk here is that
value zero might be a valid value with other firmware, currently there's no way
to detect that.

Without the fix, the rssi value indicated by iw changes between the actual
value and -95.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00005-QCARMSWP-1.

Co-developed-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f42bac204ef8..ecf34ce7acf0 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2130,9 +2130,15 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 	hdr = (struct ieee80211_hdr *)skb->data;
 	rx_status = IEEE80211_SKB_RXCB(skb);
 	rx_status->chains |= BIT(0);
-	rx_status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
-			    rx->ppdu.combined_rssi;
-	rx_status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
+	if (rx->ppdu.combined_rssi == 0) {
+		/* SDIO firmware does not provide signal */
+		rx_status->signal = 0;
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
+	} else {
+		rx_status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
+			rx->ppdu.combined_rssi;
+		rx_status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
+	}
 
 	spin_lock_bh(&ar->data_lock);
 	ch = ar->scan_channel;
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
