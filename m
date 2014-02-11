Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD80i-0001Wk-Bi
 for ath10k@lists.infradead.org; Tue, 11 Feb 2014 07:44:04 +0000
Received: by mail-ee0-f46.google.com with SMTP id c13so3385846eek.19
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 23:43:42 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: remove excessive rx msdu len check
Date: Tue, 11 Feb 2014 08:37:06 +0100
Message-Id: <1392104226-12096-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This throw a lot of pointless warnings in case of DFS (radar
detection) and PHYERR events from firmware, when firmware may
actually insert more data, than we assume.

Besides of being noisy this debug does not protect or check
anything usefull currently. It was introduced long time ago
while debugging aggregations. So just removing it.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fe8bd1b..f57f5cf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -430,12 +430,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 			msdu_chaining = 1;
 		}
 
-		if (msdu_len > 0) {
-			/* This may suggest FW bug? */
-			ath10k_warn("htt rx msdu len not consumed (%d)\n",
-				    msdu_len);
-		}
-
 		last_msdu = __le32_to_cpu(rx_desc->msdu_end.info0) &
 				RX_MSDU_END_INFO0_LAST_MSDU;
 
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
