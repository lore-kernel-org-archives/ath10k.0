Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Co8-0001kX-7J
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:46:36 +0000
Received: by mail-wg0-f48.google.com with SMTP id x13so994727wgg.19
 for <ath10k@lists.infradead.org>; Thu, 10 Jul 2014 04:46:12 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFT/RFC 5/5] ath10k: rx, don't pass frames with invalid FCS
Date: Thu, 10 Jul 2014 13:45:14 +0200
Message-Id: <1404992714-15690-6-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Janusz Dziedzic <janusz.dziedzi@tieto.com>, denton.gentry@gmail.com

In case of bridged network, don't pass frames with
invalid FCS to the upper layer.

TODO: pass all frames in standalone monitor mode.

Signed-off-by: Janusz Dziedzic <janusz.dziedzi@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 702653e..efcee32 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1173,8 +1173,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 
 	if (status != HTT_RX_IND_MPDU_STATUS_OK &&
 	    status != HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR &&
-	    status != HTT_RX_IND_MPDU_STATUS_ERR_INV_PEER &&
-	    !htt->ar->monitor_started) {
+	    status != HTT_RX_IND_MPDU_STATUS_ERR_INV_PEER) {
 		ath10k_dbg(ATH10K_DBG_HTT,
 			   "htt rx ignoring frame w/ status %d\n",
 			   status);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
