Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22b.google.com ([2a00:1450:4013:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqX-0003BO-Mh
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:23 +0000
Received: by mail-ea0-f171.google.com with SMTP id n15so329136ead.16
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:52:56 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 09/14] ath10k: kill fcs_err from htt_rx_info
Date: Tue,  4 Mar 2014 13:52:22 +0100
Message-Id: <1393937548-7482-10-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
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

Setup this directly in ieee80211_rx_status.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |    1 -
 drivers/net/wireless/ath/ath10k/htt_rx.c |   18 +++++++++++-------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index ea39b87..1713c70 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1178,7 +1178,6 @@ struct htt_rx_info {
 	struct ieee80211_rx_status rx_status;
 	enum htt_rx_mpdu_status status;
 	enum htt_rx_mpdu_encrypt_type encrypt_type;
-	bool fcs_err;
 	bool amsdu_more;
 	bool mic_err;
 };
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 4eca6e6..35a7ae15 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -786,9 +786,6 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 	if (info->mic_err)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (info->fcs_err)
-		status->flag |= RX_FLAG_FAILED_FCS_CRC;
-
 	if (info->amsdu_more)
 		status->flag |= RX_FLAG_AMSDU_MORE;
 
@@ -805,7 +802,8 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 		   status->rate_idx,
 		   status->vht_nss,
 		   status->freq,
-		   status->band, status->flag, info->fcs_err);
+		   status->band, status->flag,
+		   !!(status->flag & RX_FLAG_FAILED_FCS_CRC));
 	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "rx skb: ",
 			info->skb->data, info->skb->len);
 
@@ -1149,7 +1147,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	int num_mpdu_ranges;
 	int fw_desc_len;
 	u8 *fw_desc;
-	bool channel_set;
+	bool channel_set, fcs_err;
 	int i, j;
 
 	lockdep_assert_held(&htt->rx_ring.lock);
@@ -1213,10 +1211,16 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			}
 
 			info.skb     = msdu_head;
-			info.fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
+
+			fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
+			if (fcs_err)
+				info.rx_status.flag |= RX_FLAG_FAILED_FCS_CRC;
+			else
+				info.rx_status.flag &= ~RX_FLAG_FAILED_FCS_CRC;
+
 			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
 
-			if (info.fcs_err)
+			if (fcs_err)
 				ath10k_dbg(ATH10K_DBG_HTT,
 					   "htt rx has FCS err\n");
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
