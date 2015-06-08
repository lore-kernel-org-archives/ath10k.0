Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1v9n-00087p-JO
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 11:23:56 +0000
Received: by wgez8 with SMTP id z8so100589125wge.0
 for <ath10k@lists.infradead.org>; Mon, 08 Jun 2015 04:23:33 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: prevent memory leak in wmi rx ops
Date: Mon,  8 Jun 2015 13:23:27 +0200
Message-Id: <1433762607-28854-1-git-send-email-michal.kazior@tieto.com>
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

Found during code review. This was pretty much
impossible to happen but better safe than sorry.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 3 ++-
 drivers/net/wireless/ath/ath10k/wmi.c     | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 563fde73623c..8fdba3865c96 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -402,7 +402,7 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
 
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
-		return;
+		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
 
@@ -521,6 +521,7 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+out:
 	dev_kfree_skb(skb);
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 77220b0f0e89..c2e86edfd66f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3222,7 +3222,7 @@ static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
 
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
-		return;
+		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
 
@@ -3326,6 +3326,7 @@ static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+out:
 	dev_kfree_skb(skb);
 }
 
@@ -3339,7 +3340,7 @@ static void ath10k_wmi_10_1_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
 
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
-		return;
+		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
 
@@ -3462,7 +3463,7 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
 
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
-		return;
+		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
 
@@ -3570,6 +3571,7 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 
+out:
 	dev_kfree_skb(skb);
 }
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
