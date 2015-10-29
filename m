Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrnUK-0007mR-Qp
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 13:43:33 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 3/3] ath10k: Add new pdev params defines to 10.4
Date: Thu, 29 Oct 2015 19:11:34 +0530
Message-ID: <1446126094-30880-4-git-send-email-vthiagar@qti.qualcomm.com>
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

No functionality change, just sync to the latest
pdev params that 10.4 firmware defines.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 3076581..a9073b0 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3660,6 +3660,12 @@ enum wmi_10_4_pdev_param {
 	WMI_10_4_PDEV_PARAM_WAPI_MBSSID_OFFSET,
 	WMI_10_4_PDEV_PARAM_ARP_SRCADDR,
 	WMI_10_4_PDEV_PARAM_ARP_DSTADDR,
+	WMI_10_4_PDEV_PARAM_TXPOWER_DECR_DB,
+	WMI_10_4_PDEV_PARAM_RX_BATCHMODE,
+	WMI_10_4_PDEV_PARAM_PACKET_AGGR_DELAY,
+	WMI_10_4_PDEV_PARAM_ATF_OBSS_NOISE_SCH,
+	WMI_10_4_PDEV_PARAM_ATF_OBSS_NOISE_SCALING_FACTOR,
+	WMI_10_4_PDEV_PARAM_CUST_TXPOWER_SCALE,
 };
 
 struct wmi_pdev_set_param_cmd {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
