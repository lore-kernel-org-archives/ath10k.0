Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvSEM-0007NB-O4
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 14:45:39 +0000
Subject: [PATCH v3 3/7] ath10k: set max_num_pending_tx in
 ath10k_core_init_firmware_features()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 1 Dec 2014 16:45:34 +0200
Message-ID: <20141201144534.18248.51909.stgit@potku.adurom.net>
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

Better to have this in same place as other firmware interface handling.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c   |    2 ++
 drivers/net/wireless/ath/ath10k/htt_tx.c |    5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f8ddc8087db9..1170fd739675 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -824,11 +824,13 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 	case ATH10K_FW_WMI_OP_VERSION_MAIN:
 		ar->max_num_peers = TARGET_NUM_PEERS;
 		ar->max_num_stations = TARGET_NUM_STATIONS;
+		ar->htt.max_num_pending_tx = TARGET_NUM_MSDU_DESC;
 		break;
 	case ATH10K_FW_WMI_OP_VERSION_10_1:
 	case ATH10K_FW_WMI_OP_VERSION_10_2:
 		ar->max_num_peers = TARGET_10X_NUM_PEERS;
 		ar->max_num_stations = TARGET_10X_NUM_STATIONS;
+		ar->htt.max_num_pending_tx = TARGET_10X_NUM_MSDU_DESC;
 		break;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 4bc51d8a14a3..a1bda41fb543 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -93,11 +93,6 @@ int ath10k_htt_tx_alloc(struct ath10k_htt *htt)
 
 	spin_lock_init(&htt->tx_lock);
 
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, htt->ar->fw_features))
-		htt->max_num_pending_tx = TARGET_10X_NUM_MSDU_DESC;
-	else
-		htt->max_num_pending_tx = TARGET_NUM_MSDU_DESC;
-
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt tx max num pending tx %d\n",
 		   htt->max_num_pending_tx);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
