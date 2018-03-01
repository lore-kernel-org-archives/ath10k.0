Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erCTh-0006fO-SD
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 00:53:47 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Clear rx status enc_flags
Date: Wed, 28 Feb 2018 16:53:27 -0800
Message-Id: <1519865607-3602-1-git-send-email-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

Otherwise, rx rate encodings are wrong as SGI flag may be set
when it should not be.  Maybe other issues as well.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 83eb7b2..8446dfc 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -901,6 +901,7 @@ static void ath10k_htt_rx_h_ppdu(struct ath10k *ar,
 		status->rate_idx = 0;
 		status->nss = 0;
 		status->encoding = RX_ENC_LEGACY;
+		status->enc_flags = 0;
 		status->bw = RATE_INFO_BW_20;
 		status->flag &= ~RX_FLAG_MACTIME_END;
 		status->flag |= RX_FLAG_NO_SIGNAL_VAL;
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
