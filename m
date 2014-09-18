Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUbp2-0001z3-AV
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 13:32:33 +0000
Received: by mail-we0-f170.google.com with SMTP id u57so929505wes.1
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 06:32:12 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/9] ath10k: relocate wmi attach/deatch functions
Date: Thu, 18 Sep 2014 15:21:23 +0200
Message-Id: <1411046487-19544-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Init functions should be placed at the end of
files in most cases to avoid forward declarations
for static functions.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 77 +++++++++++++++++------------------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index f99cdef..029a127 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2772,45 +2772,6 @@ static void ath10k_wmi_process_rx(struct ath10k *ar, struct sk_buff *skb)
 	}
 }
 
-/* WMI Initialization functions */
-int ath10k_wmi_attach(struct ath10k *ar)
-{
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
-		if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features))
-			ar->wmi.cmd = &wmi_10_2_cmd_map;
-		else
-			ar->wmi.cmd = &wmi_10x_cmd_map;
-
-		ar->wmi.vdev_param = &wmi_10x_vdev_param_map;
-		ar->wmi.pdev_param = &wmi_10x_pdev_param_map;
-	} else {
-		ar->wmi.cmd = &wmi_cmd_map;
-		ar->wmi.vdev_param = &wmi_vdev_param_map;
-		ar->wmi.pdev_param = &wmi_pdev_param_map;
-	}
-
-	init_completion(&ar->wmi.service_ready);
-	init_completion(&ar->wmi.unified_ready);
-	init_waitqueue_head(&ar->wmi.tx_credits_wq);
-
-	return 0;
-}
-
-void ath10k_wmi_detach(struct ath10k *ar)
-{
-	int i;
-
-	/* free the host memory chunks requested by firmware */
-	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
-		dma_free_coherent(ar->dev,
-				  ar->wmi.mem_chunks[i].len,
-				  ar->wmi.mem_chunks[i].vaddr,
-				  ar->wmi.mem_chunks[i].paddr);
-	}
-
-	ar->wmi.num_mem_chunks = 0;
-}
-
 int ath10k_wmi_connect(struct ath10k *ar)
 {
 	int status;
@@ -4179,3 +4140,41 @@ int ath10k_wmi_dbglog_cfg(struct ath10k *ar, u32 module_enable)
 
 	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->dbglog_cfg_cmdid);
 }
+
+int ath10k_wmi_attach(struct ath10k *ar)
+{
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
+		if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features))
+			ar->wmi.cmd = &wmi_10_2_cmd_map;
+		else
+			ar->wmi.cmd = &wmi_10x_cmd_map;
+
+		ar->wmi.vdev_param = &wmi_10x_vdev_param_map;
+		ar->wmi.pdev_param = &wmi_10x_pdev_param_map;
+	} else {
+		ar->wmi.cmd = &wmi_cmd_map;
+		ar->wmi.vdev_param = &wmi_vdev_param_map;
+		ar->wmi.pdev_param = &wmi_pdev_param_map;
+	}
+
+	init_completion(&ar->wmi.service_ready);
+	init_completion(&ar->wmi.unified_ready);
+	init_waitqueue_head(&ar->wmi.tx_credits_wq);
+
+	return 0;
+}
+
+void ath10k_wmi_detach(struct ath10k *ar)
+{
+	int i;
+
+	/* free the host memory chunks requested by firmware */
+	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
+		dma_free_coherent(ar->dev,
+				  ar->wmi.mem_chunks[i].len,
+				  ar->wmi.mem_chunks[i].vaddr,
+				  ar->wmi.mem_chunks[i].paddr);
+	}
+
+	ar->wmi.num_mem_chunks = 0;
+}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
