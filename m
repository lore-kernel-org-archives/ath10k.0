Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaH4X-0007S1-Gf
 for ath10k@lists.infradead.org; Thu, 28 Nov 2019 10:30:54 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v8 2/4] ath10k: change ATH10K_SDIO_BUS_REQUEST_MAX_NUM from 64
 to 1024
Date: Thu, 28 Nov 2019 10:30:51 +0000
Message-ID: <0101016eb19041d3-bdda1434-24b9-4702-8ae8-6d48e8d2e6df-000000@us-west-2.amazonses.com>
In-Reply-To: <20191128103030.6429-1-wgong@codeaurora.org>
References: <20191128103030.6429-1-wgong@codeaurora.org>
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

sdio bus bandwidth is low, sometimes for high performance TX test,
it will lack of ath10k_sdio_bus_request, it will print message:
ath10k_sdio mmc1:0001:1: unable to allocate bus request for async request

change the num from 64 to 1024 will not happen it.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00017-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index b8c7ac0330bd..556f67b0f89e 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -37,7 +37,7 @@
 	(ATH10K_SDIO_MAX_BUFFER_SIZE - sizeof(struct ath10k_htc_hdr))
 
 #define ATH10K_HIF_MBOX_NUM_MAX                 4
-#define ATH10K_SDIO_BUS_REQUEST_MAX_NUM         64
+#define ATH10K_SDIO_BUS_REQUEST_MAX_NUM         1024
 
 #define ATH10K_SDIO_HIF_COMMUNICATION_TIMEOUT_HZ (100 * HZ)
 
@@ -98,6 +98,7 @@
 #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_OFF 0xFFFEFFFF
 #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_ON 0x10000
 
+/* TODO: remove this and use skb->cb instead, much cleaner approach */
 struct ath10k_sdio_bus_request {
 	struct list_head list;
 
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
