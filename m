Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpQM-0004GU-08
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:08:07 +0000
Received: by mail-ee0-f47.google.com with SMTP id b15so1673745eek.34
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:07:41 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/4] ath10k: make sure to not use invalid beacon pointer
Date: Wed,  9 Apr 2014 12:01:23 +0200
Message-Id: <1397037685-7485-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
References: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
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
 drivers/net/wireless/ath/ath10k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index d4b48ef..35c7d52 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1441,6 +1441,8 @@ static void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 			dev_kfree_skb_any(arvif->beacon);
 		}
 
+		arvif->beacon = NULL;
+
 		ATH10K_SKB_CB(bcn)->paddr = dma_map_single(arvif->ar->dev,
 							   bcn->data, bcn->len,
 							   DMA_TO_DEVICE);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
