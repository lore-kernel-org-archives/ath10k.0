Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7om3-0005vQ-JC
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 19:24:37 +0000
Received: by mail-qk0-x243.google.com with SMTP id x190so34214540qkb.0
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 11:24:15 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 03/11] ath10k: htc: Removal of unused struct members
Date: Fri, 18 Nov 2016 20:22:43 +0100
Message-Id: <1479496971-19174-4-git-send-email-erik.stromdahl@gmail.com>
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

Removed tx_credits_per_max_message and tx_credit_size
from struct ath10k_htc_ep since they are not used
anywhere in the code.

They are just written, never read.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |    6 ------
 drivers/net/wireless/ath/ath10k/htc.h |    2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 957e828..79d44de 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -815,12 +815,6 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 	ep->max_tx_queue_depth = conn_req->max_send_queue_depth;
 	ep->max_ep_message_len = __le16_to_cpu(resp_msg->max_msg_size);
 	ep->tx_credits = tx_alloc;
-	ep->tx_credit_size = htc->target_credit_size;
-	ep->tx_credits_per_max_message = ep->max_ep_message_len /
-					 htc->target_credit_size;
-
-	if (ep->max_ep_message_len % htc->target_credit_size)
-		ep->tx_credits_per_max_message++;
 
 	/* copy all the callbacks */
 	ep->ep_ops = conn_req->ep_ops;
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index b0f9cf3..f94b25a 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -336,8 +336,6 @@ struct ath10k_htc_ep {
 
 	u8 seq_no; /* for debugging */
 	int tx_credits;
-	int tx_credit_size;
-	int tx_credits_per_max_message;
 	bool tx_credit_flow_enabled;
 };
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
