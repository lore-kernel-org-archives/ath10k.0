Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkBHE-0007nI-3S
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 16:44:09 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Protect against buggy firmware.
Date: Mon, 30 Jul 2018 09:43:49 -0700
Message-Id: <1532969029-12926-1-git-send-email-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

While testing some buggy wave-2 firmware, I was seeing full
kernel crashes.  Adding this additional check keeps
the kernel from crashing.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 478cc67..8ab949d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2644,9 +2644,9 @@ static void ath10k_htt_fetch_peer_stats(struct ath10k *ar,
 	rcu_read_lock();
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, peer_id);
-	if (!peer) {
-		ath10k_warn(ar, "Invalid peer id %d peer stats buffer\n",
-			    peer_id);
+	if (!peer || !peer->sta) {
+		ath10k_warn(ar, "Invalid peer id %d or peer stats buffer, peer: %p  sta: %p\n",
+			    peer_id, peer, peer ? peer->sta : NULL);
 		goto out;
 	}
 
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
