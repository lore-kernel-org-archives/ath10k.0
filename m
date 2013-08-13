Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97eG-0006KB-Tf
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 06:00:05 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/4] ath10k: fix HTT service setup
Date: Tue, 13 Aug 2013 07:59:35 +0200
Message-ID: <1376373578-2180-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1376373578-2180-1-git-send-email-michal.kazior@tieto.com>
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1376373578-2180-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The "disable credit flow" flag was set too late
and it never was in the HTC service request
message.

This patch prevents firmware from reporting
(useless) HTC credits for HTT service. HTT service
doesn't use nor need credits.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index ef3329e..7d445d3 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -772,16 +772,16 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 
 	flags |= SM(tx_alloc, ATH10K_HTC_CONN_FLAGS_RECV_ALLOC);
 
-	req_msg = &msg->connect_service;
-	req_msg->flags = __cpu_to_le16(flags);
-	req_msg->service_id = __cpu_to_le16(conn_req->service_id);
-
 	/* Only enable credit flow control for WMI ctrl service */
 	if (conn_req->service_id != ATH10K_HTC_SVC_ID_WMI_CONTROL) {
 		flags |= ATH10K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL;
 		disable_credit_flow_ctrl = true;
 	}
 
+	req_msg = &msg->connect_service;
+	req_msg->flags = __cpu_to_le16(flags);
+	req_msg->service_id = __cpu_to_le16(conn_req->service_id);
+
 	INIT_COMPLETION(htc->ctl_resp);
 
 	status = ath10k_htc_send(htc, ATH10K_HTC_EP_0, skb);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
