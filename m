Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VagCb-0004Fl-R6
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 06:21:26 +0000
Received: by mail-ea0-f170.google.com with SMTP id q10so1562237eaj.1
 for <ath10k@lists.infradead.org>; Sun, 27 Oct 2013 23:21:00 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: plug memory leak on beacon tx
Date: Mon, 28 Oct 2013 07:18:14 +0100
Message-Id: <1382941094-3291-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1382941094-3291-1-git-send-email-michal.kazior@tieto.com>
References: <1382941094-3291-1-git-send-email-michal.kazior@tieto.com>
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

If beacon tx command failed the wmi command buffer
was not freed. This led to OOM in the long run.
This became aparent when stress testing
multi-BSSID.

Reported-By: Tomasz Skapski <tomasz.skapski@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 8db9db2..f79f17c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3092,6 +3092,7 @@ int ath10k_wmi_beacon_send_nowait(struct ath10k *ar,
 {
 	struct wmi_bcn_tx_cmd *cmd;
 	struct sk_buff *skb;
+	int ret;
 
 	skb = ath10k_wmi_alloc_skb(sizeof(*cmd) + arg->bcn_len);
 	if (!skb)
@@ -3104,7 +3105,11 @@ int ath10k_wmi_beacon_send_nowait(struct ath10k *ar,
 	cmd->hdr.bcn_len  = __cpu_to_le32(arg->bcn_len);
 	memcpy(cmd->bcn, arg->bcn, arg->bcn_len);
 
-	return ath10k_wmi_cmd_send_nowait(ar, skb, ar->wmi.cmd->bcn_tx_cmdid);
+	ret = ath10k_wmi_cmd_send_nowait(ar, skb, ar->wmi.cmd->bcn_tx_cmdid);
+	if (ret)
+		dev_kfree_skb(skb);
+
+	return ret;
 }
 
 static void ath10k_wmi_pdev_set_wmm_param(struct wmi_wmm_params *params,
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
