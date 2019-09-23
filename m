Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCNHl-0004LO-AV
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 12:17:46 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v3 1/2] ath10k: add bus type for each layout of coredump
Date: Mon, 23 Sep 2019 20:17:34 +0800
Message-Id: <1569241055-30816-2-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1569241055-30816-1-git-send-email-wgong@codeaurora.org>
References: <1569241055-30816-1-git-send-email-wgong@codeaurora.org>
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

For some hw version, it has more than one bus type, it need to add bus
type to distinguish different chip.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00018-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: change code style
v3: split bus type to another patch, 
remove ATH10K_BUS_ANY, 
add bus type for each layout
 drivers/net/wireless/ath/ath10k/coredump.c | 15 ++++++++++++++-
 drivers/net/wireless/ath/ath10k/coredump.h |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index b6d2932..abc133d 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -955,6 +955,7 @@
 	{
 		.hw_id = QCA6174_HW_1_0_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -963,6 +964,7 @@
 	{
 		.hw_id = QCA6174_HW_1_1_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -971,6 +973,7 @@
 	{
 		.hw_id = QCA6174_HW_1_3_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -979,6 +982,7 @@
 	{
 		.hw_id = QCA6174_HW_2_1_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw21_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw21_mem_regions),
@@ -987,6 +991,7 @@
 	{
 		.hw_id = QCA6174_HW_3_0_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -995,6 +1000,7 @@
 	{
 		.hw_id = QCA6174_HW_3_2_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1003,6 +1009,7 @@
 	{
 		.hw_id = QCA9377_HW_1_1_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA9377,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1011,6 +1018,7 @@
 	{
 		.hw_id = QCA988X_HW_2_0_VERSION,
 		.hw_rev = ATH10K_HW_QCA988X,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca988x_hw20_mem_regions,
 			.size = ARRAY_SIZE(qca988x_hw20_mem_regions),
@@ -1019,6 +1027,7 @@
 	{
 		.hw_id = QCA9984_HW_1_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA9984,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca9984_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca9984_hw10_mem_regions),
@@ -1027,6 +1036,7 @@
 	{
 		.hw_id = QCA9888_HW_2_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA9888,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca9984_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca9984_hw10_mem_regions),
@@ -1035,6 +1045,7 @@
 	{
 		.hw_id = QCA99X0_HW_2_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA99X0,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca99x0_hw20_mem_regions,
 			.size = ARRAY_SIZE(qca99x0_hw20_mem_regions),
@@ -1043,6 +1054,7 @@
 	{
 		.hw_id = QCA4019_HW_1_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA4019,
+		.bus = ATH10K_BUS_AHB,
 		.region_table = {
 			.regions = qca4019_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca4019_hw10_mem_regions),
@@ -1090,7 +1102,8 @@ const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k
 
 	for (i = 0; i < ARRAY_SIZE(hw_mem_layouts); i++) {
 		if (ar->target_version == hw_mem_layouts[i].hw_id &&
-		    ar->hw_rev == hw_mem_layouts[i].hw_rev)
+		    ar->hw_rev == hw_mem_layouts[i].hw_rev &&
+		    hw_mem_layouts[i].bus == ar->hif.bus)
 			return &hw_mem_layouts[i];
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 09de419..b191746 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -155,6 +155,7 @@ struct ath10k_mem_region {
 struct ath10k_hw_mem_layout {
 	u32 hw_id;
 	u32 hw_rev;
+	enum ath10k_bus bus;
 
 	struct {
 		const struct ath10k_mem_region *regions;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
