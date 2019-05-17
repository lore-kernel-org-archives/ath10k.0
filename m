Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRZjx-00083d-0B
 for ath10k@lists.infradead.org; Fri, 17 May 2019 10:05:26 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH 1/2] ath10k: move pktlog connect service before htc start
Date: Fri, 17 May 2019 15:35:15 +0530
Message-Id: <1558087516-666-2-git-send-email-aambure@codeaurora.org>
In-Reply-To: <1558087516-666-1-git-send-email-aambure@codeaurora.org>
References: <1558087516-666-1-git-send-email-aambure@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 supports HTC service for pktlog. PKTLOG service should be
connected before HTC start. Hence move connect pktlog service before
HTC start

Fixes: 713358c321f4 ("ath10k: enable pktlog for WCN3990 target")
Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00963-QCAHLSWMTPL-1

Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 805a7f8..e2980fe9 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -893,6 +893,14 @@ int ath10k_htc_start(struct ath10k_htc *htc)
 	int status = 0;
 	struct ath10k_htc_msg *msg;
 
+	if (ath10k_htc_pktlog_svc_supported(ar)) {
+		status = ath10k_htc_pktlog_connect(ar);
+		if (status) {
+			ath10k_err(ar, "failed to connect to pktlog: %d\n", status);
+			return status;
+		}
+	}
+
 	skb = ath10k_htc_build_tx_ctrl_skb(htc->ar);
 	if (!skb)
 		return -ENOMEM;
@@ -919,14 +927,6 @@ int ath10k_htc_start(struct ath10k_htc *htc)
 		return status;
 	}
 
-	if (ath10k_htc_pktlog_svc_supported(ar)) {
-		status = ath10k_htc_pktlog_connect(ar);
-		if (status) {
-			ath10k_err(ar, "failed to connect to pktlog: %d\n", status);
-			return status;
-		}
-	}
-
 	return 0;
 }
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
