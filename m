Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS9NM-0005cc-Cr
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 21:27:11 +0000
Received: by mail-lf0-x244.google.com with SMTP id v186so7057084lfa.2
 for <ath10k@lists.infradead.org>; Fri, 13 Jan 2017 13:26:47 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v3 3/8] ath10k: htc: move htc ctrl ep connect to htc_init
Date: Fri, 13 Jan 2017 22:26:06 +0100
Message-Id: <1484342771-6160-4-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
References: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
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
---
 drivers/net/wireless/ath/ath10k/htc.c | 39 +++++++++++++++--------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index e72f385..f39eef6 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -584,8 +584,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	struct ath10k *ar = htc->ar;
 	int i, status = 0;
 	unsigned long time_left;
-	struct ath10k_htc_svc_conn_req conn_req;
-	struct ath10k_htc_svc_conn_resp conn_resp;
 	struct ath10k_htc_msg *msg;
 	u16 message_id;
 	u16 credit_count;
@@ -648,22 +646,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
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
 
@@ -873,8 +855,10 @@ int ath10k_htc_start(struct ath10k_htc *htc)
 /* registered target arrival callback from the HIF layer */
 int ath10k_htc_init(struct ath10k *ar)
 {
-	struct ath10k_htc_ep *ep = NULL;
+	int status;
 	struct ath10k_htc *htc = &ar->htc;
+	struct ath10k_htc_svc_conn_req conn_req;
+	struct ath10k_htc_svc_conn_resp conn_resp;
 
 	spin_lock_init(&htc->tx_lock);
 
@@ -882,10 +866,21 @@ int ath10k_htc_init(struct ath10k *ar)
 
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
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
