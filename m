Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqn4-0005Cq-O1
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:29:31 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh07.mail.saunalahti.fi (Postfix) with ESMTP id B759A400C
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:29:07 +0300 (EEST)
Subject: [PATCH v5 4/7] ath10k: save firmware stack upon firmware crash
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:29:02 +0300
Message-ID: <20140808202902.20713.67641.stgit@potku.adurom.net>
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

Should help debug firmware crashes, and give users a way
to provide some useful debug reports to firmware developers.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h  |    1 +
 drivers/net/wireless/ath/ath10k/debug.c |   11 +++++++++++
 drivers/net/wireless/ath/ath10k/hw.h    |    1 +
 drivers/net/wireless/ath/ath10k/pci.c   |   15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1243de3eae46..e5f43d6960a9 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -299,6 +299,7 @@ struct ath10k_fw_crash_data {
 	uuid_le uuid;
 	struct ath10k_dbglog_entry_storage dbglog_entry_data;
 	u32 reg_dump_values[REG_DUMP_COUNT_QCA988X];
+	u8 stack_buf[ATH10K_FW_STACK_SIZE];
 };
 
 struct ath10k_debug {
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 2a443e9557ed..e019850dc969 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -31,10 +31,12 @@
  * enum ath10k_fw_error_dump_type - types of data in the dump file
  * @ATH10K_FW_CRASH_DUMP_DBGLOG:  Recent firmware debug log entries
  * @ATH10K_FW_CRASH_DUMP_REGDUMP: Register crash dump in binary format
+ * @ATH10K_FW_CRASH_DUMP_STACK:   Stack memory contents.
  */
 enum ath10k_fw_error_dump_type {
 	ATH10K_FW_CRASH_DUMP_DBGLOG = 0,
 	ATH10K_FW_CRASH_DUMP_REGDUMP = 1,
+	ATH10K_FW_CRASH_DUMP_STACK = 2,
 
 	ATH10K_FW_CRASH_DUMP_MAX,
 };
@@ -712,6 +714,7 @@ static struct ath10k_dump_file_data *ath10k_build_dump_file(struct ath10k *ar)
 	len = hdr_len;
 	len += sizeof(*dump_tlv) + sizeof(crash_data->reg_dump_values);
 	len += sizeof(*dump_tlv) + sizeof(crash_data->dbglog_entry_data);
+	len += sizeof(*dump_tlv) + sizeof(crash_data->stack_buf);
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -781,8 +784,16 @@ static struct ath10k_dump_file_data *ath10k_build_dump_file(struct ath10k *ar)
 	       dump_tlv->tlv_len);
 	sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
 
+	/* Gather firmware stack dump */
+	dump_tlv = (struct ath10k_tlv_dump_data *)(buf + sofar);
+	dump_tlv->type = ATH10K_FW_CRASH_DUMP_STACK;
+	dump_tlv->tlv_len = sizeof(crash_data->stack_buf);
+	memcpy(dump_tlv->tlv_data, crash_data->stack_buf, dump_tlv->tlv_len);
+	sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
+
 	spin_unlock_bh(&ar->data_lock);
 
+	WARN_ON(sofar != len);
 	return dump_data;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index c391c88096ee..9c602b0d7277 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -40,6 +40,7 @@
 #define ATH10K_FIRMWARE_MAGIC               "QCA-ATH10K"
 
 #define REG_DUMP_COUNT_QCA988X 60
+#define ATH10K_FW_STACK_SIZE 4096
 
 struct ath10k_fw_ie {
 	__le32 id;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 19a556facb1f..016f6641d1f7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -867,6 +867,15 @@ static u16 ath10k_pci_hif_get_free_queue_number(struct ath10k *ar, u8 pipe)
 	return ath10k_ce_num_free_src_entries(ar_pci->pipe_info[pipe].ce_hdl);
 }
 
+/* Save the main firmware stack */
+static void ath10k_pci_dump_stack(struct ath10k *ar,
+				  struct ath10k_fw_crash_data *crash_data)
+{
+	BUILD_BUG_ON(ATH10K_FW_STACK_SIZE % 4);
+	ath10k_pci_diag_read_hi(ar, crash_data->stack_buf,
+				hi_stack, ATH10K_FW_STACK_SIZE);
+}
+
 static void ath10k_pci_dump_dbglog(struct ath10k *ar,
 				   struct ath10k_fw_crash_data *crash_data)
 {
@@ -1010,6 +1019,12 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 	if (!crash_data)
 		goto exit;
 
+	spin_lock_bh(&ar->data_lock);
+
+	ath10k_pci_dump_stack(ar, crash_data);
+
+	spin_unlock_bh(&ar->data_lock);
+
 	ath10k_pci_dump_registers(ar, crash_data);
 	ath10k_pci_dump_dbglog(ar, crash_data);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
