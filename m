Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmOg-0002g0-Th
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 14:26:12 +0000
From: Dundi Raviteja <dundi@codeaurora.org>
Subject: [PATCH] ath10k: Fix memory leak in qmi
Date: Tue, 25 Jun 2019 19:55:48 +0530
Message-Id: <1561472748-28467-1-git-send-email-dundi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Dundi Raviteja <dundi@codeaurora.org>

Currently the memory allocated for qmi handle is
not being freed during de-init which leads to memory leak.

Free the allocated qmi memory in qmi deinit
to avoid memory leak.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Fixes: fda6fee0001e ("ath10k: add QMI message handshake for wcn3990 client")
Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 2e67878..dcbf20b 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1003,6 +1003,7 @@ int ath10k_qmi_deinit(struct ath10k *ar)
 	qmi_handle_release(&qmi->qmi_hdl);
 	cancel_work_sync(&qmi->event_work);
 	destroy_workqueue(qmi->event_wq);
+	kfree(qmi);
 	ar_snoc->qmi = NULL;
 
 	return 0;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
