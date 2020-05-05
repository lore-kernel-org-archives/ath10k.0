Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVrqH-0000x1-O2
 for ath10k@lists.infradead.org; Tue, 05 May 2020 07:18:17 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Skip handling del_server during driver exit
Date: Tue,  5 May 2020 12:47:41 +0530
Message-Id: <1588663061-12138-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

The qmi infrastructure sends the client a del_server
event when the client releases its qmi handle. This
is not the msg indicating the actual qmi server exiting.
In such cases the del_server msg should not be processed,
since the wifi firmware does not reset its qmi state.

Hence skip the processing of del_server event when the
driver is unloading.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 13 ++++++++++++-
 drivers/net/wireless/ath/ath10k/qmi.h |  6 ++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 85dce43..7abdef8 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -961,7 +961,16 @@ static void ath10k_qmi_del_server(struct qmi_handle *qmi_hdl,
 		container_of(qmi_hdl, struct ath10k_qmi, qmi_hdl);
 
 	qmi->fw_ready = false;
-	ath10k_qmi_driver_event_post(qmi, ATH10K_QMI_EVENT_SERVER_EXIT, NULL);
+
+	/*
+	 * The del_server event is to be processed only if coming from
+	 * the qmi server. The qmi infrastructure sends del_server, when
+	 * any client releases the qmi handle. In this case do not process
+	 * this del_server event.
+	 */
+	if (qmi->state == ATH10K_QMI_STATE_INIT_DONE)
+		ath10k_qmi_driver_event_post(qmi, ATH10K_QMI_EVENT_SERVER_EXIT,
+					     NULL);
 }
 
 static struct qmi_ops ath10k_qmi_ops = {
@@ -1091,6 +1100,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	if (ret)
 		goto err_qmi_lookup;
 
+	qmi->state = ATH10K_QMI_STATE_INIT_DONE;
 	return 0;
 
 err_qmi_lookup:
@@ -1109,6 +1119,7 @@ int ath10k_qmi_deinit(struct ath10k *ar)
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct ath10k_qmi *qmi = ar_snoc->qmi;
 
+	qmi->state = ATH10K_QMI_STATE_DEINIT;
 	qmi_handle_release(&qmi->qmi_hdl);
 	cancel_work_sync(&qmi->event_work);
 	destroy_workqueue(qmi->event_wq);
diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index dc25737..b597205 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -83,6 +83,11 @@ struct ath10k_qmi_driver_event {
 	void *data;
 };
 
+enum ath10k_qmi_state {
+	ATH10K_QMI_STATE_INIT_DONE,
+	ATH10K_QMI_STATE_DEINIT,
+};
+
 struct ath10k_qmi {
 	struct ath10k *ar;
 	struct qmi_handle qmi_hdl;
@@ -105,6 +110,7 @@ struct ath10k_qmi {
 	char fw_build_timestamp[MAX_TIMESTAMP_LEN + 1];
 	struct ath10k_qmi_cal_data cal_data[MAX_NUM_CAL_V01];
 	bool msa_fixed_perm;
+	enum ath10k_qmi_state state;
 };
 
 int ath10k_qmi_wlan_enable(struct ath10k *ar,
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
