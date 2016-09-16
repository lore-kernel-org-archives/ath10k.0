Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkraf-0005rg-0z
 for ath10k@lists.infradead.org; Fri, 16 Sep 2016 11:45:57 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCH] ath10k: add cc_wraparound type for QCA9888 and QCA9884
Date: Fri, 16 Sep 2016 17:15:27 +0530
Message-ID: <1474026327-7065-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@qti.qualcomm.com>

During offchannel scan, iw survey dump shows wrong values.
Fix this by assigning cycle counter wranarround type for
QCA9888 and QCA9884, they share same config with QCA4019.

Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3a8984ba9f74..93168d9f8902 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -191,6 +191,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.name = "qca9984/qca9994 hw1.0",
 		.patch_load_addr = QCA9984_HW_1_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
+		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_EACH,
 		.otp_exe_param = 0x00000700,
 		.continuous_frag_desc = true,
 		.cck_rate_map_rev2 = true,
@@ -215,6 +216,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.name = "qca9888 hw2.0",
 		.patch_load_addr = QCA9888_HW_2_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
+		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_EACH,
 		.otp_exe_param = 0x00000700,
 		.continuous_frag_desc = true,
 		.channel_counters_freq_hz = 150000,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
