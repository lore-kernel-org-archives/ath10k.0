Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7zQR-0005jF-VR
 for ath10k@lists.infradead.org; Mon, 05 Jan 2015 04:37:56 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH] ath10k: Make HTT fill size configurable
Date: Mon,  5 Jan 2015 10:09:56 +0530
Message-Id: <1420432796-10765-1-git-send-email-sujith@msujith.org>
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

From: Sujith Manoharan <c_manoha@qca.qualcomm.com>

The HTT RX ring is replenished with a maximum of 16 buffers,
but this might be insufficient when RX traffic is high.
Not having enough RX buffers throttles the FW, resulting
in low throughput.

This patch adds a module parameter to adjust the fill size
based on the platform/usage.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c   | 3 +++
 drivers/net/wireless/ath/ath10k/htt.h    | 2 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2d0671e..a74af21 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -33,14 +33,17 @@
 unsigned int ath10k_debug_mask;
 static bool uart_print;
 static bool skip_otp;
+int htt_fill_size = ATH10K_HTT_MAX_NUM_REFILL;
 
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param(skip_otp, bool, 0644);
+module_param(htt_fill_size, int, 0644);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
+MODULE_PARM_DESC(htt_fill_size, "HTT RX ring fill size");
 
 static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 	{
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 1bd5545..1aa5db1 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -26,6 +26,8 @@
 #include "htc.h"
 #include "rx_desc.h"
 
+extern int htt_fill_size;
+
 enum htt_dbg_stats_type {
 	HTT_DBG_STATS_WAL_PDEV_TXRX = 1 << 0,
 	HTT_DBG_STATS_RX_REORDER    = 1 << 1,
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9c782a4..1440b0e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -128,7 +128,7 @@ static void ath10k_htt_rx_msdu_buff_replenish(struct ath10k_htt *htt)
 	 * improves the avarage and stability. */
 	spin_lock_bh(&htt->rx_ring.lock);
 	num_deficit = htt->rx_ring.fill_level - htt->rx_ring.fill_cnt;
-	num_to_fill = min(ATH10K_HTT_MAX_NUM_REFILL, num_deficit);
+	num_to_fill = min(htt_fill_size, num_deficit);
 	num_deficit -= num_to_fill;
 	ret = ath10k_htt_rx_ring_fill_n(htt, num_to_fill);
 	if (ret == -ENOMEM) {
-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
