Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQ9i0-0008UU-Gx
 for ath10k@lists.infradead.org; Wed, 19 Mar 2014 06:10:37 +0000
Received: by mail-ee0-f42.google.com with SMTP id d17so6219887eek.29
 for <ath10k@lists.infradead.org>; Tue, 18 Mar 2014 23:10:14 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH 2/2] ath10k: Fill per-ppdu info in rx_info only once
Date: Wed, 19 Mar 2014 07:09:41 +0100
Message-Id: <1395209381-26782-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395209381-26782-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1395209381-26782-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Don't fill this for each msdu, while this is the
same.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9cd54a9..a407d98 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1023,6 +1023,15 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			     HTT_RX_INDICATION_INFO1_NUM_MPDU_RANGES);
 	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
 
+	/* Fill this once, while this is per-ppdu */
+	info.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
+	info.signal += rx->ppdu.combined_rssi;
+
+	info.rate.info0 = rx->ppdu.info0;
+	info.rate.info1 = __le32_to_cpu(rx->ppdu.info1);
+	info.rate.info2 = __le32_to_cpu(rx->ppdu.info2);
+	info.tsf = __le32_to_cpu(rx->ppdu.tsf);
+
 	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "htt rx ind: ",
 			rx, sizeof(*rx) +
 			(sizeof(struct htt_rx_indication_mpdu_range) *
@@ -1067,14 +1076,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				ath10k_dbg(ATH10K_DBG_HTT,
 					   "htt rx has MIC err\n");
 
-			info.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
-			info.signal += rx->ppdu.combined_rssi;
-
-			info.rate.info0 = rx->ppdu.info0;
-			info.rate.info1 = __le32_to_cpu(rx->ppdu.info1);
-			info.rate.info2 = __le32_to_cpu(rx->ppdu.info2);
-			info.tsf = __le32_to_cpu(rx->ppdu.tsf);
-
 			hdr = ath10k_htt_rx_skb_get_hdr(msdu_head);
 
 			if (ath10k_htt_rx_hdr_is_amsdu(hdr))
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
