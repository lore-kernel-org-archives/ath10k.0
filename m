Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZLbF-0002BI-7t
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 17:55:16 +0000
Received: by mail-lf0-f41.google.com with SMTP id z134so12667906lff.3
 for <ath10k@lists.infradead.org>; Thu, 02 Feb 2017 09:54:49 -0800 (PST)
From: Waldemar Rymarkiewicz <ext.waldemar.rymarkiewicz@tieto.com>
Subject: [PATCH] ath10k: remove unneeded semicolon
Date: Thu,  2 Feb 2017 18:53:42 +0100
Message-Id: <20170202175342.26338-1-ext.waldemar.rymarkiewicz@tieto.com>
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
To: kvalo@qca.qualcomm.com, ath10k@lists.infradead.org
Cc: Waldemar Rymarkiewicz <ext.waldemar.rymarkiewicz@tieto.com>, linux-wireless@vger.kernel.org

Remove redundant semicolon after switch statement.

Signed-off-by: Waldemar Rymarkiewicz <ext.waldemar.rymarkiewicz@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 12e67c46ea0a..ae1b64584eb2 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2493,7 +2493,7 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt event: ",
 				skb->data, skb->len);
 		break;
-	};
+	}
 	return true;
 }
 EXPORT_SYMBOL(ath10k_htt_t2h_msg_handler);
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
