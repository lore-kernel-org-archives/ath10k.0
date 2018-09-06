Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxuD3-0007et-5W
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 13:20:39 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Fix tx status flag setting for management frames
Date: Thu,  6 Sep 2018 18:50:14 +0530
Message-Id: <1536240014-10349-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

The tx_status for management frames is being filled
incorrectly in the flags of skb_cb. This incorrect
flag setting causes the upper layers to consider that
the particular frame was not transmitted properly,
leading to improper behavior.

Set the IEEE80211_TX_STAT_ACK flag in the info flags
of skb_cb, to indicate the successful transmission of
the management frame.

Fixes: dc405152bb64d4ae01c9ac669de25b2d1fb6fc2d

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fd612d2..1dced0d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2336,7 +2336,12 @@ static int wmi_process_mgmt_tx_comp(struct ath10k *ar, u32 desc_id,
 	dma_unmap_single(ar->dev, pkt_addr->paddr,
 			 msdu->len, DMA_FROM_DEVICE);
 	info = IEEE80211_SKB_CB(msdu);
-	info->flags |= status;
+
+	if (status)
+		info->flags &= ~IEEE80211_TX_STAT_ACK;
+	else
+		info->flags |= IEEE80211_TX_STAT_ACK;
+
 	ieee80211_tx_status_irqsafe(ar->hw, msdu);
 
 	ret = 0;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
