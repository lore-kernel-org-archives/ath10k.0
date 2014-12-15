Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0aov-0005oD-LB
 for ath10k@lists.infradead.org; Mon, 15 Dec 2014 18:56:38 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath: fix incorrect PPB on FCC radar type 5
Date: Mon, 15 Dec 2014 10:55:34 -0800
Message-ID: <1418669734-12921-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

The minimum number of pulses per burst on FCC radar type 5 is 1.
Use this number for correct radar detection.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pattern_detector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index cfd0554..3d57f87 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -86,7 +86,7 @@ static const struct radar_detector_specs fcc_radar_ref_types[] = {
 	FCC_PATTERN(1, 0, 5, 150, 230, 1, 23),
 	FCC_PATTERN(2, 6, 10, 200, 500, 1, 16),
 	FCC_PATTERN(3, 11, 20, 200, 500, 1, 12),
-	FCC_PATTERN(4, 50, 100, 1000, 2000, 1, 20),
+	FCC_PATTERN(4, 50, 100, 1000, 2000, 1, 1),
 	FCC_PATTERN(5, 0, 1, 333, 333, 1, 9),
 };
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
