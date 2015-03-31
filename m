Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YctUC-0007OY-09
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 10:33:35 +0000
Received: by labe2 with SMTP id e2so9177848lab.3
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2015 03:33:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v6 7/7] ath10k: allocate fw resources for iface combinations
Date: Tue, 31 Mar 2015 10:26:26 +0000
Message-Id: <1427797586-5132-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1427797586-5132-1-git-send-email-michal.kazior@tieto.com>
References: <1427797586-5132-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The number of 3 vdevs wasn't enough to handle the
worst case for interface combinations in practice.

wpa_supplicant may need up to 4 vifs to have 2
vifs actually connected, i.e. p2pdev + client + 2x
p2p (either p2p client or p2p go).

This fixes worst case warning:

  Free vdev map is empty, no more interfaces allowed.

This keeps the ability to associate 32 stations in
AP mode at the cost of not being able to guarantee
that under all circumstances, i.e. some
combinations may consume additional fw peer
entries for internal purposes leaving less
resource for stations in AP mode.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.h      | 6 ++----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 254215973637..89e09cbeac19 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -299,11 +299,9 @@ enum ath10k_hw_rate_cck {
 #define TARGET_10_2_DMA_BURST_SIZE		1
 
 /* Target specific defines for WMI-TLV firmware */
-#define TARGET_TLV_NUM_VDEVS			3
+#define TARGET_TLV_NUM_VDEVS			4
 #define TARGET_TLV_NUM_STATIONS			32
-#define TARGET_TLV_NUM_PEERS			((TARGET_TLV_NUM_STATIONS) + \
-						 (TARGET_TLV_NUM_VDEVS) + \
-						 2)
+#define TARGET_TLV_NUM_PEERS			35
 #define TARGET_TLV_NUM_TDLS_VDEVS		1
 #define TARGET_TLV_NUM_TIDS			((TARGET_TLV_NUM_PEERS) * 2)
 #define TARGET_TLV_NUM_MSDU_DESC		(1024 + 32)
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 03e34c351576..ae120782e737 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1318,8 +1318,8 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	cfg->num_peers = __cpu_to_le32(TARGET_TLV_NUM_PEERS);
 
 	if (test_bit(WMI_SERVICE_RX_FULL_REORDER, ar->wmi.svc_map)) {
-		cfg->num_offload_peers = __cpu_to_le32(3);
-		cfg->num_offload_reorder_bufs = __cpu_to_le32(3);
+		cfg->num_offload_peers = __cpu_to_le32(TARGET_TLV_NUM_VDEVS);
+		cfg->num_offload_reorder_bufs = __cpu_to_le32(TARGET_TLV_NUM_VDEVS);
 	} else {
 		cfg->num_offload_peers = __cpu_to_le32(0);
 		cfg->num_offload_reorder_bufs = __cpu_to_le32(0);
@@ -1336,8 +1336,8 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	cfg->rx_timeout_pri[3] = __cpu_to_le32(0x28);
 	cfg->rx_decap_mode = __cpu_to_le32(1);
 	cfg->scan_max_pending_reqs = __cpu_to_le32(4);
-	cfg->bmiss_offload_max_vdev = __cpu_to_le32(3);
-	cfg->roam_offload_max_vdev = __cpu_to_le32(3);
+	cfg->bmiss_offload_max_vdev = __cpu_to_le32(TARGET_TLV_NUM_VDEVS);
+	cfg->roam_offload_max_vdev = __cpu_to_le32(TARGET_TLV_NUM_VDEVS);
 	cfg->roam_offload_max_ap_profiles = __cpu_to_le32(8);
 	cfg->num_mcast_groups = __cpu_to_le32(0);
 	cfg->num_mcast_table_elems = __cpu_to_le32(0);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
