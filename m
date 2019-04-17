Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGq1q-0007FW-Gv
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 19:15:32 +0000
Received: by mail-lf1-x144.google.com with SMTP id w23so19690963lfc.9
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 12:15:30 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH v2 3/5] ath10k: sdio: read RX packets in bundles
Date: Wed, 17 Apr 2019 21:15:01 +0200
Message-Id: <20190417191503.18814-4-erik.stromdahl@gmail.com>
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
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, Alagu Sankar <alagusankar@silex-india.com>

From: Alagu Sankar <alagusankar@silex-india.com>

The existing implementation of initiating multiple sdio transfers for
receive bundling is slowing down the receive speed.

Instead of having one sdio transfer for each packet in the bundle, we
read all packets in one sdio transfer.

This results in significant performance improvement on some targets.

On an imx6dl together with a QCA9377 SDIO device, the following
performance increase was obtained with iperf:

Before:

[  3]  0.0- 1.0 sec  3.38 MBytes  28.3 Mbits/sec

After:

[  3]  0.0- 1.0 sec  7.12 MBytes  59.8 Mbits/sec

Co-developed-by: Erik Stromdahl <erik.stromdahl@gmail.com>
Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 71 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/sdio.h |  2 +
 2 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index d5073fac9509..b89732aad97c 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -24,6 +24,8 @@
 #include "trace.h"
 #include "sdio.h"
 
+#define ATH10K_SDIO_READ_BUF_SIZE	(32 * 1024)
+
 /* inlined helper functions */
 
 static inline int ath10k_sdio_calc_txrx_padded_len(struct ath10k_sdio *ar_sdio,
@@ -618,41 +620,73 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 	return ret;
 }
 
-static int ath10k_sdio_mbox_rx_packet(struct ath10k *ar,
-				      struct ath10k_sdio_rx_data *pkt)
+static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_rx_data *pkt = &ar_sdio->rx_pkts[0];
 	struct sk_buff *skb = pkt->skb;
 	int ret;
 
-	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
-				 skb->data, pkt->alloc_len);
+	ret = ath10k_sdio_read(ar, ar_sdio->mbox_info.htc_addr,
+			       skb->data, pkt->alloc_len);
+	if (ret) {
+		ath10k_warn(ar, "sdio_read error %d\n", ret);
+		goto err;
+	}
+
 	pkt->status = ret;
-	if (!ret)
-		skb_put(skb, pkt->act_len);
+	skb_put(skb, pkt->act_len);
 
+	return 0;
+
+err:
+	ar_sdio->n_rx_pkts = 0;
+	ath10k_sdio_mbox_free_rx_pkt(pkt);
 	return ret;
 }
 
-static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
+static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_rx_data *pkt;
 	int ret, i;
+	u32 pkt_offset = 0, pkt_bundle_len = 0;
+
+	for (i = 0; i < ar_sdio->n_rx_pkts; i++)
+		pkt_bundle_len += ar_sdio->rx_pkts[i].alloc_len;
+
+	if (pkt_bundle_len > ATH10K_SDIO_READ_BUF_SIZE) {
+		ret = -ENOSPC;
+		ath10k_warn(ar, "bundle size (%d) exceeding limit %d\n",
+			    pkt_bundle_len, ATH10K_SDIO_READ_BUF_SIZE);
+		goto err;
+	}
+
+	ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
+				 ar_sdio->sdio_read_buf, pkt_bundle_len);
+	if (ret)
+		goto err;
 
 	for (i = 0; i < ar_sdio->n_rx_pkts; i++) {
-		ret = ath10k_sdio_mbox_rx_packet(ar,
-						 &ar_sdio->rx_pkts[i]);
-		if (ret)
-			goto err;
+		struct sk_buff *skb = ar_sdio->rx_pkts[i].skb;
+
+		pkt = &ar_sdio->rx_pkts[i];
+		skb_put(skb, pkt->act_len);
+		memcpy(skb->data, ar_sdio->sdio_read_buf + pkt_offset,
+		       pkt->alloc_len);
+		pkt->status = 0;
+		pkt_offset += pkt->alloc_len;
 	}
 
 	return 0;
 
 err:
 	/* Free all packets that was not successfully fetched. */
-	for (; i < ar_sdio->n_rx_pkts; i++)
+	for (i = 0; i < ar_sdio->n_rx_pkts; i++)
 		ath10k_sdio_mbox_free_rx_pkt(&ar_sdio->rx_pkts[i]);
 
+	ar_sdio->n_rx_pkts = 0;
+
 	return ret;
 }
 
@@ -695,7 +729,10 @@ static int ath10k_sdio_mbox_rxmsg_pending_handler(struct ath10k *ar,
 			 */
 			*done = false;
 
-		ret = ath10k_sdio_mbox_rx_fetch(ar);
+		if (ar_sdio->n_rx_pkts > 1)
+			ret = ath10k_sdio_mbox_rx_fetch_bundle(ar);
+		else
+			ret = ath10k_sdio_mbox_rx_fetch(ar);
 
 		/* Process fetched packets. This will potentially update
 		 * n_lookaheads depending on if the packets contain lookahead
@@ -2001,6 +2038,14 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		goto err_core_destroy;
 	}
 
+	ar_sdio->sdio_read_buf = devm_kzalloc(ar->dev,
+					      ATH10K_SDIO_READ_BUF_SIZE,
+					      GFP_KERNEL);
+	if (!ar_sdio->sdio_read_buf) {
+		ret = -ENOMEM;
+		goto err_core_destroy;
+	}
+
 	ar_sdio->func = func;
 	sdio_set_drvdata(func, ar_sdio);
 
diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index b8c7ac0330bd..07e2cc6a3bd8 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -196,6 +196,8 @@ struct ath10k_sdio {
 	struct ath10k *ar;
 	struct ath10k_sdio_irq_data irq_data;
 
+	u8 *sdio_read_buf;
+
 	/* temporary buffer for BMI requests */
 	u8 *bmi_buf;
 
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
