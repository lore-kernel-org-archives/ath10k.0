Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqmb-00056g-TJ
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:29:02 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh06.mail.saunalahti.fi (Postfix) with ESMTP id 3097E699B2
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:28:42 +0300 (EEST)
Subject: [PATCH v5 1/7] ath10k: add ath10k_pci_diag_* helpers
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:28:39 +0300
Message-ID: <20140808202839.20713.42972.stgit@potku.adurom.net>
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

ath10k_pci_diag_read32() is for reading u32 from a device and ath10k_pci_diag_read_hi()
is a helper for reading data using "host interest" table.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   55 +++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 2d340cc522e3..96ce359349cb 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -466,13 +466,46 @@ done:
 	return ret;
 }
 
+static int ath10k_pci_diag_read32(struct ath10k *ar, u32 address, u32 *value)
+{
+	return ath10k_pci_diag_read_mem(ar, address, value, sizeof(u32));
+}
+
+static int __ath10k_pci_diag_read_hi(struct ath10k *ar, void *dest,
+				     u32 src, u32 len)
+{
+	u32 host_addr, addr;
+	int ret;
+
+	host_addr = host_interest_item_address(src);
+
+	ret = ath10k_pci_diag_read32(ar, host_addr, &addr);
+	if (ret != 0) {
+		ath10k_warn("failed to get memcpy hi address for firmware address %d: %d\n",
+			    src, ret);
+		return ret;
+	}
+
+	ret = ath10k_pci_diag_read_mem(ar, addr, dest, len);
+	if (ret != 0) {
+		ath10k_warn("failed to memcpy firmware memory from %d (%d B): %d\n",
+			    addr, len, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define ath10k_pci_diag_read_hi(ar, dest, src, len)		\
+	__ath10k_pci_diag_read_hi(ar, dest, HI_ITEM(src), len);
+
 /* Read 4-byte aligned data from Target memory or register */
 static int ath10k_pci_diag_read_access(struct ath10k *ar, u32 address,
 				       u32 *data)
 {
 	/* Assume range doesn't cross this boundary */
 	if (address >= DRAM_BASE_ADDRESS)
-		return ath10k_pci_diag_read_mem(ar, address, data, sizeof(u32));
+		return ath10k_pci_diag_read32(ar, address, data);
 
 	ath10k_pci_wake(ar);
 	*data = ath10k_pci_read32(ar, address);
@@ -836,9 +869,7 @@ static u16 ath10k_pci_hif_get_free_queue_number(struct ath10k *ar, u8 pipe)
 
 static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 {
-	u32 reg_dump_area = 0;
 	u32 reg_dump_values[REG_DUMP_COUNT_QCA988X] = {};
-	u32 host_addr;
 	int ret;
 	u32 i;
 
@@ -847,21 +878,11 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 		   ar->hw_params.name, ar->target_version);
 	ath10k_err("firmware version: %s\n", ar->hw->wiphy->fw_version);
 
-	host_addr = host_interest_item_address(HI_ITEM(hi_failure_state));
-	ret = ath10k_pci_diag_read_mem(ar, host_addr,
-				       &reg_dump_area, sizeof(u32));
+	ret = ath10k_pci_diag_read_hi(ar, &reg_dump_values[0],
+				      hi_failure_state,
+				      REG_DUMP_COUNT_QCA988X * sizeof(u32));
 	if (ret) {
-		ath10k_err("failed to read FW dump area address: %d\n", ret);
-		return;
-	}
-
-	ath10k_err("target register Dump Location: 0x%08X\n", reg_dump_area);
-
-	ret = ath10k_pci_diag_read_mem(ar, reg_dump_area,
-				       &reg_dump_values[0],
-				       REG_DUMP_COUNT_QCA988X * sizeof(u32));
-	if (ret != 0) {
-		ath10k_err("failed to read FW dump area: %d\n", ret);
+		ath10k_err("failed to read firmware dump area: %d\n", ret);
 		return;
 	}
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
