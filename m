Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1josXG-0006cT-Bz
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 17:53:13 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Register shutdown handler
Date: Fri, 26 Jun 2020 23:23:01 +0530
Message-Id: <1593193981-30161-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

As a part of device shutdown the smmu driver will be
stopped and henceforth any IOVA address translation
will not be done. The wlan driver, being one of the
smmu driver consumer, should stop all the dma related
activity as a part of shutdown, and thereby ensuring
that no dma activity is done once the smmu driver
shuts down.

During the device shutdown, the smmu calls shutdown
for all its consumers in order to indicate them to
stop all their dma activities.

Register the shutdown handler to stop the wlan
driver and avoid any dma operations.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 354d49b..645ed5f 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1772,9 +1772,18 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void ath10k_snoc_shutdown(struct platform_device *pdev)
+{
+	struct ath10k *ar = platform_get_drvdata(pdev);
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc shutdown\n");
+	ath10k_snoc_remove(pdev);
+}
+
 static struct platform_driver ath10k_snoc_driver = {
 	.probe  = ath10k_snoc_probe,
 	.remove = ath10k_snoc_remove,
+	.shutdown =  ath10k_snoc_shutdown,
 	.driver = {
 		.name   = "ath10k_snoc",
 		.of_match_table = ath10k_snoc_dt_match,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
