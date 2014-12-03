Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw50y-0007Pu-LB
 for ath10k@lists.infradead.org; Wed, 03 Dec 2014 08:10:25 +0000
Subject: [PATCH v4 2/8] ath10k: create ath10k_core_init_features()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 3 Dec 2014 10:09:59 +0200
Message-ID: <20141203080958.31187.62552.stgit@potku.adurom.net>
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

It's easier to manage firmware version differences when we configure them in
one place. Rename ath10k_core_init_max_sta_count() to
ath10k_core_init_firmware_features() and start moving most of the firmware
version ("features") handling to that function.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 09784c68339b..05ca1b6ac704 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -582,13 +582,6 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 		goto err;
 	}
 
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features) &&
-	    !test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
-		ath10k_err(ar, "feature bits corrupted: 10.2 feature requires 10.x feature to be set as well");
-		ret = -EINVAL;
-		goto err;
-	}
-
 	/* now fetch the board file */
 	if (ar->hw_params.fw.board == NULL) {
 		ath10k_err(ar, "board data file not defined");
@@ -799,8 +792,14 @@ static void ath10k_core_restart(struct work_struct *work)
 	mutex_unlock(&ar->conf_mutex);
 }
 
-static void ath10k_core_init_max_sta_count(struct ath10k *ar)
+static int ath10k_core_init_firmware_features(struct ath10k *ar)
 {
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features) &&
+	    !test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
+		ath10k_err(ar, "feature bits corrupted: 10.2 feature requires 10.x feature to be set as well");
+		return -EINVAL;
+	}
+
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
 		ar->max_num_peers = TARGET_10X_NUM_PEERS;
 		ar->max_num_stations = TARGET_10X_NUM_STATIONS;
@@ -808,6 +807,8 @@ static void ath10k_core_init_max_sta_count(struct ath10k *ar)
 		ar->max_num_peers = TARGET_NUM_PEERS;
 		ar->max_num_stations = TARGET_NUM_STATIONS;
 	}
+
+	return 0;
 }
 
 int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
@@ -1043,7 +1044,12 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		goto err_power_down;
 	}
 
-	ath10k_core_init_max_sta_count(ar);
+	ret = ath10k_core_init_firmware_features(ar);
+	if (ret) {
+		ath10k_err(ar, "fatal problem with firmware features: %d\n",
+			   ret);
+		goto err_free_firmware_files;
+	}
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -1064,6 +1070,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 err_unlock:
 	mutex_unlock(&ar->conf_mutex);
 
+err_free_firmware_files:
 	ath10k_core_free_firmware_files(ar);
 
 err_power_down:


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
