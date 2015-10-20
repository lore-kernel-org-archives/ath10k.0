Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zobia-0004A4-4t
 for ath10k@lists.infradead.org; Tue, 20 Oct 2015 18:33:04 +0000
Received: by pacik9 with SMTP id ik9so2880428pac.3
 for <ath10k@lists.infradead.org>; Tue, 20 Oct 2015 11:32:43 -0700 (PDT)
From: manikanta.pubbisetty@gmail.com
Subject: [PATCH] ath10k: consolidate if statements in ath10k_wmi_event_mgmt_rx
Date: Tue, 20 Oct 2015 11:32:46 +0530
Message-Id: <1445320966-17024-1-git-send-email-manikanta.pubbisetty@gmail.com>
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

This patch combines several if statements into a single if condition
in WMI management rx handler. Found during code review.

Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6e7d7a7..a9d42ef 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2200,22 +2200,9 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	ath10k_dbg(ar, ATH10K_DBG_MGMT,
 		   "event mgmt rx status %08x\n", rx_status);
 
-	if (test_bit(ATH10K_CAC_RUNNING, &ar->dev_flags)) {
-		dev_kfree_skb(skb);
-		return 0;
-	}
-
-	if (rx_status & WMI_RX_STATUS_ERR_DECRYPT) {
-		dev_kfree_skb(skb);
-		return 0;
-	}
-
-	if (rx_status & WMI_RX_STATUS_ERR_KEY_CACHE_MISS) {
-		dev_kfree_skb(skb);
-		return 0;
-	}
-
-	if (rx_status & WMI_RX_STATUS_ERR_CRC) {
+	if ((test_bit(ATH10K_CAC_RUNNING, &ar->dev_flags)) ||
+	    (rx_stats & (WMI_RX_STATUS_ERR_DECRYPT |
+	    WMI_RX_STATUS_ERR_KEY_CACHE_MISS | WMI_RX_STATUS_ERR_CRC))) {
 		dev_kfree_skb(skb);
 		return 0;
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
