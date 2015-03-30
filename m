Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcXfE-00021S-45
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 11:15:29 +0000
Subject: [PATCH] ath10k: fix HTT op backwards compatibility for QCA6174
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 30 Mar 2015 14:14:28 +0300
Message-ID: <20150330111428.22198.36611.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

Commit 8348db298496 ("ath10k: add ATH10K_FW_IE_HTT_OP_VERSION") broke QCA6174
receive side as the HTT ids from ATH10K_FW_HTT_OP_VERSION_MAIN don't have
HTT_TLV_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND set. Fix this by adding a backwards
compatibility code which sets HTT op version if it's not set by the firmare
image.

Fixes: 8348db298496 ("ath10k: add ATH10K_FW_IE_HTT_OP_VERSION")
Reported-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   23 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htt.c  |    2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 1c74585d9256..47f7e7116448 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -998,6 +998,29 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 		return -EINVAL;
 	}
 
+	/* Backwards compatibility for firmwares without
+	 * ATH10K_FW_IE_HTT_OP_VERSION.
+	 */
+	if (ar->htt.op_version == ATH10K_FW_HTT_OP_VERSION_UNSET) {
+		switch (ar->wmi.op_version) {
+		case ATH10K_FW_WMI_OP_VERSION_MAIN:
+			ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_MAIN;
+			break;
+		case ATH10K_FW_WMI_OP_VERSION_10_1:
+		case ATH10K_FW_WMI_OP_VERSION_10_2:
+		case ATH10K_FW_WMI_OP_VERSION_10_2_4:
+			ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_10_1;
+			break;
+		case ATH10K_FW_WMI_OP_VERSION_TLV:
+			ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_TLV;
+			break;
+		case ATH10K_FW_WMI_OP_VERSION_UNSET:
+		case ATH10K_FW_WMI_OP_VERSION_MAX:
+			WARN_ON(1);
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index f782d76c3886..6da6ef26143a 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -156,11 +156,11 @@ int ath10k_htt_init(struct ath10k *ar)
 		ar->htt.t2h_msg_types_max = HTT_TLV_T2H_NUM_MSGS;
 		break;
 	case ATH10K_FW_HTT_OP_VERSION_MAIN:
-	case ATH10K_FW_HTT_OP_VERSION_UNSET:
 		ar->htt.t2h_msg_types = htt_main_t2h_msg_types;
 		ar->htt.t2h_msg_types_max = HTT_MAIN_T2H_NUM_MSGS;
 		break;
 	case ATH10K_FW_HTT_OP_VERSION_MAX:
+	case ATH10K_FW_HTT_OP_VERSION_UNSET:
 		WARN_ON(1);
 		return -EINVAL;
 	}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
