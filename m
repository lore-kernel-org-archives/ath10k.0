Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPSKd-0004VJ-VC
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 10:32:59 +0000
Received: by mail-lf0-x22a.google.com with SMTP id f93so10085503lfi.2
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 03:32:35 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/4] ath10k: add wmi command barrier utility
Date: Tue, 19 Jul 2016 12:34:11 +0200
Message-Id: <1468924452-23877-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1468924452-23877-1-git-send-email-michal.kazior@tieto.com>
References: <1468924452-23877-1-git-send-email-michal.kazior@tieto.com>
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
To: kvalo@qca.qualcomm.com
Cc: marek.puzyniak@tieto.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

This allows placing command barriers for explicit
serializing and synchronizing state.

Useful for future driver development.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c  | 31 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h  |  1 +
 3 files changed, 33 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 9374bcde3d35..bf385052b168 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -142,6 +142,7 @@ struct ath10k_wmi {
 	enum ath10k_htc_ep_id eid;
 	struct completion service_ready;
 	struct completion unified_ready;
+	struct completion barrier;
 	wait_queue_head_t tx_credits_wq;
 	DECLARE_BITMAP(svc_map, WMI_SERVICE_MAX);
 	struct wmi_cmd_map *cmd;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 8ca76ecd7e9b..2bd9f2d0f186 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -29,6 +29,9 @@
 #include "p2p.h"
 #include "hw.h"
 
+#define ATH10K_WMI_BARRIER_ECHO_ID 0xBA991E9
+#define ATH10K_WMI_BARRIER_TIMEOUT_HZ (3 * HZ)
+
 /* MAIN WMI cmd track */
 static struct wmi_cmd_map wmi_cmd_map = {
 	.init_cmdid = WMI_INIT_CMDID,
@@ -2507,6 +2510,9 @@ void ath10k_wmi_event_echo(struct ath10k *ar, struct sk_buff *skb)
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
 		   "wmi event echo value 0x%08x\n",
 		   le32_to_cpu(arg.value));
+
+	if (le32_to_cpu(arg.value) == ATH10K_WMI_BARRIER_ECHO_ID)
+		complete(&ar->wmi.barrier);
 }
 
 int ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb)
@@ -7689,6 +7695,30 @@ ath10k_wmi_op_gen_echo(struct ath10k *ar, u32 value)
 	return skb;
 }
 
+int
+ath10k_wmi_barrier(struct ath10k *ar)
+{
+	int ret;
+	int time_left;
+
+	spin_lock_bh(&ar->data_lock);
+	reinit_completion(&ar->wmi.barrier);
+	spin_unlock_bh(&ar->data_lock);
+
+	ret = ath10k_wmi_echo(ar, ATH10K_WMI_BARRIER_ECHO_ID);
+	if (ret) {
+		ath10k_warn(ar, "failed to submit wmi echo: %d\n", ret);
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->wmi.barrier,
+						ATH10K_WMI_BARRIER_TIMEOUT_HZ);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static const struct wmi_ops wmi_ops = {
 	.rx = ath10k_wmi_op_rx,
 	.map_svc = wmi_main_svc_map,
@@ -8086,6 +8116,7 @@ int ath10k_wmi_attach(struct ath10k *ar)
 
 	init_completion(&ar->wmi.service_ready);
 	init_completion(&ar->wmi.unified_ready);
+	init_completion(&ar->wmi.barrier);
 
 	INIT_WORK(&ar->svc_rdy_work, ath10k_wmi_event_service_ready_work);
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 086d78807d2f..89adfa90ee8d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -6628,5 +6628,6 @@ void ath10k_wmi_10_4_op_fw_stats_fill(struct ath10k *ar,
 				      char *buf);
 int ath10k_wmi_op_get_vdev_subtype(struct ath10k *ar,
 				   enum wmi_vdev_subtype subtype);
+int ath10k_wmi_barrier(struct ath10k *ar);
 
 #endif /* _WMI_H_ */
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
