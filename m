Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDWna-0004ws-FC
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 12:53:30 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Enable beacon loss detection support for 10.4
Date: Thu, 16 Jun 2016 18:24:44 +0530
Message-ID: <1466081684-8074-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Enable beacon loss detection support for 10.4 by handling
roam event. With this change QCA99X0 station is able to
detect beacon loss when the AP is powered off

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6279ab4..4dd35f1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5257,6 +5257,9 @@ static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	case WMI_10_4_PEER_STA_KICKOUT_EVENTID:
 		ath10k_wmi_event_peer_sta_kickout(ar, skb);
 		break;
+	case WMI_10_4_ROAM_EVENTID:
+		ath10k_wmi_event_roam(ar, skb);
+		break;
 	case WMI_10_4_HOST_SWBA_EVENTID:
 		ath10k_wmi_event_host_swba(ar, skb);
 		break;
@@ -7903,6 +7906,7 @@ static const struct wmi_ops wmi_10_4_ops = {
 	.pull_phyerr = ath10k_wmi_10_4_op_pull_phyerr_ev,
 	.pull_svc_rdy = ath10k_wmi_main_op_pull_svc_rdy_ev,
 	.pull_rdy = ath10k_wmi_op_pull_rdy_ev,
+	.pull_roam_ev = ath10k_wmi_op_pull_roam_ev,
 	.get_txbf_conf_scheme = ath10k_wmi_10_4_txbf_conf_scheme,
 
 	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
