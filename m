Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlfC5-0007vE-Ah
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 14:34:51 +0000
Received: by mail-la0-f44.google.com with SMTP id gf13so998942lab.3
 for <ath10k@lists.infradead.org>; Tue, 04 Nov 2014 06:34:24 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/7] ath10k: refactor htt->rx_confused
Date: Tue,  4 Nov 2014 15:22:07 +0100
Message-Id: <1415110931-10945-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
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

Make the rx_confused be handled by the rx
indication handlers instead of the buffer popping
function.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index cba2f3b..651028e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -316,20 +316,13 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
-	if (htt->rx_confused) {
-		ath10k_warn(ar, "htt is confused. refusing rx\n");
-		return -1;
-	}
-
 	for (;;) {
 		int last_msdu, msdu_len_invalid, msdu_chained;
 
 		msdu = ath10k_htt_rx_netbuf_pop(htt);
 		if (!msdu) {
-			ath10k_err(ar, "failed to pop msdu\n");
 			__skb_queue_purge(amsdu);
-			htt->rx_confused = true;
-			break;
+			return -ENOENT;
 		}
 
 		__skb_queue_tail(amsdu, msdu);
@@ -351,10 +344,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		 */
 		if (!(__le32_to_cpu(rx_desc->attention.flags)
 				& RX_ATTENTION_FLAGS_MSDU_DONE)) {
-			ath10k_err(ar, "popped an incomplete msdu\n");
 			__skb_queue_purge(amsdu);
-			htt->rx_confused = true;
-			break;
+			return -EIO;
 		}
 
 		*attention |= __le32_to_cpu(rx_desc->attention.flags) &
@@ -422,10 +413,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		while (msdu_chained--) {
 			msdu = ath10k_htt_rx_netbuf_pop(htt);
 			if (!msdu) {
-				ath10k_warn(ar, "failed to pop chained msdu\n");
 				__skb_queue_purge(amsdu);
-				htt->rx_confused = true;
-				break;
+				return -ENOENT;
 			}
 
 			__skb_queue_tail(amsdu, msdu);
@@ -1201,6 +1190,9 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
+	if (htt->rx_confused)
+		return;
+
 	fw_desc_len = __le16_to_cpu(rx->prefix.fw_rx_desc_bytes);
 	fw_desc = (u8 *)&rx->fw_desc;
 
@@ -1246,10 +1238,13 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 					      &fw_desc_len, &amsdu,
 					      &attention);
 		if (ret < 0) {
-			ath10k_warn(ar, "failed to pop amsdu from htt rx ring %d\n",
-				    ret);
+			ath10k_warn(ar, "rx ring became corrupted: %d\n", ret);
 			__skb_queue_purge(&amsdu);
-			continue;
+			/* FIXME: It's probably a good idea to reboot the
+			 * device instead of leaving it inoperable.
+			 */
+			htt->rx_confused = true;
+			break;
 		}
 
 		if (!ath10k_htt_rx_amsdu_allowed(htt, skb_peek(&amsdu),
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
