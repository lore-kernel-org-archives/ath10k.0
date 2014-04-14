Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZbIB-0001p8-4a
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 07:26:59 +0000
Received: by mail-ee0-f54.google.com with SMTP id d49so6301661eek.27
 for <ath10k@lists.infradead.org>; Mon, 14 Apr 2014 00:26:37 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 2/4] ath10k: make sure to not use invalid beacon pointer
Date: Mon, 14 Apr 2014 09:20:08 +0200
Message-Id: <1397460010-19153-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397460010-19153-1-git-send-email-michal.kazior@tieto.com>
References: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
 <1397460010-19153-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

If DMA mapping of next beacon failed it was
possible for next SWBA to access a pointer that
was already unmapped and freed. This could cause
memory corruption.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * move arvif->beacon=NULL after dev_kfree_skb() [Kalle]

 drivers/net/wireless/ath/ath10k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fe4d5f1..11176cc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1431,6 +1431,7 @@ static void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 					 ATH10K_SKB_CB(arvif->beacon)->paddr,
 					 arvif->beacon->len, DMA_TO_DEVICE);
 			dev_kfree_skb_any(arvif->beacon);
+			arvif->beacon = NULL;
 		}
 
 		ATH10K_SKB_CB(bcn)->paddr = dma_map_single(arvif->ar->dev,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
