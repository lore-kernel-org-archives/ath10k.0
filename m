Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHSBT-0001GL-Cd
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 08:46:24 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH 3/3] ath10k: add testmode support for 10.4 firmware
Date: Mon, 27 Jun 2016 14:21:20 +0530
Message-ID: <1467017480-12374-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patch adds testmode support for QCA99X0 chipsets which uses
10.4 firmware and added code swap support for UTF binary.

Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/testmode.c |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 120f423..2c10c0e 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -23,6 +23,7 @@
 #include "wmi.h"
 #include "hif.h"
 #include "hw.h"
+#include "core.h"
 
 #include "testmode_i.h"
 
@@ -240,6 +241,18 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
 		goto err;
 	}
 
+	if (ar->testmode.utf_mode_fw.fw_file.codeswap_data &&
+	    ar->testmode.utf_mode_fw.fw_file.codeswap_len) {
+		ret = ath10k_swap_code_seg_init(ar,
+					&ar->testmode.utf_mode_fw.fw_file);
+		if (ret) {
+			ath10k_warn(ar,
+				"failed to init utf code swap segment: %d\n",
+				ret);
+			goto err_release_utf_mode_fw;
+		}
+	}
+
 	spin_lock_bh(&ar->data_lock);
 	ar->testmode.utf_monitor = true;
 	spin_unlock_bh(&ar->data_lock);
@@ -279,6 +292,11 @@ err_power_down:
 	ath10k_hif_power_down(ar);
 
 err_release_utf_mode_fw:
+	if (ar->testmode.utf_mode_fw.fw_file.codeswap_data &&
+	    ar->testmode.utf_mode_fw.fw_file.codeswap_len)
+		ath10k_swap_code_seg_release(ar,
+					&ar->testmode.utf_mode_fw.fw_file);
+
 	release_firmware(ar->testmode.utf_mode_fw.fw_file.firmware);
 	ar->testmode.utf_mode_fw.fw_file.firmware = NULL;
 
@@ -301,6 +319,11 @@ static void __ath10k_tm_cmd_utf_stop(struct ath10k *ar)
 
 	spin_unlock_bh(&ar->data_lock);
 
+	if (ar->testmode.utf_mode_fw.fw_file.codeswap_data &&
+	    ar->testmode.utf_mode_fw.fw_file.codeswap_len)
+		ath10k_swap_code_seg_release(ar,
+					&ar->testmode.utf_mode_fw.fw_file);
+
 	release_firmware(ar->testmode.utf_mode_fw.fw_file.firmware);
 	ar->testmode.utf_mode_fw.fw_file.firmware = NULL;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
