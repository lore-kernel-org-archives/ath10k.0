Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpa20-0001XQ-LX
 for ath10k@lists.infradead.org; Wed, 28 May 2014 09:20:23 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh06.mail.saunalahti.fi (Postfix) with ESMTP id 406BE69AD4
 for <ath10k@lists.infradead.org>; Wed, 28 May 2014 12:19:57 +0300 (EEST)
Subject: [RFC PATCH 2/2] ath10k: add testmode
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 28 May 2014 12:19:56 +0300
Message-ID: <20140528091956.8030.46201.stgit@potku.adurom.net>
In-Reply-To: <20140528091832.8030.93169.stgit@potku.adurom.net>
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
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

Add testmode interface for starting and using UTF firmware which is used to run
factory tests. This is implemented by adding new state ATH10K_STATE_UTF and user
space can enable this state with ATH10K_TM_CMD_UTF_START command. To go back to
normal mode user space can send ATH10K_TM_CMD_UTF_STOP.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/Makefile   |    2 
 drivers/net/wireless/ath/ath10k/core.c     |   66 ++++--
 drivers/net/wireless/ath/ath10k/core.h     |   17 +-
 drivers/net/wireless/ath/ath10k/debug.h    |    1 
 drivers/net/wireless/ath/ath10k/hw.h       |    1 
 drivers/net/wireless/ath/ath10k/mac.c      |   10 +
 drivers/net/wireless/ath/ath10k/testmode.c |  312 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/testmode.h |   45 ++++
 drivers/net/wireless/ath/ath10k/wmi.c      |    6 +
 9 files changed, 440 insertions(+), 20 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.h

diff --git a/drivers/net/wireless/ath/ath10k/Makefile b/drivers/net/wireless/ath/ath10k/Makefile
index a4179f49ee1f..d7708ee65a09 100644
--- a/drivers/net/wireless/ath/ath10k/Makefile
+++ b/drivers/net/wireless/ath/ath10k/Makefile
@@ -10,6 +10,8 @@ ath10k_core-y += mac.o \
 		 wmi.o \
 		 bmi.o
 
+ath10k_core-$(CONFIG_NL80211_TESTMODE) += testmode.o
+
 ath10k_core-$(CONFIG_ATH10K_TRACING) += trace.o
 
 obj-$(CONFIG_ATH10K_PCI) += ath10k_pci.o
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 82017f56e661..18b6d4d8ca1c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -26,6 +26,7 @@
 #include "bmi.h"
 #include "debug.h"
 #include "htt.h"
+#include "testmode.h"
 
 unsigned int ath10k_debug_mask;
 static bool uart_print;
@@ -255,17 +256,36 @@ static int ath10k_download_and_run_otp(struct ath10k *ar)
 	return 0;
 }
 
-static int ath10k_download_fw(struct ath10k *ar)
+static int ath10k_download_fw(struct ath10k *ar, enum ath10k_firmware_mode mode)
 {
-	u32 address;
+	u32 address, data_len;
+	const void *data;
 	int ret;
 
 	address = ar->hw_params.patch_load_addr;
 
-	ret = ath10k_bmi_fast_download(ar, address, ar->firmware_data,
-				       ar->firmware_len);
+	/* to shut up a compiler warning */
+	data = NULL;
+	data_len = 0;
+
+	switch (mode) {
+	case ATH10K_FIRMWARE_MODE_NORMAL:
+		data = ar->firmware_data;
+		data_len = ar->firmware_len;
+		break;
+	case ATH10K_FIRMWARE_MODE_UTF:
+		data = ar->testmode.utf->data;
+		data_len = ar->testmode.utf->size;
+		break;
+	}
+
+	ath10k_dbg(ATH10K_DBG_BOOT,
+		   "boot uploading firmware image %p len %d mode %d\n",
+		   data, data_len, mode);
+
+	ret = ath10k_bmi_fast_download(ar, address, data, data_len);
 	if (ret) {
-		ath10k_err("could not write fw (%d)\n", ret);
+		ath10k_err("failed to download firmware: %d\n", ret);
 		goto exit;
 	}
 
@@ -551,7 +571,8 @@ success:
 	return 0;
 }
 
