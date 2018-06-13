Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSzZu-0006FE-Kg
 for ath10k@lists.infradead.org; Wed, 13 Jun 2018 06:48:23 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Handle resource init failure case
Date: Wed, 13 Jun 2018 12:18:06 +0530
Message-Id: <20180613064806.32286-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Return type of resource init method is not assigned.
Handle resource init failures for graceful exit.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index aa8a9b36250e..a0504b8e003c 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1500,13 +1500,13 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 	ar_snoc->ce.bus_ops = &ath10k_snoc_bus_ops;
 	ar->ce_priv = &ar_snoc->ce;
 
-	ath10k_snoc_resource_init(ar);
+	ret = ath10k_snoc_resource_init(ar);
 	if (ret) {
 		ath10k_warn(ar, "failed to initialize resource: %d\n", ret);
 		goto err_core_destroy;
 	}
 
-	ath10k_snoc_setup_resource(ar);
+	ret = ath10k_snoc_setup_resource(ar);
 	if (ret) {
 		ath10k_warn(ar, "failed to setup resource: %d\n", ret);
 		goto err_core_destroy;
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
