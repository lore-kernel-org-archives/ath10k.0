Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuGGv-0006Yd-Pd
 for ath10k@lists.infradead.org; Thu, 05 Nov 2015 08:51:55 +0000
Received: by lbblt2 with SMTP id lt2so11409665lbb.3
 for <ath10k@lists.infradead.org>; Thu, 05 Nov 2015 00:51:31 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2 2/4] ath10k: update missing hw_params of QCA9377 hw1.1
Date: Thu,  5 Nov 2015 09:50:41 +0100
Message-Id: <1446713443-22542-3-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
References: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

The uart_pin was incorrectly configured for QCA9377
and the recently added hw_params were omitted.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 11e42720035b..345770f1625a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -141,8 +141,10 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.id = QCA9377_HW_1_1_DEV_VERSION,
 		.name = "qca9377 hw1.1",
 		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
-		.uart_pin = 7,
+		.uart_pin = 6,
 		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
 		.fw = {
 			.dir = QCA9377_HW_1_0_FW_DIR,
 			.fw = QCA9377_HW_1_0_FW_FILE,
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
