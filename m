Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSkdL-0002TH-Tz
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 14:50:58 +0000
Date: Tue, 12 Jun 2018 22:50:37 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] ath10k: ath10k_snoc_get_ce_id_from_irq() can be static
Message-ID: <20180612145037.GA95182@lkp-ib03>
References: <20180612113907.15043-2-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180612113907.15043-2-niklas.cassel@linaro.org>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kbuild-all@01.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>


Fixes: aecf55e7df3a ("ath10k: allow ATH10K_SNOC with COMPILE_TEST")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 snoc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index a3a7042..92ddb1c 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -820,7 +820,7 @@ static const struct ath10k_bus_ops ath10k_snoc_bus_ops = {
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
