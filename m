Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x231.google.com ([2a00:1450:4013:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqO-0003Az-N9
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:14 +0000
Received: by mail-ea0-f177.google.com with SMTP id h10so329169eak.22
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:52:52 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 06/14] ath10k: kill signal field in htt_rx_info
Date: Tue,  4 Mar 2014 13:52:19 +0100
Message-Id: <1393937548-7482-7-git-send-email-janusz.dziedzic@tieto.com>
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

Setup signal field directly in ieee80211_rx_status.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |    1 -
 drivers/net/wireless/ath/ath10k/htt_rx.c |    6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index e80f033..9f5da2b 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1178,7 +1178,6 @@ struct htt_rx_info {
 	struct ieee80211_rx_status rx_status;
 	enum htt_rx_mpdu_status status;
 	enum htt_rx_mpdu_encrypt_type encrypt_type;
-	s8 signal;
 	struct {
 		u8 info0;
 		u32 info1;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 2fca1fa..fa6540b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -775,8 +775,6 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 	if (info->amsdu_more)
 		status->flag |= RX_FLAG_AMSDU_MORE;
 
-	status->signal = info->signal;
-
 	spin_lock_bh(&ar->data_lock);
 	ch = ar->scan_channel;
 	if (!ch)
@@ -1164,8 +1162,8 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
 
 	/* Fill this once, while this is per-ppdu */
-	info.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
-	info.signal += rx->ppdu.combined_rssi;
+	info.rx_status.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
+	info.rx_status.signal += rx->ppdu.combined_rssi;
 
 	info.rate.info0 = rx->ppdu.info0;
 	info.rate.info1 = __le32_to_cpu(rx->ppdu.info1);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
