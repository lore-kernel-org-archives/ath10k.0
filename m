Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvcCz-0005zo-TI
 for ath10k@lists.infradead.org; Mon, 18 Feb 2019 06:15:19 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: remove the calibration data fetch for sdio
Date: Mon, 18 Feb 2019 14:14:31 +0800
Message-Id: <1550470471-28002-1-git-send-email-wgong@codeaurora.org>
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

The calibration data fetch will trigger sdio error, then sdio will
become fail untill reboot system.

If happens when run ifconfig wlan down, then ifconfig wlan up will
fail untill reboot system.Remove it fix the ifconfig wlan issue.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00005-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 15964b3..c33a51f 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1263,6 +1263,9 @@ static int ath10k_debug_cal_data_fetch(struct ath10k *ar)
 	if (WARN_ON(ar->hw_params.cal_data_len > ATH10K_DEBUG_CAL_DATA_LEN))
 		return -EINVAL;
 
+	if (ar->hw_params.cal_data_len == 0)
+		return -EOPNOTSUPP;
+
 	hi_addr = host_interest_item_address(HI_ITEM(hi_board_data));
 
 	ret = ath10k_hif_diag_read(ar, hi_addr, &addr, sizeof(addr));
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
