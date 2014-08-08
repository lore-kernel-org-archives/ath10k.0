Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqnJ-0005H4-Of
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:29:47 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh01.mail.saunalahti.fi (Postfix) with ESMTP id EC28490033
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:29:22 +0300 (EEST)
Subject: [PATCH v5 6/7] ath10k: save firmware RAM and ROM BSS sections on crash
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:29:20 +0300
Message-ID: <20140808202920.20713.58726.stgit@potku.adurom.net>
In-Reply-To: <20140808201815.20713.85582.stgit@potku.adurom.net>
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
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

From: Ben Greear <greearb@candelatech.com>

This can be used to get a useful back trace out of a firmware
crash that involves an interrupt handler.  For instance, a
null-pointer-exception would be this kind of trace.  A user-space
tool can read the debugfs file and decode things as wished.

This requires a packaged firmware with a new IE to describe the
BSS section starts and length.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c  |   54 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h  |   16 +++++++++
 drivers/net/wireless/ath/ath10k/debug.c |   28 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h    |    5 +++
 drivers/net/wireless/ath/ath10k/pci.c   |   39 ++++++++++++++++++++++
 5 files changed, 142 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 440c3ff03aec..39b7383b395c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -479,6 +479,60 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 			ar->otp_len = ie_len;
 
 			break;
+		case ATH10K_FW_IE_RAM_BSS_ADDR:
+			if (ie_len != sizeof(u32))
+				break;
+
+			ar->fw.ram_bss_addr = le32_to_cpup((__le32 *)data);
+
+			ath10k_dbg(ATH10K_DBG_BOOT,
+				   "found RAM BSS address 0x%x\n",
+				   ar->fw.ram_bss_addr);
+			break;
+		case ATH10K_FW_IE_RAM_BSS_LEN:
+			if (ie_len != sizeof(u32))
+				break;
+
+			ar->fw.ram_bss_len = le32_to_cpup((__le32 *)data);
+
+			ath10k_dbg(ATH10K_DBG_BOOT,
+				   "found RAM BSS length 0x%x\n",
+				   ar->fw.ram_bss_len);
+
+			if (ar->fw.ram_bss_len > ATH10K_RAM_BSS_BUF_LEN) {
+				ath10k_warn("too long firmware RAM BSS length: %d\n",
+					    ar->fw.ram_bss_len);
+				ar->fw.ram_bss_len = 0;
+			}
+
+			break;
+		case ATH10K_FW_IE_ROM_BSS_ADDR:
+			if (ie_len != sizeof(u32))
+				break;
+
+			ar->fw.rom_bss_addr = le32_to_cpup((__le32 *)data);
+
+			ath10k_dbg(ATH10K_DBG_BOOT,
+				   "found ROM BSS address 0x%x\n",
+				   ar->fw.rom_bss_addr);
+			break;
+		case ATH10K_FW_IE_ROM_BSS_LEN:
+			if (ie_len != sizeof(u32))
+				break;
+
+			ar->fw.rom_bss_len = le32_to_cpup((__le32 *)data);
+
+			ath10k_dbg(ATH10K_DBG_BOOT,
+				   "found ROM BSS length 0x%x\n",
+				   ar->fw.rom_bss_len);
+
+			if (ar->fw.ram_bss_len > ATH10K_RAM_BSS_BUF_LEN) {
+				ath10k_warn("too long firmware RAM BSS length: %d\n",
+					    ar->fw.ram_bss_len);
+				ar->fw.rom_bss_len = 0;
+			}
+
+			break;
 		default:
 			ath10k_warn("Unknown FW IE: %u\n",
 				    le32_to_cpu(hdr->id));
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dd1a939974c2..19832ac38685 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -292,6 +292,10 @@ struct ath10k_dbglog_entry_storage {
 	u8 data[ATH10K_DBGLOG_DATA_LEN];
 };
 
+/* estimated values, hopefully these are enough */
+#define ATH10K_ROM_BSS_BUF_LEN 10000
+#define ATH10K_RAM_BSS_BUF_LEN 30000
+
 /* used for crash-dump storage, protected by data-lock */
 struct ath10k_fw_crash_data {
 	bool crashed_since_read;
@@ -301,6 +305,9 @@ struct ath10k_fw_crash_data {
 	u32 reg_dump_values[REG_DUMP_COUNT_QCA988X];
 	u8 stack_buf[ATH10K_FW_STACK_SIZE];
 	u8 exc_stack_buf[ATH10K_FW_STACK_SIZE];
+
+	u8 rom_bss_buf[ATH10K_ROM_BSS_BUF_LEN];
+	u8 ram_bss_buf[ATH10K_RAM_BSS_BUF_LEN];
 };
 
 struct ath10k_debug {
@@ -426,6 +433,15 @@ struct ath10k {
 		} fw;
 	} hw_params;
 
+	/* These are written to only during first firmware boot so no need
+	 * for locking. */
+	struct {
+		unsigned int ram_bss_addr;
+		unsigned int ram_bss_len;
+		unsigned int rom_bss_addr;
+		unsigned int rom_bss_len;
+	} fw;
+
 	const struct firmware *board;
 	const void *board_data;
 	size_t board_len;
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index d605fe54522b..dbdf5f638568 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -33,12 +33,16 @@
  * @ATH10K_FW_CRASH_DUMP_REGDUMP: Register crash dump in binary format
  * @ATH10K_FW_CRASH_DUMP_STACK:   Stack memory contents.
  * @ATH10K_FW_CRASH_DUMP_EXC_STACK:  Exception stack contents
+ * @ATH10K_FW_CRASH_DUMP_RAM_BSS:  BSS area for RAM code
+ * @ATH10K_FW_CRASH_DUMP_ROM_BSS:  BSS area for ROM code
  */
 enum ath10k_fw_error_dump_type {
 	ATH10K_FW_CRASH_DUMP_DBGLOG = 0,
 	ATH10K_FW_CRASH_DUMP_REGDUMP = 1,
 	ATH10K_FW_CRASH_DUMP_STACK = 2,
 	ATH10K_FW_CRASH_DUMP_EXC_STACK = 3,
+	ATH10K_FW_CRASH_DUMP_RAM_BSS = 4,
+	ATH10K_FW_CRASH_DUMP_ROM_BSS = 5,
 
 	ATH10K_FW_CRASH_DUMP_MAX,
 };
@@ -719,6 +723,12 @@ static struct ath10k_dump_file_data *ath10k_build_dump_file(struct ath10k *ar)
 	len += sizeof(*dump_tlv) + sizeof(crash_data->stack_buf);
 	len += sizeof(*dump_tlv) + sizeof(crash_data->exc_stack_buf);
 
+	if (ar->fw.ram_bss_addr && ar->fw.ram_bss_len)
+		len += sizeof(*dump_tlv) + ar->fw.ram_bss_len;
+
+	if (ar->fw.rom_bss_addr && ar->fw.rom_bss_len)
+		len += sizeof(*dump_tlv) + ar->fw.rom_bss_len;
+
 	lockdep_assert_held(&ar->conf_mutex);
 
 	sofar += hdr_len;
@@ -802,6 +812,24 @@ static struct ath10k_dump_file_data *ath10k_build_dump_file(struct ath10k *ar)
 	       dump_tlv->tlv_len);
 	sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
 
