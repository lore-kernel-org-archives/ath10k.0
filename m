Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvrH-0000Ux-VG
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 17:15:21 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [RFC 7/7] ath10k: Handle rx thread suspend and resume
Date: Tue, 21 Jul 2020 22:44:26 +0530
Message-Id: <1595351666-28193-8-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

During the system suspend or resume, the rx thread
also needs to be suspended or resume respectively.

Handle the rx thread as well during the system
suspend and resume.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 23 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |  5 ++++
 drivers/net/wireless/ath/ath10k/snoc.c | 44 +++++++++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4064fa2..b82b355 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -668,6 +668,27 @@ static unsigned int ath10k_core_get_fw_feature_str(char *buf,
 	return scnprintf(buf, buf_len, "%s", ath10k_core_fw_feature_str[feat]);
 }
 
+int ath10k_core_thread_suspend(struct ath10k_thread *thread)
+{
+	ath10k_dbg(thread->ar, ATH10K_DBG_BOOT, "Suspending thread %s\n",
+		   thread->name);
+	set_bit(ATH10K_THREAD_EVENT_SUSPEND, thread->event_flags);
+	wait_for_completion(&thread->suspend);
+
+	return 0;
+}
+EXPORT_SYMBOL(ath10k_core_thread_suspend);
+
+int ath10k_core_thread_resume(struct ath10k_thread *thread)
+{
+	ath10k_dbg(thread->ar, ATH10K_DBG_BOOT, "Resuming thread %s\n",
+		   thread->name);
+	complete(&thread->resume);
+
+	return 0;
+}
+EXPORT_SYMBOL(ath10k_core_thread_resume);
+
 void ath10k_core_thread_post_event(struct ath10k_thread *thread,
 				   enum ath10k_thread_events event)
 {
@@ -700,6 +721,8 @@ int ath10k_core_thread_init(struct ath10k *ar,
 
 	init_waitqueue_head(&thread->wait_q);
 	init_completion(&thread->shutdown);
+	init_completion(&thread->suspend);
+	init_completion(&thread->resume);
 	memcpy(thread->name, thread_name, ATH10K_THREAD_NAME_SIZE_MAX);
 	clear_bit(ATH10K_THREAD_EVENT_SHUTDOWN, thread->event_flags);
 	ath10k_info(ar, "Starting thread %s\n", thread_name);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 596d31b..df65e75 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -976,6 +976,7 @@ enum ath10k_thread_events {
 	ATH10K_THREAD_EVENT_SHUTDOWN,
 	ATH10K_THREAD_EVENT_RX_POST,
 	ATH10K_THREAD_EVENT_TX_POST,
+	ATH10K_THREAD_EVENT_SUSPEND,
 	ATH10K_THREAD_EVENT_MAX,
 };
 
@@ -983,6 +984,8 @@ struct ath10k_thread {
 	struct ath10k *ar;
 	struct task_struct *task;
 	struct completion shutdown;
+	struct completion suspend;
+	struct completion resume;
 	wait_queue_head_t wait_q;
 	DECLARE_BITMAP(event_flags, ATH10K_THREAD_EVENT_MAX);
 	char name[ATH10K_THREAD_NAME_SIZE_MAX];
@@ -1296,6 +1299,8 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
 
 extern unsigned long ath10k_coredump_mask;
 
+int ath10k_core_thread_suspend(struct ath10k_thread *thread);
+int ath10k_core_thread_resume(struct ath10k_thread *thread);
 void ath10k_core_thread_post_event(struct ath10k_thread *thread,
 				   enum ath10k_thread_events event);
 int ath10k_core_thread_shutdown(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 3eb5eac..a373b2b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -932,13 +932,31 @@ int ath10k_snoc_rx_thread_loop(void *data)
 					    rx_thread->event_flags) ||
 			 test_and_clear_bit(ATH10K_THREAD_EVENT_TX_POST,
 					    rx_thread->event_flags) ||
+			 test_bit(ATH10K_THREAD_EVENT_SUSPEND,
+				  rx_thread->event_flags) ||
 			 test_bit(ATH10K_THREAD_EVENT_SHUTDOWN,
 				  rx_thread->event_flags)));
 
+		if (test_and_clear_bit(ATH10K_THREAD_EVENT_SUSPEND,
+				       rx_thread->event_flags)) {
+			complete(&rx_thread->suspend);
+			ath10k_info(ar, "rx thread suspend\n");
+			wait_for_completion(&rx_thread->resume);
+			ath10k_info(ar, "rx thread resume\n");
+		}
+
 		ath10k_htt_txrx_compl_task(ar, thread_budget);
 		if (test_and_clear_bit(ATH10K_THREAD_EVENT_SHUTDOWN,
 				       rx_thread->event_flags))
 			shutdown = true;
+
+		if (test_and_clear_bit(ATH10K_THREAD_EVENT_SUSPEND,
+				       rx_thread->event_flags)) {
+			complete(&rx_thread->suspend);
+			ath10k_info(ar, "rx thread suspend\n");
+			wait_for_completion(&rx_thread->resume);
+			ath10k_info(ar, "rx thread resume\n");
+		}
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "rx thread exiting\n");
@@ -1133,15 +1151,30 @@ static int ath10k_snoc_hif_suspend(struct ath10k *ar)
 	if (!device_may_wakeup(ar->dev))
 		return -EPERM;
 
+	if (ar->rx_thread_enable) {
+		ret = ath10k_core_thread_suspend(&ar->rx_thread);
+		if (ret) {
+			ath10k_err(ar, "failed to suspend rx_thread, %d\n",
+				   ret);
+			return ret;
+		}
+	}
+
 	ret = enable_irq_wake(ar_snoc->ce_irqs[ATH10K_SNOC_WAKE_IRQ].irq_line);
 	if (ret) {
 		ath10k_err(ar, "failed to enable wakeup irq :%d\n", ret);
-		return ret;
+		goto fail;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc device suspended\n");
 
 	return ret;
+
+fail:
+	if (ar->rx_thread_enable)
+		ath10k_core_thread_resume(&ar->rx_thread);
+
+	return ret;
 }
 
 static int ath10k_snoc_hif_resume(struct ath10k *ar)
@@ -1158,6 +1191,15 @@ static int ath10k_snoc_hif_resume(struct ath10k *ar)
 		return ret;
 	}
 
+	if (ar->rx_thread_enable) {
+		ret = ath10k_core_thread_resume(&ar->rx_thread);
+		if (ret) {
+			ath10k_err(ar, "failed to suspend rx_thread, %d\n",
+				   ret);
+			return ret;
+		}
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc device resumed\n");
 
 	return ret;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
