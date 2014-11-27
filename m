Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtwDo-0001QW-4v
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 10:22:50 +0000
Received: by mail-wi0-f179.google.com with SMTP id ex7so7806335wid.6
 for <ath10k@lists.infradead.org>; Thu, 27 Nov 2014 02:22:24 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: remove unused callback argument
Date: Thu, 27 Nov 2014 11:09:36 +0100
Message-Id: <1417082978-1701-1-git-send-email-michal.kazior@tieto.com>
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

This wasn't used since forever and there are no
plans on using it.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hif.h | 3 +--
 drivers/net/wireless/ath/ath10k/htc.c | 3 +--
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 6ac5523..91d24a5 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -35,8 +35,7 @@ struct ath10k_hif_cb {
 			     struct sk_buff *wbuf,
 			     unsigned transfer_id);
 	int (*rx_completion)(struct ath10k *ar,
-			     struct sk_buff *wbuf,
-			     u8 pipe_id);
+			     struct sk_buff *wbuf);
 };
 
 struct ath10k_hif_ops {
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 676bd4e..e245e34 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -317,8 +317,7 @@ static int ath10k_htc_process_trailer(struct ath10k_htc *htc,
 }
 
 static int ath10k_htc_rx_completion_handler(struct ath10k *ar,
-					    struct sk_buff *skb,
-					    u8 pipe_id)
+					    struct sk_buff *skb)
 {
 	int status = 0;
 	struct ath10k_htc *htc = &ar->htc;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 0816098..541f3bc 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -875,7 +875,7 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 		ath10k_dbg_dump(ar, ATH10K_DBG_PCI_DUMP, NULL, "pci rx: ",
 				skb->data, skb->len);
 
-		cb->rx_completion(ar, skb, pipe_info->pipe_num);
+		cb->rx_completion(ar, skb);
 	}
 
 	ath10k_pci_rx_post_pipe(pipe_info);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
