Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUAMg-0007cE-JB
 for ath10k@lists.infradead.org; Mon, 01 Aug 2016 10:22:33 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv2 2/2] ath10k: Allow setting coverage class
Date: Mon,  1 Aug 2016 12:21:45 +0200
Message-Id: <1470046905-17449-3-git-send-email-benjamin@sipsolutions.net>
In-Reply-To: <1470046905-17449-1-git-send-email-benjamin@sipsolutions.net>
References: <1470046905-17449-1-git-send-email-benjamin@sipsolutions.net>
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
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Michal Kazior <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Unfortunately ath10k does not generally allow modifying the coverage class
with the stock firmware and Qualcomm has so far refused to implement this
feature so that it can be properly supported in ath10k. If we however know
the registers that need to be modified for proper operation with a higher
coverage class, then we can do these modifications from the driver.

This patch implements this hack for first generation cards which are based
on a core that is similar to ath9k. The registers are modified in place and
need to be re-written every time the firmware sets them. To achieve this
the register status is verified after any WMI event from the firmware.

The coverage class may not be modified temporarily right after the card
re-initializes the registers. This is for example the case during scanning.

Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for initially
working on a userspace support for this. This patch wouldn't have been
possible without this documentation.

Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
Signed-off-by: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>
---
 drivers/net/wireless/ath/ath10k/core.h |  10 +++
 drivers/net/wireless/ath/ath10k/hw.c   | 112 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  22 ++++++-
 drivers/net/wireless/ath/ath10k/mac.c  |  19 ++++++
 drivers/net/wireless/ath/ath10k/wmi.c  |  29 +++++++++
 5 files changed, 191 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 5ace413..4ae730b 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -890,6 +890,16 @@ struct ath10k {
 	struct ath10k_thermal thermal;
 	struct ath10k_wow wow;
 
+	/* protected by data_lock */
+	struct {
+		s16 coverage_class;
+
+		u32 reg_slottime_conf;
+		u32 reg_slottime_orig;
+		u32 reg_ack_cts_timeout_conf;
+		u32 reg_ack_cts_timeout_orig;
+	} fw_coverage;
+
 	/* must be last */
 	u8 drv_priv[0] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index c2ecb9b..f1278ad 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -17,11 +17,13 @@
 #include <linux/types.h>
 #include "core.h"
 #include "hw.h"
+#include "hif.h"
 
 const struct ath10k_hw_regs qca988x_regs = {
 	.rtc_soc_base_address		= 0x00004000,
 	.rtc_wmac_base_address		= 0x00005000,
 	.soc_core_base_address		= 0x00009000,
+	.wlan_mac_base_address		= 0x00020000,
 	.ce_wrapper_base_address	= 0x00057000,
 	.ce0_base_address		= 0x00057400,
 	.ce1_base_address		= 0x00057800,
@@ -48,6 +50,7 @@ const struct ath10k_hw_regs qca6174_regs = {
 	.rtc_soc_base_address			= 0x00000800,
 	.rtc_wmac_base_address			= 0x00001000,
 	.soc_core_base_address			= 0x0003a000,
+	.wlan_mac_base_address			= 0x00020000,
 	.ce_wrapper_base_address		= 0x00034000,
 	.ce0_base_address			= 0x00034400,
 	.ce1_base_address			= 0x00034800,
@@ -74,6 +77,7 @@ const struct ath10k_hw_regs qca99x0_regs = {
 	.rtc_soc_base_address			= 0x00080000,
 	.rtc_wmac_base_address			= 0x00000000,
 	.soc_core_base_address			= 0x00082000,
+	.wlan_mac_base_address			= 0x00030000,
 	.ce_wrapper_base_address		= 0x0004d000,
 	.ce0_base_address			= 0x0004a000,
 	.ce1_base_address			= 0x0004a400,
@@ -109,6 +113,7 @@ const struct ath10k_hw_regs qca99x0_regs = {
 const struct ath10k_hw_regs qca4019_regs = {
 	.rtc_soc_base_address                   = 0x00080000,
 	.soc_core_base_address                  = 0x00082000,
+	.wlan_mac_base_address                  = 0x00030000,
 	.ce_wrapper_base_address                = 0x0004d000,
 	.ce0_base_address                       = 0x0004a000,
 	.ce1_base_address                       = 0x0004a400,
@@ -220,7 +225,114 @@ void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 	survey->time_busy = CCNT_TO_MSEC(ar, rcc);
 }
 
+static void ath10k_qca988x_mac_op_set_coverage_class(struct ath10k *ar,
+						     s16 value)
+{
+	u32 slottime_reg;
+	u32 slottime;
+	u32 timeout_reg;
+	u32 timeout;
+	u32 counters_freq_mhz = ar->hw_params.channel_counters_freq_hz / 1000;
+
+	/* The firmware does not support setting the coverage class. Instead
+	 * this function monitors and modifies the corresponding MAC registers.
+	 */
+
+	spin_lock_bh(&ar->data_lock);
+
+	/* Retrieve the current values of the two registers that need to be
+	 * adjusted.
+	 */
+	slottime_reg = ath10k_hif_read32(ar, WLAN_MAC_BASE_ADDRESS +
+					     WAVE1_PCU_GBL_IFS_SLOT);
+	timeout_reg = ath10k_hif_read32(ar, WLAN_MAC_BASE_ADDRESS +
+					    WAVE1_PCU_ACK_CTS_TIMEOUT);
+
+	if (value < 0)
+		value = ar->fw_coverage.coverage_class;
+
+	/* Break out if the coverage class and registers have the expected
+	 * value.
+	 */
+	if (value == ar->fw_coverage.coverage_class &&
+	    slottime_reg == ar->fw_coverage.reg_slottime_conf &&
+	    timeout_reg == ar->fw_coverage.reg_ack_cts_timeout_conf)
+		goto unlock;
+
+	/* Store new initial register values from the firmware. */
+	if (slottime_reg != ar->fw_coverage.reg_slottime_conf)
+		ar->fw_coverage.reg_slottime_orig = slottime_reg;
+	if (timeout_reg != ar->fw_coverage.reg_ack_cts_timeout_conf)
+		ar->fw_coverage.reg_ack_cts_timeout_orig = timeout_reg;
+
+	/* Calculat new value based on the (original) firmware calculation. */
+	slottime_reg = ar->fw_coverage.reg_slottime_orig;
+	timeout_reg = ar->fw_coverage.reg_ack_cts_timeout_orig;
+
+	/* Do some sanity checks on the slottime register. */
+	if (unlikely(slottime_reg % counters_freq_mhz)) {
+		ath10k_warn(ar,
+			    "failed to set coverage class: expected integer microsecond value in register\n");
+
+		goto store_regs;
+	}
+
+	slottime = (slottime_reg & WAVE1_PCU_GBL_IFS_SLOT_M);
+	slottime = slottime / counters_freq_mhz;
+	if (unlikely(slottime != 9 && slottime != 20)) {
+		ath10k_warn(ar,
+			    "failed to set coverage class: expected slot time of 9 or 20us in HW register. It is %uus.\n",
+			    slottime);
+
+		goto store_regs;
+	}
+
+	/* Recalculate the register values by adding the additional propagation
+	 * delay (3us per coverage class).
+	 */
+
+	slottime = (slottime_reg & WAVE1_PCU_GBL_IFS_SLOT_M);
+	slottime += value * 3 * counters_freq_mhz;
+	slottime = min_t(u32, slottime, WAVE1_PCU_GBL_IFS_SLOT_M);
+	slottime_reg = (slottime_reg & ~WAVE1_PCU_GBL_IFS_SLOT_M) | slottime;
+
+	/* Update ack timeout (lower halfword). */
+	timeout = (timeout_reg & WAVE1_PCU_ACK_CTS_TIMEOUT_ACK);
+	timeout = timeout >> WAVE1_PCU_ACK_CTS_TIMEOUT_ACK_S;
+	timeout += 3 * value * counters_freq_mhz;
+	timeout = min_t(u32, timeout, WAVE1_PCU_ACK_CTS_TIMEOUT_MAX);
+	timeout = (timeout << WAVE1_PCU_ACK_CTS_TIMEOUT_ACK_S);
+	timeout = timeout & WAVE1_PCU_ACK_CTS_TIMEOUT_ACK;
+	timeout_reg = (timeout_reg & ~WAVE1_PCU_ACK_CTS_TIMEOUT_ACK) | timeout;
+
+	/* Update cts timeout (upper halfword). */
+	timeout = (timeout_reg & WAVE1_PCU_ACK_CTS_TIMEOUT_CTS);
+	timeout = timeout >> WAVE1_PCU_ACK_CTS_TIMEOUT_CTS_S;
+	timeout += 3 * value * counters_freq_mhz;
+	timeout = min_t(u32, timeout, WAVE1_PCU_ACK_CTS_TIMEOUT_MAX);
+	timeout = (timeout << WAVE1_PCU_ACK_CTS_TIMEOUT_CTS_S);
+	timeout = timeout & WAVE1_PCU_ACK_CTS_TIMEOUT_CTS;
+	timeout_reg = (timeout_reg & ~WAVE1_PCU_ACK_CTS_TIMEOUT_CTS) | timeout;
+
+	ath10k_hif_write32(ar,
+			   WLAN_MAC_BASE_ADDRESS + WAVE1_PCU_GBL_IFS_SLOT,
+			   slottime_reg);
+	ath10k_hif_write32(ar,
+			   WLAN_MAC_BASE_ADDRESS + WAVE1_PCU_ACK_CTS_TIMEOUT,
+			   timeout_reg);
+
+store_regs:
+	/* After an error we will not retry setting the coverage class. */
+	ar->fw_coverage.coverage_class = value;
+	ar->fw_coverage.reg_slottime_conf = slottime_reg;
+	ar->fw_coverage.reg_ack_cts_timeout_conf = timeout_reg;
+
+unlock:
+	spin_unlock_bh(&ar->data_lock);
+}
+
 const struct ath10k_hw_ops qca988x_ops = {
+	.mac_op_set_coverage_class = ath10k_qca988x_mac_op_set_coverage_class,
 };
 
 static int ath10k_qca99x0_rx_desc_get_l3_pad_bytes(struct htt_rx_desc *rxd)
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 1ef7dc6..532eab5 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -230,6 +230,7 @@ struct ath10k_hw_regs {
 	u32 rtc_soc_base_address;
 	u32 rtc_wmac_base_address;
 	u32 soc_core_base_address;
+	u32 wlan_mac_base_address;
 	u32 ce_wrapper_base_address;
 	u32 ce0_base_address;
 	u32 ce1_base_address;
@@ -418,6 +419,7 @@ struct htt_rx_desc;
 /* Defines needed for Rx descriptor abstraction */
 struct ath10k_hw_ops {
 	int (*rx_desc_get_l3_pad_bytes)(struct htt_rx_desc *rxd);
+	void (*mac_op_set_coverage_class)(struct ath10k *ar, s16 value);
 };
 
 extern const struct ath10k_hw_ops qca988x_ops;
@@ -605,7 +607,7 @@ extern const struct ath10k_hw_ops qca99x0_ops;
 #define WLAN_SI_BASE_ADDRESS			0x00010000
 #define WLAN_GPIO_BASE_ADDRESS			0x00014000
 #define WLAN_ANALOG_INTF_BASE_ADDRESS		0x0001c000
-#define WLAN_MAC_BASE_ADDRESS			0x00020000
+#define WLAN_MAC_BASE_ADDRESS			ar->regs->wlan_mac_base_address
 #define EFUSE_BASE_ADDRESS			0x00030000
 #define FPGA_REG_BASE_ADDRESS			0x00039000
 #define WLAN_UART2_BASE_ADDRESS			0x00054c00
@@ -805,4 +807,22 @@ extern const struct ath10k_hw_ops qca99x0_ops;
 
 #define RTC_STATE_V_GET(x) (((x) & RTC_STATE_V_MASK) >> RTC_STATE_V_LSB)
 
+/* Register definitions for first generation ath10k cards. These cards include
+ * a mac thich has a register allocation similar to ath9k and at least some
+ * registers including the ones relevant for modifying the coverage class are
+ * identical to the ath9k definitions.
+ * These registers are usually managed by the ath10k firmware. However by
+ * overriding them it is possible to support coverage class modifications.
+ */
+#define WAVE1_PCU_ACK_CTS_TIMEOUT		0x8014
+#define WAVE1_PCU_ACK_CTS_TIMEOUT_MAX		0x00003FFF
+#define WAVE1_PCU_ACK_CTS_TIMEOUT_ACK		0x00003FFF
+#define WAVE1_PCU_ACK_CTS_TIMEOUT_ACK_S	0
+#define WAVE1_PCU_ACK_CTS_TIMEOUT_CTS		0x3FFF0000
+#define WAVE1_PCU_ACK_CTS_TIMEOUT_CTS_S	16
+
+#define WAVE1_PCU_GBL_IFS_SLOT			0x1070
+#define WAVE1_PCU_GBL_IFS_SLOT_M		0x0000FFFF
+#define WAVE1_PCU_GBL_IFS_SLOT_RESV0		0xFFFF0000
+
 #endif /* _HW_H_ */
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index fb8e38d..ad1cb6d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5372,6 +5372,20 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static void ath10k_mac_op_set_coverage_class(struct ieee80211_hw *hw, s16 value)
+{
+	struct ath10k *ar = hw->priv;
+
+	/* This function should never be called if setting the coverage class
+	 * is not supported on this hardware.
+	 */
+	if (!ar->hw_params.hw_ops->mac_op_set_coverage_class) {
+		WARN_ON_ONCE(1);
+		return;
+	}
+	ar->hw_params.hw_ops->mac_op_set_coverage_class(ar, value);
+}
+
 static int ath10k_hw_scan(struct ieee80211_hw *hw,
 			  struct ieee80211_vif *vif,
 			  struct ieee80211_scan_request *hw_req)
@@ -7397,6 +7411,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.remove_interface		= ath10k_remove_interface,
 	.configure_filter		= ath10k_configure_filter,
 	.bss_info_changed		= ath10k_bss_info_changed,
+	.set_coverage_class		= ath10k_mac_op_set_coverage_class,
 	.hw_scan			= ath10k_hw_scan,
 	.cancel_hw_scan			= ath10k_cancel_hw_scan,
 	.set_key			= ath10k_set_key,
@@ -7974,6 +7989,10 @@ int ath10k_mac_register(struct ath10k *ar)
 		      ar->running_fw->fw_file.fw_features))
 		ar->ops->wake_tx_queue = NULL;
 
+	/* Disable set_coverage_class for chipsets that do not support it. */
+	if (!ar->hw_params.hw_ops->mac_op_set_coverage_class)
+		ar->ops->set_coverage_class = NULL;
+
 	ret = ath_regd_init(&ar->ath_common.regulatory, ar->hw->wiphy,
 			    ath10k_reg_notifier);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 169cd2e7..700c430 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4992,6 +4992,13 @@ static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+	/* Check and possibly reset the coverage class configuration override.
+	 * There are many conditions (in particular internal card resets) that
+	 * can cause the registers to be re-initialized.
+	 */
+	if (!ar->hw_params.hw_ops->mac_op_set_coverage_class)
+		ar->hw_params.hw_ops->mac_op_set_coverage_class(ar, -1);
+
 out:
 	dev_kfree_skb(skb);
 }
@@ -5116,6 +5123,13 @@ static void ath10k_wmi_10_1_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+	/* Check and possibly reset the coverage class configuration override.
+	 * There are many conditions (in particular internal card resets) that
+	 * can cause the registers to be re-initialized.
+	 */
+	if (!ar->hw_params.hw_ops->mac_op_set_coverage_class)
+		ar->hw_params.hw_ops->mac_op_set_coverage_class(ar, -1);
+
 out:
 	dev_kfree_skb(skb);
 }
@@ -5240,6 +5254,13 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+	/* Check and possibly reset the coverage class configuration override.
+	 * There are many conditions (in particular internal card resets) that
+	 * can cause the registers to be re-initialized.
+	 */
+	if (!ar->hw_params.hw_ops->mac_op_set_coverage_class)
+		ar->hw_params.hw_ops->mac_op_set_coverage_class(ar, -1);
+
 out:
 	dev_kfree_skb(skb);
 }
@@ -5323,6 +5344,13 @@ static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+	/* Check and possibly reset the coverage class configuration override.
+	 * There are many conditions (in particular internal card resets) that
+	 * can cause the registers to be re-initialized.
+	 */
+	if (!ar->hw_params.hw_ops->mac_op_set_coverage_class)
+		ar->hw_params.hw_ops->mac_op_set_coverage_class(ar, -1);
+
 out:
 	dev_kfree_skb(skb);
 }
@@ -6017,6 +6045,7 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 		| WMI_SCAN_EVENT_COMPLETED
 		| WMI_SCAN_EVENT_BSS_CHANNEL
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL
+		| WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
 		| WMI_SCAN_EVENT_DEQUEUED;
 	arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->n_bssids = 1;
-- 
2.8.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