-static int ath10k_init_download_firmware(struct ath10k *ar)
+static int ath10k_init_download_firmware(struct ath10k *ar,
+					 enum ath10k_firmware_mode mode)
 {
 	int ret;
 
@@ -567,7 +588,7 @@ static int ath10k_init_download_firmware(struct ath10k *ar)
 		return ret;
 	}
 
-	ret = ath10k_download_fw(ar);
+	ret = ath10k_download_fw(ar, mode);
 	if (ret) {
 		ath10k_err("failed to download firmware: %d\n", ret);
 		return ret;
@@ -669,12 +690,15 @@ static void ath10k_core_restart(struct work_struct *work)
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn("device is wedged, will not restart\n");
 		break;
+	case ATH10K_STATE_UTF:
+		ath10k_warn("firmware restart in UTF mode not supported\n");
+		break;
 	}
 
 	mutex_unlock(&ar->conf_mutex);
 }
 
-int ath10k_core_start(struct ath10k *ar)
+int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 {
 	int status;
 
@@ -687,7 +711,7 @@ int ath10k_core_start(struct ath10k *ar)
 		goto err;
 	}
 
-	status = ath10k_init_download_firmware(ar);
+	status = ath10k_init_download_firmware(ar, mode);
 	if (status)
 		goto err;
 
@@ -744,10 +768,12 @@ int ath10k_core_start(struct ath10k *ar)
 		goto err_hif_stop;
 	}
 
-	status = ath10k_htt_connect(&ar->htt);
-	if (status) {
-		ath10k_err("failed to connect htt (%d)\n", status);
-		goto err_hif_stop;
+	if (mode != ATH10K_FIRMWARE_MODE_UTF) {
+		status = ath10k_htt_connect(&ar->htt);
+		if (status) {
+			ath10k_err("failed to connect htt (%d)\n", status);
+			goto err_hif_stop;
+		}
 	}
 
 	status = ath10k_wmi_connect(ar);
@@ -785,10 +811,12 @@ int ath10k_core_start(struct ath10k *ar)
 		goto err_htc_stop;
 	}
 
