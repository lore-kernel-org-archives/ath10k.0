Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHFo7-00088U-AM
 for ath10k@lists.infradead.org; Fri, 11 May 2018 21:42:32 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/3] ath10k:  Don't try un-supported idle_ps_config command.
Date: Fri, 11 May 2018 14:42:10 -0700
Message-Id: <1526074931-23885-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1526074931-23885-1-git-send-email-greearb@candelatech.com>
References: <1526074931-23885-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

The warning the the logs does not give user a clue as to what
command is failing, so it is worth it to check for un-supported
command before trying the call.

And add return-code to survey error message.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3d7119a..1185d0c2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4680,10 +4680,13 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	}
 
 	param = ar->wmi.pdev_param->idle_ps_config;
-	ret = ath10k_wmi_pdev_set_param(ar, param, 1);
-	if (ret && ret != -EOPNOTSUPP) {
-		ath10k_warn(ar, "failed to enable idle_ps_config: %d\n", ret);
-		goto err_core_stop;
+	if (param != WMI_PDEV_PARAM_UNSUPPORTED) {
+		ret = ath10k_wmi_pdev_set_param(ar, param, 1);
+		if (ret) {
+			ath10k_warn(ar, "failed to enable idle_ps_config: %d\n",
+				    ret);
+			goto err_core_stop;
+		}
 	}
 
 	__ath10k_set_antenna(ar, ar->cfg_tx_chainmask, ar->cfg_rx_chainmask);
@@ -6770,7 +6773,8 @@ ath10k_mac_update_bss_chan_survey(struct ath10k *ar,
 
 	ret = ath10k_wmi_pdev_bss_chan_info_request(ar, type);
 	if (ret) {
-		ath10k_warn(ar, "failed to send pdev bss chan info request\n");
+		ath10k_warn(ar, "failed to send pdev bss chan info request: %d\n",
+			    ret);
 		return;
 	}
 
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
