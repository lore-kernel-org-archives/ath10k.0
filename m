Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNZos-00042o-9n
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 09:54:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/2] ath10k: cosmetic cleanup to sdio files
Date: Thu, 24 Oct 2019 12:54:08 +0300
Message-Id: <1571910849-11489-1-git-send-email-kvalo@codeaurora.org>
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

Do some cosmetic cleanup while reviewing the files. No functional changes.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index c34637881219..ef16b45c18da 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -541,10 +541,8 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 	int pkt_cnt = 0;
 
 	if (n_lookaheads > ATH10K_SDIO_MAX_RX_MSGS) {
-		ath10k_warn(ar,
-			    "the total number of pkgs to be fetched (%u) exceeds maximum %u\n",
-			    n_lookaheads,
-			    ATH10K_SDIO_MAX_RX_MSGS);
+		ath10k_warn(ar, "the total number of pkgs to be fetched (%u) exceeds maximum %u\n",
+			    n_lookaheads, ATH10K_SDIO_MAX_RX_MSGS);
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -553,10 +551,8 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 		htc_hdr = (struct ath10k_htc_hdr *)&lookaheads[i];
 		last_in_bundle = false;
 
-		if (le16_to_cpu(htc_hdr->len) >
-		    ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH) {
-			ath10k_warn(ar,
-				    "payload length %d exceeds max htc length: %zu\n",
+		if (le16_to_cpu(htc_hdr->len) > ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH) {
+			ath10k_warn(ar, "payload length %d exceeds max htc length: %zu\n",
 				    le16_to_cpu(htc_hdr->len),
 				    ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH);
 			ret = -ENOMEM;
@@ -567,8 +563,7 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 		full_len = ath10k_sdio_calc_txrx_padded_len(ar_sdio, act_len);
 
 		if (full_len > ATH10K_SDIO_MAX_BUFFER_SIZE) {
-			ath10k_warn(ar,
-				    "rx buffer requested with invalid htc_hdr length (%d, 0x%x): %d\n",
+			ath10k_warn(ar, "rx buffer requested with invalid htc_hdr length (%d, 0x%x): %d\n",
 				    htc_hdr->eid, htc_hdr->flags,
 				    le16_to_cpu(htc_hdr->len));
 			ret = -EINVAL;
@@ -590,12 +585,14 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 							    &bndl_cnt);
 
 			if (ret) {
-				ath10k_warn(ar, "alloc_bundle error %d\n", ret);
+				ath10k_warn(ar, "failed to allocate a bundle: %d\n",
+					    ret);
 				goto err;
 			}
 
 			pkt_cnt += bndl_cnt;
-			/*Next buffer will be the last in the bundle */
+
+			/* next buffer will be the last in the bundle */
 			last_in_bundle = true;
 		}
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
