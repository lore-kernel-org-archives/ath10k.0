Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9Ghb-0003EJ-Sb
 for ath10k@lists.infradead.org; Wed, 16 Dec 2015 18:21:28 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: add modparam 'hw_csum' to make HW checksum
 configurable
Date: Wed, 16 Dec 2015 10:20:51 -0800
Message-ID: <1450290051-15593-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Some hardwares such as QCA988X and QCA99X0 doesn't have
capability of checksum offload when frame formats are not
suitable for it such as Mesh frame.
Hence add a module parameter, hw_csum, to make checksum offload
configurable during module registration time.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 ++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fca702c..fcfccd8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -35,18 +35,21 @@ static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
 static bool rawmode;
+static bool hw_csum = true;
 
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
 module_param_named(cryptmode, ath10k_cryptmode_param, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param(skip_otp, bool, 0644);
 module_param(rawmode, bool, 0644);
+module_param(hw_csum, bool, 0644);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
 MODULE_PARM_DESC(cryptmode, "Crypto mode: 0-hardware, 1-software");
 MODULE_PARM_DESC(rawmode, "Use raw 802.11 frame datapath");
+MODULE_PARM_DESC(hw_csum, "Enable HW checksum offload (default: on)");
 
 static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	{
@@ -1405,6 +1408,9 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		ar->htt.max_num_amsdu = 1;
 	}
 
+	if (!hw_csum)
+		set_bit(ATH10K_FLAG_HW_CSUM_DISABLED, &ar->dev_flags);
+
 	/* Backwards compatibility for firmwares without
 	 * ATH10K_FW_IE_WMI_OP_VERSION.
 	 */
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 3c8a510..1972439 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -535,6 +535,9 @@ enum ath10k_dev_flags {
 
 	/* Bluetooth coexistance enabled */
 	ATH10K_FLAG_BTCOEX,
+
+	/* Do not use checksum offload */
+	ATH10K_FLAG_HW_CSUM_DISABLED,
 };
 
 enum ath10k_cal_mode {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a4c5c1d..f87f521 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7332,7 +7332,8 @@ int ath10k_mac_register(struct ath10k *ar)
 		goto err_free;
 	}
 
-	if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags))
+	if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags) &&
+	    !test_bit(ATH10K_FLAG_HW_CSUM_DISABLED, &ar->dev_flags))
 		ar->hw->netdev_features = NETIF_F_HW_CSUM;
 
 	if (config_enabled(CONFIG_ATH10K_DFS_CERTIFIED)) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