+	if (ar->fw.ram_bss_addr && ar->fw.ram_bss_len) {
+		dump_tlv = (struct ath10k_tlv_dump_data *)(buf + sofar);
+		dump_tlv->type = ATH10K_FW_CRASH_DUMP_RAM_BSS;
+		dump_tlv->tlv_len = ar->fw.ram_bss_len;
+		memcpy(dump_tlv->tlv_data, crash_data->ram_bss_buf,
+		       dump_tlv->tlv_len);
+		sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
+	}
+
+	if (ar->fw.rom_bss_addr && ar->fw.rom_bss_len) {
+		dump_tlv = (struct ath10k_tlv_dump_data *)(buf + sofar);
+		dump_tlv->type = ATH10K_FW_CRASH_DUMP_ROM_BSS;
+		dump_tlv->tlv_len = ar->fw.rom_bss_len;
+		memcpy(dump_tlv->tlv_data, crash_data->rom_bss_buf,
+		       dump_tlv->tlv_len);
+		sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
+	}
+
 	spin_unlock_bh(&ar->data_lock);
 
 	WARN_ON(sofar != len);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 9c602b0d7277..6c275638ddaa 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -54,6 +54,11 @@ enum ath10k_fw_ie_type {
 	ATH10K_FW_IE_FEATURES = 2,
 	ATH10K_FW_IE_FW_IMAGE = 3,
 	ATH10K_FW_IE_OTP_IMAGE = 4,
+	ATH10K_FW_IE_RAM_BSS_ADDR = 5,
+	ATH10K_FW_IE_RAM_BSS_LEN = 6,
+	ATH10K_FW_IE_ROM_BSS_ADDR = 7,
+	ATH10K_FW_IE_ROM_BSS_LEN = 8,
+
 };
 
 /* Known pecularities:
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5e4de6cb6fcf..a65d45c78542 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -885,6 +885,43 @@ static void ath10k_pci_dump_exc_stack(struct ath10k *ar,
 				hi_err_stack, ATH10K_FW_STACK_SIZE);
 }
 
+static void ath10k_pci_dump_bss_ram(struct ath10k *ar,
+				    struct ath10k_fw_crash_data *crash_data) {
+	int ret;
+
+	if (!ar->fw.ram_bss_addr)
+		return;
+
+	if (!ar->fw.ram_bss_len)
+		return;
+
+	ret = ath10k_pci_diag_read_mem(ar, ar->fw.ram_bss_addr,
+				       crash_data->ram_bss_buf,
+				       ar->fw.ram_bss_len);
+	if (ret)
+		ath10k_warn("failed to read firmware RAM BSS memory from %d (%d B): %d\n",
+			    ar->fw.ram_bss_addr, ar->fw.ram_bss_len, ret);
+}
+
+static void ath10k_pci_dump_bss_rom(struct ath10k *ar,
+				    struct ath10k_fw_crash_data *crash_data)
+{
+	int ret;
+
+	if (!ar->fw.rom_bss_addr)
+		return;
+
+	if (!ar->fw.rom_bss_len)
+		return;
+
+	ret = ath10k_pci_diag_read_mem(ar, ar->fw.rom_bss_addr,
+				       crash_data->rom_bss_buf,
+				       ar->fw.rom_bss_len);
+	if (ret)
+		ath10k_warn("failed to read firmware ROM BSS memory from %d (%d B): %d\n",
+			    ar->fw.rom_bss_addr, ar->fw.rom_bss_len, ret);
+}
+
 static void ath10k_pci_dump_dbglog(struct ath10k *ar,
 				   struct ath10k_fw_crash_data *crash_data)
 {
@@ -1032,6 +1069,8 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 
 	ath10k_pci_dump_stack(ar, crash_data);
 	ath10k_pci_dump_exc_stack(ar, crash_data);
+	ath10k_pci_dump_bss_ram(ar, crash_data);
+	ath10k_pci_dump_bss_rom(ar, crash_data);
 
 	spin_unlock_bh(&ar->data_lock);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
