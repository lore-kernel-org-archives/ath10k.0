Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x234.google.com ([2a00:1450:4013:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD8mm-0002db-Ok
 for ath10k@lists.infradead.org; Tue, 11 Feb 2014 08:33:45 +0000
Received: by mail-ee0-f52.google.com with SMTP id e53so3440856eek.39
 for <ath10k@lists.infradead.org>; Tue, 11 Feb 2014 00:33:20 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: pass frames with invalid peer status to upper layer
Date: Tue, 11 Feb 2014 09:32:59 +0100
Message-Id: <1392107579-4289-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Pass frames with invalid peer status to upper layer.
Next mac80211 will validate frames and drop if required.
This is required to detect spurious frames and pass
this info to user mode (detect CLASS2 CLASS3 frames from
nonauthenticated/nonassociated stations).

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fe8bd1b..c7a5822 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -951,6 +951,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 			if (status != HTT_RX_IND_MPDU_STATUS_OK &&
 			    status != HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR &&
+			    status != HTT_RX_IND_MPDU_STATUS_ERR_INV_PEER &&
 			    !htt->ar->monitor_enabled) {
 				ath10k_dbg(ATH10K_DBG_HTT,
 					   "htt rx ignoring frame w/ status %d\n",
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
