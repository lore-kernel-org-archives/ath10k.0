Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3756C7EE23
	for <ath10k@archiver.kernel.org>; Sun, 11 Jun 2023 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYzfG8raoXBnzMixq4ZbFZR6sFGcENjM7H7cCzyyeAA=; b=AvoH4sCmnzceJF
	C/8+kUtNTFeFB3qmoE4nbIxjMXcm27ljzr4nXmMAkWBLschd7wQMDWYlfmtlthK6vYFhLeqS56nG1
	rLaHSbEtkKUzQBzk48s+rvcVMueKR24tUMV0BJWDrzDT7Yal0u7Ss3aeAZvxbMp5AhILhaiPwuZ8Q
	VpfCQnNz4Fc1J7CHsrpOqD3WQPo58Fs9A0G2ifpJRnyIBpYWVK88IXXo76/tNyzdHyxlY/082H5Ua
	m4CCv90THYWEbP77rNOgFINmfuZ3AZylgpuM7Yx2Z3/wlvXhGO7GjbSJF9/xQqImlpsQmq2o8kX72
	7lD7gzQ+dd6c3/XKtL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NmT-001Jh2-17;
	Sun, 11 Jun 2023 16:19:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NmP-001JfN-1G
	for ath10k@lists.infradead.org;
	Sun, 11 Jun 2023 16:19:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30af0aa4812so2208255f8f.1
        for <ath10k@lists.infradead.org>; Sun, 11 Jun 2023 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686500329; x=1689092329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UK2JCJaFut5nkBmF19u7JPJCqeH3Vy0Fyp7sDDnIFe0=;
        b=mT/kLZ5hHntzyRya7N5fphuiuUHgo07Q/VLJTgWN9AMAV58/6kDwMPun+0D7JkRceA
         FeQpc5z4QahJTLPH1e2lcRpT51Vn0N2ONOetREmj1621ZJQbedspoZnt6GI73nvRrUV7
         Pj77Yu+WMY3ksgt9qFyLSfuVKFdEDu3nFMw+jLvES/BzO02XR9wTSjn0pOdh1YxrbPSP
         5v/EbigL2bAbJ4g2BZZXYgN33cD07p/6xIE4VzFPDsEwEL/TLhZ8VdUwVgOCEqHGml34
         jJ7/4x7r0jUXvNjb60u1iu6zdOr4nURNN7IisKbq1hTiPzjTnSomiNxzK/m4kSy++DUt
         17Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686500329; x=1689092329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UK2JCJaFut5nkBmF19u7JPJCqeH3Vy0Fyp7sDDnIFe0=;
        b=ODhJF2HJk9a0dVob8V1H6fg9V2QRV06GwzDvr79mbT20p02q3DRXPYBa19zMg0NfO+
         VM/e9w82eATyBp2VmcCOav3WQesLaTxJIyUMRQ4VJ3RPNT1bKLr8onux0iJEzY/Ifxjg
         2KB+jL/zKyTABYEu4xBwY86mvpRYEA5nEp8qV+5gJjo5TqTKquEOWnpdtTnnj3AqI+b3
         G4+esBcBs31OnM4SIh7tUjtiRsYQSIdA6V2Wwe2cO5tawlEUIiLlmT3g72xYB5sN/I4T
         4X/3ObxFZEopqJXeCYqTLDzJTE+7dweWwogrIjvNuvReBdNZZ9OZ2kKcpNnPlO+3Elr2
         GQyg==
X-Gm-Message-State: AC+VfDxb1ATHw8QSDzCO/UyLiofX2a37PDv03IamqmH5cGgcqwR7eLLk
	tIgBkM5pQMEUXezBBZoLdf4=
X-Google-Smtp-Source: ACHHUZ4FPzaLje34QyXdKnTUXwZU3PbQzp7wpo7a+LdcN8mcqtiGBMTx/bSd4xE99JxgrbpTfm4c/w==
X-Received: by 2002:a5d:4b86:0:b0:30d:5cce:3bb5 with SMTP id b6-20020a5d4b86000000b0030d5cce3bb5mr2538968wrt.60.1686500328361;
        Sun, 11 Jun 2023 09:18:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.googlemail.com with ESMTPSA id y14-20020a5d620e000000b0030ae4350212sm10059830wru.66.2023.06.11.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:18:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>,
	Steve deRosier <derosier@cal-sierra.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: [PATCH v14] ath10k: add LED and GPIO controlling support for various chipsets
