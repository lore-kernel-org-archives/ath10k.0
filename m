Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQzW4-0000un-8D
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 15:38:48 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: Fix updating peer stats rx duration
Date: Wed, 3 Feb 2016 21:07:42 +0530
Message-ID: <1454513863-2703-2-git-send-email-mohammed@qca.qualcomm.com>
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

We are not updating peer stats rx_duration periodically
unless the user one polls for fw_stats, this is because
we discard the update event since pdev list is empty. Fix
this by updating rx duration periodically irrepective of checks
for pdev list (irrespective of ping-pong response)

Fixes: 856e7c3 ("ath10k: add debugfs support for Per STA total rx duration")
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 8d4148a..d80a44e 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -348,6 +348,9 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 	 */
 
 	peer_stats_svc = test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map);
+	if (peer_stats_svc)
+		ath10k_sta_update_rx_duration(ar, &stats.peers);
+
 	if (ar->debug.fw_stats_done && !peer_stats_svc) {
 		ath10k_warn(ar, "received unsolicited stats update event\n");
 		goto free;
@@ -384,9 +387,6 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 			goto free;
 		}
 
-		if (peer_stats_svc)
-			ath10k_sta_update_rx_duration(ar, &stats.peers);
-
 		list_splice_tail_init(&stats.peers, &ar->debug.fw_stats.peers);
 		list_splice_tail_init(&stats.vdevs, &ar->debug.fw_stats.vdevs);
 	}
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
