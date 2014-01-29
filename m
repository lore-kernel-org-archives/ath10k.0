Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8UZk-0001MM-W8
 for ath10k@lists.infradead.org; Wed, 29 Jan 2014 12:49:05 +0000
Received: by mail-ea0-f180.google.com with SMTP id o10so881840eaj.25
 for <ath10k@lists.infradead.org>; Wed, 29 Jan 2014 04:48:32 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH] ath10k: configure access category for arp
Date: Wed, 29 Jan 2014 13:48:16 +0100
Message-Id: <1390999696-8895-1-git-send-email-marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org

ARP frames exchange does not work properly for UAPSD enabled AP.
ARP requests which arrives with access category 0 are processed
by network stack and send back with access category 0. FW changes
access category to 6. This is causing problems when UAPSD associated
STA is sleeping after has sent ARP request. Configure ARP access
category in FW to best effort (0) solves this problem. ARP frames
will be send with access category 0.

Simplify arp ac override functionality by removing redundant entry in
pdev param maping table. There should be only one entry in pdev param
map but enum has different name for different FW.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c |  4 +---
 drivers/net/wireless/ath/ath10k/wmi.h |  1 -
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 776e364..7fd33da 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2100,6 +2100,23 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		ath10k_warn("could not init WMI_PDEV_PARAM_DYNAMIC_BW (%d)\n",
 			    ret);
 
+	/*
+	 * By default FW set ARP frames ac to voice (6). In that case ARP
+	 * exchange is not working properly for UAPSD enabled AP. ARP requests
+	 * which arrives with access category 0 are processed by network stack
+	 * and send back with access category 0, but FW changes access category
+	 * to 6. Set ARP frames access category to best effort (0) solves
+	 * this problem.
+	 */
+
+	ret = ath10k_wmi_pdev_set_param(ar,
+					ar->wmi.pdev_param->arp_ac_override, 0);
+	if (ret) {
+		ath10k_warn("could not init WMI_PDEV_PARAM_ARP_AC_OVERRIDE (%d)\n",
+			    ret);
+		goto exit;
+	}
+
 	ath10k_regd_update(ar);
 
 exit:
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 712a606..ebcc698 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -420,7 +420,6 @@ static struct wmi_pdev_param_map wmi_pdev_param_map = {
 	.bcnflt_stats_update_period = WMI_PDEV_PARAM_BCNFLT_STATS_UPDATE_PERIOD,
 	.pmf_qos = WMI_PDEV_PARAM_PMF_QOS,
 	.arp_ac_override = WMI_PDEV_PARAM_ARP_AC_OVERRIDE,
-	.arpdhcp_ac_override = WMI_PDEV_PARAM_UNSUPPORTED,
 	.dcs = WMI_PDEV_PARAM_DCS,
 	.ani_enable = WMI_PDEV_PARAM_ANI_ENABLE,
 	.ani_poll_period = WMI_PDEV_PARAM_ANI_POLL_PERIOD,
@@ -472,8 +471,7 @@ static struct wmi_pdev_param_map wmi_10x_pdev_param_map = {
 	.bcnflt_stats_update_period =
 				WMI_10X_PDEV_PARAM_BCNFLT_STATS_UPDATE_PERIOD,
 	.pmf_qos = WMI_10X_PDEV_PARAM_PMF_QOS,
-	.arp_ac_override = WMI_PDEV_PARAM_UNSUPPORTED,
-	.arpdhcp_ac_override = WMI_10X_PDEV_PARAM_ARPDHCP_AC_OVERRIDE,
+	.arp_ac_override = WMI_10X_PDEV_PARAM_ARPDHCP_AC_OVERRIDE,
 	.dcs = WMI_10X_PDEV_PARAM_DCS,
 	.ani_enable = WMI_10X_PDEV_PARAM_ANI_ENABLE,
 	.ani_poll_period = WMI_10X_PDEV_PARAM_ANI_POLL_PERIOD,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 4b5e7d3..b776bc4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2277,7 +2277,6 @@ struct wmi_pdev_param_map {
 	u32 bcnflt_stats_update_period;
 	u32 pmf_qos;
 	u32 arp_ac_override;
-	u32 arpdhcp_ac_override;
 	u32 dcs;
 	u32 ani_enable;
 	u32 ani_poll_period;
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
