Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1aHj-0002MJ-6v
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 13:39:00 +0000
Subject: [PATCH 5/6] ath10k: print crc32 checksums for firmware and board files
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 25 Nov 2015 15:38:34 +0200
Message-ID: <20151125133834.25507.23767.stgit@potku.adurom.net>
In-Reply-To: <20151125133654.25507.10863.stgit@potku.adurom.net>
References: <20151125133654.25507.10863.stgit@potku.adurom.net>
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

To detect cases if the firmare or board file is corrupted or otherwise modified print crc32 value
of both. Now the output looks like:

ath10k_pci 0000:02:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
ath10k_pci 0000:02:00.0: qca99x0 hw2.0 target 0x01000000 chip_id 0x003801ff sub 168c:0002
ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
ath10k_pci 0000:02:00.0: firmware ver 10.4.1.00030-1 api 5 features no-p2p crc32 d2901e01
ath10k_pci 0000:02:00.0: board_file api 1 bmi_id 1:1 crc32 7e56fd07
ath10k_pci 0000:02:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal otp max-sta 512 raw 0 hwcrypto 1

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/Kconfig |    1 +
 drivers/net/wireless/ath/ath10k/debug.c |   12 ++++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 72acb822bb11..03aa35f999a1 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -2,6 +2,7 @@ config ATH10K
         tristate "Atheros 802.11ac wireless cards support"
         depends on MAC80211 && HAS_DMA
 	select ATH_COMMON
+	select CRC32
         ---help---
           This module adds support for wireless adapters based on
           Atheros IEEE 802.11ac family of chipsets.
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index ebe3e52cdd1d..79d9426426da 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -19,6 +19,8 @@
 #include <linux/debugfs.h>
 #include <linux/vmalloc.h>
 #include <linux/utsname.h>
+#include <linux/crc32.h>
+#include <linux/firmware.h>
 
 #include "core.h"
 #include "debug.h"
@@ -141,10 +143,11 @@ void ath10k_debug_print_hwfw_info(struct ath10k *ar)
 		    config_enabled(CONFIG_ATH10K_DFS_CERTIFIED),
 		    config_enabled(CONFIG_NL80211_TESTMODE));
 
-	ath10k_info(ar, "firmware ver %s api %d features %s\n",
+	ath10k_info(ar, "firmware ver %s api %d features %s crc32 %08x\n",
 		    ar->hw->wiphy->fw_version,
 		    ar->fw_api,
-		    fw_features);
+		    fw_features,
+		    crc32_le(0, ar->firmware->data, ar->firmware->size));
 }
 
 void ath10k_debug_print_board_info(struct ath10k *ar)
@@ -157,9 +160,10 @@ void ath10k_debug_print_board_info(struct ath10k *ar)
 	else
 		scnprintf(boardinfo, sizeof(boardinfo), "N/A");
 
-	ath10k_info(ar, "board_file api %d bmi_id %s",
+	ath10k_info(ar, "board_file api %d bmi_id %s crc32 %08x",
 		    ar->bd_api,
-		    boardinfo);
+		    boardinfo,
+		    crc32_le(0, ar->board->data, ar->board->size));
 }
 
 void ath10k_debug_print_boot_info(struct ath10k *ar)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
