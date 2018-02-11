Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ekhpE-00017o-5d
 for ath10k@lists.infradead.org; Sun, 11 Feb 2018 02:57:09 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH] ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait
Date: Sun, 11 Feb 2018 10:56:45 +0800
Message-Id: <1518317805-5796-1-git-send-email-cjhuang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

The skb may be freed in tx completion context before
trace_ath10k_wmi_cmd is called. This can be easily captured
when KASAN(Kernel Address Sanitizer) is enabled. The fix is
to add a reference count to the skb and release it after
trace_ath10k_wmi_cmd is called.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 58dc218..e63aedb 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -1742,8 +1743,10 @@ int ath10k_wmi_cmd_send_nowait(struct ath10k *ar, struct sk_buff *skb,
 	cmd_hdr->cmd_id = __cpu_to_le32(cmd);
 
 	memset(skb_cb, 0, sizeof(*skb_cb));
+	skb_get(skb);
 	ret = ath10k_htc_send(&ar->htc, ar->wmi.eid, skb);
 	trace_ath10k_wmi_cmd(ar, cmd_id, skb->data, skb->len, ret);
+	dev_kfree_skb(skb);
 
 	if (ret)
 		goto err_pull;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
