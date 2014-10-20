Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDQ8-0004Wv-E3
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:49 +0000
Received: by mail-lb0-f181.google.com with SMTP id l4so3864724lbv.26
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:26 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 9/9] ath10k: clear htt->rx_confused on load
Date: Mon, 20 Oct 2014 15:40:38 +0200
Message-Id: <1413812438-14640-10-git-send-email-michal.kazior@tieto.com>
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

Once driver entered the rx_confused state it would
refuse to rx even after firmware is restarted.
Make sure to clear it so that rx works after, e.g.
hw restart or after all interfaces are stopped.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 39e1969..3e52a33 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -497,6 +497,8 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 	size_t size;
 	struct timer_list *timer = &htt->rx_ring.refill_retry_timer;
 
+	htt->rx_confused = false;
+
 	htt->rx_ring.size = ath10k_htt_rx_ring_size(htt);
 	if (!is_power_of_2(htt->rx_ring.size)) {
 		ath10k_warn(ar, "htt rx ring size is not power of 2\n");
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
