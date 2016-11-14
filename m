Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6KEV-0000RK-Q6
 for ath10k@lists.infradead.org; Mon, 14 Nov 2016 16:35:50 +0000
Received: by mail-lf0-x243.google.com with SMTP id o20so7510247lfg.3
 for <ath10k@lists.infradead.org>; Mon, 14 Nov 2016 08:35:27 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC 01/12] ath10k: htc: made static function public
Date: Mon, 14 Nov 2016 17:33:31 +0100
Message-Id: <1479141222-8493-2-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Changed ath10k_htc_notify_tx_completion and
ath10k_htc_process_trailer from static to non static.

These functions are needed by SDIO/mbox.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |   14 ++++++++------
 drivers/net/wireless/ath/ath10k/htc.h |    6 ++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 175aae3..26b1e15 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -57,8 +57,8 @@ static inline void ath10k_htc_restore_tx_skb(struct ath10k_htc *htc,
 	skb_pull(skb, sizeof(struct ath10k_htc_hdr));
 }
 
-static void ath10k_htc_notify_tx_completion(struct ath10k_htc_ep *ep,
-					    struct sk_buff *skb)
+void ath10k_htc_notify_tx_completion(struct ath10k_htc_ep *ep,
+				     struct sk_buff *skb)
 {
 	struct ath10k *ar = ep->htc->ar;
 
@@ -75,6 +75,7 @@ static void ath10k_htc_notify_tx_completion(struct ath10k_htc_ep *ep,
 
 	ep->ep_ops.ep_tx_complete(ep->htc->ar, skb);
 }
+EXPORT_SYMBOL(ath10k_htc_notify_tx_completion);
 
 static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 				      struct sk_buff *skb)
@@ -227,10 +228,10 @@ void ath10k_htc_tx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 	spin_unlock_bh(&htc->tx_lock);
 }
 
-static int ath10k_htc_process_trailer(struct ath10k_htc *htc,
-				      u8 *buffer,
-				      int length,
-				      enum ath10k_htc_ep_id src_eid)
+int ath10k_htc_process_trailer(struct ath10k_htc *htc,
+			       u8 *buffer,
+			       int length,
+			       enum ath10k_htc_ep_id src_eid)
 {
 	struct ath10k *ar = htc->ar;
 	int status = 0;
@@ -291,6 +292,7 @@ static int ath10k_htc_process_trailer(struct ath10k_htc *htc,
 
 	return status;
 }
+EXPORT_SYMBOL(ath10k_htc_process_trailer);
 
 void ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index 0c55cd9..858e19f 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -354,5 +354,11 @@ int ath10k_htc_send(struct ath10k_htc *htc, enum ath10k_htc_ep_id eid,
 struct sk_buff *ath10k_htc_alloc_skb(struct ath10k *ar, int size);
 void ath10k_htc_tx_completion_handler(struct ath10k *ar, struct sk_buff *skb);
 void ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb);
+void ath10k_htc_notify_tx_completion(struct ath10k_htc_ep *ep,
+				     struct sk_buff *skb);
+int ath10k_htc_process_trailer(struct ath10k_htc *htc,
+			       u8 *buffer,
+			       int length,
+			       enum ath10k_htc_ep_id src_eid);
 
 #endif
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
