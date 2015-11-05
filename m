Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuGGx-0006Z2-CL
 for ath10k@lists.infradead.org; Thu, 05 Nov 2015 08:51:56 +0000
Received: by lfbf136 with SMTP id f136so54255461lfb.0
 for <ath10k@lists.infradead.org>; Thu, 05 Nov 2015 00:51:33 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2 4/4] ath10k: add QCA9377 hw1.0 support
Date: Thu,  5 Nov 2015 09:50:43 +0100
Message-Id: <1446713443-22542-5-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
References: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Add new BMI target version and chip id revision. Register it
on supported chips list.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
 drivers/net/wireless/ath/ath10k/pci.c  |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9b32cb38eb45..c02e7038a1e6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -161,6 +161,24 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		},
 	},
 	{
+		.id = QCA9377_HW_1_0_DEV_VERSION,
+		.dev_id = QCA9377_1_0_DEVICE_ID,
+		.name = "qca9377 hw1.0",
+		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
+		.uart_pin = 6,
+		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
+		.fw = {
+			.dir = QCA9377_HW_1_0_FW_DIR,
+			.fw = QCA9377_HW_1_0_FW_FILE,
+			.otp = QCA9377_HW_1_0_OTP_FILE,
+			.board = QCA9377_HW_1_0_BOARD_DATA_FILE,
+			.board_size = QCA9377_BOARD_DATA_SZ,
+			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
+		},
+	},
+	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
 		.dev_id = QCA9377_1_0_DEVICE_ID,
 		.name = "qca9377 hw1.1",
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 3a5c68ac5d34..8ef3c0e487b8 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -48,6 +48,8 @@
 #define QCA6174_HW_3_0_VERSION		0x05020000
 #define QCA6174_HW_3_2_VERSION		0x05030000
 
+/* QCA9377 target BMI version signatures */
+#define QCA9377_HW_1_0_DEV_VERSION	0x05020000
 #define QCA9377_HW_1_1_DEV_VERSION	0x05020001
 
 enum qca6174_pci_rev {
@@ -69,6 +71,7 @@ enum qca6174_chip_id_rev {
 };
 
 enum qca9377_chip_id_rev {
+	QCA9377_HW_1_0_CHIP_ID_REV = 0x0,
 	QCA9377_HW_1_1_CHIP_ID_REV = 0x1,
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 0be43b80a9a4..6c46814012ef 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -86,6 +86,8 @@ static const struct ath10k_pci_supp_chip ath10k_pci_supp_chips[] = {
 	{ QCA6174_2_1_DEVICE_ID, QCA6174_HW_3_2_CHIP_ID_REV },
 
 	{ QCA99X0_2_0_DEVICE_ID, QCA99X0_HW_2_0_CHIP_ID_REV },
+
+	{ QCA9377_1_0_DEVICE_ID, QCA9377_HW_1_0_CHIP_ID_REV },
 	{ QCA9377_1_0_DEVICE_ID, QCA9377_HW_1_1_CHIP_ID_REV },
 };
 
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
