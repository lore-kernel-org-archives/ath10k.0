Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Zky-0003WM-EV
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 18:27:50 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 2/3] ath10k: Add module param to enable history
Date: Fri, 31 Jul 2020 23:57:21 +0530
Message-Id: <1596220042-2778-3-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

Add a module param to enable recording history
of certain debug events. This module parameter
is a mask of the different history recording to
be enabled.

The memory for recording the history will not be
allocated if its not enabled via module parameter.
This is to avoid unnecessary memory allocation when
recording the history is not needed.

To enable all the history recording, the driver
should be loaded as below
"insmod ath10k_core.ko history_enable_mask=0xf"

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c  |  3 +++
 drivers/net/wireless/ath/ath10k/core.h  |  8 ++++++++
 drivers/net/wireless/ath/ath10k/debug.c | 26 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/debug.h |  1 +
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9104496..f91a9d0 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -29,6 +29,7 @@
 unsigned int ath10k_debug_mask;
 EXPORT_SYMBOL(ath10k_debug_mask);
 
+unsigned long ath10k_history_enable_mask;
 static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
@@ -46,6 +47,7 @@ module_param(skip_otp, bool, 0644);
 module_param(rawmode, bool, 0644);
 module_param(fw_diag_log, bool, 0644);
 module_param_named(coredump_mask, ath10k_coredump_mask, ulong, 0444);
+module_param_named(history_enable_mask, ath10k_history_enable_mask, ulong, 0444);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
@@ -54,6 +56,7 @@ MODULE_PARM_DESC(cryptmode, "Crypto mode: 0-hardware, 1-software");
 MODULE_PARM_DESC(rawmode, "Use raw 802.11 frame datapath");
 MODULE_PARM_DESC(coredump_mask, "Bitfield of what to include in firmware crash file");
 MODULE_PARM_DESC(fw_diag_log, "Diag based fw log debugging");
+MODULE_PARM_DESC(history_enable_mask, "Enable events history recording");
 
 static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	{
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 46bd5aa..ce429df 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -977,6 +977,14 @@ struct ath10k_bus_params {
 
 #define ATH10K_WMI_DATA_LEN	16
 
+enum ath10k_history {
+	ATH10K_REG_ACCESS_HISTORY,
+	ATH10K_CE_EVENTS_HISTORY,
+	ATH10K_WMI_CMD_HISTORY,
+	ATH10K_WMI_EVENTS_HISTORY,
+	ATH10K_HISTORY_MAX,
+};
+
 enum ath10k_ce_event {
 	ATH10K_IRQ_TRIGGER,
 	ATH10K_NAPI_POLL,
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 9105b0b..5d08652 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2724,6 +2724,9 @@ EXPORT_SYMBOL(ath10k_dbg_dump);
 
 int ath10k_core_reg_access_history_init(struct ath10k *ar, u32 max_entries)
 {
+	if (!test_bit(ATH10K_REG_ACCESS_HISTORY, &ath10k_history_enable_mask))
+		return 0;
+
 	ar->reg_access_history.record = vzalloc(max_entries *
 						sizeof(struct ath10k_reg_access_entry));
 	if (!ar->reg_access_history.record)
@@ -2739,6 +2742,9 @@ EXPORT_SYMBOL(ath10k_core_reg_access_history_init);
 
 int ath10k_core_wmi_cmd_history_init(struct ath10k *ar, u32 max_entries)
 {
+	if (!test_bit(ATH10K_WMI_CMD_HISTORY, &ath10k_history_enable_mask))
+		return 0;
+
 	ar->wmi_cmd_history.record = vzalloc(max_entries *
 					     sizeof(struct ath10k_wmi_event_entry));
 	if (!ar->wmi_cmd_history.record)
@@ -2754,6 +2760,9 @@ EXPORT_SYMBOL(ath10k_core_wmi_cmd_history_init);
 
 int ath10k_core_wmi_event_history_init(struct ath10k *ar, u32 max_entries)
 {
+	if (!test_bit(ATH10K_WMI_EVENTS_HISTORY, &ath10k_history_enable_mask))
+		return 0;
+
 	ar->wmi_event_history.record = vzalloc(max_entries *
 					       sizeof(struct ath10k_wmi_event_entry));
 	if (!ar->wmi_event_history.record)
@@ -2769,6 +2778,9 @@ EXPORT_SYMBOL(ath10k_core_wmi_event_history_init);
 
 int ath10k_core_ce_event_history_init(struct ath10k *ar, u32 max_entries)
 {
+	if (!test_bit(ATH10K_CE_EVENTS_HISTORY, &ath10k_history_enable_mask))
+		return 0;
+
 	ar->ce_event_history.record = vzalloc(max_entries *
 					      sizeof(struct ath10k_ce_event_entry));
 	if (!ar->ce_event_history.record)
@@ -2787,7 +2799,8 @@ void ath10k_record_reg_access(struct ath10k *ar, u32 offset, u32 val, bool write
 	struct ath10k_reg_access_entry *entry;
 	u32 idx;
 
-	if (!ar->reg_access_history.record)
+	if (!test_bit(ATH10K_REG_ACCESS_HISTORY, &ath10k_history_enable_mask) ||
+	    !ar->reg_access_history.record)
 		return;
 
 	idx = ath10k_core_get_next_idx(&ar->reg_access_history.index,
@@ -2808,7 +2821,9 @@ void ath10k_record_wmi_event(struct ath10k *ar, enum ath10k_wmi_type type,
 	u32 idx;
 
 	if (type == ATH10K_WMI_EVENT) {
-		if (!ar->wmi_event_history.record)
+		if (!test_bit(ATH10K_WMI_EVENTS_HISTORY,
+			      &ath10k_history_enable_mask) ||
+		    !ar->wmi_event_history.record)
 			return;
 
 		spin_lock_bh(&ar->wmi_event_history.hist_lock);
@@ -2817,7 +2832,9 @@ void ath10k_record_wmi_event(struct ath10k *ar, enum ath10k_wmi_type type,
 		spin_unlock_bh(&ar->wmi_event_history.hist_lock);
 		entry = &ar->wmi_event_history.record[idx];
 	} else {
-		if (!ar->wmi_cmd_history.record)
+		if (!test_bit(ATH10K_WMI_CMD_HISTORY,
+			      &ath10k_history_enable_mask) ||
+		    !ar->wmi_event_history.record)
 			return;
 
 		spin_lock_bh(&ar->wmi_cmd_history.hist_lock);
@@ -2841,7 +2858,8 @@ void ath10k_record_ce_event(struct ath10k *ar, enum ath10k_ce_event event_type,
 	struct ath10k_ce_event_entry *entry;
 	u32 idx;
 
-	if (!ar->ce_event_history.record)
+	if (!test_bit(ATH10K_CE_EVENTS_HISTORY, &ath10k_history_enable_mask) ||
+	    !ar->ce_event_history.record)
 		return;
 
 	idx = ath10k_core_get_next_idx(&ar->ce_event_history.index,
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index c28aeb1..7799b89 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -75,6 +75,7 @@ struct ath10k_pktlog_hdr {
 #define ATH10K_TX_POWER_MIN_VAL 0
 
 extern unsigned int ath10k_debug_mask;
+extern unsigned long ath10k_history_enable_mask;
 
 __printf(2, 3) void ath10k_info(struct ath10k *ar, const char *fmt, ...);
 __printf(2, 3) void ath10k_err(struct ath10k *ar, const char *fmt, ...);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
