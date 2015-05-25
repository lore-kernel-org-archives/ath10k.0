Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YwrAd-0000DW-3Y
 for ath10k@lists.infradead.org; Mon, 25 May 2015 12:07:58 +0000
Received: by wizk4 with SMTP id k4so46384988wiz.1
 for <ath10k@lists.infradead.org>; Mon, 25 May 2015 05:07:28 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 3/3] ath10k: fix inconsistent survey reports
Date: Mon, 25 May 2015 14:06:19 +0200
Message-Id: <1432555579-18347-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1432555579-18347-1-git-send-email-michal.kazior@tieto.com>
References: <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
 <1432555579-18347-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

In some cases some channel survey data was
reported incorrect.

Channel info events were expected to come in pairs
without and with COMPLETE flag set respectively
for each channel visit during scan.

The known deviation from this is rule for last
scan chan info and first (next) scan chan info
both have COMPLETE flag set. This was either
programmed with the intent of providing BSS cycle
count info or this is an artefact of firmware scan
state machine. Either way this is useless due to
short wraparound time, wraparound quirks and no
overflow notification.

Survey dumps now include only data gathered during
scan channel visits that can be computed
correctly.

This should improve hostapd ACS a little bit.

Reported-by: Srinivasa Duvvuri <sduvvuri@chromium.org>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v4:
     * rebased
     * dont overwrite survey data needlessly
     * rename var
     * update commit log
    
    v3:
     * result of patch split up
     * rename the var so it matches more tightly with it's purpose
     * improve commit log

 drivers/net/wireless/ath/ath10k/core.h |  8 ++++++++
 drivers/net/wireless/ath/ath10k/wmi.c  | 26 ++++++++++++++------------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 729b366e2a18..2d28cfae5c94 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -696,6 +696,14 @@ struct ath10k {
 	u32 survey_last_cycle_count;
 	struct survey_info survey[ATH10K_NUM_CHANS];
 
+	/* Channel info events are expected to come in pairs without and with
+	 * COMPLETE flag set respectively for each channel visit during scan.
+	 *
+	 * However there are deviations from this rule. This flag is used to
+	 * avoid reporting garbage data.
+	 */
+	bool ch_info_can_report_survey;
+
 	struct dfs_pattern_detector *dfs_detector;
 
 	unsigned long tx_paused; /* see ATH10K_TX_PAUSE_ */
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 70e6efa2c071..77220b0f0e89 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1637,20 +1637,22 @@ void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
 	}
 
 	if (cmd_flags & WMI_CHAN_INFO_FLAG_COMPLETE) {
-		/* During scanning chan info is reported twice for each
-		 * visited channel. The reported cycle count is global
-		 * and per-channel cycle count must be calculated */
+		if (ar->ch_info_can_report_survey) {
+			survey = &ar->survey[idx];
+			survey->noise = noise_floor;
+			survey->filled = SURVEY_INFO_NOISE_DBM;
 
-		survey = &ar->survey[idx];
-		survey->noise = noise_floor;
-		survey->filled = SURVEY_INFO_NOISE_DBM;
+			ath10k_hw_fill_survey_time(ar,
+						   survey,
+						   cycle_count,
+						   rx_clear_count,
+						   ar->survey_last_cycle_count,
+						   ar->survey_last_rx_clear_count);
+		}
 
-		ath10k_hw_fill_survey_time(ar,
-					   survey,
-					   cycle_count,
-					   rx_clear_count,
-					   ar->survey_last_cycle_count,
-					   ar->survey_last_rx_clear_count);
+		ar->ch_info_can_report_survey = false;
+	} else {
+		ar->ch_info_can_report_survey = true;
 	}
 
 	ar->survey_last_rx_clear_count = rx_clear_count;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
