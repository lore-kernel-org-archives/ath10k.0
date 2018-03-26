Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0Nxv-0000YO-CO
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 08:58:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/2] ath10k: refactor ath10k_pci_dump_memory() in preparation
 for QCA9984 support
Date: Mon, 26 Mar 2018 11:58:33 +0300
Message-Id: <1522054714-31492-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

As QCA9984 needs two region types refactor the code to make it easier add the
new types. No functional changes.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 55 +++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 808f3d67ba90..977b7dade44e 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1584,6 +1584,36 @@ static int ath10k_pci_set_ram_config(struct ath10k *ar, u32 config)
 	return 0;
 }
 
+/* if an error happened returns < 0, otherwise the length */
+static int ath10k_pci_dump_memory_generic(struct ath10k *ar,
+					  const struct ath10k_mem_region *current_region,
+					  u8 *buf)
+{
+	int ret;
+
+	if (current_region->section_table.size > 0)
+		/* Copy each section individually. */
+		return ath10k_pci_dump_memory_section(ar,
+						      current_region,
+						      buf,
+						      current_region->len);
+
+	/* No individiual memory sections defined so we can
+	 * copy the entire memory region.
+	 */
+	ret = ath10k_pci_diag_read_mem(ar,
+				       current_region->start,
+				       buf,
+				       current_region->len);
+	if (ret) {
+		ath10k_warn(ar, "failed to copy ramdump region %s: %d\n",
+			    current_region->name, ret);
+		return ret;
+	}
+
+	return current_region->len;
+}
+
 static void ath10k_pci_dump_memory(struct ath10k *ar,
 				   struct ath10k_fw_crash_data *crash_data)
 {
@@ -1642,27 +1672,14 @@ static void ath10k_pci_dump_memory(struct ath10k *ar,
 		buf += sizeof(*hdr);
 		buf_len -= sizeof(*hdr);
 
-		if (current_region->section_table.size > 0) {
-			/* Copy each section individually. */
-			count = ath10k_pci_dump_memory_section(ar,
-							       current_region,
-							       buf,
-							       current_region->len);
-		} else {
-			/* No individiual memory sections defined so we can
-			 * copy the entire memory region.
-			 */
-			ret = ath10k_pci_diag_read_mem(ar,
-						       current_region->start,
-						       buf,
-						       current_region->len);
-			if (ret) {
-				ath10k_warn(ar, "failed to copy ramdump region %s: %d\n",
-					    current_region->name, ret);
+		switch (current_region->type) {
+		default:
+			ret = ath10k_pci_dump_memory_generic(ar, current_region, buf);
+			if (ret < 0)
 				break;
-			}
 
-			count = current_region->len;
+			count = ret;
+			break;
 		}
 
 		hdr->region_type = cpu_to_le32(current_region->type);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
