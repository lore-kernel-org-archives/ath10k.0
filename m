Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4iXp-0005k7-77
 for ath10k@lists.infradead.org; Mon, 02 Sep 2019 09:22:42 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v4 1/8] ath10k: adjust skb length in ath10k_sdio_mbox_rx_packet
Date: Mon,  2 Sep 2019 17:22:19 +0800
Message-Id: <1567416146-14403-2-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1567416146-14403-1-git-send-email-wgong@codeaurora.org>
References: <1567416146-14403-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Nicolas Boichat <drinkcat@chromium.org>

When the FW bundles multiple packets, pkt->act_len may be incorrect
as it refers to the first packet only (however, the FW will only
bundle packets that fit into the same pkt->alloc_len).

Before this patch, the skb length would be set (incorrectly) to
pkt->act_len in ath10k_sdio_mbox_rx_packet, and then later manually
adjusted in ath10k_sdio_mbox_rx_process_packet.

The first problem is that ath10k_sdio_mbox_rx_process_packet does not
use proper skb_put commands to adjust the length (it directly changes
skb->len), so we end up with a mismatch between skb->head + skb->tail
and skb->data + skb->len. This is quite serious, and causes corruptions
in the TCP stack, as the stack tries to coalesce packets, and relies
on skb->tail being correct (that is, skb_tail_pointer must point to
the first byte_after_ the data).

Instead of re-adjusting the size in ath10k_sdio_mbox_rx_process_packet,
this moves the code to ath10k_sdio_mbox_rx_packet, and also add a
bounds check, as skb_put would crash the kernel if not enough space is
available.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Fixes: 8530b4e7b22bc3b ("ath10k: sdio: set skb len for all rx packets")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: no this patch
v3: new added
v4: change commit log

 drivers/net/wireless/ath/ath10k/sdio.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 8ed4fbd..1127e44 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -381,16 +381,11 @@ static int ath10k_sdio_mbox_rx_process_packet(struct ath10k *ar,
 	struct ath10k_htc_hdr *htc_hdr = (struct ath10k_htc_hdr *)skb->data;
 	bool trailer_present = htc_hdr->flags & ATH10K_HTC_FLAG_TRAILER_PRESENT;
 	enum ath10k_htc_ep_id eid;
-	u16 payload_len;
 	u8 *trailer;
 	int ret;
 
-	payload_len = le16_to_cpu(htc_hdr->len);
-	skb->len = payload_len + sizeof(struct ath10k_htc_hdr);
-
 	if (trailer_present) {
-		trailer = skb->data + sizeof(*htc_hdr) +
-			  payload_len - htc_hdr->trailer_len;
+		trailer = skb->data + skb->len - htc_hdr->trailer_len;
 
 		eid = pipe_id_to_eid(htc_hdr->eid);
 
@@ -632,13 +627,29 @@ static int ath10k_sdio_mbox_rx_packet(struct ath10k *ar,
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sk_buff *skb = pkt->skb;
+	struct ath10k_htc_hdr *htc_hdr;
 	int ret;
 
 	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
 				 skb->data, pkt->alloc_len);
+
+	if (!ret) {
+		/* Update actual length. The original length may be incorrect,
+		 * as the FW will bundle multiple packets as long as their sizes
+		 * fit within the same aligned length (pkt->alloc_len).
+		 */
+		htc_hdr = (struct ath10k_htc_hdr *)skb->data;
+		pkt->act_len = le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr);
+		if (pkt->act_len <= pkt->alloc_len) {
+			skb_put(skb, pkt->act_len);
+		} else {
+			ath10k_warn(ar, "rx packet too large (%zu > %zu)\n",
+				    pkt->act_len, pkt->alloc_len);
+			ret = -EMSGSIZE;
+		}
+	}
+
 	pkt->status = ret;
-	if (!ret)
-		skb_put(skb, pkt->act_len);
 
 	return ret;
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
