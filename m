Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2r8v-0007Is-0d
 for ath10k@lists.infradead.org; Thu, 20 Sep 2018 05:04:48 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Move napi_enable to hif_start for consistent
 pairing
Date: Thu, 20 Sep 2018 10:34:25 +0530
Message-Id: <20180920050426.4113-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

There is unbalanced napi_{enable,disable}() behavior as they
are being called from hif_snoc_{power_up/stop).

The fix is to call napi_enable() from ath10k_snoc_hif_start()
so that it matches with napi_disable() being called from
ath10k_snoc_hif_stop().

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ed52a6308f76..dd043b858c8e 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -919,6 +919,7 @@ static void ath10k_snoc_hif_stop(struct ath10k *ar)
 
 static int ath10k_snoc_hif_start(struct ath10k *ar)
 {
+	napi_enable(&ar->napi);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
 
@@ -1017,7 +1018,6 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar)
 		goto err_wlan_enable;
 	}
 
-	napi_enable(&ar->napi);
 	return 0;
 
 err_wlan_enable:
-- 
2.18.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
