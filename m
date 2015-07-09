Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD7Xf-0007jc-64
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 08:50:51 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: free collected fw stats memory if .pull_fw_stats
 fails
Date: Thu, 9 Jul 2015 14:19:43 +0530
Message-ID: <1436431783-10691-2-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1436431783-10691-1-git-send-email-rmani@qti.qualcomm.com>
References: <1436431783-10691-1-git-send-email-rmani@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

If .pull_fw_stats() fails for some reason while processing
fw stats event, collected pdev/vdev/peer stats just before
the failure should be freed. This is unlikely to happen,
just code review catch.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index edf6047..fc6852c 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -321,7 +321,7 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 	ret = ath10k_wmi_pull_fw_stats(ar, skb, &stats);
 	if (ret) {
 		ath10k_warn(ar, "failed to pull fw stats: %d\n", ret);
-		goto unlock;
+		goto free;
 	}
 
 	/* Stat data may exceed htc-wmi buffer limit. In such case firmware
@@ -384,7 +384,6 @@ free:
 	ath10k_debug_fw_stats_vdevs_free(&stats.vdevs);
 	ath10k_debug_fw_stats_peers_free(&stats.peers);
 
-unlock:
 	spin_unlock_bh(&ar->data_lock);
 }
 
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
