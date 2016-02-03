Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQzWP-00012Y-Mp
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 15:39:10 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: Fix pointless update of peer stats list
Date: Wed, 3 Feb 2016 21:07:43 +0530
Message-ID: <1454513863-2703-3-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1454513863-2703-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1454513863-2703-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

We periodically receive f/w stats event for updating
the rx duration and there is no reason to keep on appending
the f/w stats peer list, as this gets completely cleaned up when
the user polls for f/w stats {pdev, vdev, peer stats}. Only don't
print the warning message in the case PEER_STATS service is enabled

Fixes: 856e7c3 ("ath10k: add debugfs support for Per STA total rx duration")
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index d80a44e..06581fa 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -351,8 +351,10 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 	if (peer_stats_svc)
 		ath10k_sta_update_rx_duration(ar, &stats.peers);
 
-	if (ar->debug.fw_stats_done && !peer_stats_svc) {
-		ath10k_warn(ar, "received unsolicited stats update event\n");
+	if (ar->debug.fw_stats_done) {
+		if (!peer_stats_svc)
+			ath10k_warn(ar, "received unsolicited stats update event\n");
+
 		goto free;
 	}
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
