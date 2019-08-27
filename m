Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2PRU-00073H-69
 for ath10k@lists.infradead.org; Tue, 27 Aug 2019 00:34:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id w16so12901408pfn.7
 for <ath10k@lists.infradead.org>; Mon, 26 Aug 2019 17:34:35 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH,
 RFC] ath10k: Fix skb->len (properly) in ath10k_sdio_mbox_rx_packet
Date: Tue, 27 Aug 2019 08:33:26 +0800
Message-Id: <20190827003326.147452-1-drinkcat@chromium.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Alagu Sankar <alagusankar@silex-india.com>, netdev@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org, Niklas Cassel <niklas.cassel@linaro.org>, tientzu@chromium.org, "David S . Miller" <davem@davemloft.net>

(not a formal patch, take this as a bug report for now, I can clean
up depending on the feedback I get here)

There's at least 3 issues here, and the patch fixes 2/3 only, I'm not sure
how/if 1 should be handled.
 1. ath10k_sdio_mbox_rx_alloc allocating skb of a incorrect size (too
    small)
 2. ath10k_sdio_mbox_rx_packet calling skb_put with that incorrect size.
 3. ath10k_sdio_mbox_rx_process_packet attempts to fixup the size, but
    does not use proper skb_put commands to do so, so we end up with
    a mismatch between skb->head + skb->tail and skb->data + skb->len.

Let's start with 3, this is quite serious as this and causes corruptions
in the TCP stack, as the stack tries to coalesce packets, and relies on
skb->tail being correct (that is, skb_tail_pointer must point to the
first byte _after_ the data): one must never manipulate skb->len
directly.

Instead, we need to use skb_put to allocate more space (which updates
skb->len and skb->tail). But it seems odd to do that in
ath10k_sdio_mbox_rx_process_packet, so I move the code to
ath10k_sdio_mbox_rx_packet (point 2 above).

However, there is still something strange (point 1 above), why is
ath10k_sdio_mbox_rx_alloc allocating packets of the incorrect
(too small?) size? What happens if the packet is bigger than alloc_len?
Does this lead to corruption/lost data?

Fixes: 8530b4e7b22bc3b ("ath10k: sdio: set skb len for all rx packets")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

One simple way to test this is this scriplet, that sends a lot of
small packets over SSH:
(for i in `seq 1 300`; do echo $i; sleep 0.1; done) | ssh $IP cat

In my testing it rarely ever reach 300 without failure.

 drivers/net/wireless/ath/ath10k/sdio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 8ed4fbd8d6c3888..a9f5002863ee7bb 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -381,16 +381,14 @@ static int ath10k_sdio_mbox_rx_process_packet(struct ath10k *ar,
 	struct ath10k_htc_hdr *htc_hdr = (struct ath10k_htc_hdr *)skb->data;
 	bool trailer_present = htc_hdr->flags & ATH10K_HTC_FLAG_TRAILER_PRESENT;
 	enum ath10k_htc_ep_id eid;
-	u16 payload_len;
 	u8 *trailer;
 	int ret;
 
-	payload_len = le16_to_cpu(htc_hdr->len);
-	skb->len = payload_len + sizeof(struct ath10k_htc_hdr);
+	/* TODO: Remove this? */
+	WARN_ON(skb->len != le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr));
 
 	if (trailer_present) {
-		trailer = skb->data + sizeof(*htc_hdr) +
-			  payload_len - htc_hdr->trailer_len;
+		trailer = skb->data + skb->len - htc_hdr->trailer_len;
 
 		eid = pipe_id_to_eid(htc_hdr->eid);
 
@@ -637,8 +635,16 @@ static int ath10k_sdio_mbox_rx_packet(struct ath10k *ar,
 	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
 				 skb->data, pkt->alloc_len);
 	pkt->status = ret;
-	if (!ret)
+	if (!ret) {
+		/* Update actual length. */
+		/* FIXME: This looks quite wrong, why is pkt->act_len not
+		 * correct in the first place?
+		 */
+		struct ath10k_htc_hdr *htc_hdr =
+			(struct ath10k_htc_hdr *)skb->data;
+		pkt->act_len = le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr);
 		skb_put(skb, pkt->act_len);
+	}
 
 	return ret;
 }
-- 
2.23.0.187.g17f5b7556c-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
