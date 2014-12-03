Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw50s-0006z4-NW
 for ath10k@lists.infradead.org; Wed, 03 Dec 2014 08:10:19 +0000
Subject: [PATCH v4 1/8] ath10k: clean up error handling in
 ath10k_core_probe_fw()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 3 Dec 2014 10:09:31 +0200
Message-ID: <20141203080931.31187.15394.stgit@potku.adurom.net>
In-Reply-To: <20141203080803.31187.85059.stgit@potku.adurom.net>
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
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

Use the error handling style preferred in ath10k. Makes it easier to add
ath10k_init_firmware_features() function in the next patch.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7762061a1944..09784c68339b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1025,8 +1025,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	ret = ath10k_bmi_get_target_info(ar, &target_info);
 	if (ret) {
 		ath10k_err(ar, "could not get target info (%d)\n", ret);
-		ath10k_hif_power_down(ar);
-		return ret;
+		goto err_power_down;
 	}
 
 	ar->target_version = target_info.version;
@@ -1035,15 +1034,13 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	ret = ath10k_init_hw_params(ar);
 	if (ret) {
 		ath10k_err(ar, "could not get hw params (%d)\n", ret);
-		ath10k_hif_power_down(ar);
-		return ret;
+		goto err_power_down;
 	}
 
 	ret = ath10k_core_fetch_firmware_files(ar);
 	if (ret) {
 		ath10k_err(ar, "could not fetch firmware files (%d)\n", ret);
-		ath10k_hif_power_down(ar);
-		return ret;
+		goto err_power_down;
 	}
 
 	ath10k_core_init_max_sta_count(ar);
@@ -1053,10 +1050,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	ret = ath10k_core_start(ar, ATH10K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
 		ath10k_err(ar, "could not init core (%d)\n", ret);
-		ath10k_core_free_firmware_files(ar);
-		ath10k_hif_power_down(ar);
-		mutex_unlock(&ar->conf_mutex);
-		return ret;
+		goto err_unlock;
 	}
 
 	ath10k_print_driver_info(ar);
@@ -1066,6 +1060,16 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 
 	ath10k_hif_power_down(ar);
 	return 0;
+
+err_unlock:
+	mutex_unlock(&ar->conf_mutex);
+
+	ath10k_core_free_firmware_files(ar);
+
+err_power_down:
+	ath10k_hif_power_down(ar);
+
+	return ret;
 }
 
 static int ath10k_core_check_chip_id(struct ath10k *ar)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
