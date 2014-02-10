Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCtVq-0001ay-Lx
 for ath10k@lists.infradead.org; Mon, 10 Feb 2014 16:15:15 +0000
Received: by mail-ea0-f175.google.com with SMTP id n15so341738ead.34
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 08:14:53 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH 2/3] ath10k: refactor suspend/resume functions
Date: Mon, 10 Feb 2014 17:14:23 +0100
Message-Id: <1392048864-13352-3-git-send-email-marek.puzyniak@tieto.com>
In-Reply-To: <1392048864-13352-1-git-send-email-marek.puzyniak@tieto.com>
References: <1392048864-13352-1-git-send-email-marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org

Suspend/resume callbacks are not protected by configuration mutex
so adding such protection. Also in order to simplify implemetation
of suspend function wait queue is replaced by completion.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  6 ++----
 drivers/net/wireless/ath/ath10k/core.h |  3 +--
 drivers/net/wireless/ath/ath10k/mac.c  | 39 ++++++++++++++++++++++------------
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 56048b1..0d161cf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -55,8 +55,7 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
 {
 	ath10k_dbg(ATH10K_DBG_BOOT, "boot suspend complete\n");
 
-	ar->is_target_paused = true;
-	wake_up(&ar->event_queue);
+	complete(&ar->target_suspend);
 }
 
 static int ath10k_init_connect_htc(struct ath10k *ar)
@@ -703,6 +702,7 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 	init_completion(&ar->scan.started);
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
+	init_completion(&ar->target_suspend);
 
 	init_completion(&ar->install_key_done);
 	init_completion(&ar->vdev_setup_done);
@@ -726,8 +726,6 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 	INIT_WORK(&ar->wmi_mgmt_tx_work, ath10k_mgmt_over_wmi_tx_work);
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
 
-	init_waitqueue_head(&ar->event_queue);
-
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
 
 	return ar;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c0b00e1..4f7ff9b 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -375,8 +375,7 @@ struct ath10k {
 		const struct ath10k_hif_ops *ops;
 	} hif;
 
-	wait_queue_head_t event_queue;
-	bool is_target_paused;
+	struct completion target_suspend;
 
 	struct ath10k_bmi bmi;
 	struct ath10k_wmi wmi;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 144b4d6..751284b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3440,21 +3440,20 @@ static int ath10k_suspend(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	int ret;
 
-	ar->is_target_paused = false;
+	mutex_lock(&ar->conf_mutex);
+
+	reinit_completion(&ar->target_suspend);
 
 	ret = ath10k_wmi_pdev_suspend_target(ar);
 	if (ret) {
 		ath10k_warn("could not suspend target (%d)\n", ret);
-		return 1;
+		ret = 1;
+		goto exit;
 	}
 
-	ret = wait_event_interruptible_timeout(ar->event_queue,
-					       ar->is_target_paused == true,
-					       1 * HZ);
-	if (ret < 0) {
-		ath10k_warn("suspend interrupted (%d)\n", ret);
-		goto resume;
-	} else if (ret == 0) {
+	ret = wait_for_completion_timeout(&ar->target_suspend, 1 * HZ);
+
+	if (ret == 0) {
 		ath10k_warn("suspend timed out - target pause event never came\n");
 		goto resume;
 	}
@@ -3465,12 +3464,17 @@ static int ath10k_suspend(struct ieee80211_hw *hw,
 		goto resume;
 	}
 
-	return 0;
+	ret = 0;
+	goto exit;
 resume:
 	ret = ath10k_wmi_pdev_resume_target(ar);
 	if (ret)
 		ath10k_warn("could not resume target (%d)\n", ret);
-	return 1;
+
+	ret = 1;
+exit:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
 }
 
 static int ath10k_resume(struct ieee80211_hw *hw)
@@ -3478,19 +3482,26 @@ static int ath10k_resume(struct ieee80211_hw *hw)
 	struct ath10k *ar = hw->priv;
 	int ret;
 
+	mutex_lock(&ar->conf_mutex);
+
 	ret = ath10k_hif_resume(ar);
 	if (ret) {
 		ath10k_warn("could not resume hif (%d)\n", ret);
-		return 1;
+		ret = 1;
+		goto exit;
 	}
 
 	ret = ath10k_wmi_pdev_resume_target(ar);
 	if (ret) {
 		ath10k_warn("could not resume target (%d)\n", ret);
-		return 1;
+		ret = 1;
+		goto exit;
 	}
 
-	return 0;
+	ret = 0;
+exit:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
 }
 #endif
 
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
