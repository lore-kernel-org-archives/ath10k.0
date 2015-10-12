Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zlcg8-00078d-8S
 for ath10k@lists.infradead.org; Mon, 12 Oct 2015 12:58:13 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 1/7] ath10k: export htc tx rx handlers
Date: Mon, 12 Oct 2015 18:27:00 +0530
Message-ID: <1444654626-3290-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Export HTC layer tx and rx handlers. This will be used by HIF layer
for per-CE data processing. Instead of callback mechanism, HIF will
call appropriate upper layers API directly.

Reviewed-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 8 ++++----
 drivers/net/wireless/ath/ath10k/htc.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 32d9ff1..97c24b2 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -181,8 +181,7 @@ err_pull:
 	return ret;
 }
 
-static int ath10k_htc_tx_completion_handler(struct ath10k *ar,
-					    struct sk_buff *skb)
+int ath10k_htc_tx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct ath10k_htc *htc = &ar->htc;
 	struct ath10k_skb_cb *skb_cb;
@@ -199,6 +198,7 @@ static int ath10k_htc_tx_completion_handler(struct ath10k *ar,
 
 	return 0;
 }
+EXPORT_SYMBOL(ath10k_htc_tx_completion_handler);
 
 /***********/
 /* Receive */
@@ -304,8 +304,7 @@ static int ath10k_htc_process_trailer(struct ath10k_htc *htc,
 	return status;
 }
 
-static int ath10k_htc_rx_completion_handler(struct ath10k *ar,
-					    struct sk_buff *skb)
+int ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 {
 	int status = 0;
 	struct ath10k_htc *htc = &ar->htc;
@@ -442,6 +441,7 @@ out:
 
 	return status;
 }
+EXPORT_SYMBOL(ath10k_htc_rx_completion_handler);
 
 static void ath10k_htc_control_rx_complete(struct ath10k *ar,
 					   struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index 527179c..d1fc8e7 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -355,5 +355,7 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 int ath10k_htc_send(struct ath10k_htc *htc, enum ath10k_htc_ep_id eid,
 		    struct sk_buff *packet);
 struct sk_buff *ath10k_htc_alloc_skb(struct ath10k *ar, int size);
+int ath10k_htc_tx_completion_handler(struct ath10k *ar, struct sk_buff *skb);
+int ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb);
 
 #endif
-- 
2.6.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
