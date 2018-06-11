Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSSbi-0004PL-BX
 for ath10k@lists.infradead.org; Mon, 11 Jun 2018 19:36:04 +0000
Received: by mail-pf0-x244.google.com with SMTP id a12-v6so10775724pfi.3
 for <ath10k@lists.infradead.org>; Mon, 11 Jun 2018 12:35:50 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: snoc: use module_platform_driver() macro
Date: Mon, 11 Jun 2018 12:35:40 -0700
Message-Id: <20180611193540.190255-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

ath10k_snoc_init()/ath10k_snoc_exit() don't add much value;
module_platform_driver() can remove the boilerplate.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index a3a7042fe13a..ee74e0060504 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1388,25 +1388,7 @@ static struct platform_driver ath10k_snoc_driver = {
 			.of_match_table = ath10k_snoc_dt_match,
 		},
 };
-
-static int __init ath10k_snoc_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&ath10k_snoc_driver);
-	if (ret)
-		pr_err("failed to register ath10k snoc driver: %d\n",
-		       ret);
-
-	return ret;
-}
-module_init(ath10k_snoc_init);
-
-static void __exit ath10k_snoc_exit(void)
-{
-	platform_driver_unregister(&ath10k_snoc_driver);
-}
-module_exit(ath10k_snoc_exit);
+module_platform_driver(ath10k_snoc_driver);
 
 MODULE_AUTHOR("Qualcomm");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.18.0.rc1.242.g61856ae69a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
