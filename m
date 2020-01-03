Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inNFc-0000By-0m
 for ath10k@lists.infradead.org; Fri, 03 Jan 2020 13:44:30 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 2/2] ath10k: Don't call SCM interface for statically mapped
 msa region
Date: Fri,  3 Jan 2020 19:14:14 +0530
Message-Id: <20200103134414.15457-3-govinds@codeaurora.org>
In-Reply-To: <20200103134414.15457-1-govinds@codeaurora.org>
References: <20200103134414.15457-1-govinds@codeaurora.org>
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
To: robh@kernel.org, devicetree@vger.kernel.org, ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

For some targets ex: QCS404, SCM permissions for MSA region is
statically configured in TrustZone fw. Add SCM call disable option
for such targets to avoid duplicate permissions.

Testing: Tested on WCN3990 HW
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 9 +++++++++
 drivers/net/wireless/ath/ath10k/qmi.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 637f83ef65f8..1b91de70c8d6 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -84,6 +84,9 @@ static int ath10k_qmi_setup_msa_permissions(struct ath10k_qmi *qmi)
 	int ret;
 	int i;
 
+	if (qmi->msa_fixed_perm)
+		return 0;
+
 	for (i = 0; i < qmi->nr_mem_region; i++) {
 		ret = ath10k_qmi_map_msa_permission(qmi, &qmi->mem_region[i]);
 		if (ret)
@@ -102,6 +105,9 @@ static void ath10k_qmi_remove_msa_permission(struct ath10k_qmi *qmi)
 {
 	int i;
 
+	if (qmi->msa_fixed_perm)
+		return;
+
 	for (i = 0; i < qmi->nr_mem_region; i++)
 		ath10k_qmi_unmap_msa_permission(qmi, &qmi->mem_region[i]);
 }
@@ -1018,6 +1024,9 @@ static int ath10k_qmi_setup_msa_resources(struct ath10k_qmi *qmi, u32 msa_size)
 		qmi->msa_mem_size = msa_size;
 	}
 
+	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
+		qmi->msa_fixed_perm = true;
+
 	ath10k_dbg(ar, ATH10K_DBG_QMI, "msa pa: %pad , msa va: 0x%p\n",
 		   &qmi->msa_pa,
 		   qmi->msa_va);
diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index 40aafb875ed0..dc257375f161 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -104,6 +104,7 @@ struct ath10k_qmi {
 	bool fw_ready;
 	char fw_build_timestamp[MAX_TIMESTAMP_LEN + 1];
 	struct ath10k_qmi_cal_data cal_data[MAX_NUM_CAL_V01];
+	bool msa_fixed_perm;
 };
 
 int ath10k_qmi_wlan_enable(struct ath10k *ar,
-- 
2.22.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
