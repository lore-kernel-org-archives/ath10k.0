Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHJFQ-00089t-Pd
 for ath10k@lists.infradead.org; Sat, 12 May 2018 01:22:58 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath10k: Add support to configure channel dwell time
Date: Fri, 11 May 2018 18:22:39 -0700
Message-Id: <1526088159-29912-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Configure channel dwell time from duration of the scan request
received from mac80211 when the duration is non-zero. When the
scan request does not have duration value, use the default ones,
the current implementation.

Corresponding flag NL80211_EXT_FEATURE_SET_SCAN_DWELL is
advertized.

Supported Chipsets:
 -QCA988X/QCA9887 PCI
 -QCA99X0/QCA9984/QCA9888/QCA4019 PCI
 -QCA6174/QCA9377 PCI/USB/SDIO
 -WCN3990 SNOC

Tested on QCA9984 with firmware ver 10.4-3.6-0010

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 23 ++++++++++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c17d805..39d4d7d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -44,6 +44,7 @@
 #define WO(_f)      ((_f##_OFFSET) >> 2)
 
 #define ATH10K_SCAN_ID 0
+#define ATH10K_SCAN_CHANNEL_SWITCH_WMI_EVT_OVERHEAD 10 /* msec */
 #define WMI_READY_TIMEOUT (5 * HZ)
 #define ATH10K_FLUSH_TIMEOUT_HZ (5 * HZ)
 #define ATH10K_CONNECTION_LOSS_HZ (3 * HZ)
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bf05a36..c6828c7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5668,6 +5668,7 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 	struct wmi_start_scan_arg arg;
 	int ret = 0;
 	int i;
+	u32 scan_timeout;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -5723,6 +5724,22 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 			arg.channels[i] = req->channels[i]->center_freq;
 	}
 
+	/* if duration is set, default dwell times will be overwritten */
+	if (req->duration) {
+		arg.dwell_time_active = req->duration;
+		arg.dwell_time_passive = req->duration;
+		arg.burst_duration_ms = req->duration;
+
+		scan_timeout = min_t(u32, arg.max_rest_time *
+				(arg.n_channels - 1) + (req->duration +
+				ATH10K_SCAN_CHANNEL_SWITCH_WMI_EVT_OVERHEAD) *
+				arg.n_channels, arg.max_scan_time + 200);
+
+	} else {
+		/* Add a 200ms margin to account for event/command processing */
+		scan_timeout = arg.max_scan_time + 200;
+	}
+
 	ret = ath10k_start_scan(ar, &arg);
 	if (ret) {
 		ath10k_warn(ar, "failed to start hw scan: %d\n", ret);
@@ -5731,10 +5748,8 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 		spin_unlock_bh(&ar->data_lock);
 	}
 
-	/* Add a 200ms margin to account for event/command processing */
 	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
-				     msecs_to_jiffies(arg.max_scan_time +
-						      200));
+				     msecs_to_jiffies(scan_timeout));
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
@@ -8351,6 +8366,8 @@ int ath10k_mac_register(struct ath10k *ar)
 	}
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_VHT_IBSS);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 
 	/*
 	 * on LL hardware queues are managed entirely by the FW
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
