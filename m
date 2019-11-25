Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZE7x-0008Qe-4O
 for ath10k@lists.infradead.org; Mon, 25 Nov 2019 13:10:06 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: move non-fatal warn logs to dbg level
Date: Mon, 25 Nov 2019 13:10:00 +0000
Message-ID: <0101016ea2aee33d-d5d92d04-d737-42be-8e94-c964dec2fc8f-000000@us-west-2.amazonses.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

During driver load below warn logs are printed in the console if
firmware doesn't support some optional HTC services, ex:pktlog.
It is likely some older fw version may not support PKTLOG HTC
service as legacy fw uses HTC DATA service  for pktlog.
Move this log to debug level to remove un-necessary warn message
on console.

htc.c:803:  ath10k_warn(ar, "unsupported HTC service id: %d\n",
htc.c:881:  ath10k_warn(ar, "unsupported HTC service id: %d\n",

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 28daed5981a1..367b762632d1 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -809,8 +809,8 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 						&ep->ul_pipe_id,
 						&ep->dl_pipe_id);
 	if (status) {
-		ath10k_warn(ar, "unsupported HTC service id: %d\n",
-			    ep->service_id);
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "unsupported HTC service id: %d\n",
+			   ep->service_id);
 		return status;
 	}
 
@@ -887,8 +887,8 @@ static bool ath10k_htc_pktlog_svc_supported(struct ath10k *ar)
 						&ul_pipe_id,
 						&dl_pipe_id);
 	if (status) {
-		ath10k_warn(ar, "unsupported HTC service id: %d\n",
-			    ATH10K_HTC_SVC_ID_HTT_LOG_MSG);
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "unsupported HTC pktlog service id: %d\n",
+			   ATH10K_HTC_SVC_ID_HTT_LOG_MSG);
 
 		return false;
 	}
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
