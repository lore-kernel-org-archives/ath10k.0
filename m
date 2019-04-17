Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGq1r-0007GD-Pa
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 19:15:35 +0000
Received: by mail-lf1-x141.google.com with SMTP id u17so19748135lfi.3
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 12:15:31 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH v2 5/5] ath10k: sdio: remove skb_trim in TX path
Date: Wed, 17 Apr 2019 21:15:03 +0200
Message-Id: <20190417191503.18814-6-erik.stromdahl@gmail.com>
In-Reply-To: <20190417191503.18814-1-erik.stromdahl@gmail.com>
References: <20190417191503.18814-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This patch fixes a bug with padding of the skb data buffer.
Since skb_trim can only be used to reduce the skb len, it is useless when
we pad (increase the length of) the skb. Instead we allocate a new
buffer with enough space to contain both the TX data and padding.

Since some skb's have multiple references, we can't use skb_put_padto()
to extend and pad skb->data (since it causes a panic if there is more
than one reference).

Also, in order to avoid the following possible deadlock issue (reported by
lockdep):

[   26.508508]  Possible interrupt unsafe locking scenario:
[   26.508508]
[   26.515314]        CPU0                    CPU1
[   26.519862]        ----                    ----
[   26.524408]   lock(fs_reclaim);
[   26.527573]                                local_irq_disable();
[   26.533508]                                lock(_xmit_ETHER#2);
[   26.539453]                                lock(fs_reclaim);
[   26.545135]   <Interrupt>
[   26.547769]     lock(_xmit_ETHER#2);
[   26.551370]
[   26.551370]  *** DEADLOCK ***

... we use the GFP_NOFS flag with kzalloc()

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 27 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/sdio.h |  2 ++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index b8b3059721ee..68d8e2d1b2ed 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1279,6 +1279,7 @@ static void ath10k_sdio_free_bus_req(struct ath10k *ar,
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 
+	kfree(bus_req->buf);
 	memset(bus_req, 0, sizeof(*bus_req));
 
 	spin_lock_bh(&ar_sdio->lock);
@@ -1294,7 +1295,7 @@ static void __ath10k_sdio_write_async(struct ath10k *ar,
 	int ret;
 
 	skb = req->skb;
-	ret = ath10k_sdio_write(ar, req->address, skb->data, skb->len);
+	ret = ath10k_sdio_write(ar, req->address, req->buf, req->buf_len);
 	if (ret)
 		ath10k_warn(ar, "failed to write skb to 0x%x asynchronously: %d",
 			    req->address, ret);
@@ -1330,6 +1331,7 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 
 static int ath10k_sdio_prep_async_req(struct ath10k *ar, u32 addr,
 				      struct sk_buff *skb,
+				      size_t alloc_len,
 				      struct completion *comp,
 				      bool htc_msg, enum ath10k_htc_ep_id eid)
 {
@@ -1343,9 +1345,17 @@ static int ath10k_sdio_prep_async_req(struct ath10k *ar, u32 addr,
 	if (!bus_req) {
 		ath10k_warn(ar,
 			    "unable to allocate bus request for async request\n");
-		return -ENOMEM;
+		goto err;
 	}
 
+	bus_req->buf_len = alloc_len;
+	bus_req->buf = kzalloc(alloc_len, GFP_NOFS);
+	if (!bus_req->buf) {
+		ath10k_warn(ar,
+			    "unable to allocate data buffer for bus request\n");
+		goto err_free_bus_req;
+	}
+	memcpy(bus_req->buf, skb->data, skb->len);
 	bus_req->skb = skb;
 	bus_req->eid = eid;
 	bus_req->address = addr;
@@ -1357,6 +1367,11 @@ static int ath10k_sdio_prep_async_req(struct ath10k *ar, u32 addr,
 	spin_unlock_bh(&ar_sdio->wr_async_lock);
 
 	return 0;
+
+err_free_bus_req:
+	ath10k_sdio_free_bus_req(ar, bus_req);
+err:
+	return -ENOMEM;
 }
 
 /* IRQ handler */
@@ -1501,12 +1516,11 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 		skb = items[i].transfer_context;
 		padded_len = ath10k_sdio_calc_txrx_padded_len(ar_sdio,
 							      skb->len);
-		skb_trim(skb, padded_len);
 
 		/* Write TX data to the end of the mbox address space */
 		address = ar_sdio->mbox_addr[eid] + ar_sdio->mbox_size[eid] -
-			  skb->len;
-		ret = ath10k_sdio_prep_async_req(ar, address, skb,
+			  padded_len;
+		ret = ath10k_sdio_prep_async_req(ar, address, skb, padded_len,
 						 NULL, true, eid);
 		if (ret)
 			return ret;
@@ -1761,7 +1775,8 @@ static void ath10k_sdio_irq_disable(struct ath10k *ar)
 
 	init_completion(&irqs_disabled_comp);
 	ret = ath10k_sdio_prep_async_req(ar, MBOX_INT_STATUS_ENABLE_ADDRESS,
-					 skb, &irqs_disabled_comp, false, 0);
+					 skb, skb->len, &irqs_disabled_comp,
+					 false, 0);
 	if (ret)
 		goto out;
 
diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index 07e2cc6a3bd8..5a727993fbda 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -105,6 +105,8 @@ struct ath10k_sdio_bus_request {
 	u32 address;
 
 	struct sk_buff *skb;
+	u8 *buf;
+	size_t buf_len;
 	enum ath10k_htc_ep_id eid;
 	int status;
 	/* Specifies if the current request is an HTC message.
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
