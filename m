Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsueP-0007Sk-N9
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:30:02 +0000
Received: by mail-wi0-f173.google.com with SMTP id r20so5832119wiv.12
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 06:29:40 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: move uart pin config into hw_params
Date: Mon, 24 Nov 2014 15:17:26 +0100
Message-Id: <1416838646-18801-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This will make it possible to easily support
different hardware with different uart pin
configuration.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ++-
 drivers/net/wireless/ath/ath10k/core.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 204aa04..0bce152 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -58,6 +58,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.patch_load_addr = QCA988X_HW_2_0_PATCH_LOAD_ADDR,
 		.supported_chips = qca988x_supported_chips,
 		.num_supported_chips = ARRAY_SIZE(qca988x_supported_chips),
+		.uart_pin = 7,
 		.fw = {
 			.dir = QCA988X_HW_2_0_FW_DIR,
 			.fw = QCA988X_HW_2_0_FW_FILE,
@@ -708,7 +709,7 @@ static int ath10k_init_uart(struct ath10k *ar)
 	if (!uart_print)
 		return 0;
 
-	ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin, 7);
+	ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin, ar->hw_params.uart_pin);
 	if (ret) {
 		ath10k_warn(ar, "could not enable UART prints (%d)\n", ret);
 		return ret;
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 1cc81e8..f8dd904 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -477,6 +477,7 @@ struct ath10k {
 		u32 patch_load_addr;
 		const u32 *supported_chips;
 		int num_supported_chips;
+		int uart_pin;
 		struct ath10k_hw_params_fw {
 			const char *dir;
 			const char *fw;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
