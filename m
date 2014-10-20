Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDQ0-0004JI-2e
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:40 +0000
Received: by mail-la0-f44.google.com with SMTP id hs14so3970012lab.31
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:16 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/9] ath10k: remove unused variable
Date: Mon, 20 Oct 2014 15:40:31 +0200
Message-Id: <1413812438-14640-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
References: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
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

The rx descriptor variable was no longer used in
the rx handler.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 63c69d8..61ff2ac 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1230,7 +1230,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	struct ath10k *ar = htt->ar;
 	struct ieee80211_rx_status *rx_status = &htt->rx_status;
 	struct htt_rx_indication_mpdu_range *mpdu_ranges;
-	struct htt_rx_desc *rxd;
 	enum htt_rx_mpdu_status status;
 	struct ieee80211_hdr *hdr;
 	int num_mpdu_ranges;
@@ -1301,10 +1300,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				continue;
 			}
 
-			rxd = container_of((void *)msdu_head->data,
-					   struct htt_rx_desc,
-					   msdu_payload);
-
 			if (!ath10k_htt_rx_amsdu_allowed(htt, msdu_head,
 							 status,
 							 channel_set,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
