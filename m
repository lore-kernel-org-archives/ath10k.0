Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtO7R-000830-PI
 for ath10k@lists.infradead.org; Fri, 15 May 2015 22:30:14 +0000
Received: by wicmx19 with SMTP id mx19so6574416wic.0
 for <ath10k@lists.infradead.org>; Fri, 15 May 2015 15:29:51 -0700 (PDT)
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com.
 [74.125.82.47])
 by mx.google.com with ESMTPSA id bm9sm4519486wjc.21.2015.05.15.15.29.50
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 May 2015 15:29:50 -0700 (PDT)
Received: by wgkx2 with SMTP id x2so8512319wgk.2
 for <ath10k@lists.infradead.org>; Fri, 15 May 2015 15:29:49 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 May 2015 15:29:49 -0700
Message-ID: <CACZoB699sLr1gu1qSM1N01FQ5RNX41wDoOeCYd6A+sjyDRRU0A@mail.gmail.com>
Subject: [PATCH v2] ath10k: handle cycle count wrap around
From: Srinivasa Duvvuri <sduvvuri@chromium.org>
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

This patch addresses
 couple of issues related to survey data that results   in a random/large
 values in the out put of iw dev wlan0 surevey dump.

  These are the 2 changes that address the issue.

  1) Handle Cycle count wrap around.
     When the cycle counts part of wmi_ch_info_ev_arg reach max value of
     0xffffffff. The HW/FW right shifts all the counteirs by 1 . The cycle
     count will be reset to 0x7fffffff and starts counting from 0x7fffffff and
     the other counters will have their value right shifted by 1 (divided by 2).
     There is no way to handle this odd wrap around. Detect and ignore the wrap
     around case.

  2) Handle Back to back channel info events from FW with
     WMI_CHAN_INFO_FLAG_COMPLETE.
     Between 2 scans FW sends back to back events with
     WMI_CHAN_INFO_FLAG_COMPLETE flag set. One at the end of first scan
     and the second at the beginning of scan. Depending on the time
     between 2 scans , the cycle counts could have wrapped around several
     timesi. Fix is detect and to ignore such events.

Signed-off-by: Srinivasa Duvvuri <sduvvuri@chromium.org>

---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c  | 40 +++++++++++++++++++++++++++-------
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h
b/drivers/net/wireless/ath/ath10k/core.h
index 827b3d7..fea6665 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -688,6 +688,7 @@ struct ath10k {
        u32 survey_last_rx_clear_count;
        u32 survey_last_cycle_count;
        struct survey_info survey[ATH10K_NUM_CHANS];
+       bool ch_info_can_process;

        struct dfs_pattern_detector *dfs_detector;

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c
b/drivers/net/wireless/ath/ath10k/wmi.c
index 0fabe68..e9ae071 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1640,16 +1640,40 @@ void ath10k_wmi_event_chan_info(struct ath10k
*ar, struct sk_buff *skb)
                 * visited channel. The reported cycle count is global
                 * and per-channel cycle count must be calculated */

-               cycle_count -= ar->survey_last_cycle_count;
-               rx_clear_count -= ar->survey_last_rx_clear_count;
-
                survey = &ar->survey[idx];
-               survey->time = WMI_CHAN_INFO_MSEC(cycle_count);
-               survey->time_busy = WMI_CHAN_INFO_MSEC(rx_clear_count);
+
+               if (cycle_count < ar->survey_last_cycle_count) {
+                       /*
+                        * Ignore the wrapped around cycle data. When
the total cycle
+                        * count  wraps around, FW/HW will right shift
all the counts
+                        * (including total cycle counts) by 1.The
cycle counts wrap
+                        * around every 24 seconds. To handle this wrap around
+                        * behavior,  we need the value of each
counter at the time
+                        * of wrap around which FW does not provide.
+                        * For now ignore the data.
+                        */
+                       survey->filled &= ~(SURVEY_INFO_CHANNEL_TIME |
+                                           SURVEY_INFO_CHANNEL_TIME_BUSY);
+               } else if (ar->ch_info_can_process) {
+                       /*
+                        * FW sends back to back events with
WMI_CHAN_INFO_FLAG_COMPLETE set.
+                        * One event at the end of the scan and other
ath the beginning of next
+                        * scan. Ignore such events.
+                        */
+                       cycle_count -= ar->survey_last_cycle_count;
+                       rx_clear_count -= ar->survey_last_rx_clear_count;
+
+                       survey->channel_time = WMI_CHAN_INFO_MSEC(cycle_count);
+                       /* the rx_clear_count count indicates the busy time */
+                       survey->channel_time_busy =
WMI_CHAN_INFO_MSEC(rx_clear_count);
+                       survey->filled = SURVEY_INFO_CHANNEL_TIME |
+                               SURVEY_INFO_CHANNEL_TIME_BUSY;
+               }
                survey->noise = noise_floor;
-               survey->filled = SURVEY_INFO_TIME |
-                                SURVEY_INFO_TIME_BUSY |
-                                SURVEY_INFO_NOISE_DBM;
+               survey->filled |= SURVEY_INFO_NOISE_DBM;
+               ar->ch_info_can_process = false;
+       } else {
+               ar->ch_info_can_process = true;
        }

        ar->survey_last_rx_clear_count = rx_clear_count;
-- 
2.2.0.rc0.207.ga3a616c

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
