Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDsYp-0000Tq-EL
 for ath10k@lists.infradead.org; Mon, 26 Aug 2013 08:54:08 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 4/4] ath10k: fix issues on non-preemptible systems
Date: Mon, 26 Aug 2013 10:53:25 +0200
Message-ID: <1377507205-5386-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Workers may not call into a sleepable function
(e.g. mutex_lock). Since ath10k workers can run
for a very long time it is necessary to explicitly
allow process rescheduling in case there's no
preemption.

This fixes some issues with system freezes, hangs,
watchdogs being triggered, userspace being
unresponsive on slow host machines under heavy
load.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c    |    4 ++++
 drivers/net/wireless/ath/ath10k/htt_rx.c |    4 ++++
 drivers/net/wireless/ath/ath10k/wmi.c    |    4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 7d445d3..99f1dbd 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -237,6 +237,10 @@ static void ath10k_htc_send_work(struct work_struct *work)
 		ret = ath10k_htc_issue_skb(htc, ep, skb, credits);
 		if (ret == -ENOSR)
 			break;
+
+#ifndef CONFIG_PREEMPT
+		cond_resched();
+#endif
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6cf4d95..80ea398 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1229,6 +1229,10 @@ static void ath10k_htt_rx_work(struct work_struct *work)
 			break;
 
 		ath10k_htt_rx_process_skb(htt->ar, skb);
+
+#ifndef CONFIG_PREEMPT
+		cond_resched();
+#endif
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 32fd5e7..f36f0be 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1155,6 +1155,10 @@ static void ath10k_wmi_event_work(struct work_struct *work)
 			break;
 
 		ath10k_wmi_event_process(ar, skb);
+
+#ifndef CONFIG_PREEMPT
+		cond_resched();
+#endif
 	}
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
