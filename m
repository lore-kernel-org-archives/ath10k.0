Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrnTx-0007Xh-1J
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 13:43:11 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 2/3] ath10k: Add new WMI cmd/event defines for 10.4
Date: Thu, 29 Oct 2015 19:11:33 +0530
Message-ID: <1446126094-30880-3-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1446126094-30880-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1446126094-30880-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

No real functionality change, add WMI command/event
defines to be in sync with 10.4 firmware.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 103dd8c..3076581 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1582,6 +1582,9 @@ enum wmi_10_4_cmd_id {
 	WMI_10_4_MU_CAL_START_CMDID,
 	WMI_10_4_SET_CCA_PARAMS_CMDID,
 	WMI_10_4_PDEV_BSS_CHAN_INFO_REQUEST_CMDID,
+	WMI_10_4_EXT_RESOURCE_CFG_CMDID,
+	WMI_10_4_VDEV_SET_IE_CMDID,
+	WMI_10_4_SET_LTEU_CONFIG_CMDID,
 	WMI_10_4_PDEV_UTF_CMDID = WMI_10_4_END_CMDID - 1,
 };
 
@@ -1644,6 +1647,7 @@ enum wmi_10_4_event_id {
 	WMI_10_4_PDEV_TEMPERATURE_EVENTID,
 	WMI_10_4_PDEV_NFCAL_POWER_ALL_CHANNELS_EVENTID,
 	WMI_10_4_PDEV_BSS_CHAN_INFO_EVENTID,
+	WMI_10_4_MU_REPORT_EVENTID,
 	WMI_10_4_PDEV_UTF_EVENTID = WMI_10_4_END_EVENTID - 1,
 };
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
