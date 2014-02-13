Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE1f2-0001X9-Hs
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 19:09:25 +0000
From: greearb@candelatech.com
Subject: [PATCH v3] ath10k:  add more details to some debug messages
Date: Thu, 13 Feb 2014 11:08:39 -0800
Message-Id: <1392318519-32315-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

Add SoB, fix title as suggested, fix log message as suggested.

 drivers/net/wireless/ath/ath10k/mac.c  | 3 ++-
 drivers/net/wireless/ath/ath10k/txrx.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1c305b1..c9c6efe 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3433,7 +3433,8 @@ static void ath10k_flush(struct ieee80211_hw *hw, u32 queues, bool drop)
 		}), ATH10K_FLUSH_TIMEOUT_HZ);
 
 	if (ret <= 0 || skip)
-		ath10k_warn("tx not flushed\n");
+		ath10k_warn("tx not flushed (skip %i ar-state %i): %i\n",
+			    skip, ar->state, ret);
 
 skip:
 	mutex_unlock(&ar->conf_mutex);
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index b11e478..d52883a 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -378,7 +378,8 @@ void ath10k_peer_unmap_event(struct ath10k_htt *htt,
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, ev->peer_id);
 	if (!peer) {
-		ath10k_warn("unknown peer id %d\n", ev->peer_id);
+		ath10k_warn("peer-unmap-event: unknown peer id %d\n",
+			    ev->peer_id);
 		goto exit;
 	}
 
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
