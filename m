Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from static.88-198-24-112.clients.your-server.de ([88.198.24.112]
 helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbPD3-0006kn-Ir
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 08:33:59 +0000
From: Felix Fietkau <nbd@openwrt.org>
Subject: [PATCH 4.3 RESEND] ath10k: fix DMA related firmware crashes on
 multiple devices
Date: Mon, 14 Sep 2015 10:33:27 +0200
Message-Id: <1442219607-12383-1-git-send-email-nbd@openwrt.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

Some platforms really don't like DMA bursts of 256 bytes, and this
causes the firmware to crash when sending beacons.
Also, changing this based on the firmware version does not seem to make
much sense, so use 128 bytes for all versions.

Cc: stable@vger.kernel.org
Signed-off-by: Felix Fietkau <nbd@openwrt.org>
---
 drivers/net/wireless/ath/ath10k/hw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 23afcda..678d72a 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -337,7 +337,7 @@ enum ath10k_hw_rate_cck {
 #define TARGET_10X_MAX_FRAG_ENTRIES		0
 
 /* 10.2 parameters */
-#define TARGET_10_2_DMA_BURST_SIZE		1
+#define TARGET_10_2_DMA_BURST_SIZE		0
 
 /* Target specific defines for WMI-TLV firmware */
 #define TARGET_TLV_NUM_VDEVS			4
@@ -391,7 +391,7 @@ enum ath10k_hw_rate_cck {
 
 #define TARGET_10_4_TX_DBG_LOG_SIZE		1024
 #define TARGET_10_4_NUM_WDS_ENTRIES		32
-#define TARGET_10_4_DMA_BURST_SIZE		1
+#define TARGET_10_4_DMA_BURST_SIZE		0
 #define TARGET_10_4_MAC_AGGR_DELIM		0
 #define TARGET_10_4_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
 #define TARGET_10_4_VOW_CONFIG			0
-- 
2.2.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
