Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAqXv-0006up-Sx
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 06:03:37 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Add memory dump support for QCA4019
Date: Fri, 12 Oct 2018 11:36:36 +0530
Message-Id: <1539324397-10597-1-git-send-email-akolli@codeaurora.org>
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

This patch adds firmware crash memory dump support for QCA4019.

Tested on:

QCA4019 firmware 10.4-3.2.1.1-00017

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/coredump.c |  103 +++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 4d28063052fe..1ccc73c6ef12 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -867,6 +867,101 @@
 	},
 };
 
+static const struct ath10k_mem_section ipq4019_soc_reg_range[] = {
+	{0x080000, 0x080004},
+	{0x080020, 0x080024},
+	{0x080028, 0x080050},
+	{0x0800d4, 0x0800ec},
+	{0x08010c, 0x080118},
+	{0x080284, 0x080290},
+	{0x0802a8, 0x0802b8},
+	{0x0802dc, 0x08030c},
+	{0x082000, 0x083fff}
+};
+
+static const struct ath10k_mem_region qca4019_hw10_mem_regions[] = {
+	{
+		.type = ATH10K_MEM_REGION_TYPE_DRAM,
+		.start = 0x400000,
+		.len = 0x68000,
+		.name = "DRAM",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_REG,
+		.start = 0xC0000,
+		.len = 0x40000,
+		.name = "SRAM",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_REG,
+		.start = 0x98000,
+		.len = 0x50000,
+		.name = "IRAM",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_IOREG,
+		.start = 0x30000,
+		.len = 0x7000,
+		.name = "APB REG 1",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_IOREG,
+		.start = 0x3f000,
+		.len = 0x3000,
+		.name = "APB REG 2",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_IOREG,
+		.start = 0x43000,
+		.len = 0x3000,
+		.name = "WIFI REG",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_IOREG,
+		.start = 0x4A000,
+		.len = 0x5000,
+		.name = "CE REG",
+		.section_table = {
+			.sections = NULL,
+			.size = 0,
+		},
+	},
+	{
+		.type = ATH10K_MEM_REGION_TYPE_REG,
+		.start = 0x080000,
+		.len = 0x083fff - 0x080000,
+		.name = "REG_TOTAL",
+		.section_table = {
+			.sections = ipq4019_soc_reg_range,
+			.size = ARRAY_SIZE(ipq4019_soc_reg_range),
+		},
+	},
+};
+
 static const struct ath10k_hw_mem_layout hw_mem_layouts[] = {
 	{
 		.hw_id = QCA6174_HW_1_0_VERSION,
@@ -945,7 +1040,13 @@
 			.size = ARRAY_SIZE(qca99x0_hw20_mem_regions),
 		},
 	},
-
+	{
+		.hw_id = QCA4019_HW_1_0_DEV_VERSION,
+		.region_table = {
+			.regions = qca4019_hw10_mem_regions,
+			.size = ARRAY_SIZE(qca4019_hw10_mem_regions),
+		},
+	},
 };
 
 static u32 ath10k_coredump_get_ramdump_size(struct ath10k *ar)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
