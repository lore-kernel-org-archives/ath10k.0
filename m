Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgXNW-0003ml-1B
 for ath10k@lists.infradead.org; Wed, 13 Nov 2013 10:08:54 +0000
Received: by mail-ee0-f48.google.com with SMTP id e49so98117eek.21
 for <ath10k@lists.infradead.org>; Wed, 13 Nov 2013 02:08:28 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: allow dynamic bandwidth in hw rate control
Date: Wed, 13 Nov 2013 11:05:10 +0100
Message-Id: <1384337110-9417-1-git-send-email-michal.kazior@tieto.com>
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

Frames were never retransmitted with
different/lower bandwidths, e.g. only 80MHz
bandwidth was used when dealing with a VHT80
peer.

Allow HW rate control to try out different
bandwidths when retransmitting. This increases
robustness.

Also, document the parameter properly.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 drivers/net/wireless/ath/ath10k/wmi.h | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 56f030e..db81942 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1964,7 +1964,7 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		ath10k_warn("could not enable WMI_PDEV_PARAM_PMF_QOS (%d)\n",
 			    ret);
 
-	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->dynamic_bw, 0);
+	ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->dynamic_bw, 1);
 	if (ret)
 		ath10k_warn("could not init WMI_PDEV_PARAM_DYNAMIC_BW (%d)\n",
 			    ret);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 81e33a7..8b824f9 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2234,7 +2234,12 @@ enum wmi_pdev_param {
 	 * 0: no protection 1:use CTS-to-self 2: use RTS/CTS
 	 */
 	WMI_PDEV_PARAM_PROTECTION_MODE,
-	/* Dynamic bandwidth 0: disable 1: enable */
+	/*
+	 * Dynamic bandwidth - 0: disable, 1: enable
+	 *
+	 * When enabled HW rate control tries different bandwidths when
+	 * retransmitting frames.
+	 */
 	WMI_PDEV_PARAM_DYNAMIC_BW,
 	/* Non aggregrate/ 11g sw retry threshold.0-disable */
 	WMI_PDEV_PARAM_NON_AGG_SW_RETRY_TH,
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
