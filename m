Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z31vb-0007KG-8T
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 12:49:54 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH] ath10k: remove unused variable hdr in
 ath10k_htt_rx_h_undecap()
Date: Thu, 11 Jun 2015 18:18:47 +0530
Message-ID: <1434026927-11698-1-git-send-email-rmani@qti.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>, ath10k@lists.infradead.org

Just found this during code review.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 89eb16b..7399e45 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1201,7 +1201,6 @@ static void ath10k_htt_rx_h_undecap(struct ath10k *ar,
 {
 	struct htt_rx_desc *rxd;
 	enum rx_msdu_decap_format decap;
-	struct ieee80211_hdr *hdr;
 
 	/* First msdu's decapped header:
 	 * [802.11 header] <-- padded to 4 bytes long
@@ -1215,7 +1214,6 @@ static void ath10k_htt_rx_h_undecap(struct ath10k *ar,
 	 */
 
 	rxd = (void *)msdu->data - sizeof(*rxd);
-	hdr = (void *)rxd->rx_hdr_status;
 	decap = MS(__le32_to_cpu(rxd->msdu_start.info1),
 		   RX_MSDU_START_INFO1_DECAP_FORMAT);
 
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
