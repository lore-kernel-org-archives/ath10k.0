Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8rGX-0004Oz-Ro
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 15:44:06 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: Fix cycle counter wraparound handling for QCA4019
Date: Fri, 3 Jun 2016 21:13:16 +0530
Message-ID: <1464968596-19834-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1464968596-19834-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1464968596-19834-1-git-send-email-vthiagar@qti.qualcomm.com>
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

In QCA4019, cycle counter wraparound is not tied to rx
clear counter. Each counter would wraparound individually
and after wraparound the respective counter will be reset
to 0x7fffffff while other counter still running unaffected.
Define a new wraparound type for this behaviour and handle
it separately so that rx clear counter wraparound is also
handled just like cycle counter. With this type of
wraparound we can accurately compute and report channel
active/busy time when any of the counter overflows.

Fixes: ee9ca147c59 ("ath10k: Fix survey reporting with QCA4019")
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  2 +-
 drivers/net/wireless/ath/ath10k/hw.c   | 24 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/hw.h   |  9 +++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 8f66653..5ede9a4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -224,7 +224,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.name = "qca4019 hw1.0",
 		.patch_load_addr = QCA4019_HW_1_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
-		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_ALL,
+		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_EACH,
 		.otp_exe_param = 0x0010000,
 		.continuous_frag_desc = true,
 		.channel_counters_freq_hz = 125000,
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 31ec164..bd86e7a 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -179,19 +179,35 @@ void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 				u32 cc, u32 rcc, u32 cc_prev, u32 rcc_prev)
 {
 	u32 cc_fix = 0;
+	u32 rcc_fix = 0;
 	enum ath10k_hw_cc_wraparound_type wraparound_type;
 
 	survey->filled |= SURVEY_INFO_TIME |
 			  SURVEY_INFO_TIME_BUSY;
 
 	wraparound_type = ar->hw_params.cc_wraparound_type;
-	if (wraparound_type == ATH10K_HW_CC_WRAP_SHIFTED_ALL && cc < cc_prev) {
-		cc_fix = 0x7fffffff;
-		survey->filled &= ~SURVEY_INFO_TIME_BUSY;
+
+	if (cc < cc_prev || rcc < rcc_prev) {
+		switch (wraparound_type) {
+		case ATH10K_HW_CC_WRAP_SHIFTED_ALL:
+			if (cc < cc_prev) {
+				cc_fix = 0x7fffffff;
+				survey->filled &= ~SURVEY_INFO_TIME_BUSY;
+			}
+			break;
+		case ATH10K_HW_CC_WRAP_SHIFTED_EACH:
+			if (cc < cc_prev)
+				cc_fix = 0x7fffffff;
+			else
+				rcc_fix = 0x7fffffff;
+			break;
+		case ATH10K_HW_CC_WRAP_DISABLED:
+			break;
+		}
 	}
 
 	cc -= cc_prev - cc_fix;
-	rcc -= rcc_prev;
+	rcc -= rcc_prev - rcc_fix;
 
 	survey->time = CCNT_TO_MSEC(ar, cc);
 	survey->time_busy = CCNT_TO_MSEC(ar, rcc);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 64e45b2..7657c60 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -340,6 +340,15 @@ enum ath10k_hw_cc_wraparound_type {
 	 * by 2 so they never wraparound themselves.
 	 */
 	ATH10K_HW_CC_WRAP_SHIFTED_ALL = 1,
+
+	/* Each hw counter wrapsaround independently. When the
+	 * counter overflows the repestive counter is right shifted
+	 * by 1, i.e reset to 0x7fffffff, and other counters will be
+	 * running unaffected. In this type of wraparound, it should
+	 * be possible to report accurate Rx busy time unlike the
+	 * first type.
+	 */
+	ATH10K_HW_CC_WRAP_SHIFTED_EACH = 2,
 };
 
 /* Target specific defines for MAIN firmware */
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
