Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hglMK-0003o9-Ho
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 07:31:49 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH] ath10k: check data ack rssi enabled/disabled in htt rx event
Date: Fri, 28 Jun 2019 13:01:24 +0530
Message-Id: <1561707084-10021-1-git-send-email-bpothuno@codeaurora.org>
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
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org, Balaji Pothunoori <bpothuno@codeaurora.org>

From: Abhishek Ambure <aambure@codeaurora.org>

For all data packets trasmmited, host gets htt tx completion event.

QCA9984 firmware gives data ack rssi values to host through
htt event of data tx completion. Data ack rssi values are valid
if A0 bit is set in HTT rx message.

Tested HW: QCA9984
Tested FW: 10.4-3.9.0.2-00044

Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index ad082b7..303f17d 100644
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
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
