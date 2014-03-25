Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMDo-0001IP-He
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 07:56:34 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so105671pbb.0
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 00:56:05 -0700 (PDT)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: fix printing of peer stats in non-AP firmware
Date: Tue, 25 Mar 2014 15:55:46 +0800
Message-Id: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

This patch is intended to fix the problem if we use the
firmware 999.999.0.636 to get peer stats when the number
of peer is more than 3. The WMI_UPDATE_STATS_EVENTID may
trigger more than 1 time if the number of peers is more
than 3. So this patch allows us to do the checking on this
and make sure that we print the peer stats correctly.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 7be284c..4a4072e 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -245,10 +245,17 @@ void ath10k_debug_read_target_stats(struct ath10k *ar,
 	if (num_peer_stats) {
 		struct wmi_peer_stats_10x *peer_stats;
 		struct ath10k_peer_stat *s;
+		int j = 0;
+
+		if (!test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features) &&
+		    !num_pdev_stats) {
+			j = 3;
+			num_peer_stats += 3;
+		}
 
 		stats->peers = num_peer_stats;
 
-		for (i = 0; i < num_peer_stats; i++) {
+		for (i = j; i < num_peer_stats; i++) {
 			peer_stats = (struct wmi_peer_stats_10x *)tmp;
 			s = &stats->peer_stat[i];
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
