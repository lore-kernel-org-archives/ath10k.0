Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVYhg-0003zi-Jo
 for ath10k@lists.infradead.org; Wed, 20 Jun 2018 08:43:25 +0000
Received: by mail-lf0-x243.google.com with SMTP id i15-v6so3702929lfc.2
 for <ath10k@lists.infradead.org>; Wed, 20 Jun 2018 01:42:50 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 3/3] ath10k: sdio: set skb len for all rx packets
Date: Wed, 20 Jun 2018 10:42:22 +0200
Message-Id: <20180620084222.3521-4-niklas.cassel@linaro.org>
In-Reply-To: <20180620084222.3521-1-niklas.cassel@linaro.org>
References: <20180620084222.3521-1-niklas.cassel@linaro.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: alagusankar@silex-india.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>

Without this, packets larger than 1500 will silently be dropped.
Easily reproduced by sending a ping packet with a size larger
than 1500.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 0c57d6aaa437..8ac47b04a17e 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -396,6 +396,7 @@ static int ath10k_sdio_mbox_rx_process_packet(struct ath10k *ar,
 	int ret;
 
 	payload_len = le16_to_cpu(htc_hdr->len);
+	skb->len = payload_len + sizeof(struct ath10k_htc_hdr);
 
 	if (trailer_present) {
 		trailer = skb->data + sizeof(*htc_hdr) +
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
