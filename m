Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cE1CB-00087F-7S
 for ath10k@lists.infradead.org; Mon, 05 Dec 2016 21:53:12 +0000
Received: by mail-wj0-x242.google.com with SMTP id he10so27014581wjc.2
 for <ath10k@lists.infradead.org>; Mon, 05 Dec 2016 13:52:49 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH 1/2] ath10k: add accounting for the extended peer statistics
Date: Mon,  5 Dec 2016 22:52:45 +0100
Message-Id: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>

The 10.4 firmware adds extended peer information to the
firmware's statistics payload. This additional info is
stored as a separate data field and the elements are
stored in their own "peers_extd" list.

These elements can pile up in the same way as the peer
information elements. This is because the
ath10k_wmi_10_4_op_pull_fw_stats() function tries to
pull the same amount (num_peer_stats) for every statistic
data unit.

Fixes: 4a49ae94a448faa ("ath10k: fix 10.4 extended peer stats update")
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 82a4c67f3672..4acd9eb65910 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -399,6 +399,7 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 			 * prevent firmware from DoS-ing the host.
 			 */
 			ath10k_fw_stats_peers_free(&ar->debug.fw_stats.peers);
+			ath10k_fw_extd_stats_peers_free(&ar->debug.fw_stats.peers_extd);
 			ath10k_warn(ar, "dropping fw peer stats\n");
 			goto free;
 		}
@@ -409,10 +410,12 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 			goto free;
 		}
 
+		if (!list_empty(&stats.peers))
+			list_splice_tail_init(&stats.peers_extd,
+					      &ar->debug.fw_stats.peers_extd);
+
 		list_splice_tail_init(&stats.peers, &ar->debug.fw_stats.peers);
 		list_splice_tail_init(&stats.vdevs, &ar->debug.fw_stats.vdevs);
-		list_splice_tail_init(&stats.peers_extd,
-				      &ar->debug.fw_stats.peers_extd);
 	}
 
 	complete(&ar->debug.fw_stats_complete);
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
