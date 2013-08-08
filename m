Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7LPN-0001tW-2k
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 08:17:21 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/4] ath10k: implement 802.3 SNAP rx decap type A-MSDU handling
Date: Thu, 8 Aug 2013 10:16:52 +0200
Message-ID: <1375949813-10969-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This enables driver to rx another decapped a-msdu
frames. It should possibly help with throughputs
in some cases and reduce (or eliminate) number of
messages like this:

  ath10k: error processing msdus -524

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index e784c40..9b93aed 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -610,8 +610,7 @@ static int ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 			RX_MPDU_START_INFO0_ENCRYPT_TYPE);
 
 	/* FIXME: No idea what assumptions are safe here. Need logs */
-	if ((fmt == RX_MSDU_DECAP_RAW && skb->next) ||
-	    (fmt == RX_MSDU_DECAP_8023_SNAP_LLC)) {
+	if ((fmt == RX_MSDU_DECAP_RAW && skb->next)) {
 		ath10k_htt_rx_free_msdu_chain(skb->next);
 		skb->next = NULL;
 		return -ENOTSUPP;
@@ -659,6 +658,15 @@ static int ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
 			decap_hdr += roundup(crypto_len, 4);
 		}
 
+		if (fmt == RX_MSDU_DECAP_8023_SNAP_LLC) {
+			/* SNAP 802.3 consists of:
+			 * [dst:6][src:6][len:2][dsap:1][ssap:1][ctl:1][snap:5]
+			 * [data][fcs:4].
+			 *
+			 * Since this overlaps with A-MSDU header (da, sa, len)
+			 * there's nothing extra to do. */
+		}
+
 		if (fmt == RX_MSDU_DECAP_ETHERNET2_DIX) {
 			/* Ethernet2 decap inserts ethernet header in place of
 			 * A-MSDU subframe header. */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
