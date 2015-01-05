Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y84WB-00060H-FC
 for ath10k@lists.infradead.org; Mon, 05 Jan 2015 10:04:12 +0000
From: "Kwon, Oh-Keun (Owen)" <ohkeunow@qti.qualcomm.com>
Subject: patch to enable LDPC / STBC sniffing with ath10k
Date: Mon, 5 Jan 2015 10:03:47 +0000
Message-ID: <b971eed24d354c6e9d022d50d63538d5@nalasexr01a.na.qualcomm.com>
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi ath10k-list,

I am a CE for WiFi in Qualcomm-Atheros. I don't know this is appropriate to contact you using QCA email.

I recently tried sniffer (monitoring mode) with ath10k driver. I found LDPC packets are not captured, and there is no flag for LDPC / STBC in Radiotap information. Could you please consider this kind of patch though this is draft form?

1. parse preamble information to set the LDPC / STBC flag in the Radiotap information.
2. indicate LDPC / STBC / SGI enable to the firmware on vdev-up

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index eebc860..ed97739 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -670,7 +670,7 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 				  u8 info0, u32 info1, u32 info2,
 				  struct ieee80211_rx_status *status)
 {
-	u8 cck, rate, rate_idx, bw, sgi, mcs, nss;
+	u8 cck, rate, rate_idx, bw, sgi, mcs, nss, ldpc, stbc;
 	u8 preamble = 0;
 
 	/* Check if valid fields */
@@ -730,6 +730,8 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 		nss = ((info1 >> 10) & 0x07) + 1;
 		bw = info1 & 3;
 		sgi = info2 & 1;
+		stbc = info1 & 8;
+		ldpc = info2 & 4;
 
 		status->rate_idx = mcs;
 		status->vht_nss = nss;
@@ -737,6 +739,13 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 		if (sgi)
 			status->flag |= RX_FLAG_SHORT_GI;
 
+		/* for test */
+		status->flag |= stbc << RX_FLAG_STBC_SHIFT;
+		
+		if (ldpc)
+		   	status->flag |= RX_FLAG_LDPC;
+
+
 		switch (bw) {
 		/* 20MHZ */
 		case 0:
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 4b7782a..df11f6d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -487,6 +487,9 @@ static struct wmi_pdev_param_map wmi_10x_pdev_param_map = {
 	.burst_enable = WMI_10X_PDEV_PARAM_BURST_ENABLE,
 };
 
+int ath10k_wmi_vdev_set_param(struct ath10k *ar, u32 vdev_id,
+			      u32 param_id, u32 param_value);
+
 int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
 {
 	int ret;
@@ -3143,6 +3146,11 @@ int ath10k_wmi_vdev_up(struct ath10k *ar, u32 vdev_id, u32 aid, const u8 *bssid)
 	struct wmi_vdev_up_cmd *cmd;
 	struct sk_buff *skb;
 
+	/* add for test */
+	ath10k_wmi_vdev_set_param(ar, vdev_id, WMI_VDEV_PARAM_LDPC, 1);
+	ath10k_wmi_vdev_set_param(ar, vdev_id, WMI_VDEV_PARAM_RX_STBC, 1);
+	ath10k_wmi_vdev_set_param(ar, vdev_id, WMI_VDEV_PARAM_SGI, 1);
+
 	skb = ath10k_wmi_alloc_skb(sizeof(*cmd));
 	if (!skb)
 		return -ENOMEM;

Thanks,
Owen

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
