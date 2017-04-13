Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cya8Y-0007Vm-Gu
 for ath10k@lists.infradead.org; Thu, 13 Apr 2017 08:29:56 +0000
Subject: [PATCH v7 03/10] ath10k: htc: move htc ctrl ep connect to htc_init
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 13 Apr 2017 11:29:24 +0300
Message-ID: <149207216424.4590.8349330640077644797.stgit@potku.adurom.net>
In-Reply-To: <149207201649.4590.5821794186383265138.stgit@potku.adurom.net>
References: <149207201649.4590.5821794186383265138.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Erik Stromdahl <erik.stromdahl@gmail.com>

This patch moves the HTC ctrl service connect from
htc_wait_target to htc_init.

This is done in order to make sure the htc ctrl service
is setup properly before hif_start is called.

The reason for this is that we want the HTC ctrl service
callback to be initialized before the target sends the
HTC ready message.

The ready message will always be transmitted on endpoint 0
(which is always assigned to the HTC control service) so it
makes more sense if HTC control has been connected before the
ready message is received.

Since the service to pipe mapping is done as a part of
the service connect, the get_default_pipe call is redundant
and was removed.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |   39 ++++++++++++++-------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 0a06562c0d32..04e355207a2d 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -590,8 +590,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	struct ath10k *ar = htc->ar;
 	int i, status = 0;
 	unsigned long time_left;
-	struct ath10k_htc_svc_conn_req conn_req;
-	struct ath10k_htc_svc_conn_resp conn_resp;
 	struct ath10k_htc_msg *msg;
 	u16 message_id;
 	u16 credit_count;
@@ -654,22 +652,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 		return -ECOMM;
 	}
 
-	/* setup our pseudo HTC control endpoint connection */
-	memset(&conn_req, 0, sizeof(conn_req));
-	memset(&conn_resp, 0, sizeof(conn_resp));
-	conn_req.ep_ops.ep_tx_complete = ath10k_htc_control_tx_complete;
-	conn_req.ep_ops.ep_rx_complete = ath10k_htc_control_rx_complete;
-	conn_req.max_send_queue_depth = ATH10K_NUM_CONTROL_TX_BUFFERS;
-	conn_req.service_id = ATH10K_HTC_SVC_ID_RSVD_CTRL;
-
-	/* connect fake service */
-	status = ath10k_htc_connect_service(htc, &conn_req, &conn_resp);
-	if (status) {
-		ath10k_err(ar, "could not connect to htc service (%d)\n",
-			   status);
-		return status;
-	}
-
 	return 0;
 }
 
@@ -879,8 +861,10 @@ int ath10k_htc_start(struct ath10k_htc *htc)
 /* registered target arrival callback from the HIF layer */
 int ath10k_htc_init(struct ath10k *ar)
 {
-	struct ath10k_htc_ep *ep = NULL;
+	int status;
 	struct ath10k_htc *htc = &ar->htc;
+	struct ath10k_htc_svc_conn_req conn_req;
+	struct ath10k_htc_svc_conn_resp conn_resp;
 
 	spin_lock_init(&htc->tx_lock);
 
@@ -888,10 +872,21 @@ int ath10k_htc_init(struct ath10k *ar)
 
 	htc->ar = ar;
 
-	/* Get HIF default pipe for HTC message exchange */
-	ep = &htc->endpoint[ATH10K_HTC_EP_0];
+	/* setup our pseudo HTC control endpoint connection */
+	memset(&conn_req, 0, sizeof(conn_req));
+	memset(&conn_resp, 0, sizeof(conn_resp));
+	conn_req.ep_ops.ep_tx_complete = ath10k_htc_control_tx_complete;
+	conn_req.ep_ops.ep_rx_complete = ath10k_htc_control_rx_complete;
+	conn_req.max_send_queue_depth = ATH10K_NUM_CONTROL_TX_BUFFERS;
+	conn_req.service_id = ATH10K_HTC_SVC_ID_RSVD_CTRL;
 
-	ath10k_hif_get_default_pipe(ar, &ep->ul_pipe_id, &ep->dl_pipe_id);
+	/* connect fake service */
+	status = ath10k_htc_connect_service(htc, &conn_req, &conn_resp);
+	if (status) {
+		ath10k_err(ar, "could not connect to htc service (%d)\n",
+			   status);
+		return status;
+	}
 
 	init_completion(&htc->ctl_resp);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
