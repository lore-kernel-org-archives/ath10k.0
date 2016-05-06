Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayeYT-0004So-PN
 for ath10k@lists.infradead.org; Fri, 06 May 2016 12:08:26 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: Fix survey reporting with QCA4019
Date: Fri, 6 May 2016 17:37:03 +0530
Message-ID: <1462536423-9903-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1462536423-9903-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1462536423-9903-1-git-send-email-vthiagar@qti.qualcomm.com>
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

In QCA4019, cycle counter wraparound in same fashion
as QCA988X. When the cycle counter wraparound it
resets to 0x7fffffff. Set has_shifted_cc_wraparound to
true for QCA4019 to enable the code path to handle cycle
counter wraparound for consistent survey report.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e94cb87..f6018be 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -202,6 +202,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.name = "qca4019 hw1.0",
 		.patch_load_addr = QCA4019_HW_1_0_PATCH_LOAD_ADDR,
 		.uart_pin = 7,
+		.has_shifted_cc_wraparound = true,
 		.otp_exe_param = 0x0010000,
 		.continuous_frag_desc = true,
 		.channel_counters_freq_hz = 125000,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
