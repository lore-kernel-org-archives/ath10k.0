Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDQ8-0004WC-41
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:48 +0000
Received: by mail-la0-f52.google.com with SMTP id hz20so4015970lab.11
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:24 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 8/9] ath10k: don't forget to replenish after fragmented Rx
Date: Mon, 20 Oct 2014 15:40:37 +0200
Message-Id: <1413812438-14640-9-git-send-email-michal.kazior@tieto.com>
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

In theory it was possible to drain entire HTT Rx
ring via fragmented Rx leading to Rx lockup.

In practice non-data traffic would always trigger
replenishment via the regular Rx handler.

For correctness sake make sure to replenish the
ring on fragmented Rx.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index ddb9fe9..39e1969 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1355,6 +1355,8 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 				      &attention);
 	spin_unlock_bh(&htt->rx_ring.lock);
 
+	tasklet_schedule(&htt->rx_replenish_task);
+
 	ath10k_dbg(ar, ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");
 
 	if (ret) {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
