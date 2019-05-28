Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVRpf-0002ii-Em
 for ath10k@lists.infradead.org; Tue, 28 May 2019 02:27:20 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: add report MIC error for sdio chip
Date: Tue, 28 May 2019 10:27:12 +0800
Message-Id: <1559010432-1005-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Firmware will report flag with HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR
if MIC error, the flag will be used in mac80211.

ieee80211_rx_h_michael_mic_verify will check the flag and start TKIP
countermeasures.

Now countermeasure tests pass both with WPA only and WPA2/WPA mixed
mode.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea27..c0b0061 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2101,7 +2101,9 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 			    num_mpdu_ranges);
 
 	if (mpdu_ranges->mpdu_range_status !=
-	    HTT_RX_IND_MPDU_STATUS_OK) {
+	    HTT_RX_IND_MPDU_STATUS_OK &&
+	    mpdu_ranges->mpdu_range_status !=
+	    HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR) {
 		ath10k_warn(ar, "MPDU range status: %d\n",
 			    mpdu_ranges->mpdu_range_status);
 		goto err;
@@ -2162,6 +2164,9 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 				   RX_FLAG_MMIC_STRIPPED;
 	}
 
+	if (mpdu_ranges->mpdu_range_status == HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR)
+		rx_status->flag |= RX_FLAG_MMIC_ERROR;
+
 	ieee80211_rx_ni(ar->hw, skb);
 
 	/* We have delivered the skb to the upper layers (mac80211) so we
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
