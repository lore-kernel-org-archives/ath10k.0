Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ypc0b-00043f-Vg
 for ath10k@lists.infradead.org; Tue, 05 May 2015 12:31:37 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix survey information reporting
Date: Tue, 5 May 2015 18:00:48 +0530
Message-ID: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

Rx clear count reported in wmi_chan_info_event is actually channel_busy_count
not rx_frame_count. Send rx_clear_count through time_busy of survey_info
and set SURVEY_INFO_TIME_BUSY in filled.

iw wlan0 survey dump

urvey data from wlan0
        frequency:                      5180 MHz [in use]
        noise:                          -103 dBm
        channel active time:            150 ms
        channel busy time:              22 ms
Survey data from wlan0
        frequency:                      5200 MHz
        noise:                          -102 dBm
        channel active time:            146 ms
        channel busy time:              0 ms

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index ebaa096..0fabe68 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1645,10 +1645,10 @@ void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
 
 		survey = &ar->survey[idx];
 		survey->time = WMI_CHAN_INFO_MSEC(cycle_count);
-		survey->time_rx = WMI_CHAN_INFO_MSEC(rx_clear_count);
+		survey->time_busy = WMI_CHAN_INFO_MSEC(rx_clear_count);
 		survey->noise = noise_floor;
 		survey->filled = SURVEY_INFO_TIME |
-				 SURVEY_INFO_TIME_RX |
+				 SURVEY_INFO_TIME_BUSY |
 				 SURVEY_INFO_NOISE_DBM;
 	}
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
