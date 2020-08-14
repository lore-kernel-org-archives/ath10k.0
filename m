Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Uhi-0005f5-Vl
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 08:04:54 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: correct the array index from mcs index for HT mode
 for QCA6174
Date: Fri, 14 Aug 2020 16:04:54 +0800
Message-Id: <1597392294-13124-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

The mcs index of HT mode is 0 to 31, please refer http://mcsindex.com/.
Its spatial stream(Nss) number is from 1 to 4, mcs index is 0~7 for
Nss=1, 8~15 for Nss=2, 16~23 for Nss=3 and 24~31 is for Nss=4.

The mcs is reported from firmware in wmi_tlv_peer_stats_info of
event WMI_TLV_PEER_STATS_INFO_EVENTID, its range is from 0~15 for
QCA6174 SDIO and PCIe. It is for both Nss=1 and Nss=2, and it has 2
rate table supported_ht_mcs_rate_nss1 and supported_ht_mcs_rate_nss2
in ath10k, they are for Nss=1 and Nss=2, each table has 8 rates.

It need to find the matched row number with the mcs index, for example,
mcs index is 2, it is <=7, so it is Nss=1, and match row 2 in table of
Nss=1. If mcs index is 12, it is >= 8 and <= 15, so it is Nss=2, it
match row 4(12-8) in table of Nss=2. If mcs index is >=16, it is for
Nss=3/4, it need to add rate table, so it is not support in current
ath10k.

This patch is to find the row number in rate table of Nss=1 or Nss=2
with the mcs index reported from firmware.

This patch only effect the chips which supports_peer_stats_info of its
hw_params is true, it is true only for QCA6174 currently.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3e3896214e8b..daa9e43d16b0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8368,19 +8368,32 @@ static void ath10k_mac_get_rate_flags_ht(struct ath10k *ar, u32 rate, u8 nss, u8
 					 u8 *flags, u8 *bw)
 {
 	struct ath10k_index_ht_data_rate_type *mcs_rate;
+	u8 index;
+	size_t len_nss1 = ARRAY_SIZE(supported_ht_mcs_rate_nss1);
+	size_t len_nss2 = ARRAY_SIZE(supported_ht_mcs_rate_nss2);
+
+	if (mcs >= (len_nss1 + len_nss2)) {
+		ath10k_warn(ar, "not supported mcs %d in current rate table", mcs);
+		return;
+	}
 
 	mcs_rate = (struct ath10k_index_ht_data_rate_type *)
 		   ((nss == 1) ? &supported_ht_mcs_rate_nss1 :
 		   &supported_ht_mcs_rate_nss2);
 
-	if (rate == mcs_rate[mcs].supported_rate[0]) {
+	if (mcs >= len_nss1)
+		index = mcs - len_nss1;
+	else
+		index = mcs;
+
+	if (rate == mcs_rate[index].supported_rate[0]) {
 		*bw = RATE_INFO_BW_20;
-	} else if (rate == mcs_rate[mcs].supported_rate[1]) {
+	} else if (rate == mcs_rate[index].supported_rate[1]) {
 		*bw |= RATE_INFO_BW_40;
-	} else if (rate == mcs_rate[mcs].supported_rate[2]) {
+	} else if (rate == mcs_rate[index].supported_rate[2]) {
 		*bw |= RATE_INFO_BW_20;
 		*flags |= RATE_INFO_FLAGS_SHORT_GI;
-	} else if (rate == mcs_rate[mcs].supported_rate[3]) {
+	} else if (rate == mcs_rate[index].supported_rate[3]) {
 		*bw |= RATE_INFO_BW_40;
 		*flags |= RATE_INFO_FLAGS_SHORT_GI;
 	} else {
@@ -8441,6 +8454,9 @@ static void ath10k_mac_parse_bitrate(struct ath10k *ar, u32 rate_code,
 	u8 mcs = WMI_TLV_GET_HW_RC_RATE_V1(rate_code);
 	u8 flags = 0, bw = 0;
 
+	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac parse rate code 0x%x bitrate %d kbps\n",
+		   rate_code, bitrate_kbps);
+
 	if (preamble == WMI_RATE_PREAMBLE_HT)
 		mode = ATH10K_PHY_MODE_HT;
 	else if (preamble == WMI_RATE_PREAMBLE_VHT)
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
