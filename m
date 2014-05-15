Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x233.google.com ([2a00:1450:4013:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkrM4-0002sp-Px
 for ath10k@lists.infradead.org; Thu, 15 May 2014 08:49:33 +0000
Received: by mail-ee0-f51.google.com with SMTP id e51so404253eek.38
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 01:49:09 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/5] ath10k: clean up start() callback
Date: Thu, 15 May 2014 10:42:00 +0200
Message-Id: <1400143324-14911-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This fixes failpath when override AC pdev param
setup fails and makes other pdev params setting
fail as well.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * add empty lines before each goto label [Kalle]
 * dont use err goto paths on main code path [Kalle]

 drivers/net/wireless/ath/ath10k/mac.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7026f02..854e183 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2339,22 +2339,19 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	if (ar->state != ATH10K_STATE_OFF &&
 	    ar->state != ATH10K_STATE_RESTARTING) {
 		ret = -EINVAL;
-		goto exit;
+		goto err;
 	}
 
 	ret = ath10k_hif_power_up(ar);
 	if (ret) {
 		ath10k_err("Could not init hif: %d\n", ret);
-		ar->state = ATH10K_STATE_OFF;
-		goto exit;
+		goto err_off;
 	}
 
 	ret = ath10k_core_start(ar);
 	if (ret) {
 		ath10k_err("Could not init core: %d\n", ret);
-		ath10k_hif_power_down(ar);
-		ar->state = ATH10K_STATE_OFF;
-		goto exit;
+		goto err_power_down;
 	}
 
 	if (ar->state == ATH10K_STATE_OFF)
@@ -2363,12 +2360,16 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		ar->state = ATH10K_STATE_RESTARTED;
 
 	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->pmf_qos, 1);
-	if (ret)
+	if (ret) {
 		ath10k_warn("failed to enable PMF QOS: %d\n", ret);
+		goto err_core_stop;
+	}
 
 	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->dynamic_bw, 1);
-	if (ret)
+	if (ret) {
 		ath10k_warn("failed to enable dynamic BW: %d\n", ret);
+		goto err_core_stop;
+	}
 
 	/*
 	 * By default FW set ARP frames ac to voice (6). In that case ARP
@@ -2384,14 +2385,25 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	if (ret) {
 		ath10k_warn("failed to set arp ac override parameter: %d\n",
 			    ret);
-		goto exit;
+		goto err_core_stop;
 	}
 
 	ar->num_started_vdevs = 0;
 	ath10k_regd_update(ar);
-	ret = 0;
 
-exit:
+	mutex_unlock(&ar->conf_mutex);
+	return 0;
+
+err_core_stop:
+	ath10k_core_stop(ar);
+
+err_power_down:
+	ath10k_hif_power_down(ar);
+
+err_off:
+	ar->state = ATH10K_STATE_OFF;
+
+err:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
