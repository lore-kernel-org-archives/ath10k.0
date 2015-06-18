Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5Tqt-000589-Tb
 for ath10k@lists.infradead.org; Thu, 18 Jun 2015 07:03:08 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V2 04/10] ath10k: Copy Engine related changes for QCA99X0
Date: Thu, 18 Jun 2015 12:31:04 +0530
Message-ID: <1434610870-5505-5-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

QCA99X0 supports upto 12 Copy engines. Host and target
CE configuration table is updated to support new copy engine
pipes. This also fixes the assumption of diagnostic CE by making
CE_7 as the one instead of CE_COUNT - 1.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.h  |  2 +-
 drivers/net/wireless/ath/ath10k/hw.h  |  3 ++
 drivers/net/wireless/ath/ath10k/pci.c | 69 ++++++++++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 93939de..bb4b8f3 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -21,7 +21,7 @@
 #include "hif.h"
 
 /* Maximum number of Copy Engine's supported */
-#define CE_COUNT_MAX 8
+#define CE_COUNT_MAX 12
 #define CE_HTT_H2T_MSG_SRC_NENTRIES 4096
 
 /* Descriptor rings must be aligned to this boundary */
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 76caeab..5819659 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -343,6 +343,9 @@ enum ath10k_hw_rate_cck {
 #define TARGET_TLV_NUM_MSDU_DESC		(1024 + 32)
 #define TARGET_TLV_NUM_WOW_PATTERNS		22
 
+/* Diagnostic Window */
+#define CE_DIAG_PIPE	7
+
 #define NUM_TARGET_CE_CONFIG_WLAN ar->hw_values->num_target_ce_config_wlan
 
 /* Number of Copy Engines supported */
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 0007e70..c2aecfe 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -156,6 +156,38 @@ static const struct ce_attr host_ce_config_wlan[] = {
 		.src_sz_max = DIAG_TRANSFER_LIMIT,
 		.dest_nentries = 2,
 	},
+
+	/* CE8: target->host pktlog */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 128,
+	},
+
+	/* CE9 target autonomous qcache memcpy */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE10: target autonomous hif memcpy */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE11: target autonomous hif memcpy */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
 };
 
 /* Target firmware's Copy Engine configuration. */
@@ -233,6 +265,38 @@ static const struct ce_pipe_config target_ce_config_wlan[] = {
 	},
 
 	/* CE7 used only by Host */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(0),
+		.nbytes_max = __cpu_to_le32(0),
+		.flags = __cpu_to_le32(0),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8 target->host packtlog */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(64),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE9 target autonomous qcache memcpy */
+	{
+		.pipenum = __cpu_to_le32(9),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* It not necessary to send target wlan configuration for CE10 & CE11
+	 * as these CEs are not actively used in target.
+	 */
 };
 
 /*
@@ -1771,7 +1835,8 @@ static int ath10k_pci_init_config(struct ath10k *ar)
 
 	ret = ath10k_pci_diag_write_mem(ar, pipe_cfg_targ_addr,
 					target_ce_config_wlan,
-					sizeof(target_ce_config_wlan));
+					sizeof(struct ce_pipe_config) *
+					NUM_TARGET_CE_CONFIG_WLAN);
 
 	if (ret != 0) {
 		ath10k_err(ar, "Failed to write pipe cfg: %d\n", ret);
@@ -1885,7 +1950,7 @@ static int ath10k_pci_alloc_pipes(struct ath10k *ar)
 		}
 
 		/* Last CE is Diagnostic Window */
-		if (i == CE_COUNT - 1) {
+		if (i == CE_DIAG_PIPE) {
 			ar_pci->ce_diag = pipe->ce_hdl;
 			continue;
 		}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
