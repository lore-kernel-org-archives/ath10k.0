Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzjUH-00039Z-CZ
 for ath10k@lists.infradead.org; Fri, 01 Mar 2019 14:50:10 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Move board id and fw version logging to info level
Date: Fri,  1 Mar 2019 20:20:00 +0530
Message-Id: <20190301145000.22624-1-govinds@codeaurora.org>
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

Board id and fw version is not printed by default in qmi
cap response message. Move board id and fw version logging
to info level for default logging.

[   34.005399] ath10k_snoc a000000.wifi: qmi chip_id 0x30b chip_family 0x4001 board_id 0xff soc_id 0x40070000
[   34.005432] ath10k_snoc a000000.wifi: qmi fw_version 0x3106836b fw_build_timestamp 2019-02-13 10:24 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.1-00875-QCAHLSWMTPL-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 54f783ceb147..2b086fa16040 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -523,6 +523,7 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
 	struct wlfw_cap_resp_msg_v01 *resp;
 	struct wlfw_cap_req_msg_v01 req = {};
 	struct ath10k *ar = qmi->ar;
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct qmi_txn txn;
 	int ret;
 
@@ -577,13 +578,13 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
 		strlcpy(qmi->fw_build_id, resp->fw_build_id,
 			MAX_BUILD_ID_LEN + 1);
 
-	ath10k_dbg(ar, ATH10K_DBG_QMI,
-		   "qmi chip_id 0x%x chip_family 0x%x board_id 0x%x soc_id 0x%x",
-		   qmi->chip_info.chip_id, qmi->chip_info.chip_family,
-		   qmi->board_info.board_id, qmi->soc_info.soc_id);
-	ath10k_dbg(ar, ATH10K_DBG_QMI,
-		   "qmi fw_version 0x%x fw_build_timestamp %s fw_build_id %s",
-		   qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);
+	if (!test_bit(ATH10K_SNOC_FLAG_REGISTERED, &ar_snoc->flags)) {
+		ath10k_info(ar, "qmi chip_id 0x%x chip_family 0x%x board_id 0x%x soc_id 0x%x",
+			    qmi->chip_info.chip_id, qmi->chip_info.chip_family,
+			    qmi->board_info.board_id, qmi->soc_info.soc_id);
+		ath10k_info(ar, "qmi fw_version 0x%x fw_build_timestamp %s fw_build_id %s",
+			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);
+	}
 
 	kfree(resp);
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
