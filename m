Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifJFX-0007i8-UD
 for ath10k@lists.infradead.org; Thu, 12 Dec 2019 07:51:07 +0000
MIME-Version: 1.0
Date: Thu, 12 Dec 2019 07:50:59 +0000
From: Zhi Chen <zhichen@codeaurora.org>
Subject: [PATCH,v3] Revert "ath10k: fix DMA related firmware crashes on 
 multiple devices"
Message-ID: <0101016ef916ee0b-63ec3937-3f44-469d-bd01-b1555bbc6721-000000@us-west-2.amazonses.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
PCIe hung issue was observed on multiple platforms. The issue was 
reproduced
when DUT was configured as AP and associated with 50+ STAs.

For QCA9984/QCA9888, the DMA_BURST_SIZE register controls the AXI burst 
size
of the RD/WR access to the HOST MEM.
0 - No split , RAW read/write transfer size from MAC is put out on bus
     as burst length
1 - Split at 256 byte boundary
2,3 - Reserved

With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary 
when
issue happened. It broke PCIe spec and caused PCIe stuck. So revert
the default value from 0 to 1.

Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
          QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
          Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040

Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
---
v2: restored 10.2 register configuration
v3: modified commit message
---
  drivers/net/wireless/ath/ath10k/hw.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h 
b/drivers/net/wireless/ath/ath10k/hw.h
index 35a3623..59a9a58 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -813,7 +813,7 @@ ath10k_is_rssi_enable(struct ath10k_hw_params *hw,

  #define TARGET_10_4_TX_DBG_LOG_SIZE		1024
  #define TARGET_10_4_NUM_WDS_ENTRIES		32
-#define TARGET_10_4_DMA_BURST_SIZE		0
+#define TARGET_10_4_DMA_BURST_SIZE		1
  #define TARGET_10_4_MAC_AGGR_DELIM		0
  #define TARGET_10_4_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
  #define TARGET_10_4_VOW_CONFIG			0
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
