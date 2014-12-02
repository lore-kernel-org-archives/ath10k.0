Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvlIo-00039P-MX
 for ath10k@lists.infradead.org; Tue, 02 Dec 2014 11:07:31 +0000
Subject: [PATCH v2 1/2] ath10k: add new pdev parameters for fw 10.2
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 2 Dec 2014 13:06:53 +0200
Message-ID: <20141202110653.14817.30464.stgit@potku.adurom.net>
In-Reply-To: <20141202110443.14817.85639.stgit@potku.adurom.net>
References: <20141202110443.14817.85639.stgit@potku.adurom.net>
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

From: Peter Oh <poh@qca.qualcomm.com>

New pdev paramters have been added to firmware 10.2,
hence update wmi interfaces to sync with.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 7d091a74d3f3..4b31da5d3c4c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2793,6 +2793,9 @@ enum wmi_10x_pdev_param {
 	WMI_10X_PDEV_PARAM_SET_MCAST2UCAST_MODE,
 	WMI_10X_PDEV_PARAM_SET_MCAST2UCAST_BUFFER,
 	WMI_10X_PDEV_PARAM_REMOVE_MCAST2UCAST_BUFFER,
+	WMI_10X_PDEV_PARAM_PEER_STA_PS_STATECHG_ENABLE,
+	WMI_10X_PDEV_PARAM_RTS_FIXED_RATE,
+	WMI_10X_PDEV_PARAM_CAL_PERIOD
 };
 
 struct wmi_pdev_set_param_cmd {


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
