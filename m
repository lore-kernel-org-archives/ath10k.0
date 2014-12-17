Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1BjU-0000va-SF
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 10:21:29 +0000
Subject: [PATCH v2 3/8] ath10k: print ath10k wmi op version
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 17 Dec 2014 12:21:03 +0200
Message-ID: <20141217102103.15964.40410.stgit@potku.adurom.net>
In-Reply-To: <20141217101755.15964.2625.stgit@potku.adurom.net>
References: <20141217101755.15964.2625.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

The internal firmware version doesn't tell much to the user, it's more
informative to use that field to print the wmi op version.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 70a9599aeb7a..6ca24427e184 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -124,7 +124,7 @@ EXPORT_SYMBOL(ath10k_info);
 
 void ath10k_print_driver_info(struct ath10k *ar)
 {
-	ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d.%d.%d.%d cal %s max_sta %d\n",
+	ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d\n",
 		    ar->hw_params.name,
 		    ar->target_version,
 		    ar->chip_id,
@@ -132,10 +132,7 @@ void ath10k_print_driver_info(struct ath10k *ar)
 		    ar->fw_api,
 		    ar->htt.target_version_major,
 		    ar->htt.target_version_minor,
-		    ar->fw_version_major,
-		    ar->fw_version_minor,
-		    ar->fw_version_release,
-		    ar->fw_version_build,
+		    ar->wmi.op_version,
 		    ath10k_cal_mode_str(ar->cal_mode),
 		    ar->max_num_stations);
 	ath10k_info(ar, "debug %d debugfs %d tracing %d dfs %d testmode %d\n",


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
