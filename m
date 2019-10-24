Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNZou-00043j-7n
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 09:54:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/2] ath10k: sdio: remove struct ath10k_sdio_rx_data::status
Date: Thu, 24 Oct 2019 12:54:09 +0300
Message-Id: <1571910849-11489-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1571910849-11489-1-git-send-email-kvalo@codeaurora.org>
References: <1571910849-11489-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

It seems to be unused.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 2 --
 drivers/net/wireless/ath/ath10k/sdio.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index ef16b45c18da..ceeee465a73a 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -649,7 +649,6 @@ static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
 
 	htc_hdr = (struct ath10k_htc_hdr *)skb->data;
 	pkt->act_len = le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr);
-	pkt->status = ret;
 	skb_put(skb, pkt->act_len);
 
 	return ret;
@@ -687,7 +686,6 @@ static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
 		pkt->act_len = le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr);
 
 		skb_put_data(pkt->skb, htc_hdr, pkt->act_len);
-		pkt->status = 0;
 		pkt_offset += pkt->alloc_len;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index 9acaf0229cf2..33195f49acab 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -126,7 +126,6 @@ struct ath10k_sdio_rx_data {
 	bool part_of_bundle;
 	bool last_in_bundle;
 	bool trailer_only;
-	int status;
 };
 
 struct ath10k_sdio_irq_proc_regs {
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
