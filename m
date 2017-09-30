Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyLjH-0001Qt-Em
 for ath10k@lists.infradead.org; Sat, 30 Sep 2017 17:39:12 +0000
Received: by mail-pf0-x242.google.com with SMTP id e69so1759739pfg.4
 for <ath10k@lists.infradead.org>; Sat, 30 Sep 2017 10:38:47 -0700 (PDT)
From: silexcommon@gmail.com
Subject: [PATCH 10/11] ath10k_sdio: enable firmware crash dump
Date: Sat, 30 Sep 2017 23:07:47 +0530
Message-Id: <1506793068-27445-11-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
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
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org

From: Alagu Sankar <alagusankar@silex-india.com>

Handle firmware crash and gracefully restart the sdio driver on firmware
failures.  The caldata prefetch is disabled for sdio as the data read in
prefetch is resulting in errors, when enabled.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |  3 ++
 drivers/net/wireless/ath/ath10k/sdio.c  | 86 +++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index eed4e9c..3a1982f 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1255,6 +1255,9 @@ static int ath10k_debug_cal_data_fetch(struct ath10k *ar)
 	if (WARN_ON(ar->hw_params.cal_data_len > ATH10K_DEBUG_CAL_DATA_LEN))
 		return -EINVAL;
 
+	if (ar->hif.bus == ATH10K_BUS_SDIO)
+		return -EINVAL;
+
 	hi_addr = host_interest_item_address(HI_ITEM(hi_board_data));
 
 	ret = ath10k_hif_diag_read(ar, hi_addr, &addr, sizeof(addr));
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 45df9db..11fbf6e 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -28,6 +28,7 @@
 #include "core.h"
 #include "bmi.h"
 #include "debug.h"
+#include "coredump.h"
 #include "hif.h"
 #include "htc.h"
 #include "targaddrs.h"
@@ -37,6 +38,8 @@
 #define ATH10K_SDIO_DMA_BUF_SIZE	(32 * 1024)
 #define ATH10K_SDIO_VSG_BUF_SIZE	(32 * 1024)
 
+static int ath10k_sdio_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
+				     size_t buf_len);
 static int ath10k_sdio_read(struct ath10k *ar, u32 addr, void *buf,
 			    u32 len, bool incr);
 static int ath10k_sdio_write(struct ath10k *ar, u32 addr, const void *buf,
@@ -810,6 +813,86 @@ static int ath10k_sdio_mbox_rxmsg_pending_handler(struct ath10k *ar,
 	return ret;
 }
 
+static int __ath10k_sdio_diag_read_hi(struct ath10k *ar, void *dest, u32 src,
+				      u32 len)
+{
+	u32 host_addr, addr;
+	int ret;
+
+	host_addr = host_interest_item_address(src);
+
+	ret = ath10k_sdio_hif_diag_read(ar, host_addr, &addr, sizeof(addr));
+	if (ret != 0) {
+		ath10k_warn(ar, "failed to get firmware hi address %d: %d\n",
+			    src, ret);
+		return ret;
+	}
+
+	ret = ath10k_sdio_hif_diag_read(ar, addr, dest, len);
+	if (ret != 0) {
+		ath10k_warn(ar, "failed to copy memory from %d (%d B): %d\n",
+			    addr, len, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define ath10k_sdio_diag_read_hi(ar, dest, src, len)		\
+	__ath10k_sdio_diag_read_hi(ar, dest, HI_ITEM(src), len)
+
+static void ath10k_sdio_dump_registers(struct ath10k *ar,
+				       struct ath10k_fw_crash_data *crash_data)
+{
+	__le32 reg_dump_values[REG_DUMP_COUNT_QCA988X] = {};
+	int i, ret;
+
+	ret = ath10k_sdio_diag_read_hi(ar, &reg_dump_values[0],
+				       hi_failure_state,
+				       sizeof(reg_dump_values));
+	if (ret) {
+		ath10k_err(ar, "failed to read firmware dump area: %d\n", ret);
+		return;
+	}
+
+	BUILD_BUG_ON(REG_DUMP_COUNT_QCA988X % 4);
+
+	ath10k_err(ar, "firmware register dump:\n");
+	for (i = 0; i < REG_DUMP_COUNT_QCA988X; i += 4)
+		ath10k_err(ar, "[%02d]: 0x%08X 0x%08X 0x%08X 0x%08X\n",
+			   i,
+			   __le32_to_cpu(reg_dump_values[i]),
+			   __le32_to_cpu(reg_dump_values[i + 1]),
+			   __le32_to_cpu(reg_dump_values[i + 2]),
+			   __le32_to_cpu(reg_dump_values[i + 3]));
+
+	if (!crash_data)
+		return;
+
+	for (i = 0; i < REG_DUMP_COUNT_QCA988X; i++)
+		crash_data->registers[i] = reg_dump_values[i];
+}
+
+static void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
+{
+	struct ath10k_fw_crash_data *crash_data;
+	char guid[UUID_STRING_LEN + 1];
+
+	ar->stats.fw_crash_counter++;
+	crash_data = ath10k_coredump_new(ar);
+
+	if (crash_data)
+		scnprintf(guid, sizeof(guid), "%pUl", &crash_data->guid);
+	else
+		scnprintf(guid, sizeof(guid), "n/a");
+
+	ath10k_err(ar, "firmware crashed! (guid %s)\n", guid);
+	ath10k_print_driver_info(ar);
+	ath10k_sdio_dump_registers(ar, crash_data);
+
+	queue_work(ar->workqueue, &ar->restart_work);
+}
+
 static int ath10k_sdio_mbox_proc_dbg_intr(struct ath10k *ar)
 {
 	u32 val;
@@ -933,6 +1016,9 @@ static int ath10k_sdio_mbox_proc_cpu_intr(struct ath10k *ar)
 		goto out;
 	}
 
+	if (cpu_int_status & 0x1)
+		ath10k_sdio_fw_crashed_dump(ar);
+
 out:
 	mutex_unlock(&irq_data->mtx);
 	return ret;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
