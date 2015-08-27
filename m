Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUwab-00065B-5e
 for ath10k@lists.infradead.org; Thu, 27 Aug 2015 12:47:34 +0000
Received: by laba3 with SMTP id a3so11642308lab.1
 for <ath10k@lists.infradead.org>; Thu, 27 Aug 2015 05:47:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: fix mu-mimo rx status reporting
Date: Thu, 27 Aug 2015 14:47:33 +0200
Message-Id: <1440679653-20289-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
References: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
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

MU-MIMO Rx involves different interpretation of
the VHT-SIG-A compared to SU-MIMO.

The incorrect interpretation led ath10k to report
VHT MCS values greater than 9 which subsequently
prompted mac80211 to drop such frames. This
effectively broke Rx with MU-MIMO in many cases
and manifested with a kernel warning in the log
which looked like this:

  [   14.552520] WARNING: CPU: 2 PID: 0 at net/mac80211/rx.c:3578 ieee80211_rx+0x26c/0x940 [mac80211]()
  [   14.552522] Rate marked as a VHT rate but data is invalid: MCS: 10, NSS: 2
  ... call trace follows ...

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 1b7a04366256..8ba8fa9004cf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -643,6 +643,8 @@ struct amsdu_subframe_hdr {
 	__be16 len;
 } __packed;
 
+#define GROUP_ID_IS_SU_MIMO(x) ((x) == 0 || (x) == 63)
+
 static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 				  struct ieee80211_rx_status *status,
 				  struct htt_rx_desc *rxd)
@@ -650,6 +652,7 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 	struct ieee80211_supported_band *sband;
 	u8 cck, rate, bw, sgi, mcs, nss;
 	u8 preamble = 0;
+	u8 group_id;
 	u32 info1, info2, info3;
 
 	info1 = __le32_to_cpu(rxd->ppdu_start.info1);
@@ -692,10 +695,27 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 	case HTT_RX_VHT_WITH_TXBF:
 		/* VHT-SIG-A1 in info2, VHT-SIG-A2 in info3
 		   TODO check this */
-		mcs = (info3 >> 4) & 0x0F;
-		nss = ((info2 >> 10) & 0x07) + 1;
 		bw = info2 & 3;
 		sgi = info3 & 1;
+		group_id = (info2 >> 4) & 0x3F;
+
+		if (GROUP_ID_IS_SU_MIMO(group_id)) {
+			mcs = (info3 >> 4) & 0x0F;
+			nss = ((info2 >> 10) & 0x07) + 1;
+		} else {
+			/* Hardware doesn't decode VHT-SIG-B into Rx descriptor
+			 * so it's impossible to decode MCS. Also since
+			 * firmware consumes Group Id Management frames host
+			 * has no knowledge regarding group/user position
+			 * mapping so it's impossible to pick the correct Nsts
+			 * from VHT-SIG-A1.
+			 *
+			 * Bandwidth and SGI are valid so report the rateinfo
+			 * on best-effort basis.
+			 */
+			mcs = 0;
+			nss = 1;
+		}
 
 		status->rate_idx = mcs;
 		status->vht_nss = nss;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
