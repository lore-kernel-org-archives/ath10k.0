Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfF9-0004BG-S2
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 07:28:17 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v4 1/2] ath10k: add bus type for each layout of coredump
Date: Tue, 24 Sep 2019 15:27:09 +0800
Message-Id: <1569310030-834-2-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1569310030-834-1-git-send-email-wgong@codeaurora.org>
References: <1569310030-834-1-git-send-email-wgong@codeaurora.org>
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

v4: rebase to latest commit
 drivers/net/wireless/ath/ath10k/coredump.c | 16 +++++++++++++++-
 drivers/net/wireless/ath/ath10k/coredump.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index de0926c..8860c62 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -968,6 +968,7 @@
 	{
 		.hw_id = QCA6174_HW_1_0_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -976,6 +977,7 @@
 	{
 		.hw_id = QCA6174_HW_1_1_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -984,6 +986,7 @@
 	{
 		.hw_id = QCA6174_HW_1_3_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -992,6 +995,7 @@
 	{
 		.hw_id = QCA6174_HW_2_1_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw21_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw21_mem_regions),
@@ -1000,6 +1004,7 @@
 	{
 		.hw_id = QCA6174_HW_3_0_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1008,6 +1013,7 @@
 	{
 		.hw_id = QCA6174_HW_3_2_VERSION,
 		.hw_rev = ATH10K_HW_QCA6174,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1016,6 +1022,7 @@
 	{
 		.hw_id = QCA9377_HW_1_1_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA9377,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1024,6 +1031,7 @@
 	{
 		.hw_id = QCA988X_HW_2_0_VERSION,
 		.hw_rev = ATH10K_HW_QCA988X,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca988x_hw20_mem_regions,
 			.size = ARRAY_SIZE(qca988x_hw20_mem_regions),
@@ -1032,6 +1040,7 @@
 	{
 		.hw_id = QCA9984_HW_1_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA9984,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca9984_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca9984_hw10_mem_regions),
@@ -1040,6 +1049,7 @@
 	{
 		.hw_id = QCA9888_HW_2_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA9888,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca9984_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca9984_hw10_mem_regions),
@@ -1048,6 +1058,7 @@
 	{
 		.hw_id = QCA99X0_HW_2_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA99X0,
+		.bus = ATH10K_BUS_PCI,
 		.region_table = {
 			.regions = qca99x0_hw20_mem_regions,
 			.size = ARRAY_SIZE(qca99x0_hw20_mem_regions),
@@ -1056,6 +1067,7 @@
 	{
 		.hw_id = QCA4019_HW_1_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_QCA4019,
+		.bus = ATH10K_BUS_AHB,
 		.region_table = {
 			.regions = qca4019_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca4019_hw10_mem_regions),
@@ -1064,6 +1076,7 @@
 	{
 		.hw_id = WCN3990_HW_1_0_DEV_VERSION,
 		.hw_rev = ATH10K_HW_WCN3990,
+		.bus = ATH10K_BUS_SNOC,
 		.region_table = {
 			.regions = wcn399x_hw10_mem_regions,
 			.size = ARRAY_SIZE(wcn399x_hw10_mem_regions),
@@ -1111,7 +1124,8 @@ const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k
 
 	for (i = 0; i < ARRAY_SIZE(hw_mem_layouts); i++) {
 		if (ar->target_version == hw_mem_layouts[i].hw_id &&
-		    ar->hw_rev == hw_mem_layouts[i].hw_rev)
+		    ar->hw_rev == hw_mem_layouts[i].hw_rev &&
+		    hw_mem_layouts[i].bus == ar->hif.bus)
 			return &hw_mem_layouts[i];
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 8bf03e8..492dddc 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -156,6 +156,7 @@ struct ath10k_mem_region {
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
