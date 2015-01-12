Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAksP-0005Zr-91
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 19:42:13 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/8] ath10k: scan should handle scan-start-failed event
 properly.
Date: Mon, 12 Jan 2015 11:41:42 -0800
Message-Id: <1421091709-19891-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

In case firmware fails to start the scan, then complete
the start condition and clean up so that driver does not
block on timeout.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 249107d..924879f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2375,6 +2375,17 @@ static int ath10k_start_scan(struct ath10k *ar,
 		return -ETIMEDOUT;
 	}
 
+	/* If we failed to start the scan, return error code at
+	 * this point.  This is probably due to some issue in the
+	 * firmware, but no need to wedge the driver due to that...
+	 */
+	spin_lock_bh(&ar->data_lock);
+	if (ar->scan.state == ATH10K_SCAN_IDLE) {
+		spin_unlock_bh(&ar->data_lock);
+		return -EINVAL;
+	}
+	spin_unlock_bh(&ar->data_lock);
+
 	/* Add a 200ms margin to account for event/command processing */
 	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
 				     msecs_to_jiffies(arg->max_scan_time+200));
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6e4ece0..203bcb9 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -916,6 +916,25 @@ static void ath10k_wmi_event_scan_started(struct ath10k *ar)
 	}
 }
 
+static void ath10k_wmi_event_scan_start_failed(struct ath10k *ar)
+{
+	lockdep_assert_held(&ar->data_lock);
+
+	switch (ar->scan.state) {
+	case ATH10K_SCAN_IDLE:
+	case ATH10K_SCAN_RUNNING:
+	case ATH10K_SCAN_ABORTING:
+		ath10k_warn(ar, "received scan start failed event in an invalid scan state: %s (%d)\n",
+			    ath10k_scan_state_str(ar->scan.state),
+			    ar->scan.state);
+		break;
+	case ATH10K_SCAN_STARTING:
+		complete(&ar->scan.started);
+		__ath10k_scan_finish(ar);
+		break;
+	}
+}
+
 static void ath10k_wmi_event_scan_completed(struct ath10k *ar)
 {
 	lockdep_assert_held(&ar->data_lock);
@@ -1057,6 +1076,7 @@ static int ath10k_wmi_event_scan(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	case WMI_SCAN_EVENT_START_FAILED:
 		ath10k_warn(ar, "received scan start failure event\n");
+		ath10k_wmi_event_scan_start_failed(ar);
 		break;
 	case WMI_SCAN_EVENT_DEQUEUED:
 	case WMI_SCAN_EVENT_PREEMPTED:
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
