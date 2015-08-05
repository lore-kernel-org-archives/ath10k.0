Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMvjB-0003mk-Mn
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 10:15:19 +0000
Received: by labgo9 with SMTP id go9so25312135lab.3
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 03:14:54 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: don't remove peer that doesn't exist
Date: Wed,  5 Aug 2015 12:15:23 +0200
Message-Id: <1438769724-29438-1-git-send-email-michal.kazior@tieto.com>
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

If peer creation failed during offchannel Tx the
driver attempted to delete the peer nonetheless.
This caused the ar->num_peers counter to be
incorrectly decremented. This subsequently could
cause the counter to drop below 0 and also
eventually lead to firmware crash because host
would think there are less peer entries created in
firmware then there really were.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index acd222f3b899..4f6dddac8e43 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3346,6 +3346,7 @@ void ath10k_offchan_tx_work(struct work_struct *work)
 	int vdev_id;
 	int ret;
 	unsigned long time_left;
+	bool tmp_peer_created = false;
 
 	/* FW requirement: We must create a peer before FW will send out
 	 * an offchannel frame. Otherwise the frame will be stuck and
@@ -3383,6 +3384,7 @@ void ath10k_offchan_tx_work(struct work_struct *work)
 			if (ret)
 				ath10k_warn(ar, "failed to create peer %pM on vdev %d: %d\n",
 					    peer_addr, vdev_id, ret);
+			tmp_peer_created = (ret == 0);
 		}
 
 		spin_lock_bh(&ar->data_lock);
@@ -3398,7 +3400,7 @@ void ath10k_offchan_tx_work(struct work_struct *work)
 			ath10k_warn(ar, "timed out waiting for offchannel skb %p\n",
 				    skb);
 
-		if (!peer) {
+		if (!peer && tmp_peer_created) {
 			ret = ath10k_peer_delete(ar, vdev_id, peer_addr);
 			if (ret)
 				ath10k_warn(ar, "failed to delete peer %pM on vdev %d: %d\n",
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
