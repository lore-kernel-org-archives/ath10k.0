Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDTwQ-0006RD-Av
 for ath10k@lists.infradead.org; Thu, 26 Sep 2019 13:36:19 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 1/2] ath10k: fix IRAM addr in coredump
Date: Thu, 26 Sep 2019 19:07:00 +0530
Message-Id: <1569505021-20515-1-git-send-email-akolli@codeaurora.org>
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

Fix IRAM start address in coredump.
Tested on: QCA9984, QCA4019
FW version: 10.4-3.9.0.2-00044

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/coredump.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index b6d2932383cf..ecd3dd5d8356 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -703,7 +703,7 @@
 	},
 	{
 		.type = ATH10K_MEM_REGION_TYPE_REG,
-		.start = 0x98000,
+		.start = 0x980000,
 		.len = 0x50000,
 		.name = "IRAM",
 		.section_table = {
@@ -786,7 +786,7 @@
 	},
 	{
 		.type = ATH10K_MEM_REGION_TYPE_REG,
-		.start = 0x98000,
+		.start = 0x980000,
 		.len = 0x50000,
 		.name = "IRAM",
 		.section_table = {
@@ -891,7 +891,7 @@
 	},
 	{
 		.type = ATH10K_MEM_REGION_TYPE_REG,
-		.start = 0x98000,
+		.start = 0x980000,
 		.len = 0x50000,
 		.name = "IRAM",
 		.section_table = {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