-	status = ath10k_htt_setup(&ar->htt);
-	if (status) {
-		ath10k_err("failed to setup htt: %d\n", status);
-		goto err_htc_stop;
+	if (mode != ATH10K_FIRMWARE_MODE_UTF) {
+		status = ath10k_htt_setup(&ar->htt);
+		if (status) {
+			ath10k_err("failed to setup htt: %d\n", status);
+			goto err_htc_stop;
+		}
 	}
 
 	status = ath10k_debug_start(ar);
@@ -908,7 +936,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 
 	mutex_lock(&ar->conf_mutex);
 
-	ret = ath10k_core_start(ar);
+	ret = ath10k_core_start(ar, ATH10K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
 		ath10k_err("could not init core (%d)\n", ret);
 		ath10k_core_free_firmware_files(ar);
@@ -1018,6 +1046,8 @@ void ath10k_core_unregister(struct ath10k *ar)
 	 * unhappy about callback failures. */
 	ath10k_mac_unregister(ar);
 
+	ath10k_testmode_unregister(ar);
+
 	ath10k_core_free_firmware_files(ar);
 
 	ath10k_debug_destroy(ar);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 68ceef61933d..de657af3ccdc 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -312,6 +312,17 @@ enum ath10k_state {
 	 * prevents completion timeouts and makes the driver more responsive to
 	 * userspace commands. This is also prevents recursive recovery. */
 	ATH10K_STATE_WEDGED,
+
+	/* factory tests */
+	ATH10K_STATE_UTF,
+};
+
+enum ath10k_firmware_mode {
+	/* the default mode, standard 802.11 functionality */
+	ATH10K_FIRMWARE_MODE_NORMAL,
+
+	/* factory tests etc */
+	ATH10K_FIRMWARE_MODE_UTF,
 };
 
 enum ath10k_fw_features {
@@ -491,13 +502,17 @@ struct ath10k {
 #ifdef CONFIG_ATH10K_DEBUGFS
 	struct ath10k_debug debug;
 #endif
+
+	struct {
+		const struct firmware *utf;
+	} testmode;
 };
 
 struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 				  const struct ath10k_hif_ops *hif_ops);
 void ath10k_core_destroy(struct ath10k *ar);
 
-int ath10k_core_start(struct ath10k *ar);
+int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode);
 int ath10k_wait_for_suspend(struct ath10k *ar, u32 suspend_opt);
 void ath10k_core_stop(struct ath10k *ar);
 int ath10k_core_register(struct ath10k *ar, u32 chip_id);
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index a5824990bd2a..084176e82166 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -34,6 +34,7 @@ enum ath10k_debug_mask {
 	ATH10K_DBG_DATA		= 0x00000200,
 	ATH10K_DBG_BMI		= 0x00000400,
 	ATH10K_DBG_REGULATORY	= 0x00000800,
+	ATH10K_DBG_TESTMODE	= 0x00001000,
 	ATH10K_DBG_ANY		= 0xffffffff,
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 007e855f4ba9..07a79761cd82 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -34,6 +34,7 @@
 #define QCA988X_HW_2_0_PATCH_LOAD_ADDR	0x1234
 
 #define ATH10K_FW_API2_FILE		"firmware-2.bin"
+#define ATH10K_FW_UTF_FILE		"utf.bin"
 
 /* includes also the null byte */
 #define ATH10K_FIRMWARE_MAGIC               "QCA-ATH10K"
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a21080028c54..c376152f213b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -26,6 +26,7 @@
 #include "wmi.h"
 #include "htt.h"
 #include "txrx.h"
+#include "testmode.h"
 
 /**********/
 /* Crypto */
@@ -2431,8 +2432,12 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	case ATH10K_STATE_RESTARTED:
 	case ATH10K_STATE_WEDGED:
 		WARN_ON(1);
+		/* fall through */
 		ret = -EINVAL;
 		goto err;
+	case ATH10K_STATE_UTF:
+		ret = -EBUSY;
+		goto err;
 	}
 
 	ret = ath10k_hif_power_up(ar);
@@ -2441,7 +2446,7 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		goto err_off;
 	}
 
