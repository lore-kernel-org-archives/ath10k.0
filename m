Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZnYE-0003N2-RU
 for ath10k@lists.infradead.org; Wed, 27 Nov 2019 02:59:38 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: set max mtu to 1500 for sdio chip
Date: Wed, 27 Nov 2019 02:59:29 +0000
Message-ID: <0101016eaacca93c-357e80e9-f3e0-44e6-b441-ceaf9183880f-000000@us-west-2.amazonses.com>
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

For sdio chip, the max credit size in firmware is 1556, the 1556
include payload, ieee80211 header, htt header, htc header. So it
need to set the max mtu to 1500 to forbidden TX packet which exceed
1500 form application.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00017-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 60849ab8088f..8aa8ebc1d8e9 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2185,6 +2185,8 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	bus_params.chip_id = 0;
 	bus_params.hl_msdu_ids = true;
 
+	ar->hw->max_mtu = ETH_DATA_LEN;
+
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
 		ath10k_err(ar, "failed to register driver core: %d\n", ret);
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
