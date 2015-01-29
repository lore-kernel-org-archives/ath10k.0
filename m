Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGoAQ-0002ZA-MB
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 12:25:51 +0000
Received: by mail-wg0-f50.google.com with SMTP id b13so22969062wgh.9
 for <ath10k@lists.infradead.org>; Thu, 29 Jan 2015 04:25:25 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: enable qca6174 hw3.2
Date: Thu, 29 Jan 2015 13:24:33 +0100
Message-Id: <1422534273-18427-1-git-send-email-michal.kazior@tieto.com>
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

The 3.2 revision has a different target BMI
version so it wasn't recognized by ath10k (despite
the chip_id rev being on the supported list
already).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5e9e1a6..36a8fcf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -85,6 +85,20 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
 	},
+	{
+		.id = QCA6174_HW_3_2_VERSION,
+		.name = "qca6174 hw3.2",
+		.patch_load_addr = QCA6174_HW_3_0_PATCH_LOAD_ADDR,
+		.uart_pin = 6,
+		.fw = {
+			.dir = QCA6174_HW_3_0_FW_DIR,
+			.fw = QCA6174_HW_3_0_FW_FILE,
+			.otp = QCA6174_HW_3_0_OTP_FILE,
+			.board = QCA6174_HW_3_0_BOARD_DATA_FILE,
+			.board_size = QCA6174_BOARD_DATA_SZ,
+			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
+		},
+	},
 };
 
 static void ath10k_send_suspend_complete(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 5771278..460771f 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -40,6 +40,7 @@
 #define QCA6174_HW_1_3_VERSION		0x05000003
 #define QCA6174_HW_2_1_VERSION		0x05010000
 #define QCA6174_HW_3_0_VERSION		0x05020000
+#define QCA6174_HW_3_2_VERSION		0x05030000
 
 enum qca6174_pci_rev {
 	QCA6174_PCI_REV_1_1 = 0x11,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
