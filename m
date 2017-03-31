Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctv9t-0006St-3O
 for ath10k@lists.infradead.org; Fri, 31 Mar 2017 11:56:06 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: cancel coverage class work during stop and restart
Date: Fri, 31 Mar 2017 17:28:41 +0530
Message-ID: <1490961521-32746-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

It seems set_coverage_class_work is not cancelled anywhere,
though I could not find a crash/warning  with this existing
design, its safer to cancel it during stop() and also before
restarting the hardware.

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
[comments updated, thanks Kalle]

 drivers/net/wireless/ath/ath10k/core.c | 7 +++++++
 drivers/net/wireless/ath/ath10k/mac.c  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index ba8768d..e653717 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1610,6 +1610,13 @@ static void ath10k_core_restart(struct work_struct *work)
 	wake_up(&ar->wmi.tx_credits_wq);
 	wake_up(&ar->peer_mapping_wq);
 
+	/* TODO: We can have one instance of cancelling coverage_class_work by
+	 * moving it to ath10k_halt(), so that both stop() and restart() would
+	 * call that but it takes conf_mutex() and if we call cancel_work_sync()
+	 * with conf_mutex it will deadlock.
+	 */
+	cancel_work_sync(&ar->set_coverage_class_work);
+
 	mutex_lock(&ar->conf_mutex);
 
 	switch (ar->state) {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3029f25..6470ed3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4684,6 +4684,7 @@ static void ath10k_stop(struct ieee80211_hw *hw)
 	}
 	mutex_unlock(&ar->conf_mutex);
 
+	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
