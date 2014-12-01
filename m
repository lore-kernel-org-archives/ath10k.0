Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvSEL-0007NB-SX
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 14:45:38 +0000
Subject: [PATCH v3 1/7] ath10k: create ath10k_core_init_features()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 1 Dec 2014 16:44:58 +0200
Message-ID: <20141201144458.18248.28568.stgit@potku.adurom.net>
In-Reply-To: <20141201144400.18248.62714.stgit@potku.adurom.net>
References: <20141201144400.18248.62714.stgit@potku.adurom.net>
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
 drivers/net/wireless/ath/ath10k/core.c |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7762061a1944..bd6315952ad0 100644
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
@@ -1046,7 +1047,12 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		return ret;
 	}
 
-	ath10k_core_init_max_sta_count(ar);
+	ret = ath10k_core_init_firmware_features(ar);
+	if (ret) {
+		ath10k_err(ar, "fatal problem with firmware features: %d\n",
+			   ret);
+		return ret;
+	}
 
 	mutex_lock(&ar->conf_mutex);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
