Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwE8-0002T5-L9
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:28:22 +0000
Subject: [PATCH 1/6] ath10k: sdio: workaround firmware UART pin
 configuration bug
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 12 Apr 2019 16:28:17 +0300
Message-ID: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Wen Gong <wgong@codeaurora.org>

On QCA6174 SDIO devices the SDIO interrupt will fail if UART is
disabled from ath10k. SDIO firmware enables UART printouts by
default. If ath10k will try to enable UART again the firmware
will configure it's GPIO line incorrectly and SDIO interrupts
won't work anymore. The workaround is to set UART pin again (19
for QCA6174 SDIO) if uart_print is 0.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c |   10 +++++++++-
 drivers/net/wireless/ath/ath10k/hw.h   |    5 +++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 835b8de92d55..cfd7bb29a1ec 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2065,8 +2065,16 @@ static int ath10k_init_uart(struct ath10k *ar)
 		return ret;
 	}
 
-	if (!uart_print)
+	if (!uart_print && ar->hw_params.uart_pin_workaround) {
+		ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin,
+					 ar->hw_params.uart_pin);
+		if (ret) {
+			ath10k_warn(ar, "failed to set UART TX pin: %d", ret);
+			return ret;
+		}
+
 		return 0;
+	}
 
 	ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin, ar->hw_params.uart_pin);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 71314999aa24..a92fce1bb6f0 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -606,6 +606,11 @@ struct ath10k_hw_params {
 
 	/* target supporting fw download via diag ce */
 	bool fw_diag_ce_download;
+
+	/* need to set uart pin if disable uart print, workaround for a
+	 * firmware bug
+	 */
+	bool uart_pin_workaround;
 };
 
 struct htt_rx_desc;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
