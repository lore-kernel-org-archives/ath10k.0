Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z72wm-0005t5-Db
 for ath10k@lists.infradead.org; Mon, 22 Jun 2015 14:43:41 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH v2 10/10] ath10k: handle 10.4 fw wmi ready event
Date: Mon, 22 Jun 2015 20:10:18 +0530
Message-ID: <1434984018-24057-11-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1434984018-24057-1-git-send-email-rmani@qti.qualcomm.com>
References: <1434984018-24057-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

Reuse existing function ath10k_wmi_op_pull_rdy_ev()
to parse WMI_10_4_READY_EVENTID and handle the same
event in ath10k_wmi_10_4_op_rx().

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 62ea0bc..271ad2f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4338,6 +4338,9 @@ static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_wmi_event_mgmt_rx(ar, skb);
 		/* mgmt_rx() owns the skb now! */
 		return;
+	case WMI_10_4_READY_EVENTID:
+		ath10k_wmi_event_ready(ar, skb);
+		break;
 	default:
 		ath10k_warn(ar, "Unknown eventid: %d\n", id);
 		break;
@@ -6270,6 +6273,7 @@ static const struct wmi_ops wmi_10_4_ops = {
 	.map_svc = wmi_10_4_svc_map,
 	.pull_mgmt_rx = ath10k_wmi_10_4_op_pull_mgmt_rx_ev,
 	.pull_svc_rdy = ath10k_wmi_main_op_pull_svc_rdy_ev,
+	.pull_rdy = ath10k_wmi_op_pull_rdy_ev,
 	.gen_init = ath10k_wmi_10_4_op_gen_init,
 };
 
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
