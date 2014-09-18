Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUbp1-0001yQ-I8
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 13:32:33 +0000
Received: by mail-wg0-f43.google.com with SMTP id x12so888780wgg.2
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 06:32:09 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/9] ath10k: remove unused pdev_set_channel command
Date: Thu, 18 Sep 2014 15:21:20 +0200
Message-Id: <1411046487-19544-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
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

This command is not used anymore and most firmware
revisions do not seem to handle it well. Channel
switching is done via vdev restarting.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 36 -----------------------------------
 drivers/net/wireless/ath/ath10k/wmi.h |  7 -------
 2 files changed, 43 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 772cca5..89e63d5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2871,42 +2871,6 @@ int ath10k_wmi_pdev_set_regdomain(struct ath10k *ar, u16 rd, u16 rd2g,
 							 ctl2g, ctl5g);
 }
 
-int ath10k_wmi_pdev_set_channel(struct ath10k *ar,
-				const struct wmi_channel_arg *arg)
-{
-	struct wmi_set_channel_cmd *cmd;
-	struct sk_buff *skb;
-	u32 ch_flags = 0;
-
-	if (arg->passive)
-		return -EINVAL;
-
-	skb = ath10k_wmi_alloc_skb(ar, sizeof(*cmd));
-	if (!skb)
-		return -ENOMEM;
-
-	if (arg->chan_radar)
-		ch_flags |= WMI_CHAN_FLAG_DFS;
-
-	cmd = (struct wmi_set_channel_cmd *)skb->data;
-	cmd->chan.mhz               = __cpu_to_le32(arg->freq);
-	cmd->chan.band_center_freq1 = __cpu_to_le32(arg->freq);
-	cmd->chan.mode              = arg->mode;
-	cmd->chan.flags		   |= __cpu_to_le32(ch_flags);
-	cmd->chan.min_power         = arg->min_power;
-	cmd->chan.max_power         = arg->max_power;
-	cmd->chan.reg_power         = arg->max_reg_power;
-	cmd->chan.reg_classid       = arg->reg_class_id;
-	cmd->chan.antenna_max       = arg->max_antenna_gain;
-
-	ath10k_dbg(ar, ATH10K_DBG_WMI,
-		   "wmi set channel mode %d freq %d\n",
-		   arg->mode, arg->freq);
-
-	return ath10k_wmi_cmd_send(ar, skb,
-				   ar->wmi.cmd->pdev_set_channel_cmdid);
-}
-
 int ath10k_wmi_pdev_suspend_target(struct ath10k *ar, u32 suspend_opt)
 {
 	struct wmi_pdev_suspend_cmd *cmd;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 86f5ebc..b8098d2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2908,11 +2908,6 @@ enum wmi_tp_scale {
 	WMI_TP_SCALE_SIZE   = 5,	/* max num of enum     */
 };
 
-struct wmi_set_channel_cmd {
-	/* channel (only frequency and mode info are used) */
-	struct wmi_channel chan;
-} __packed;
-
 struct wmi_pdev_chanlist_update_event {
 	/* number of channels */
 	__le32 num_chan;
@@ -4732,8 +4727,6 @@ int ath10k_wmi_connect(struct ath10k *ar);
 struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len);
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
 
-int ath10k_wmi_pdev_set_channel(struct ath10k *ar,
-				const struct wmi_channel_arg *);
 int ath10k_wmi_pdev_suspend_target(struct ath10k *ar, u32 suspend_opt);
 int ath10k_wmi_pdev_resume_target(struct ath10k *ar);
 int ath10k_wmi_pdev_set_regdomain(struct ath10k *ar, u16 rd, u16 rd2g,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
