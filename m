Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6KEX-0000Rc-Iy
 for ath10k@lists.infradead.org; Mon, 14 Nov 2016 16:35:52 +0000
Received: by mail-lf0-x242.google.com with SMTP id o141so7513455lff.1
 for <ath10k@lists.infradead.org>; Mon, 14 Nov 2016 08:35:29 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC 03/12] ath10k: htc: Changed order of wait target and ep connect
Date: Mon, 14 Nov 2016 17:33:33 +0100
Message-Id: <1479141222-8493-4-git-send-email-erik.stromdahl@gmail.com>
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

This patch changes the order in which the driver waits for the
target to become ready and the service connect of the HTC
control service.

The HTC control service is connected before the driver starts
waiting for the HTC ready control message.

The reason for this is that the HTC ready control message is
transmitted on EP 0 and that sdio/mbox based systems will ignore
messages received on unconnected endpoints.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |   32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index e3f7bf4..7257366 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -606,6 +606,22 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	u16 credit_count;
 	u16 credit_size;
 
+	/* setup our pseudo HTC control endpoint connection */
+	memset(&conn_req, 0, sizeof(conn_req));
+	memset(&conn_resp, 0, sizeof(conn_resp));
+	conn_req.ep_ops.ep_tx_complete = ath10k_htc_control_tx_complete;
+	conn_req.ep_ops.ep_rx_complete = ath10k_htc_control_rx_complete;
+	conn_req.max_send_queue_depth = ATH10K_NUM_CONTROL_TX_BUFFERS;
+	conn_req.service_id = ATH10K_HTC_SVC_ID_RSVD_CTRL;
+
+	/* connect fake service */
+	status = ath10k_htc_connect_service(htc, &conn_req, &conn_resp);
+	if (status) {
+		ath10k_err(ar, "could not connect to htc service (%d)\n",
+			   status);
+		return status;
+	}
+
 	time_left = wait_for_completion_timeout(&htc->ctl_resp,
 						ATH10K_HTC_WAIT_TIMEOUT_HZ);
 	if (!time_left) {
@@ -665,22 +681,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 
 	ath10k_htc_setup_target_buffer_assignments(htc);
 
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
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
