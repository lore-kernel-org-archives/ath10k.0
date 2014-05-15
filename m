Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wl0V1-0007ue-AI
 for ath10k@lists.infradead.org; Thu, 15 May 2014 18:35:23 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  fix rssi reporting.
Date: Thu, 15 May 2014 11:34:54 -0700
Message-Id: <1400178894-26206-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

When the driver cannot provide proper rssi, mark
status with RX_FLAG_NO_SIGNAL_VAL so that stack
properly ignores it.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

Patch is against my tree, hopefully will apply OK against upstream
but have not tested that yet.

 drivers/net/wireless/ath/ath10k/htt_rx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 0c83ffb..d8ec8dd 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1216,11 +1216,12 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
 
 	/* Fill this once, while this is per-ppdu */
-	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID) {
-		memset(rx_status, 0, sizeof(*rx_status));
+	memset(rx_status, 0, sizeof(*rx_status));
+	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID)
 		rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR +
 				     rx->ppdu.combined_rssi;
-	}
+	else
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 
 	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_END_VALID) {
 		/* TSF available only in 32-bit */
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
