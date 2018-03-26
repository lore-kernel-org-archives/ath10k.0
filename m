Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0Krg-0004j4-Mn
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 05:40:18 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 05/12] ath10k: Add support of QMI indication message
Date: Mon, 26 Mar 2018 11:10:00 +0530
Message-Id: <1522042800-25877-1-git-send-email-govinds@codeaurora.org>
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
To: ath10k@lists.infradead.org, bjorn.andersson@linaro.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add support of indication qmi message to communicate
with wlan qmi server. Indication message request
describes client capability and in response client
gets the state of wlan qmi service.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 71 ++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 3a7fcc6..bc80b8f 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -29,8 +29,76 @@
 #include "qmi.h"
 #include "qmi_svc_v01.h"
 
+#define WLFW_CLIENT_ID			0x4b4e454c
+#define WLFW_TIMEOUT			500
+
 static struct ath10k_qmi *qmi;
 
+static int
+ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
+{
+	struct wlfw_ind_register_resp_msg_v01 *resp;
+	struct wlfw_ind_register_req_msg_v01 *req;
+	struct qmi_txn txn;
+	int ret;
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
+	if (!resp) {
+		kfree(req);
+		return -ENOMEM;
+	}
+
+	req->client_id_valid = 1;
+	req->client_id = WLFW_CLIENT_ID;
+	req->fw_ready_enable_valid = 1;
+	req->fw_ready_enable = 1;
+	req->msa_ready_enable_valid = 1;
+	req->msa_ready_enable = 1;
+
+	ret = qmi_txn_init(&qmi->qmi_hdl, &txn,
+			   wlfw_ind_register_resp_msg_v01_ei, resp);
+	if (ret < 0) {
+		pr_err("fail to init txn for ind register resp %d\n",
+		       ret);
+		goto out;
+	}
+
+	ret = qmi_send_request(&qmi->qmi_hdl, NULL, &txn,
+			       QMI_WLFW_IND_REGISTER_REQ_V01,
+			       WLFW_IND_REGISTER_REQ_MSG_V01_MAX_MSG_LEN,
+			       wlfw_ind_register_req_msg_v01_ei, req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		pr_err("fail to send ind register req %d\n", ret);
+		goto out;
+	}
+
+	ret = qmi_txn_wait(&txn, WLFW_TIMEOUT * HZ);
+	if (ret < 0)
+		goto out;
+
+	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
+		pr_err("qmi indication register request rejected:");
+		pr_err("resut:%d error:%d\n",
+		       resp->resp.result, resp->resp.error);
+		ret = resp->resp.result;
+	}
+
+	pr_debug("indication register request completed\n");
+	kfree(resp);
+	kfree(req);
+	return 0;
+
+out:
+	kfree(resp);
+	kfree(req);
+	return ret;
+}
+
 static int ath10k_qmi_event_fw_ready_ind(struct ath10k_qmi *qmi)
 {
 	pr_debug("fw ready event received\n");
@@ -100,11 +168,12 @@ static void ath10k_qmi_event_server_arrive(struct work_struct *work)
 					      work_svc_arrive);
 	int ret;
 
+	pr_debug("wlan qmi server arrive\n");
 	ret = ath10k_qmi_connect_to_fw_server(qmi);
 	if (ret)
 		return;
 
-	pr_debug("qmi server arrive\n");
+	ath10k_qmi_ind_register_send_sync_msg(qmi);
 }
 
 static void ath10k_qmi_event_server_exit(struct work_struct *work)
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