Date: Sun, 11 Jun 2023 10:05:05 +0200
Message-Id: <20230611080505.17393-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_091901_441711_9337126C 
X-CRM114-Status: GOOD (  34.33  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Sebastian Gottschall <s.gottschall@dd-wrt.com>

Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984
based chipsets with on chipset connected led's using WMI Firmware API.
The LED device will get available named as "ath10k-phyX" at sysfs and
can be controlled with various triggers.
Adds also debugfs interface for gpio control.

Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
[kvalo: major reorg and cleanup]
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
[ansuel: rebase and small cleanup]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Tested-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
---

Hi,
this is a very old patch from 2018 that somehow was talked till 2020
with Kavlo asked to rebase and resubmit and nobody did.
So here we are in 2023 with me trying to finally have this upstream.

A summarize of the situation.
- The patch is from years in OpenWRT. Used by anything that has ath10k
  card and a LED connected.
- This patch is also used by the fw variant from Candela Tech with no
  problem reported.
- It was pointed out that this caused some problem with ipq4019 SoC
  but the problem was actually caused by a different bug related to
  interrupts.

I honestly hope we can have this feature merged since it's really
funny to have something that was so near merge and jet still not
present and with devices not supporting this simple but useful
feature.

Changes v14:
- Fixed SPDX missing tag in leds.c and leds.h
- Fixes discrepancy between From: and Signed-off-by:
- Improve and rework kconfig description
- Improve commit description
- Add very old tested-by tag

(v13 changelog from Kavlo from 2018 [1])

* only compile tested!

* fix all checkpatch warnings

* fix commit log

* sizeof(struct ath10k_gpiocontrol) -> sizeof(*gpio)

* unsigned -> unsigned int

* remove GPIOLIB code, that should be added in a separate patch

* rename gpio.c to leds.c

* add leds.h

* rename some functions:

  ath10k_attach_led() -> ath10k_leds_register()
  ath10k_unregister_led() -> ath10k_leds_unregister()
  ath10k_reset_led_pin() -> ath10k_leds_start()

* call ath10k_leds_unregister() before ath10k_thermal_unregister() to preserve ordering

* call ath10k_leds_start() only from ath10k_core_start() and not from mac.c

* rename struct ath10k_gpiocontrol as anonymous function under struct
  ath10k::leds, no need for memory allocation

* merge ath10k_add_led() to ath10k_attach_led(), which is it's only caller

* remove #if IS_ENABLED() checks from most of places, memory savings from those were not worth it

* Kconfig help text improvement and move it lower in the menu, also don't enable it by default

* switch to set_brightness_blocking() so that the callback can sleep,
  then no need to use ath10k_wmi_cmd_send_nowait() and can take mutex
  to access ar->state

* don't touch ath10k_wmi_pdev_get_temperature()

* as QCA6174/QCA9377 are not (yet) supported don't add the command to WMI-TLV interface

* remove debugfs interface, that should be added in another patch

* cleanup includes

(old changelog from really old patch v12 from 2018 [1])
v12 fix warning
v11 make register_gpio_chip static. advise by krobot
v10 compile fix if gpiolib isnt included
v9  move led and led code to separate sourcefile (gpio.c)
v8  fix various code design issues reported by reviewers
v7  fix ath10k_unregister_led for compiling without LED_CLASS
v6  correct return values and fix comment style
v5  fix compiling without LED_CLASS and GPIOLIB support, fix also error by kbuild test robot which does not occur in standard builds. curious
v2  add correct gpio count per chipset and remove IPQ4019 support since this chipset does not make use of specific gpios)

