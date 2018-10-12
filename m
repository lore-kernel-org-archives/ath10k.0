Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAqY8-0006vz-1j
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 06:03:52 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 2/2] ath10k: assign proper firmware crash dump structure
Date: Fri, 12 Oct 2018 11:36:37 +0530
Message-Id: <1539324397-10597-2-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1539324397-10597-1-git-send-email-akolli@codeaurora.org>
References: <1539324397-10597-1-git-send-email-akolli@codeaurora.org>
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

ar->target_version is same for QCA99x0, QCA4019, QCA9888
and QCA9984, this eneded up in assgning the wrong hw_mem_layouts.
This patch adds additional hw_rev check to assign correct
hw_mem_layouts.

Tested on:
QCA4019 firmware 10.4-3.2.1.1-00017
QCA9984 firmware 10.4-3.5.3-00057

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/coredump.c |   15 ++++++++++++++-
 drivers/net/wireless/ath/ath10k/coredump.h |    1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 1ccc73c6ef12..eadae2f9206b 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -965,6 +965,7 @@
 static const struct ath10k_hw_mem_layout hw_mem_layouts[] = {
 	{
 		.hw_id = QCA6174_HW_1_0_VERSION,
+		.hw_rev = ATH10K_HW_QCA6174,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -972,6 +973,7 @@
 	},
 	{
 		.hw_id = QCA6174_HW_1_1_VERSION,
+		.hw_rev = ATH10K_HW_QCA6174,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -979,6 +981,7 @@
 	},
 	{
 		.hw_id = QCA6174_HW_1_3_VERSION,
+		.hw_rev = ATH10K_HW_QCA6174,
 		.region_table = {
 			.regions = qca6174_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw10_mem_regions),
@@ -986,6 +989,7 @@
 	},
 	{
 		.hw_id = QCA6174_HW_2_1_VERSION,
+		.hw_rev = ATH10K_HW_QCA6174,
 		.region_table = {
 			.regions = qca6174_hw21_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw21_mem_regions),
@@ -993,6 +997,7 @@
 	},
 	{
 		.hw_id = QCA6174_HW_3_0_VERSION,
+		.hw_rev = ATH10K_HW_QCA6174,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1000,6 +1005,7 @@
 	},
 	{
 		.hw_id = QCA6174_HW_3_2_VERSION,
+		.hw_rev = ATH10K_HW_QCA6174,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1007,6 +1013,7 @@
 	},
 	{
 		.hw_id = QCA9377_HW_1_1_DEV_VERSION,
+		.hw_rev = ATH10K_HW_QCA9377,
 		.region_table = {
 			.regions = qca6174_hw30_mem_regions,
 			.size = ARRAY_SIZE(qca6174_hw30_mem_regions),
@@ -1014,6 +1021,7 @@
 	},
 	{
 		.hw_id = QCA988X_HW_2_0_VERSION,
+		.hw_rev = ATH10K_HW_QCA988X,
 		.region_table = {
 			.regions = qca988x_hw20_mem_regions,
 			.size = ARRAY_SIZE(qca988x_hw20_mem_regions),
@@ -1021,6 +1029,7 @@
 	},
 	{
 		.hw_id = QCA9984_HW_1_0_DEV_VERSION,
+		.hw_rev = ATH10K_HW_QCA9984,
 		.region_table = {
 			.regions = qca9984_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca9984_hw10_mem_regions),
@@ -1028,6 +1037,7 @@
 	},
 	{
 		.hw_id = QCA9888_HW_2_0_DEV_VERSION,
+		.hw_rev = ATH10K_HW_QCA9888,
 		.region_table = {
 			.regions = qca9984_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca9984_hw10_mem_regions),
@@ -1035,6 +1045,7 @@
 	},
 	{
 		.hw_id = QCA99X0_HW_2_0_DEV_VERSION,
+		.hw_rev = ATH10K_HW_QCA99X0,
 		.region_table = {
 			.regions = qca99x0_hw20_mem_regions,
 			.size = ARRAY_SIZE(qca99x0_hw20_mem_regions),
@@ -1042,6 +1053,7 @@
 	},
 	{
 		.hw_id = QCA4019_HW_1_0_DEV_VERSION,
+		.hw_rev = ATH10K_HW_QCA4019,
 		.region_table = {
 			.regions = qca4019_hw10_mem_regions,
 			.size = ARRAY_SIZE(qca4019_hw10_mem_regions),
@@ -1088,7 +1100,8 @@ const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k
 		return NULL;
 
 	for (i = 0; i < ARRAY_SIZE(hw_mem_layouts); i++) {
-		if (ar->target_version == hw_mem_layouts[i].hw_id)
+		if (ar->target_version == hw_mem_layouts[i].hw_id &&
+		    ar->hw_rev == hw_mem_layouts[i].hw_rev)
 			return &hw_mem_layouts[i];
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 3baaf9d2cbcd..5dac653e1649 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -165,6 +165,7 @@ struct ath10k_mem_region {
  */
 struct ath10k_hw_mem_layout {
 	u32 hw_id;
+	u32 hw_rev;
 
 	struct {
 		const struct ath10k_mem_region *regions;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
