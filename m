Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqV-0003BV-HQ
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:20 +0000
Received: by mail-ea0-f174.google.com with SMTP id f15so332273eak.19
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:52:57 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 10/14] ath10k: kill mic_err/amsdu_more from htt_rx_info
Date: Tue,  4 Mar 2014 13:52:23 +0100
Message-Id: <1393937548-7482-11-git-send-email-janusz.dziedzic@tieto.com>
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
 drivers/net/wireless/ath/ath10k/htt.h    |    2 --
 drivers/net/wireless/ath/ath10k/htt_rx.c |   20 ++++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 1713c70..d3d2f01 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1178,8 +1178,6 @@ struct htt_rx_info {
 	struct ieee80211_rx_status rx_status;
 	enum htt_rx_mpdu_status status;
 	enum htt_rx_mpdu_encrypt_type encrypt_type;
-	bool amsdu_more;
-	bool mic_err;
 };
 
 struct ath10k_htt_txbuf {
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 35a7ae15..3aa5a61 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -783,12 +783,6 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 				~IEEE80211_FCTL_PROTECTED);
 	}
 
-	if (info->mic_err)
-		status->flag |= RX_FLAG_MMIC_ERROR;
-
-	if (info->amsdu_more)
-		status->flag |= RX_FLAG_AMSDU_MORE;
-
 	ath10k_dbg(ATH10K_DBG_DATA,
 		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i\n",
 		   info->skb,
@@ -908,7 +902,9 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 		info->skb->next = NULL;
 
 		if (skb)
-			info->amsdu_more = true;
+			info->rx_status.flag |= RX_FLAG_AMSDU_MORE;
+		else
+			info->rx_status.flag &= ~RX_FLAG_AMSDU_MORE;
 
 		ath10k_process_rx(htt->ar, info);
 	}
@@ -1147,7 +1143,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	int num_mpdu_ranges;
 	int fw_desc_len;
 	u8 *fw_desc;
-	bool channel_set, fcs_err;
+	bool channel_set, fcs_err, mic_err;
 	int i, j;
 
 	lockdep_assert_held(&htt->rx_ring.lock);
@@ -1218,13 +1214,17 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			else
 				info.rx_status.flag &= ~RX_FLAG_FAILED_FCS_CRC;
 
-			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
+			mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
+			if (mic_err)
+				info.rx_status.flag |= RX_FLAG_MMIC_ERROR;
+			else
+				info.rx_status.flag &= ~RX_FLAG_MMIC_ERROR;
 
 			if (fcs_err)
 				ath10k_dbg(ATH10K_DBG_HTT,
 					   "htt rx has FCS err\n");
 
-			if (info.mic_err)
+			if (mic_err)
 				ath10k_dbg(ATH10K_DBG_HTT,
 					   "htt rx has MIC err\n");
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
