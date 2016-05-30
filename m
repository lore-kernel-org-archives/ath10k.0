Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7MuZ-0006Hj-H7
 for ath10k@lists.infradead.org; Mon, 30 May 2016 13:07:16 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH] ath10k: enable ipq4019 device probe in ahb module
Date: Mon, 30 May 2016 18:41:23 +0530
Message-ID: <1464613883-24036-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

From: Raja Mani <rmani@qti.qualcomm.com>

All the necessary patches to make wifi running (over AHB)
on ipq4019 SoC are ready now. It's good to enable
ipq4019 wifi device probing in ahb module and
remove work in progress debug print.

Device tree change is there in the public review by
below commit message
"qcom: ipq4019: add wifi nodes to ipq4019 SoC device tree"

Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index bd62bc1..ce847bf 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -25,10 +25,9 @@
 #include "ahb.h"
 
 static const struct of_device_id ath10k_ahb_of_match[] = {
-	/* TODO: enable this entry once everything in place.
-	 * { .compatible = "qcom,ipq4019-wifi",
-	 *   .data = (void *)ATH10K_HW_QCA4019 },
-	 */
+	{ .compatible = "qcom,ipq4019-wifi",
+	  .data = (void *)ATH10K_HW_QCA4019
+	},
 	{ }
 };
 
@@ -918,8 +917,6 @@ int ath10k_ahb_init(void)
 {
 	int ret;
 
-	printk(KERN_ERR "AHB support is still work in progress\n");
-
 	ret = platform_driver_register(&ath10k_ahb_driver);
 	if (ret)
 		printk(KERN_ERR "failed to register ath10k ahb driver: %d\n",
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
