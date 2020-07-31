Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1RbG-0003lo-Cr
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 09:45:16 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH] ath10k: enable transmit data ack RSSI for QCA9884
Date: Fri, 31 Jul 2020 15:14:16 +0530
Message-Id: <20200731094416.5172-1-murugana@codeaurora.org>
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
To: stable@vger.kernel.org
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Abhishek Ambure <aambure@codeaurora.org>, Sathishkumar Muruganandam <murugana@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Abhishek Ambure <aambure@codeaurora.org>

commit cc78dc3b790619aa05f22a86a9152986bd73698c upstream.

This commit fixes the regression caused by
commit 6ddc3860a566 ("ath10k: add support for ack rssi value of data tx packets")
in linux-5.4.y branch.

ath10k_is_rssi_enable() always returns 0 for QCA9984 and this will cause
the ppdu_info_offset to hold invalid value in ath10k_htt_rx_tx_compl_ind().

This leads to CE corruption for HTC endpoints to cause WMI command failures
with insufficient HTC credits. Below warnings are seen due to beacon
command failure in QCA9984.

[  675.939638] ath10k_pci 0000:03:00.0: SWBA overrun on vdev 0, skipped old beacon
[  675.947828] ath10k_pci 0000:04:00.0: SWBA overrun on vdev 1, skipped old beacon

Tested HW: QCA9984
Tested FW: 10.4-3.10-00047
Tested Kernel version: 5.4.22

Fixes: 6ddc3860a566 ("ath10k: add support for ack rssi value of data tx packets")
Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
[kvalo@codeaurora.org: improve commit log]
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index c415e971735b..004af89a02b8 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1145,6 +1145,7 @@ static bool ath10k_qca99x0_rx_desc_msdu_limit_error(struct htt_rx_desc *rxd)
 const struct ath10k_hw_ops qca99x0_ops = {
 	.rx_desc_get_l3_pad_bytes = ath10k_qca99x0_rx_desc_get_l3_pad_bytes,
 	.rx_desc_get_msdu_limit_error = ath10k_qca99x0_rx_desc_msdu_limit_error,
+	.is_rssi_enable = ath10k_htt_tx_rssi_enable,
 };
 
 const struct ath10k_hw_ops qca6174_ops = {
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
