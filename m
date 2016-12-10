Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFhGC-0002uK-9f
 for ath10k@lists.infradead.org; Sat, 10 Dec 2016 13:00:17 +0000
Received: by mail-lf0-x242.google.com with SMTP id y21so2226491lfa.0
 for <ath10k@lists.infradead.org>; Sat, 10 Dec 2016 04:59:57 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 2/2] ath10k: htc: Simplified credit distribution.
Date: Sat, 10 Dec 2016 13:58:41 +0100
Message-Id: <1481374721-16354-2-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1481374721-16354-1-git-send-email-erik.stromdahl@gmail.com>
References: <1481374721-16354-1-git-send-email-erik.stromdahl@gmail.com>
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

Simplified transmit credit distribution code somewhat.
Since the WMI control service will get assigned all credits
there is no need for having a credit_allocation array in
struct ath10k_htc.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |   29 +++++------------------------
 drivers/net/wireless/ath/ath10k/htc.h |    1 -
 2 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index f2e0659..9f6a915 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -474,33 +474,16 @@ static void ath10k_htc_reset_endpoint_states(struct ath10k_htc *htc)
 	}
 }
 
-static void ath10k_htc_setup_target_buffer_assignments(struct ath10k_htc *htc)
-{
-	struct ath10k_htc_svc_tx_credits *entry;
-
-	entry = &htc->service_tx_alloc[0];
-
-	/*
-	 * for PCIE allocate all credists/HTC buffers to WMI.
-	 * no buffers are used/required for data. data always
-	 * remains on host.
-	 */
-	entry++;
-	entry->service_id = ATH10K_HTC_SVC_ID_WMI_CONTROL;
-	entry->credit_allocation = htc->total_transmit_credits;
-}
-
 static u8 ath10k_htc_get_credit_allocation(struct ath10k_htc *htc,
 					   u16 service_id)
 {
 	u8 allocation = 0;
-	int i;
 
-	for (i = 0; i < ATH10K_HTC_EP_COUNT; i++) {
-		if (htc->service_tx_alloc[i].service_id == service_id)
-			allocation =
-			    htc->service_tx_alloc[i].credit_allocation;
-	}
+	/* The WMI control service is the only service with flow control.
+	 * Let it have all transmit credits.
+	 */
+	if (service_id == ATH10K_HTC_SVC_ID_WMI_CONTROL)
+		allocation = htc->total_transmit_credits;
 
 	return allocation;
 }
@@ -574,8 +557,6 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 		return -ECOMM;
 	}
 
-	ath10k_htc_setup_target_buffer_assignments(htc);
-
 	/* setup our pseudo HTC control endpoint connection */
 	memset(&conn_req, 0, sizeof(conn_req));
 	memset(&conn_resp, 0, sizeof(conn_resp));
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index ca150c9..6ababa3 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -337,7 +337,6 @@ struct ath10k_htc {
 	struct completion ctl_resp;
 
 	int total_transmit_credits;
-	struct ath10k_htc_svc_tx_credits service_tx_alloc[ATH10K_HTC_EP_COUNT];
 	int target_credit_size;
 };
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
