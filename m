Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqnC-0005ET-6t
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:29:39 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id 6BA4E1887B3
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:29:15 +0300 (EEST)
Subject: [PATCH v5 5/7] ath10k: dump exception stack contents on firmware crash
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:29:12 +0300
Message-ID: <20140808202912.20713.81974.stgit@potku.adurom.net>
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

Firmware developers can decode this and maybe figure out
why the firmware crashed.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h  |    1 +
 drivers/net/wireless/ath/ath10k/debug.c |   11 +++++++++++
 drivers/net/wireless/ath/ath10k/pci.c   |   10 ++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e5f43d6960a9..dd1a939974c2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -300,6 +300,7 @@ struct ath10k_fw_crash_data {
 	struct ath10k_dbglog_entry_storage dbglog_entry_data;
 	u32 reg_dump_values[REG_DUMP_COUNT_QCA988X];
 	u8 stack_buf[ATH10K_FW_STACK_SIZE];
+	u8 exc_stack_buf[ATH10K_FW_STACK_SIZE];
 };
 
 struct ath10k_debug {
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index e019850dc969..d605fe54522b 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -32,11 +32,13 @@
  * @ATH10K_FW_CRASH_DUMP_DBGLOG:  Recent firmware debug log entries
  * @ATH10K_FW_CRASH_DUMP_REGDUMP: Register crash dump in binary format
  * @ATH10K_FW_CRASH_DUMP_STACK:   Stack memory contents.
+ * @ATH10K_FW_CRASH_DUMP_EXC_STACK:  Exception stack contents
  */
 enum ath10k_fw_error_dump_type {
 	ATH10K_FW_CRASH_DUMP_DBGLOG = 0,
 	ATH10K_FW_CRASH_DUMP_REGDUMP = 1,
 	ATH10K_FW_CRASH_DUMP_STACK = 2,
+	ATH10K_FW_CRASH_DUMP_EXC_STACK = 3,
 
 	ATH10K_FW_CRASH_DUMP_MAX,
 };
@@ -715,6 +717,7 @@ static struct ath10k_dump_file_data *ath10k_build_dump_file(struct ath10k *ar)
 	len += sizeof(*dump_tlv) + sizeof(crash_data->reg_dump_values);
 	len += sizeof(*dump_tlv) + sizeof(crash_data->dbglog_entry_data);
 	len += sizeof(*dump_tlv) + sizeof(crash_data->stack_buf);
+	len += sizeof(*dump_tlv) + sizeof(crash_data->exc_stack_buf);
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -791,6 +794,14 @@ static struct ath10k_dump_file_data *ath10k_build_dump_file(struct ath10k *ar)
 	memcpy(dump_tlv->tlv_data, crash_data->stack_buf, dump_tlv->tlv_len);
 	sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
 
+	/* Gather firmware exception (irq) stack dump */
+	dump_tlv = (struct ath10k_tlv_dump_data *)(buf + sofar);
+	dump_tlv->type = ATH10K_FW_CRASH_DUMP_EXC_STACK;
+	dump_tlv->tlv_len = sizeof(crash_data->exc_stack_buf);
+	memcpy(dump_tlv->tlv_data, &crash_data->exc_stack_buf,
+	       dump_tlv->tlv_len);
+	sofar += sizeof(*dump_tlv) + dump_tlv->tlv_len;
+
 	spin_unlock_bh(&ar->data_lock);
 
 	WARN_ON(sofar != len);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 016f6641d1f7..5e4de6cb6fcf 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -876,6 +876,15 @@ static void ath10k_pci_dump_stack(struct ath10k *ar,
 				hi_stack, ATH10K_FW_STACK_SIZE);
 }
 
+/* Save the firmware exception stack */
+static void ath10k_pci_dump_exc_stack(struct ath10k *ar,
+				      struct ath10k_fw_crash_data *crash_data)
+{
+	BUILD_BUG_ON(ATH10K_FW_STACK_SIZE % 4);
+	ath10k_pci_diag_read_hi(ar, crash_data->exc_stack_buf,
+				hi_err_stack, ATH10K_FW_STACK_SIZE);
+}
+
 static void ath10k_pci_dump_dbglog(struct ath10k *ar,
 				   struct ath10k_fw_crash_data *crash_data)
 {
@@ -1022,6 +1031,7 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 	spin_lock_bh(&ar->data_lock);
 
 	ath10k_pci_dump_stack(ar, crash_data);
+	ath10k_pci_dump_exc_stack(ar, crash_data);
 
 	spin_unlock_bh(&ar->data_lock);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
