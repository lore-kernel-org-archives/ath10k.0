Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y5Tfy-0003vw-5X
 for ath10k@lists.infradead.org; Mon, 29 Dec 2014 06:19:34 +0000
From: Sujith Manoharan <sujith@msujith.org>
Subject: [PATCH] ath10k: Fix DMA burst size
Date: Mon, 29 Dec 2014 11:51:06 +0530
Message-Id: <1419834066-11802-1-git-send-email-sujith@msujith.org>
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

A value of zero indicates that 128B is the maximum
DMA request size for read/writes. But PCI cards based
on AR9880 can support 256B, so enable this for
the 10.2 firmware.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.h  | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 5729901..7b771ae 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -183,6 +183,9 @@ struct ath10k_pktlog_hdr {
 #define TARGET_10X_NUM_MSDU_DESC		(1024 + 400)
 #define TARGET_10X_MAX_FRAG_ENTRIES		0
 
+/* 10.2 parameters */
+#define TARGET_10_2_DMA_BURST_SIZE		1
+
 /* Target specific defines for WMI-TLV firmware */
 #define TARGET_TLV_NUM_VDEVS			3
 #define TARGET_TLV_NUM_STATIONS			32
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index ac74290..b103122 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3744,7 +3744,7 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
 	config.mcast2ucast_mode = __cpu_to_le32(TARGET_10X_MCAST2UCAST_MODE);
 	config.tx_dbg_log_size = __cpu_to_le32(TARGET_10X_TX_DBG_LOG_SIZE);
 	config.num_wds_entries = __cpu_to_le32(TARGET_10X_NUM_WDS_ENTRIES);
-	config.dma_burst_size = __cpu_to_le32(TARGET_10X_DMA_BURST_SIZE);
+	config.dma_burst_size = __cpu_to_le32(TARGET_10_2_DMA_BURST_SIZE);
 	config.mac_aggr_delim = __cpu_to_le32(TARGET_10X_MAC_AGGR_DELIM);
 
 	val = TARGET_10X_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
-- 
2.2.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
