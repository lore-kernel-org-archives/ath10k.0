Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsn02-0003Ea-Qo
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 11:42:32 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: revalidate the msa region coming from firmware
Date: Wed, 31 Jul 2019 17:12:20 +0530
Message-Id: <20190731114220.22830-1-govinds@codeaurora.org>
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

driver sends QMI_WLFW_MSA_INFO_REQ_V01 QMI request to firmware
and in response expects range of addresses and size to be mapped.
Add condition to check whether addresses in response falls
under valid range otherwise return failure.

Testing: Tested on WCN3990 HW
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 2e678780df5d..3457509a003f 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -111,6 +111,7 @@ static int ath10k_qmi_msa_mem_info_send_sync_msg(struct ath10k_qmi *qmi)
 	struct wlfw_msa_info_resp_msg_v01 resp = {};
 	struct wlfw_msa_info_req_msg_v01 req = {};
 	struct ath10k *ar = qmi->ar;
+	phys_addr_t max_mapped_addr;
 	struct qmi_txn txn;
 	int ret;
 	int i;
@@ -150,8 +151,20 @@ static int ath10k_qmi_msa_mem_info_send_sync_msg(struct ath10k_qmi *qmi)
 		goto out;
 	}
 
+	max_mapped_addr = qmi->msa_pa + qmi->msa_mem_size;
 	qmi->nr_mem_region = resp.mem_region_info_len;
 	for (i = 0; i < resp.mem_region_info_len; i++) {
+		if (resp.mem_region_info[i].size > qmi->msa_mem_size ||
+		    resp.mem_region_info[i].region_addr > max_mapped_addr ||
+		    resp.mem_region_info[i].region_addr < qmi->msa_pa ||
+		    resp.mem_region_info[i].size +
+		    resp.mem_region_info[i].region_addr > max_mapped_addr) {
+			ath10k_err(ar, "received out of range memory region address 0x%llx with size 0x%x, aborting\n",
+				   resp.mem_region_info[i].region_addr,
+				   resp.mem_region_info[i].size);
+			ret = -EINVAL;
+			goto fail_unwind;
+		}
 		qmi->mem_region[i].addr = resp.mem_region_info[i].region_addr;
 		qmi->mem_region[i].size = resp.mem_region_info[i].size;
 		qmi->mem_region[i].secure = resp.mem_region_info[i].secure_flag;
@@ -165,6 +178,8 @@ static int ath10k_qmi_msa_mem_info_send_sync_msg(struct ath10k_qmi *qmi)
 	ath10k_dbg(ar, ATH10K_DBG_QMI, "qmi msa mem info request completed\n");
 	return 0;
 
+fail_unwind:
+	memset(&qmi->mem_region[0], 0, sizeof(qmi->mem_region[0]) * i);
 out:
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
