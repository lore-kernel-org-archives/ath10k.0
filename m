Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTXC-0000LD-Da
 for ath10k@lists.infradead.org; Wed, 03 Jun 2020 13:34:23 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Move msa region map/unmap to init/deinit path
Date: Wed,  3 Jun 2020 19:03:51 +0530
Message-Id: <1591191231-31917-1-git-send-email-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

With kernel qrtr switch from user space qrtr, fw crash is seen
during reboot. During reboot modem rproc shutdown causes wlan qmi
service exit and msa region gets unmapped. Since pdev is not suspended
hw still accessing the msa region and this results in  fw crash as
msa region is unmapped.

Decouple msa mapping from wlan qmi server arrive/exit to init/deinit
path.

Testing is pending with "0c2204a4ad71 net: qrtr: Migrate nameservice
to kernel from userspace", only regression sanity performed with user space
qrtr on QCS404/SC7180.

Fixes: 0c2204a4ad71 net: qrtr: Migrate nameservice to kernel from userspace
Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 5ae829b46c3d..8b1291e28ba2 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -796,22 +796,16 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
 	 */
 	msleep(20);
 
-	ret = ath10k_qmi_setup_msa_permissions(qmi);
-	if (ret)
-		return;
-
 	ret = ath10k_qmi_msa_ready_send_sync_msg(qmi);
 	if (ret)
-		goto err_setup_msa;
+		return;
 
 	ret = ath10k_qmi_cap_send_sync_msg(qmi);
 	if (ret)
-		goto err_setup_msa;
+		return;
 
 	return;
 
-err_setup_msa:
-	ath10k_qmi_remove_msa_permission(qmi);
 }
 
 static int ath10k_qmi_fetch_board_file(struct ath10k_qmi *qmi)
@@ -854,7 +848,6 @@ static void ath10k_qmi_event_server_exit(struct ath10k_qmi *qmi)
 	struct ath10k *ar = qmi->ar;
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
-	ath10k_qmi_remove_msa_permission(qmi);
 	ath10k_core_free_board_files(ar);
 	if (!test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags))
 		ath10k_snoc_fw_crashed_dump(ar);
@@ -1046,6 +1039,10 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	if (ret)
 		goto err_qmi_lookup;
 
+	ret = ath10k_qmi_setup_msa_permissions(qmi);
+	if (ret)
+		goto err_qmi_lookup;
+
 	return 0;
 
 err_qmi_lookup:
@@ -1064,6 +1061,7 @@ int ath10k_qmi_deinit(struct ath10k *ar)
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct ath10k_qmi *qmi = ar_snoc->qmi;
 
+	ath10k_qmi_remove_msa_permission(qmi);
 	qmi_handle_release(&qmi->qmi_hdl);
 	cancel_work_sync(&qmi->event_work);
 	destroy_workqueue(qmi->event_wq);
-- 
2.22.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
