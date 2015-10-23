Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpUJh-0007gT-Js
 for ath10k@lists.infradead.org; Fri, 23 Oct 2015 04:51:02 +0000
From: Yanbo Li <yanbol@qca.qualcomm.com>
Subject: [PATCH] ath10k: Adjust the RX packet pad offset at QCA99X0 4addr mode
Date: Thu, 22 Oct 2015 21:50:16 -0700
Message-ID: <1445575816-4500-1-git-send-email-yanbol@qca.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

The QCA99X0 4 addresses RX packets pad 2 bytes at the beginning of
MSDU instead the end of ieee80211 header to keep align. The currently
RX data path can't parse the header correctly in this case. This
patch fixes it for QCA99X0

Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 13de3617d5ab..3c1d07c191d5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -58,6 +58,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
+		.loc_4addr_pad = ATH10K_4ADDR_PAD_AFT,
 		.fw = {
 			.dir = QCA988X_HW_2_0_FW_DIR,
 			.fw = QCA988X_HW_2_0_FW_FILE,
@@ -75,6 +76,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
+		.loc_4addr_pad = ATH10K_4ADDR_PAD_AFT,
 		.fw = {
 			.dir = QCA6174_HW_2_1_FW_DIR,
 			.fw = QCA6174_HW_2_1_FW_FILE,
@@ -92,6 +94,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
+		.loc_4addr_pad = ATH10K_4ADDR_PAD_AFT,
 		.fw = {
 			.dir = QCA6174_HW_3_0_FW_DIR,
 			.fw = QCA6174_HW_3_0_FW_FILE,
@@ -109,6 +112,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
+		.loc_4addr_pad = ATH10K_4ADDR_PAD_AFT,
 		.fw = {
 			/* uses same binaries as hw3.0 */
 			.dir = QCA6174_HW_3_0_FW_DIR,
@@ -128,6 +132,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.continuous_frag_desc = true,
 		.channel_counters_freq_hz = 150000,
 		.max_probe_resp_desc_thres = 24,
+		.loc_4addr_pad = ATH10K_4ADDR_PAD_PRE,
 		.fw = {
 			.dir = QCA99X0_HW_2_0_FW_DIR,
 			.fw = QCA99X0_HW_2_0_FW_FILE,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 7cc7cdd56c95..b4db8bbf85ce 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -646,6 +646,9 @@ struct ath10k {
 		 */
 		u32 max_probe_resp_desc_thres;
 
+		/* The padding bytes's location is different on various chips */
+		enum ath10k_loc_4addr_pad loc_4addr_pad;
+
 		struct ath10k_hw_params_fw {
 			const char *dir;
 			const char *fw;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6060dda4e910..f25f1d7a3edf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1114,7 +1114,19 @@ static void ath10k_htt_rx_h_undecap_nwifi(struct ath10k *ar,
 	 */
 
 	/* pull decapped header and copy SA & DA */
-	hdr = (struct ieee80211_hdr *)msdu->data;
+	if ((ar->hw_params.loc_4addr_pad  == ATH10K_4ADDR_PAD_PRE) &&
+	    ieee80211_has_a4(((struct ieee80211_hdr *)first_hdr)->frame_control)) {
+		/* The QCA99X0 4 address mode pad 2 bytes at the
+		 * beginning of MSDU
+		 */
+		hdr = (struct ieee80211_hdr *)(msdu->data + 2);
+		/* The skb length need be extended 2 as the 2 bytes at the tail
+		 * be excluded due to the padding
+		 */
+		skb_put(msdu, 2);
+	} else
+		hdr = (struct ieee80211_hdr *)(msdu->data);
+
 	hdr_len = ath10k_htt_rx_nwifi_hdrlen(ar, hdr);
 	ether_addr_copy(da, ieee80211_get_DA(hdr));
 	ether_addr_copy(sa, ieee80211_get_SA(hdr));
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 2d87737e35ff..efbe6fa1f356 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -282,6 +282,11 @@ enum ath10k_hw_rate_cck {
 	ATH10K_HW_RATE_CCK_SP_2M,
 };
 
+enum ath10k_loc_4addr_pad {
+	ATH10K_4ADDR_PAD_AFT,
+	ATH10K_4ADDR_PAD_PRE,
+};
+
 /* Target specific defines for MAIN firmware */
 #define TARGET_NUM_VDEVS			8
 #define TARGET_NUM_PEER_AST			2
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
