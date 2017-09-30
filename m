Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyLj5-0001PI-Gx
 for ath10k@lists.infradead.org; Sat, 30 Sep 2017 17:39:02 +0000
Received: by mail-pf0-x244.google.com with SMTP id m28so1628016pfi.0
 for <ath10k@lists.infradead.org>; Sat, 30 Sep 2017 10:38:35 -0700 (PDT)
From: silexcommon@gmail.com
Subject: [PATCH 04/11] ath10k_sdio: reduce transmit msdu count
Date: Sat, 30 Sep 2017 23:07:41 +0530
Message-Id: <1506793068-27445-5-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
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
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org

From: Alagu Sankar <alagusankar@silex-india.com>

Reduce the transmit MSDU count for SDIO, to match with the descriptors
as used by the firmware. This also acts as a high watermark level for
transmit. Too many packets to the firmware results in transmit overflow
interrupt.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
---
 drivers/net/wireless/ath/ath10k/core.c    | 6 +++++-
 drivers/net/wireless/ath/ath10k/hw.h      | 1 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 86247c8..9de49f5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1968,7 +1968,11 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		ar->max_num_stations = TARGET_TLV_NUM_STATIONS;
 		ar->max_num_vdevs = TARGET_TLV_NUM_VDEVS;
 		ar->max_num_tdls_vdevs = TARGET_TLV_NUM_TDLS_VDEVS;
-		ar->htt.max_num_pending_tx = TARGET_TLV_NUM_MSDU_DESC;
+		if (ar->hif.bus == ATH10K_BUS_SDIO)
+			ar->htt.max_num_pending_tx =
+				TARGET_TLV_NUM_MSDU_DESC_HL;
+		else
+			ar->htt.max_num_pending_tx = TARGET_TLV_NUM_MSDU_DESC;
 		ar->wow.max_num_patterns = TARGET_TLV_NUM_WOW_PATTERNS;
 		ar->fw_stats_req_mask = WMI_STAT_PDEV | WMI_STAT_VDEV |
 			WMI_STAT_PEER;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 7c9f6f9..b870a92 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -688,6 +688,7 @@ struct ath10k_hw_ops {
 #define TARGET_TLV_NUM_TDLS_VDEVS		1
 #define TARGET_TLV_NUM_TIDS			((TARGET_TLV_NUM_PEERS) * 2)
 #define TARGET_TLV_NUM_MSDU_DESC		(1024 + 32)
+#define TARGET_TLV_NUM_MSDU_DESC_HL		64
 #define TARGET_TLV_NUM_WOW_PATTERNS		22
 
 /* Target specific defines for QCA9377 high latency firmware */
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 34e9770..3842caa 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1440,7 +1440,7 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	cfg->rx_skip_defrag_timeout_dup_detection_check = __cpu_to_le32(0);
 	cfg->vow_config = __cpu_to_le32(0);
 	cfg->gtk_offload_max_vdev = __cpu_to_le32(2);
-	cfg->num_msdu_desc = __cpu_to_le32(TARGET_TLV_NUM_MSDU_DESC);
+	cfg->num_msdu_desc = __cpu_to_le32(ar->htt.max_num_pending_tx);
 	cfg->max_frag_entries = __cpu_to_le32(2);
 	cfg->num_tdls_vdevs = __cpu_to_le32(TARGET_TLV_NUM_TDLS_VDEVS);
 	cfg->num_tdls_conn_table_entries = __cpu_to_le32(0x20);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
