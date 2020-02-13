Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j27yb-0003WZ-Ah
 for ath10k@lists.infradead.org; Thu, 13 Feb 2020 06:27:54 +0000
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: [PATCH] Allow qca988x family to support ack rssi of tx data packets.
Date: Thu, 13 Feb 2020 14:30:51 +0800
Message-Id: <1581575451-948-1-git-send-email-yiboz@codeaurora.org>
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
Cc: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org

Hardwares tested : QCA9887
Firmwares tested : 10.4-3.9.0.1-00036

Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 2451e0f..57c58af 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1131,6 +1131,7 @@ static int ath10k_get_htt_tx_data_rssi_pad(struct htt_resp *resp)
 
 const struct ath10k_hw_ops qca988x_ops = {
 	.set_coverage_class = ath10k_hw_qca988x_set_coverage_class,
+	.is_rssi_enable = ath10k_htt_tx_rssi_enable,
 };
 
 static int ath10k_qca99x0_rx_desc_get_l3_pad_bytes(struct htt_rx_desc *rxd)
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