[1] https://patchwork.kernel.org/project/ath10k/patch/20180226084406.2093-1-s.gottschall@dd-wrt.com/
[2] https://patchwork.kernel.org/project/ath10k/patch/1523027875-5143-1-git-send-email-kvalo@codeaurora.org/

 drivers/net/wireless/ath/ath10k/Kconfig   | 17 +++++
 drivers/net/wireless/ath/ath10k/Makefile  |  1 +
 drivers/net/wireless/ath/ath10k/core.c    | 21 ++++++
 drivers/net/wireless/ath/ath10k/core.h    |  8 ++
 drivers/net/wireless/ath/ath10k/hw.h      |  1 +
 drivers/net/wireless/ath/ath10k/leds.c    | 92 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/leds.h    | 34 +++++++++
 drivers/net/wireless/ath/ath10k/mac.c     |  1 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 32 ++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  2 +
 drivers/net/wireless/ath/ath10k/wmi.c     | 54 +++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     | 35 +++++++++
 12 files changed, 298 insertions(+)
 create mode 100644 drivers/net/wireless/ath/ath10k/leds.c
 create mode 100644 drivers/net/wireless/ath/ath10k/leds.h

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index e6ea884cafc1..d8726090d70a 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -67,6 +67,23 @@ config ATH10K_DEBUGFS
 
 	  If unsure, say Y to make it easier to debug problems.
 
+config ATH10K_LEDS
+	bool "Atheros ath10k LED support"
+	depends on ATH10K
+	select MAC80211_LEDS
+	select LEDS_CLASS
+	select NEW_LEDS
+	default y
+	help
+	  This option enables LEDs support for chipset LED pins.
+	  Each pin is connected via GPIO and can be controlled using
+	  WMI Firmware API.
+
+	  The LED device will get available named as "ath10k-phyX" at sysfs and
+    	  can be controlled with various triggers.
+
+	  Say Y, if you have LED pins connected to the ath10k wireless card.
+
 config ATH10K_SPECTRAL
 	bool "Atheros ath10k spectral scan support"
 	depends on ATH10K_DEBUGFS
diff --git a/drivers/net/wireless/ath/ath10k/Makefile b/drivers/net/wireless/ath/ath10k/Makefile
index 142c777b287f..02bf9b629038 100644
--- a/drivers/net/wireless/ath/ath10k/Makefile
+++ b/drivers/net/wireless/ath/ath10k/Makefile
@@ -19,6 +19,7 @@ ath10k_core-$(CONFIG_ATH10K_SPECTRAL) += spectral.o
 ath10k_core-$(CONFIG_NL80211_TESTMODE) += testmode.o
 ath10k_core-$(CONFIG_ATH10K_TRACING) += trace.o
 ath10k_core-$(CONFIG_THERMAL) += thermal.o
+ath10k_core-$(CONFIG_ATH10K_LEDS) += leds.o
 ath10k_core-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
 ath10k_core-$(CONFIG_PM) += wow.o
 ath10k_core-$(CONFIG_DEV_COREDUMP) += coredump.o
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6cdb225b7eac..a8dbaf0a74c4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -26,6 +26,7 @@
 #include "testmode.h"
 #include "wmi-ops.h"
 #include "coredump.h"
+#include "leds.h"
 
 unsigned int ath10k_debug_mask;
 EXPORT_SYMBOL(ath10k_debug_mask);
@@ -65,6 +66,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.dev_id = QCA988X_2_0_DEVICE_ID,
 		.bus = ATH10K_BUS_PCI,
 		.name = "qca988x hw2.0",
+		.led_pin = 1,
 		.patch_load_addr = QCA988X_HW_2_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
 		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_ALL,
@@ -146,6 +148,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.dev_id = QCA9887_1_0_DEVICE_ID,
 		.bus = ATH10K_BUS_PCI,
 		.name = "qca9887 hw1.0",
+		.led_pin = 1,
 		.patch_load_addr = QCA9887_HW_1_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
 		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_ALL,
@@ -387,6 +390,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.dev_id = QCA99X0_2_0_DEVICE_ID,
 		.bus = ATH10K_BUS_PCI,
 		.name = "qca99x0 hw2.0",
+		.led_pin = 17,
 		.patch_load_addr = QCA99X0_HW_2_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
 		.otp_exe_param = 0x00000700,
@@ -433,6 +437,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.dev_id = QCA9984_1_0_DEVICE_ID,
 		.bus = ATH10K_BUS_PCI,
 		.name = "qca9984/qca9994 hw1.0",
