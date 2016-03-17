Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22b.google.com ([2a00:1450:4010:c07::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agUYU-0003NM-84
 for ath10k@lists.infradead.org; Thu, 17 Mar 2016 09:49:23 +0000
Received: by mail-lf0-x22b.google.com with SMTP id e138so37059107lfe.1
 for <ath10k@lists.infradead.org>; Thu, 17 Mar 2016 02:49:01 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: fix tx hang
Date: Thu, 17 Mar 2016 10:51:04 +0100
Message-Id: <1458208265-16715-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1458208265-16715-1-git-send-email-michal.kazior@tieto.com>
References: <1458208265-16715-1-git-send-email-michal.kazior@tieto.com>
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

The wake_tx_queue/push_pending logic had a bug
which could stop queues indefinitely effectivelly
breaking traffic.

Fixes: 299468782d94 ("ath10k: implement wake_tx_queue")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ebff9c0a0784..74dd010a9188 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3779,13 +3779,13 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
 		}
 
 		list_del_init(&artxq->list);
+		if (ret != -ENOENT)
+			list_add_tail(&artxq->list, &ar->txqs);
+
 		ath10k_htt_tx_txq_update(hw, txq);
 
-		if (artxq == last || (ret < 0 && ret != -ENOENT)) {
-			if (ret != -ENOENT)
-				list_add_tail(&artxq->list, &ar->txqs);
+		if (artxq == last || (ret < 0 && ret != -ENOENT))
 			break;
-		}
 	}
 
 	rcu_read_unlock();
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
