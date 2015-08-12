Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPTgH-0000R8-Hk
 for ath10k@lists.infradead.org; Wed, 12 Aug 2015 10:54:50 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: Fix invalid survey reporting for QCA99X0
Date: Wed, 12 Aug 2015 16:24:04 +0530
Message-ID: <1439376845-17245-1-git-send-email-vthiagar@qti.qualcomm.com>
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

There are three WMI_CHAN_INFO events reported per channel
in QCA99X0 firmware. First one is a notification at the begining
of the channel dwell time with cmd_flag as CHAN_INFO_START(cmd_flag = 0),
second one is a notification at the end of the dwell time with cmd_flag
CHAN_INFO_PRE_COMPLETE (cmd_flag = 2) and the third is the indication
with CHAN_INFO_COMPLETE (cmd_flag = 1) which is the last indication for
the channel. Since there is a new state before the completion, the handler
is to fixed so that the counts are deducted from the ones reported with
CHAN_INFO_START rather than the ones reported with CHAN_INFO_PRE_COMPLETE.
Without this fix there will be lots of 0 msecs reported as active
and busy time.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 6 ++++--
 drivers/net/wireless/ath/ath10k/wmi.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e6d6b42..38e22e0 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2412,8 +2412,10 @@ void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
 		ar->ch_info_can_report_survey = true;
 	}
 
-	ar->survey_last_rx_clear_count = rx_clear_count;
-	ar->survey_last_cycle_count = cycle_count;
+	if (!(cmd_flags & WMI_CHAN_INFO_FLAG_PRE_COMPLETE)) {
+		ar->survey_last_rx_clear_count = rx_clear_count;
+		ar->survey_last_cycle_count = cycle_count;
+	}
 
 exit:
 	spin_unlock_bh(&ar->data_lock);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0d4efc9..5825c5c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -5585,6 +5585,7 @@ struct wmi_peer_sta_kickout_event {
 } __packed;
 
 #define WMI_CHAN_INFO_FLAG_COMPLETE BIT(0)
+#define WMI_CHAN_INFO_FLAG_PRE_COMPLETE BIT(1)
 
 /* Beacon filter wmi command info */
 #define BCN_FLT_MAX_SUPPORTED_IES	256
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