+		.led_pin = 17,
 		.patch_load_addr = QCA9984_HW_1_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
 		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_EACH,
@@ -486,6 +491,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.dev_id = QCA9888_2_0_DEVICE_ID,
 		.bus = ATH10K_BUS_PCI,
 		.name = "qca9888 hw2.0",
+		.led_pin = 17,
 		.patch_load_addr = QCA9888_HW_2_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
 		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_EACH,
@@ -3222,6 +3228,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
+	status = ath10k_leds_start(ar);
+	if (status)
+		goto err_hif_stop;
+
 	return 0;
 
 err_hif_stop:
@@ -3480,9 +3490,18 @@ static void ath10k_core_register_work(struct work_struct *work)
 		goto err_spectral_destroy;
 	}
 
+	status = ath10k_leds_register(ar);
+	if (status) {
+		ath10k_err(ar, "could not register leds: %d\n",
+			   status);
+		goto err_thermal_unregister;
+	}
+
 	set_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags);
 	return;
 
+err_thermal_unregister:
+	ath10k_thermal_unregister(ar);
 err_spectral_destroy:
 	ath10k_spectral_destroy(ar);
 err_debug_destroy:
@@ -3518,6 +3537,8 @@ void ath10k_core_unregister(struct ath10k *ar)
 	if (!test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
 		return;
 
+	ath10k_leds_unregister(ar);
+
 	ath10k_thermal_unregister(ar);
 	/* Stop spectral before unregistering from mac80211 to remove the
 	 * relayfs debugfs file cleanly. Otherwise the parent debugfs tree
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 4b5239de4018..2a15fcdad0b9 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -14,6 +14,7 @@
 #include <linux/pci.h>
 #include <linux/uuid.h>
 #include <linux/time.h>
+#include <linux/leds.h>
 
 #include "htt.h"
 #include "htc.h"
@@ -1255,6 +1256,13 @@ struct ath10k {
 		bool utf_monitor;
 	} testmode;
 
+	struct {
+		struct gpio_led wifi_led;
+		struct led_classdev cdev;
+		char label[48];
+		u32 gpio_state_pin;
+	} leds;
+
 	struct {
 		/* protected by data_lock */
 		u32 rx_crc_err_drop;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 9643031a4427..9d66293517b5 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -519,6 +519,7 @@ struct ath10k_hw_params {
 	const char *name;
 	u32 patch_load_addr;
 	int uart_pin;
+	int led_pin;
 	u32 otp_exe_param;
 
 	/* Type of hw cycle counter wraparound logic, for more info
diff --git a/drivers/net/wireless/ath/ath10k/leds.c b/drivers/net/wireless/ath/ath10k/leds.c
new file mode 100644
index 000000000000..8f5d66bb50b9
--- /dev/null
+++ b/drivers/net/wireless/ath/ath10k/leds.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2005-2011 Atheros Communications Inc.
+ * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
+ * Copyright (c) 2018 Sebastian Gottschall <s.gottschall@dd-wrt.com>
+ * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/leds.h>
+
+#include "core.h"
+#include "wmi.h"
+#include "wmi-ops.h"
+
+#include "leds.h"
+
+static int ath10k_leds_set_brightness_blocking(struct led_classdev *led_cdev,
+					       enum led_brightness brightness)
+{
+	struct ath10k *ar = container_of(led_cdev, struct ath10k,
+					 leds.cdev);
+	struct gpio_led *led = &ar->leds.wifi_led;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH10K_STATE_ON)
+		goto out;
+
+	ar->leds.gpio_state_pin = (brightness != LED_OFF) ^ led->active_low;
+	ath10k_wmi_gpio_output(ar, led->gpio, ar->leds.gpio_state_pin);
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+
+	return 0;
+}
+
+int ath10k_leds_start(struct ath10k *ar)
+{
+	if (ar->hw_params.led_pin == 0)
+		/* leds not supported */
+		return 0;
+
+	/* under some circumstances, the gpio pin gets reconfigured
+	 * to default state by the firmware, so we need to
+	 * reconfigure it this behaviour has only ben seen on
+	 * QCA9984 and QCA99XX devices so far
+	 */
+	ath10k_wmi_gpio_config(ar, ar->hw_params.led_pin, 0,
+			       WMI_GPIO_PULL_NONE, WMI_GPIO_INTTYPE_DISABLE);
+	ath10k_wmi_gpio_output(ar, ar->hw_params.led_pin, 1);
+
+	return 0;
+}
+
+int ath10k_leds_register(struct ath10k *ar)
+{
+	int ret;
+
+	if (ar->hw_params.led_pin == 0)
+		/* leds not supported */
+		return 0;
+
+	snprintf(ar->leds.label, sizeof(ar->leds.label), "ath10k-%s",
+		 wiphy_name(ar->hw->wiphy));
+	ar->leds.wifi_led.active_low = 1;
+	ar->leds.wifi_led.gpio = ar->hw_params.led_pin;
+	ar->leds.wifi_led.name = ar->leds.label;
+	ar->leds.wifi_led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
+
+	ar->leds.cdev.name = ar->leds.label;
+	ar->leds.cdev.brightness_set_blocking = ath10k_leds_set_brightness_blocking;
+
+	/* FIXME: this assignment doesn't make sense as it's NULL, remove it? */
+	ar->leds.cdev.default_trigger = ar->leds.wifi_led.default_trigger;
+
+	ret = led_classdev_register(wiphy_dev(ar->hw->wiphy), &ar->leds.cdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void ath10k_leds_unregister(struct ath10k *ar)
+{
+	if (ar->hw_params.led_pin == 0)
+		/* leds not supported */
+		return;
+
+	led_classdev_unregister(&ar->leds.cdev);
+}
+
diff --git a/drivers/net/wireless/ath/ath10k/leds.h b/drivers/net/wireless/ath/ath10k/leds.h
new file mode 100644
index 000000000000..1254e21e87de
--- /dev/null
+++ b/drivers/net/wireless/ath/ath10k/leds.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2005-2011 Atheros Communications Inc.
+ * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
+ * Copyright (c) 2018 Sebastian Gottschall <s.gottschall@dd-wrt.com>
+ * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _LEDS_H_
+#define _LEDS_H_
+
+#include "core.h"
+
+#ifdef CONFIG_ATH10K_LEDS
+void ath10k_leds_unregister(struct ath10k *ar);
+int ath10k_leds_start(struct ath10k *ar);
+int ath10k_leds_register(struct ath10k *ar);
+#else
+static inline void ath10k_leds_unregister(struct ath10k *ar)
+{
+}
+
+static inline int ath10k_leds_start(struct ath10k *ar)
+{
+	return 0;
+}
+
+static inline int ath10k_leds_register(struct ath10k *ar)
+{
+	return 0;
+}
+
+#endif
+#endif /* _LEDS_H_ */
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 03e7bc5b6c0b..54649b24e690 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -24,6 +24,7 @@
 #include "wmi-tlv.h"
 #include "wmi-ops.h"
 #include "wow.h"
+#include "leds.h"
 
 /*********/
 /* Rates */
diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
index aa57d807491c..f3f6b5954b27 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
@@ -226,7 +226,10 @@ struct wmi_ops {
 			 const struct wmi_bb_timing_cfg_arg *arg);
 	struct sk_buff *(*gen_per_peer_per_tid_cfg)(struct ath10k *ar,
 						    const struct wmi_per_peer_per_tid_cfg_arg *arg);
+	struct sk_buff *(*gen_gpio_config)(struct ath10k *ar, u32 gpio_num,
+					   u32 input, u32 pull_type, u32 intr_mode);
 
+	struct sk_buff *(*gen_gpio_output)(struct ath10k *ar, u32 gpio_num, u32 set);
 };
 
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
@@ -1122,6 +1125,35 @@ ath10k_wmi_force_fw_hang(struct ath10k *ar,
 	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->force_fw_hang_cmdid);
 }
 
+static inline int ath10k_wmi_gpio_config(struct ath10k *ar, u32 gpio_num,
+					 u32 input, u32 pull_type, u32 intr_mode)
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_gpio_config)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_gpio_config(ar, gpio_num, input, pull_type, intr_mode);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->gpio_config_cmdid);
+}
+
+static inline int ath10k_wmi_gpio_output(struct ath10k *ar, u32 gpio_num, u32 set)
+{
+	struct sk_buff *skb;
+
+	if (!ar->wmi.ops->gen_gpio_config)
+		return -EOPNOTSUPP;
+
+	skb = ar->wmi.ops->gen_gpio_output(ar, gpio_num, set);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->gpio_output_cmdid);
+}
+
 static inline int
 ath10k_wmi_dbglog_cfg(struct ath10k *ar, u64 module_enable, u32 log_level)
 {
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 6b6aa3c36744..8a3a3bde2446 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -4601,6 +4601,8 @@ static const struct wmi_ops wmi_tlv_ops = {
 	.gen_echo = ath10k_wmi_tlv_op_gen_echo,
 	.gen_vdev_spectral_conf = ath10k_wmi_tlv_op_gen_vdev_spectral_conf,
 	.gen_vdev_spectral_enable = ath10k_wmi_tlv_op_gen_vdev_spectral_enable,
+	/* .gen_gpio_config not implemented */
+	/* .gen_gpio_output not implemented */
 };
 
 static const struct wmi_peer_flags_map wmi_tlv_peer_flags_map = {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 05fa7d4c0e1a..25352fa6162d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7472,6 +7472,49 @@ ath10k_wmi_op_gen_peer_set_param(struct ath10k *ar, u32 vdev_id,
 	return skb;
 }
 
+static struct sk_buff *ath10k_wmi_op_gen_gpio_config(struct ath10k *ar,
+						     u32 gpio_num, u32 input,
+						     u32 pull_type, u32 intr_mode)
+{
+	struct wmi_gpio_config_cmd *cmd;
+	struct sk_buff *skb;
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	cmd = (struct wmi_gpio_config_cmd *)skb->data;
+	cmd->pull_type = __cpu_to_le32(pull_type);
+	cmd->gpio_num = __cpu_to_le32(gpio_num);
+	cmd->input = __cpu_to_le32(input);
+	cmd->intr_mode = __cpu_to_le32(intr_mode);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi gpio_config gpio_num 0x%08x input 0x%08x pull_type 0x%08x intr_mode 0x%08x\n",
+		   gpio_num, input, pull_type, intr_mode);
+
+	return skb;
+}
+
+static struct sk_buff *ath10k_wmi_op_gen_gpio_output(struct ath10k *ar,
+						     u32 gpio_num, u32 set)
+{
+	struct wmi_gpio_output_cmd *cmd;
+	struct sk_buff *skb;
+
+	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
+	if (!skb)
+		return ERR_PTR(-ENOMEM);
+
+	cmd = (struct wmi_gpio_output_cmd *)skb->data;
+	cmd->gpio_num = __cpu_to_le32(gpio_num);
+	cmd->set = __cpu_to_le32(set);
+
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi gpio_output gpio_num 0x%08x set 0x%08x\n",
+		   gpio_num, set);
+
+	return skb;
+}
+
 static struct sk_buff *
 ath10k_wmi_op_gen_set_psmode(struct ath10k *ar, u32 vdev_id,
 			     enum wmi_sta_ps_mode psmode)
