Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRB39-0000wS-7U
 for ath10k@lists.infradead.org; Wed, 22 Apr 2020 08:48:12 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2] ath10k: drop the TX packet which size exceed credit size
 for sdio
Date: Wed, 22 Apr 2020 16:47:19 +0800
Message-Id: <20200422084719.3479-1-wgong@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

sdio chip use DMA buffer to receive TX packet from ath10k, and it has
limitation of each buffer, if the packet size exceed the credit size,
it will trigger error in firmware.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00017-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: rebase to ath-next
 drivers/net/wireless/ath/ath10k/htc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 58ceba75d20a..31df6dd04bf6 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -846,6 +846,11 @@ int ath10k_htc_send_hl(struct ath10k_htc *htc,
 	struct ath10k_htc_ep *ep = &htc->endpoint[eid];
 	struct ath10k *ar = htc->ar;
 
+	if (sizeof(struct ath10k_htc_hdr) + skb->len > ep->tx_credit_size) {
+		ath10k_dbg(ar, ATH10K_DBG_HTC, "tx exceed max len %d\n", skb->len);
+		return -ENOMEM;
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_HTC, "htc send hl eid %d bundle %d tx count %d len %d\n",
 		   eid, ep->bundle_tx, skb_queue_len(&ep->tx_req_head), skb->len);
 
-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
