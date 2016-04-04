Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anDnV-0003i6-Ol
 for ath10k@lists.infradead.org; Mon, 04 Apr 2016 23:20:43 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 2/3] ath10k: update 10.4 WMI vdev parameters
Date: Mon, 4 Apr 2016 16:19:15 -0700
Message-ID: <1459811956-26186-3-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1459811956-26186-1-git-send-email-poh@qca.qualcomm.com>
References: <1459811956-26186-1-git-send-email-poh@qca.qualcomm.com>
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

Update 10.4 WMI vdev param to sync to current 10.4 firmware
as of 2/23/2016.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 8225d90..e10df2e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4957,6 +4957,12 @@ enum wmi_10_4_vdev_param {
 	WMI_10_4_VDEV_PARAM_MERU_VC,
 	WMI_10_4_VDEV_PARAM_RX_DECAP_TYPE,
 	WMI_10_4_VDEV_PARAM_BW_NSS_RATEMASK,
+	WMI_10_4_VDEV_PARAM_SENSOR_AP,
+	WMI_10_4_VDEV_PARAM_BEACON_RATE,
+	WMI_10_4_VDEV_PARAM_DTIM_ENABLE_CTS,
+	WMI_10_4_VDEV_PARAM_STA_KICKOUT,
+	WMI_10_4_VDEV_PARAM_CAPABILITIES,
+	WMI_10_4_VDEV_PARAM_TSF_INCREMENT,
 };
 
 #define WMI_VDEV_PARAM_TXBF_SU_TX_BFEE BIT(0)
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