-	ret = ath10k_core_start(ar);
+	ret = ath10k_core_start(ar, ATH10K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
 		ath10k_err("Could not init core: %d\n", ret);
 		goto err_power_down;
@@ -4357,6 +4362,9 @@ static const struct ieee80211_ops ath10k_ops = {
 	.set_bitrate_mask		= ath10k_set_bitrate_mask,
 	.sta_rc_update			= ath10k_sta_rc_update,
 	.get_tsf			= ath10k_get_tsf,
+
+	CFG80211_TESTMODE_CMD(ath10k_tm_cmd)
+
 #ifdef CONFIG_PM
 	.suspend			= ath10k_suspend,
 	.resume				= ath10k_resume,
diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
new file mode 100644
index 000000000000..1bef042d3d5a
--- /dev/null
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -0,0 +1,312 @@
+/*
+ * Copyright (c) 2014 Qualcomm Atheros, Inc.
+ *
+ * Permission to use, copy, modify, and/or distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ */
+
+#include "testmode.h"
+
+#include <net/netlink.h>
+#include <linux/firmware.h>
+
+#include "debug.h"
+#include "wmi.h"
+#include "hif.h"
+#include "hw.h"
+
+/* "API" level of the ath10k testmode interface. Bump it after every
+ * interface change. */
+#define ATH10K_TESTMODE_VERSION 1
+
+#define ATH10K_TM_DATA_MAX_LEN		5000
+
+enum ath10k_tm_attr {
+	__ATH10K_TM_ATTR_INVALID	= 0,
+	ATH10K_TM_ATTR_CMD		= 1,
+	ATH10K_TM_ATTR_DATA		= 2,
+	ATH10K_TM_ATTR_WMI_CMDID	= 3,
+	ATH10K_TM_ATTR_VERSION		= 4,
+
+	/* keep last */
+	__ATH10K_TM_ATTR_AFTER_LAST,
+	ATH10K_TM_ATTR_MAX		= __ATH10K_TM_ATTR_AFTER_LAST - 1,
+};
+
+enum ath10k_tm_cmd {
+	/* Returns the supported ath10k testmode interface version, always
+	 * guaranteed to work. User space uses this to verify it's using
+	 * the correct version of the testmode interface */
+	ATH10K_TM_CMD_GET_VERSION = 0,
+
+	/* boots the utf firmware, interface must be down */
+	ATH10K_TM_CMD_UTF_START = 1,
+
+	/* shuts down the utf firmware, interface must be down */
+	ATH10K_TM_CMD_UTF_STOP = 2,
+
+	/* transmits a wmi command to the firmware */
+	ATH10K_TM_CMD_WMI = 3,
+
+	/* emits a wmi event from firmware to the user space */
+	ATH10K_TM_CMD_EVENT_WMI = 4,
+};
+
+static const struct nla_policy ath10k_tm_policy[ATH10K_TM_ATTR_MAX + 1] = {
+	[ATH10K_TM_ATTR_CMD]		= { .type = NLA_U32 },
+	[ATH10K_TM_ATTR_DATA]		= { .type = NLA_BINARY,
+					    .len = ATH10K_TM_DATA_MAX_LEN },
+	[ATH10K_TM_ATTR_WMI_CMDID]	= { .type = NLA_U32 },
+	[ATH10K_TM_ATTR_VERSION]	= { .type = NLA_U32 },
+};
+
+/* skb owned by the caller, must not sleep */
+void ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)
+{
+	struct sk_buff *nl_skb;
+	int ret;
+
+	ath10k_dbg(ATH10K_DBG_TESTMODE,
+		   "testmode event wmi cmd_id %d skb %p skb->len %d\n",
+		   cmd_id, skb, skb->len);
+
+	ath10k_dbg_dump(ATH10K_DBG_TESTMODE, NULL, "", skb->data, skb->len);
+
+	/* FIXME: locking! */
+
+	if (ar->state != ATH10K_STATE_UTF)
+		return;
+
+	nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
+						   2 * sizeof(u32) + skb->len,
+						   GFP_ATOMIC);
+	if (!nl_skb) {
+		ath10k_warn("failed to allocate skb for testmode wmi event\n");
+		return;
+	}
+
+	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_CMD, ATH10K_TM_CMD_EVENT_WMI);
+	if (ret) {
+		ath10k_warn("failed to to put testmode wmi event cmd attribute: %d\n",
+			    ret);
+		kfree_skb(nl_skb);
+		return;
+	}
+
+	ret = nla_put_u32(nl_skb, ATH10K_TM_ATTR_WMI_CMDID, cmd_id);
+	if (ret) {
+		ath10k_warn("failed to to put testmode wmi even cmd_id: %d\n",
+			    ret);
+		kfree_skb(nl_skb);
+		return;
+	}
+
+	ret = nla_put(nl_skb, ATH10K_TM_ATTR_DATA, skb->len, skb->data);
+	if (ret) {
+		ath10k_warn("failed to copy skb to testmode wmi event: %d\n",
+			    ret);
+		kfree_skb(nl_skb);
+		return;
+	}
+
+	cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
+
+	return;
+}
+
+static int ath10k_tm_cmd_get_version(struct ath10k *ar, struct nlattr *tb[])
+{
+	struct sk_buff *skb;
+	int ret;
+
+	ath10k_dbg(ATH10K_DBG_TESTMODE, "testmode cmd get version %d\n",
+		   ATH10K_TESTMODE_VERSION);
+
+	skb = cfg80211_testmode_alloc_reply_skb(ar->hw->wiphy,
+						nla_total_size(sizeof(u32)));
+	if (!skb)
+		return -ENOMEM;
+
+	ret = nla_put_u32(skb, ATH10K_TM_ATTR_VERSION,
+			  ATH10K_TESTMODE_VERSION);
+	if (ret) {
+		kfree_skb(skb);
+		return ret;
+	}
+
+	return cfg80211_testmode_reply(skb);
+}
+
+static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
+{
+	char filename[100];
+	int ret;
+
+	ath10k_dbg(ATH10K_DBG_TESTMODE, "testmode cmd utf start\n");
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state == ATH10K_STATE_UTF) {
+		ret = -EALREADY;
+		goto out;
+	}
+
+	/* start utf only when the driver is not in use  */
+	if (ar->state != ATH10K_STATE_OFF) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (ar->testmode.utf != NULL)
+		/* utf is already loaded */
+		goto power_up;
+
+
+	snprintf(filename, sizeof(filename), "%s/%s",
+		 ar->hw_params.fw.dir, ATH10K_FW_UTF_FILE);
+
+	/* load utf image now and release only when the device is removed */
+	ret = request_firmware(&ar->testmode.utf, filename, ar->dev);
+	if (ret) {
+		ath10k_warn("failed to retrieve utf firmware '%s': %d\n",
+			    filename, ret);
+		goto out;
+	}
+
+power_up:
+	ret = ath10k_hif_power_up(ar);
+	if (ret) {
+		ath10k_err("failed to power up hif (testmode): %d\n", ret);
+		ar->state = ATH10K_STATE_OFF;
+		goto out;
+	}
+
+	ret = ath10k_core_start(ar, ATH10K_FIRMWARE_MODE_UTF);
+	if (ret) {
+		ath10k_err("failed to start core (testmode): %d\n", ret);
+		ath10k_hif_power_down(ar);
+		ar->state = ATH10K_STATE_OFF;
+		goto out;
+	}
+
+	ar->state = ATH10K_STATE_UTF;
+	ret = 0;
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static int ath10k_tm_cmd_utf_stop(struct ath10k *ar, struct nlattr *tb[])
+{
+	int ret;
+
+	ath10k_dbg(ATH10K_DBG_TESTMODE, "testmode cmd utf stop\n");
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH10K_STATE_UTF) {
+		ret = -ENETDOWN;
+		goto out;
+	}
+
+	ath10k_core_stop(ar);
+	ath10k_hif_power_down(ar);
+
+	ar->state = ATH10K_STATE_OFF;
+	ret = 0;
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static int ath10k_tm_cmd_wmi(struct ath10k *ar, struct nlattr *tb[])
+{
+	struct sk_buff *skb;
+	int ret, buf_len;
+	u32 cmd_id;
+	void *buf;
+
+	if (!tb[ATH10K_TM_ATTR_DATA])
+		return -EINVAL;
+
+	if (!tb[ATH10K_TM_ATTR_WMI_CMDID])
+		return -EINVAL;
+
+	buf = nla_data(tb[ATH10K_TM_ATTR_DATA]);
+	buf_len = nla_len(tb[ATH10K_TM_ATTR_DATA]);
+	cmd_id = nla_get_u32(tb[ATH10K_TM_ATTR_WMI_CMDID]);
+
+	ath10k_dbg(ATH10K_DBG_TESTMODE,
+		   "testmode cmd wmi cmd_id %d buf %p buf_len %d\n",
+		   cmd_id, buf, buf_len);
+
+	ath10k_dbg_dump(ATH10K_DBG_TESTMODE, NULL, "", buf, buf_len);
+
+	skb = ath10k_wmi_alloc_skb(buf_len);
+
+	memcpy(skb->data, buf, buf_len);
+
+	ret = ath10k_wmi_cmd_send(ar, skb, cmd_id);
+	if (ret) {
+		ath10k_warn("failed to transmit wmi command (testmode): %d\n",
+			    ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int ath10k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		  void *data, int len)
+{
+	struct ath10k *ar = hw->priv;
+	struct nlattr *tb[ATH10K_TM_ATTR_MAX + 1];
+	int err;
+
+	err = nla_parse(tb, ATH10K_TM_ATTR_MAX, data, len,
+			ath10k_tm_policy);
+	if (err)
+		return err;
+
+	if (!tb[ATH10K_TM_ATTR_CMD])
+		return -EINVAL;
+
+	switch (nla_get_u32(tb[ATH10K_TM_ATTR_CMD])) {
+	case ATH10K_TM_CMD_GET_VERSION:
+		return ath10k_tm_cmd_get_version(ar, tb);
+	case ATH10K_TM_CMD_UTF_START:
+		return ath10k_tm_cmd_utf_start(ar, tb);
+	case ATH10K_TM_CMD_UTF_STOP:
+		return ath10k_tm_cmd_utf_stop(ar, tb);
+	case ATH10K_TM_CMD_WMI:
+		return ath10k_tm_cmd_wmi(ar, tb);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+void ath10k_testmode_unregister(struct ath10k *ar)
+{
+	/* FIXME: locking! */
+
+	release_firmware(ar->testmode.utf);
+
+	if (ar->state != ATH10K_STATE_UTF)
+		/* utf firmware is not running */
+		return;
+
+	ath10k_htc_stop(&ar->htc);
+	ath10k_wmi_detach(ar);
+	ath10k_hif_power_down(ar);
+}
diff --git a/drivers/net/wireless/ath/ath10k/testmode.h b/drivers/net/wireless/ath/ath10k/testmode.h
new file mode 100644
index 000000000000..fc35c7e6f066
--- /dev/null
+++ b/drivers/net/wireless/ath/ath10k/testmode.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright (c) 2014 Qualcomm Atheros, Inc.
+ *
+ * Permission to use, copy, modify, and/or distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ */
+
+#include "core.h"
+
+#ifdef CONFIG_NL80211_TESTMODE
+
+void ath10k_testmode_unregister(struct ath10k *ar);
+
+void ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb);
+int ath10k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		  void *data, int len);
+
+#else
+
+static inline void ath10k_testmode_unregister(struct ath10k *ar)
+{
+}
+
+static inline void ath10k_tm_event_wmi(struct ath10k *ar, u32 cmd_id,
+				       struct sk_buff *skb)
+{
+}
+
+static inline int ath10k_tm_cmd(struct ieee80211_hw *hw,
+				struct ieee80211_vif *vif,
+				void *data, int len)
+{
+	return 0;
+}
+
+#endif
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 921d18d599fc..204c0e293b8e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -23,6 +23,7 @@
 #include "debug.h"
 #include "wmi.h"
 #include "mac.h"
+#include "testmode.h"
 
 /* MAIN WMI cmd track */
 static struct wmi_cmd_map wmi_cmd_map = {
@@ -2235,6 +2236,7 @@ static void ath10k_wmi_10x_process_rx(struct ath10k *ar, struct sk_buff *skb)
 	len = skb->len;
 
 	trace_ath10k_wmi_event(id, skb->data, skb->len);
+	ath10k_tm_event_wmi(ar, id, skb);
 
 	switch (id) {
 	case WMI_10X_MGMT_RX_EVENTID:
@@ -2322,6 +2324,9 @@ static void ath10k_wmi_10x_process_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_10X_READY_EVENTID:
 		ath10k_wmi_ready_event_rx(ar, skb);
 		break;
+	case WMI_10X_PDEV_UTF_EVENTID:
+		/* ignore utf events */
+		break;
 	default:
 		ath10k_warn("Unknown eventid: %d\n", id);
 		break;
@@ -2333,6 +2338,7 @@ static void ath10k_wmi_10x_process_rx(struct ath10k *ar, struct sk_buff *skb)
 
 static void ath10k_wmi_process_rx(struct ath10k *ar, struct sk_buff *skb)
 {
+	/* FIXME: somehow force ot use 10x with UTF */
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
 		ath10k_wmi_10x_process_rx(ar, skb);
 	else


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
