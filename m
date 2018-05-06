Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFJg5-0005vI-Cn
 for ath10k@lists.infradead.org; Sun, 06 May 2018 13:26:14 +0000
Received: by mail-lf0-x242.google.com with SMTP id g12-v6so36895910lfb.10
 for <ath10k@lists.infradead.org>; Sun, 06 May 2018 06:26:00 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH] ath10k: fix return value check in wake_tx_q op
Date: Sun,  6 May 2018 15:25:00 +0200
Message-Id: <20180506132500.16888-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

ath10k_mac_tx_push_txq returns either a postive integer (length) on
success or a negative error code on error.

The "if (ret) break;" statement will thus always break out of the loop
immediately after ath10k_mac_tx_push_txq has returned (making the loop
pointless).

A side effect of this fix is that we will iterate the queue until
ath10k_mac_tx_push_txq returns -ENOENT. This will make sure the queue is
not added back to ar->txqs when it is empty. This could potentially
improve performance somewhat (I have seen a small improvement with SDIO
devices).

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3d7119ad7c7a..487a7a7380fd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4290,7 +4290,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 	while (ath10k_mac_tx_can_push(hw, f_txq) && max--) {
 		ret = ath10k_mac_tx_push_txq(hw, f_txq);
-		if (ret)
+		if (ret < 0)
 			break;
 	}
 	if (ret != -ENOENT)
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
