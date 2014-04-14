Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZbIA-0001p3-Aw
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 07:26:58 +0000
Received: by mail-ee0-f46.google.com with SMTP id t10so6212050eei.33
 for <ath10k@lists.infradead.org>; Mon, 14 Apr 2014 00:26:35 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 1/4] ath10k: make sure to not leak beacon dma mapping
Date: Mon, 14 Apr 2014 09:20:07 +0200
Message-Id: <1397460010-19153-2-git-send-email-michal.kazior@tieto.com>
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

If for some reason mac80211 wouldn't stop
beaconing gracefully and just removed interface of
a running AP/IBSS interface it was possible to
leak pending beacon DMA mapping. It's very
unlikely but better safe than sorry.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8385a7a..22e8239 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2771,6 +2771,9 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	spin_lock_bh(&ar->data_lock);
 	if (arvif->beacon) {
+		dma_unmap_single(arvif->ar->dev,
+				 ATH10K_SKB_CB(arvif->beacon)->paddr,
+				 arvif->beacon->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(arvif->beacon);
 		arvif->beacon = NULL;
 	}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
