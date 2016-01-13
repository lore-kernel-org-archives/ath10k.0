Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJNfE-0003Hi-Ai
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 15:48:49 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 6/7] ath10k: Enable periodic peer stats update
Date: Wed, 13 Jan 2016 21:16:33 +0530
Message-ID: <1452699994-5078-7-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Register for 500ms as periodic peer stats update period,
and parameters like rx_duration that needs to be tracked
in host can be achieved by this provision, also periodic
stats update is the future of fw_stats and shall be extended
for pdev / vdev stats irrespecitive PEER_STATS service is enabled
or not

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2dba57c..fd4b4df 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4103,6 +4103,18 @@ static int ath10k_start(struct ieee80211_hw *hw)
 
 	ar->ani_enabled = true;
 
+	if (test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map)) {
+		param = ar->wmi.pdev_param->peer_stats_update_period;
+		ret = ath10k_wmi_pdev_set_param(ar, param,
+					PEER_DEFAULT_STATS_UPDATE_PERIOD);
+		if (ret) {
+			ath10k_warn(ar,
+				    "failed to set peer stats period : %d\n",
+				    ret);
+			goto err_core_stop;
+		}
+	}
+
 	ar->num_started_vdevs = 0;
 	ath10k_regd_update(ar);
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
