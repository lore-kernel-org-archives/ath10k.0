Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsiOh-0005nj-L7
 for ath10k@lists.infradead.org; Thu, 14 May 2015 01:57:16 +0000
Received: by wgin8 with SMTP id n8so60336208wgi.0
 for <ath10k@lists.infradead.org>; Wed, 13 May 2015 18:56:52 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 May 2015 18:56:51 -0700
Message-ID: <CACZoB6_jCMQM8t9GRVOsGOhWM-ySMkZXTtbgypYAFzjm1i8Lkw@mail.gmail.com>
Subject: [PATCH] ath10k: handle cycle count wrap around
From: Srinivasa Duvvuri <sduvvuri@google.com>
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

When the cycle counts part of wmi_ch_info_ev_arg reach max value of
0xffffffff The HW/FW right shifts all the counters by 1 . The cycle
count will be reset to 0x7fffffff and starts counting from 0x7fffffff.
At the same time all the other counters will also have their values
right shifted by 1 (divided by 2). There is no way to handle this odd
wrap around. Detect and ignore the wrap around case.
This change has 2 parts.

 1) Ignore all the cycle counts , if the cycle count field wraps around.
 2) With HW frequency of 88MHz the cycle count wraps around every 24
seconds. the survey_last_cycle_count saved will become stale with in
24 seconds. Reset it to 0 at every scan start.

Signed-off-by: Srinivasa Duvvuri <sduvvuri@chromium.org>

diff --git a/drivers/net/wireless-3.18/ath/ath10k/wmi.c
b/drivers/net/wireless-3.18/ath/ath10k/wmi.c
index 720b6eb..09616bb 100644
--- a/drivers/net/wireless-3.18/ath/ath10k/wmi.c
+++ b/drivers/net/wireless-3.18/ath/ath10k/wmi.c
@@ -1158,6 +1158,8 @@
  complete(&ar->scan.started);
  break;
  }
+ /* reset the last cycle count as the last cycle count is stale from
last scan. */
+ ar->survey_last_cycle_count = 0;
 }

 static void ath10k_wmi_event_scan_start_failed(struct ath10k *ar)
@@ -1716,21 +1718,36 @@
  goto exit;
  }

- if (cmd_flags & WMI_CHAN_INFO_FLAG_COMPLETE) {
+ if (cmd_flags & WMI_CHAN_INFO_FLAG_COMPLETE && ar->survey_last_cycle_count) {
  /* During scanning chan info is reported twice for each
- * visited channel. The reported cycle count is global
+ * visited channel. The reported cycle count is global
  * and per-channel cycle count must be calculated */

- cycle_count -= ar->survey_last_cycle_count;
- rx_clear_count -= ar->survey_last_rx_clear_count;
-
  survey = &ar->survey[idx];
- survey->channel_time = WMI_CHAN_INFO_MSEC(cycle_count);
- survey->channel_time_rx = WMI_CHAN_INFO_MSEC(rx_clear_count);
+
+ if (cycle_count  <  ar->survey_last_cycle_count) {
+ /*
+  * Ignore the wrapped arust_cycnd data. When the total cycle count
+  * wraps around, FW/HW will right shift all the counts
+  * (including total cycle counts) by 1.The cycle counts wrap around
+  * every 24 seconds. To handle this wrap around behavior,
+  * we need the value of each counter at the time of wrap around which
+  * FW does not provide. For now ignore the data.
+  */
+ survey->filled &= ~(SURVEY_INFO_CHANNEL_TIME |
+    SURVEY_INFO_CHANNEL_TIME_BUSY);
+ } else {
+ cycle_count -= ar->survey_last_cycle_count;
+ rx_clear_count -= ar->survey_last_rx_clear_count;
+
+ survey->channel_time = WMI_CHAN_INFO_MSEC(cycle_count);
+ /* the rx_clear_count count indicates the busy time */
+ survey->channel_time_busy = WMI_CHAN_INFO_MSEC(rx_clear_count);
+ survey->filled = SURVEY_INFO_CHANNEL_TIME |
+ SURVEY_INFO_CHANNEL_TIME_BUSY;
+ }
  survey->noise = noise_floor;
- survey->filled = SURVEY_INFO_CHANNEL_TIME |
- SURVEY_INFO_CHANNEL_TIME_RX |
- SURVEY_INFO_NOISE_DBM;
+ survey->filled |= SURVEY_INFO_NOISE_DBM;
  }

  ar->survey_last_rx_clear_count = rx_clear_count;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
