Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [45.249.212.32] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fODIa-0001SV-8k
 for ath10k@lists.infradead.org; Thu, 31 May 2018 02:26:46 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH net-next] ath10k: make some functions static
Date: Thu, 31 May 2018 02:33:14 +0000
Message-ID: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

Fixes the following sparse warnings:

drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
 symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
 symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 47a4d2a..c82bc6f 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -820,7 +820,7 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar)
 	.write32	= ath10k_snoc_write32,
 };
 
-int ath10k_snoc_get_ce_id_from_irq(struct ath10k *ar, int irq)
+static int ath10k_snoc_get_ce_id_from_irq(struct ath10k *ar, int irq)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	int i;
@@ -868,7 +868,7 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 	return done;
 }
 
-void ath10k_snoc_init_napi(struct ath10k *ar)
+static void ath10k_snoc_init_napi(struct ath10k *ar)
 {
 	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll,
 		       ATH10K_NAPI_BUDGET);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
