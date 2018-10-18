Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDGCV-0000tX-Fm
 for ath10k@lists.infradead.org; Thu, 18 Oct 2018 21:51:29 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][ath10k-next] ath10k: fix some spelling mistakes
Date: Thu, 18 Oct 2018 22:51:04 +0100
Message-Id: <20181018215104.10444-1-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to some spelling mistakes in ath10k_err and ath10k_dbg
messages:
"capablity" -> "capability"
"registed" -> "registered"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 56cb1831dcdf..c876f9057468 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -543,7 +543,7 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
 		goto out;
 
 	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath10k_err(ar, "capablity req rejected: %d\n", resp->resp.error);
+		ath10k_err(ar, "capability req rejected: %d\n", resp->resp.error);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -623,7 +623,7 @@ static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
 		goto out;
 	}
 
-	ath10k_dbg(ar, ATH10K_DBG_QMI, "qmi host capablity request completed\n");
+	ath10k_dbg(ar, ATH10K_DBG_QMI, "qmi host capability request completed\n");
 	return 0;
 
 out:
@@ -657,7 +657,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
 			       wlfw_ind_register_req_msg_v01_ei, &req);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
-		ath10k_err(ar, "failed to send indication registed request: %d\n", ret);
+		ath10k_err(ar, "failed to send indication registered request: %d\n", ret);
 		goto out;
 	}
 
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
