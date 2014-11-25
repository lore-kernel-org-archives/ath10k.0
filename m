Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtMKL-0000O9-QY
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 20:03:10 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 1/2] ath10k: add new pdev parameters for fw 10.2
Date: Tue, 25 Nov 2014 12:02:44 -0800
Message-ID: <1416945765-26902-1-git-send-email-poh@qca.qualcomm.com>
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

New pdev paramters have been added to firmware 10.2,
hence update wmi interfaces to sync with.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index a38d788..8fa0192 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2707,6 +2707,9 @@ enum wmi_10x_pdev_param {
 	WMI_10X_PDEV_PARAM_SET_MCAST2UCAST_MODE,
 	WMI_10X_PDEV_PARAM_SET_MCAST2UCAST_BUFFER,
 	WMI_10X_PDEV_PARAM_REMOVE_MCAST2UCAST_BUFFER,
+	WMI_10X_PDEV_PEER_STA_PS_STATECHG_ENABLE,
+	WMI_10X_PDEV_PARAM_RTS_FIXED_RATE,
+	WMI_10X_PDEV_PARAM_CAL_PERIOD
 };
 
 struct wmi_pdev_set_param_cmd {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