@@ -9138,6 +9181,9 @@ static const struct wmi_ops wmi_ops = {
 	.fw_stats_fill = ath10k_wmi_main_op_fw_stats_fill,
 	.get_vdev_subtype = ath10k_wmi_op_get_vdev_subtype,
 	.gen_echo = ath10k_wmi_op_gen_echo,
+	.gen_gpio_config = ath10k_wmi_op_gen_gpio_config,
+	.gen_gpio_output = ath10k_wmi_op_gen_gpio_output,
+
 	/* .gen_bcn_tmpl not implemented */
 	/* .gen_prb_tmpl not implemented */
 	/* .gen_p2p_go_bcn_ie not implemented */
@@ -9208,6 +9254,8 @@ static const struct wmi_ops wmi_10_1_ops = {
 	.fw_stats_fill = ath10k_wmi_10x_op_fw_stats_fill,
 	.get_vdev_subtype = ath10k_wmi_op_get_vdev_subtype,
 	.gen_echo = ath10k_wmi_op_gen_echo,
+	.gen_gpio_config = ath10k_wmi_op_gen_gpio_config,
+	.gen_gpio_output = ath10k_wmi_op_gen_gpio_output,
 	/* .gen_bcn_tmpl not implemented */
 	/* .gen_prb_tmpl not implemented */
 	/* .gen_p2p_go_bcn_ie not implemented */
@@ -9280,6 +9328,8 @@ static const struct wmi_ops wmi_10_2_ops = {
 	.gen_delba_send = ath10k_wmi_op_gen_delba_send,
 	.fw_stats_fill = ath10k_wmi_10x_op_fw_stats_fill,
 	.get_vdev_subtype = ath10k_wmi_op_get_vdev_subtype,
+	.gen_gpio_config = ath10k_wmi_op_gen_gpio_config,
+	.gen_gpio_output = ath10k_wmi_op_gen_gpio_output,
 	/* .gen_pdev_enable_adaptive_cca not implemented */
 };
 
@@ -9351,6 +9401,8 @@ static const struct wmi_ops wmi_10_2_4_ops = {
 		ath10k_wmi_op_gen_pdev_enable_adaptive_cca,
 	.get_vdev_subtype = ath10k_wmi_10_2_4_op_get_vdev_subtype,
 	.gen_bb_timing = ath10k_wmi_10_2_4_op_gen_bb_timing,
+	.gen_gpio_config = ath10k_wmi_op_gen_gpio_config,
+	.gen_gpio_output = ath10k_wmi_op_gen_gpio_output,
 	/* .gen_bcn_tmpl not implemented */
 	/* .gen_prb_tmpl not implemented */
 	/* .gen_p2p_go_bcn_ie not implemented */
@@ -9432,6 +9484,8 @@ static const struct wmi_ops wmi_10_4_ops = {
 	.gen_pdev_bss_chan_info_req = ath10k_wmi_10_2_op_gen_pdev_bss_chan_info,
 	.gen_echo = ath10k_wmi_op_gen_echo,
 	.gen_pdev_get_tpc_config = ath10k_wmi_10_2_4_op_gen_pdev_get_tpc_config,
+	.gen_gpio_config = ath10k_wmi_op_gen_gpio_config,
+	.gen_gpio_output = ath10k_wmi_op_gen_gpio_output,
 };
 
 int ath10k_wmi_attach(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 6d04a66fe5e0..6442a76077dd 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3030,6 +3030,41 @@ enum wmi_10_4_feature_mask {
 
 };
 
+/* WMI_GPIO_CONFIG_CMDID */
+enum {
+	WMI_GPIO_PULL_NONE,
+	WMI_GPIO_PULL_UP,
+	WMI_GPIO_PULL_DOWN,
+};
+
+enum {
+	WMI_GPIO_INTTYPE_DISABLE,
+	WMI_GPIO_INTTYPE_RISING_EDGE,
+	WMI_GPIO_INTTYPE_FALLING_EDGE,
+	WMI_GPIO_INTTYPE_BOTH_EDGE,
+	WMI_GPIO_INTTYPE_LEVEL_LOW,
+	WMI_GPIO_INTTYPE_LEVEL_HIGH
+};
+
+/* WMI_GPIO_CONFIG_CMDID */
+struct wmi_gpio_config_cmd {
+	__le32 gpio_num;             /* GPIO number to be setup */
+	__le32 input;                /* 0 - Output/ 1 - Input */
+	__le32 pull_type;            /* Pull type defined above */
+	__le32 intr_mode;            /* Interrupt mode defined above (Input) */
+} __packed;
+
+/* WMI_GPIO_OUTPUT_CMDID */
+struct wmi_gpio_output_cmd {
+	__le32 gpio_num;    /* GPIO number to be setup */
+	__le32 set;         /* Set the GPIO pin*/
+} __packed;
+
+/* WMI_GPIO_INPUT_EVENTID */
+struct wmi_gpio_input_event {
+	__le32 gpio_num;    /* GPIO number which changed state */
+} __packed;
+
 struct wmi_ext_resource_config_10_4_cmd {
 	/* contains enum wmi_host_platform_type */
 	__le32 host_platform_config;
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
