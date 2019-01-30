Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gogHB-0006cS-K9
 for ath10k@lists.infradead.org; Wed, 30 Jan 2019 03:11:00 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH][RESEND] ath10k: snoc: remove set but not used variable
 'ar_snoc'
Date: Wed, 30 Jan 2019 11:09:00 +0800
Message-ID: <20190130030900.18764-1-yuehaibing@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_tx_pipe_cleanup':
drivers/net/wireless/ath/ath10k/snoc.c:681:22: warning:
 variable 'ar_snoc' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 54efe6b..b7493df 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -875,13 +875,11 @@ static void ath10k_snoc_tx_pipe_cleanup(struct ath10k_snoc_pipe *snoc_pipe)
 {
 	struct ath10k_ce_pipe *ce_pipe;
 	struct ath10k_ce_ring *ce_ring;
-	struct ath10k_snoc *ar_snoc;
 	struct sk_buff *skb;
 	struct ath10k *ar;
 	int i;
 
 	ar = snoc_pipe->hif_ce_state;
-	ar_snoc = ath10k_snoc_priv(ar);
 	ce_pipe = snoc_pipe->ce_hdl;
 	ce_ring = ce_pipe->src_ring;
 
-- 
2.7.4



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
