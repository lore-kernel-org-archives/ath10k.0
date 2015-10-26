Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqdz2-0007a2-UO
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 09:22:29 +0000
Received: by pacfa8 with SMTP id fa8so4148199pac.0
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 02:22:07 -0700 (PDT)
From: manikanta.pubbisetty@gmail.com
Subject: [PATCH] ath10k: update antenna configuration after setting in fw
Date: Mon, 26 Oct 2015 14:52:10 +0530
Message-Id: <1445851330-18736-1-git-send-email-manikanta.pubbisetty@gmail.com>
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
Cc: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>

Updating tx/rx antenna configuration in ath10k is done even before
it is set in target. If setting of the tx/rx antenna config fails then
we will maintain incorrect configuration in ath10k and APIs like
get_antenna will provide incorrect information.

This patch updates the antenna configuration in ath10k after it is set
successfully in target.

Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 484c1a1..8d0ce37 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3771,9 +3771,6 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
 	ath10k_check_chain_mask(ar, tx_ant, "tx");
 	ath10k_check_chain_mask(ar, rx_ant, "rx");
 
-	ar->cfg_tx_chainmask = tx_ant;
-	ar->cfg_rx_chainmask = rx_ant;
-
 	if ((ar->state != ATH10K_STATE_ON) &&
 	    (ar->state != ATH10K_STATE_RESTARTED))
 		return 0;
@@ -3794,6 +3791,9 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
 		return ret;
 	}
 
+	ar->cfg_tx_chainmask = tx_ant;
+	ar->cfg_rx_chainmask = rx_ant;
+
 	return 0;
 }
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
