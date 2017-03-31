Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctvAc-0006cI-19
 for ath10k@lists.infradead.org; Fri, 31 Mar 2017 11:56:47 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Enable a HTC debug message during insufficient tx
 credits
Date: Fri, 31 Mar 2017 17:29:26 +0530
Message-ID: <1490961566-328-1-git-send-email-mohammed@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Add an ath10k HTC debug message when insufficient tx credits
are available to send the WMI commands. This is very useful
in debugging issues like 'tx credit starvation' that could
possibly happen with multiclient setup with constant roaming

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 9f6a915..f56f604 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -119,6 +119,9 @@ int ath10k_htc_send(struct ath10k_htc *htc,
 		credits = DIV_ROUND_UP(skb->len, htc->target_credit_size);
 		spin_lock_bh(&htc->tx_lock);
 		if (ep->tx_credits < credits) {
+			ath10k_dbg(ar, ATH10K_DBG_HTC,
+				   "htc insufficient credits ep %d required %d available %d\n",
+				   eid, credits, ep->tx_credits);
 			spin_unlock_bh(&htc->tx_lock);
 			ret = -EAGAIN;
 			goto err_pull;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
