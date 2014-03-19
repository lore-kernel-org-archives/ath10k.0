Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQCI6-0003Gm-66
 for ath10k@lists.infradead.org; Wed, 19 Mar 2014 08:56:02 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so6408033eei.28
 for <ath10k@lists.infradead.org>; Wed, 19 Mar 2014 01:55:40 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC v2 2/8] ath10k: rename process_rx_rates to ath10k_htt_rx_h_rates
Date: Wed, 19 Mar 2014 09:48:57 +0100
Message-Id: <1395218943-31704-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395218943-31704-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1395218943-31704-1-git-send-email-janusz.dziedzic@tieto.com>
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

No functional changes.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index c07fc8f..fd14c3a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -655,9 +655,9 @@ static const u8 rx_legacy_rate_idx[] = {
 	5,	/* 0x0F  - 9Mbps   */
 };
 
-static void process_rx_rates(struct ath10k *ar, struct htt_rx_info *info,
-			     enum ieee80211_band band,
-			     struct ieee80211_rx_status *status)
+static void ath10k_htt_rx_h_rates(struct ath10k *ar, struct htt_rx_info *info,
+				  enum ieee80211_band band,
+				  struct ieee80211_rx_status *status)
 {
 	u8 cck, rate, rate_idx, bw, sgi, mcs, nss;
 	u8 info0 = info->rate.info0;
@@ -789,7 +789,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 		return;
 	}
 
-	process_rx_rates(ar, info, ch->band, status);
+	ath10k_htt_rx_h_rates(ar, info, ch->band, status);
 	status->band = ch->band;
 	status->freq = ch->center_freq;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
