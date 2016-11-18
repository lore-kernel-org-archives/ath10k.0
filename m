Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7om1-0005vf-Ll
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 19:24:36 +0000
Received: by mail-qk0-x241.google.com with SMTP id h201so34193793qke.3
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 11:24:16 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 05/11] ath10k: htc: refactorization
Date: Fri, 18 Nov 2016 20:22:45 +0100
Message-Id: <1479496971-19174-6-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
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

Code refactorization:

Moved the code for ep 0 in ath10k_htc_rx_completion_handler
to ath10k_htc_control_rx_complete.

This eases the implementation of SDIO/mbox significantly since
the ep_rx_complete cb is invoked directly from the SDIO/mbox
hif layer.

Since the ath10k_htc_control_rx_complete already is present
(only containing a warning message) there is no reason for not
using it (instead of having a special case for ep 0 in
ath10k_htc_rx_completion_handler).

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |   73 +++++++++++++++------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 6ff5837..f4ffeef 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -457,42 +457,6 @@ void ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 		/* zero length packet with trailer data, just drop these */
 		goto out;
 
-	if (eid == ATH10K_HTC_EP_0) {
-		struct ath10k_htc_msg *msg = (struct ath10k_htc_msg *)skb->data;
-
-		switch (__le16_to_cpu(msg->hdr.message_id)) {
-		case ATH10K_HTC_MSG_READY_ID:
-		case ATH10K_HTC_MSG_CONNECT_SERVICE_RESP_ID:
-			/* handle HTC control message */
-			if (completion_done(&htc->ctl_resp)) {
-				/*
-				 * this is a fatal error, target should not be
-				 * sending unsolicited messages on the ep 0
-				 */
-				ath10k_warn(ar, "HTC rx ctrl still processing\n");
-				complete(&htc->ctl_resp);
-				goto out;
-			}
-
-			htc->control_resp_len =
-				min_t(int, skb->len,
-				      ATH10K_HTC_MAX_CTRL_MSG_LEN);
-
-			memcpy(htc->control_resp_buffer, skb->data,
-			       htc->control_resp_len);
-
-			complete(&htc->ctl_resp);
-			break;
-		case ATH10K_HTC_MSG_SEND_SUSPEND_COMPLETE:
-			htc->htc_ops.target_send_suspend_complete(ar);
-			break;
-		default:
-			ath10k_warn(ar, "ignoring unsolicited htc ep0 event\n");
-			break;
-		}
-		goto out;
-	}
-
 	ath10k_dbg(ar, ATH10K_DBG_HTC, "htc rx completion ep %d skb %pK\n",
 		   eid, skb);
 	ep->ep_ops.ep_rx_complete(ar, skb);
@@ -507,9 +471,40 @@ void ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 static void ath10k_htc_control_rx_complete(struct ath10k *ar,
 					   struct sk_buff *skb)
 {
-	/* This is unexpected. FW is not supposed to send regular rx on this
-	 * endpoint. */
-	ath10k_warn(ar, "unexpected htc rx\n");
+	struct ath10k_htc *htc = &ar->htc;
+	struct ath10k_htc_msg *msg = (struct ath10k_htc_msg *)skb->data;
+
+	switch (__le16_to_cpu(msg->hdr.message_id)) {
+	case ATH10K_HTC_MSG_READY_ID:
+	case ATH10K_HTC_MSG_CONNECT_SERVICE_RESP_ID:
+		/* handle HTC control message */
+		if (completion_done(&htc->ctl_resp)) {
+			/* this is a fatal error, target should not be
+			 * sending unsolicited messages on the ep 0
+			 */
+			ath10k_warn(ar, "HTC rx ctrl still processing\n");
+			complete(&htc->ctl_resp);
+			goto out;
+		}
+
+		htc->control_resp_len =
+			min_t(int, skb->len,
+			      ATH10K_HTC_MAX_CTRL_MSG_LEN);
+
+		memcpy(htc->control_resp_buffer, skb->data,
+		       htc->control_resp_len);
+
+		complete(&htc->ctl_resp);
+		break;
+	case ATH10K_HTC_MSG_SEND_SUSPEND_COMPLETE:
+		htc->htc_ops.target_send_suspend_complete(ar);
+		break;
+	default:
+		ath10k_warn(ar, "ignoring unsolicited htc ep0 event\n");
+		break;
+	}
+
+out:
 	kfree_skb(skb);
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
