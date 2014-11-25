Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtH6j-0005Ft-9F
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 14:28:47 +0000
Received: by mail-wg0-f50.google.com with SMTP id k14so1011118wgh.9
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 06:28:18 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/3] ath10k: clean up num_peers locking
Date: Tue, 25 Nov 2014 15:16:04 +0100
Message-Id: <1416924965-28216-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1416924965-28216-1-git-send-email-michal.kazior@tieto.com>
References: <1416834909-7130-1-git-send-email-michal.kazior@tieto.com>
 <1416924965-28216-1-git-send-email-michal.kazior@tieto.com>
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

The var was supposed to be protected by data_lock
but it wasn't so in all instances. It's actually
not necessary to have a spinlock protected
num_peers so drop it.

All instances of num_peers are already within
conf_mutex sections so use that.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8f86bd3..be7e50b6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -560,7 +560,7 @@ struct ath10k {
 	struct list_head peers;
 	wait_queue_head_t peer_mapping_wq;
 
-	/* number of created peers; protected by data_lock */
+	/* protected by conf_mutex */
 	int num_peers;
 
 	struct work_struct offchan_tx_work;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7b5a888..3312e75 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -339,9 +339,8 @@ static int ath10k_peer_create(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 			    addr, vdev_id, ret);
 		return ret;
 	}
-	spin_lock_bh(&ar->data_lock);
+
 	ar->num_peers++;
-	spin_unlock_bh(&ar->data_lock);
 
 	return 0;
 }
@@ -432,9 +431,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 	if (ret)
 		return ret;
 
-	spin_lock_bh(&ar->data_lock);
 	ar->num_peers--;
-	spin_unlock_bh(&ar->data_lock);
 
 	return 0;
 }
@@ -471,8 +468,9 @@ static void ath10k_peer_cleanup_all(struct ath10k *ar)
 		list_del(&peer->list);
 		kfree(peer);
 	}
-	ar->num_peers = 0;
 	spin_unlock_bh(&ar->data_lock);
+
+	ar->num_peers = 0;
 }
 
 /************************/
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
