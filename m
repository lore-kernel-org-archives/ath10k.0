Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1BjE-0000so-HO
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 10:21:13 +0000
Subject: [PATCH v2 1/8] ath10k: set max_num_vdevs based on wmi op version
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 17 Dec 2014 12:20:45 +0200
Message-ID: <20141217102044.15964.60991.stgit@potku.adurom.net>
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

To make it easier to manage firmware differences, we should not use
ATH10K_FW_FEATURE_WMI_10X outside ath10k_core_init_firmware_features(). To
achieve that create new field ar->max_num_vdevs and set it based on wmi op
version.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    7 +++----
 drivers/net/wireless/ath/ath10k/core.h |    1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 577a3d76df22..f17366620fde 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -907,12 +907,14 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 	case ATH10K_FW_WMI_OP_VERSION_MAIN:
 		ar->max_num_peers = TARGET_NUM_PEERS;
 		ar->max_num_stations = TARGET_NUM_STATIONS;
+		ar->max_num_vdevs = TARGET_NUM_VDEVS;
 		ar->htt.max_num_pending_tx = TARGET_NUM_MSDU_DESC;
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_10_1:
 	case ATH10K_FW_WMI_OP_VERSION_10_2:
 		ar->max_num_peers = TARGET_10X_NUM_PEERS;
 		ar->max_num_stations = TARGET_10X_NUM_STATIONS;
+		ar->max_num_vdevs = TARGET_10X_NUM_VDEVS;
 		ar->htt.max_num_pending_tx = TARGET_10X_NUM_MSDU_DESC;
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_TLV:
@@ -1064,10 +1066,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 	if (status)
 		goto err_hif_stop;
 
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
-		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS) - 1;
-	else
-		ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;
+	ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;
 
 	INIT_LIST_HEAD(&ar->arvifs);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 613355cc6895..3998f1e33874 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -581,6 +581,7 @@ struct ath10k {
 
 	int max_num_peers;
 	int max_num_stations;
+	int max_num_vdevs;
 
 	struct work_struct offchan_tx_work;
 	struct sk_buff_head offchan_tx_queue;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
