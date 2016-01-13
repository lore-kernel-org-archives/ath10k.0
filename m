Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJNes-00036N-Gm
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 15:48:27 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 4/7] ath10k: Rename few function names of firmware stats
Date: Wed, 13 Jan 2016 21:16:31 +0530
Message-ID: <1452699994-5078-5-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Prerequisite patch to address checkpatch errors for the next patch
in this series, this function names are bit too long, make it short

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 2bdf540..4fb1e0e 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -276,7 +276,7 @@ static const struct file_operations fops_wmi_services = {
 	.llseek = default_llseek,
 };
 
-static void ath10k_debug_fw_stats_pdevs_free(struct list_head *head)
+static void ath10k_fw_stats_pdevs_free(struct list_head *head)
 {
 	struct ath10k_fw_stats_pdev *i, *tmp;
 
@@ -286,7 +286,7 @@ static void ath10k_debug_fw_stats_pdevs_free(struct list_head *head)
 	}
 }
 
-static void ath10k_debug_fw_stats_vdevs_free(struct list_head *head)
+static void ath10k_fw_stats_vdevs_free(struct list_head *head)
 {
 	struct ath10k_fw_stats_vdev *i, *tmp;
 
@@ -296,7 +296,7 @@ static void ath10k_debug_fw_stats_vdevs_free(struct list_head *head)
 	}
 }
 
-static void ath10k_debug_fw_stats_peers_free(struct list_head *head)
+static void ath10k_fw_stats_peers_free(struct list_head *head)
 {
 	struct ath10k_fw_stats_peer *i, *tmp;
 
@@ -310,9 +310,9 @@ static void ath10k_debug_fw_stats_reset(struct ath10k *ar)
 {
 	spin_lock_bh(&ar->data_lock);
 	ar->debug.fw_stats_done = false;
-	ath10k_debug_fw_stats_pdevs_free(&ar->debug.fw_stats.pdevs);
-	ath10k_debug_fw_stats_vdevs_free(&ar->debug.fw_stats.vdevs);
-	ath10k_debug_fw_stats_peers_free(&ar->debug.fw_stats.peers);
+	ath10k_fw_stats_pdevs_free(&ar->debug.fw_stats.pdevs);
+	ath10k_fw_stats_vdevs_free(&ar->debug.fw_stats.vdevs);
+	ath10k_fw_stats_peers_free(&ar->debug.fw_stats.peers);
 	spin_unlock_bh(&ar->data_lock);
 }
 
@@ -391,9 +391,9 @@ free:
 	/* In some cases lists have been spliced and cleared. Free up
 	 * resources if that is not the case.
 	 */
-	ath10k_debug_fw_stats_pdevs_free(&stats.pdevs);
-	ath10k_debug_fw_stats_vdevs_free(&stats.vdevs);
-	ath10k_debug_fw_stats_peers_free(&stats.peers);
+	ath10k_fw_stats_pdevs_free(&stats.pdevs);
+	ath10k_fw_stats_vdevs_free(&stats.vdevs);
+	ath10k_fw_stats_peers_free(&stats.peers);
 
 	spin_unlock_bh(&ar->data_lock);
 }
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
