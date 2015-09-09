Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZjBI-00086B-Th
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 17:29:13 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath: fix incorrect PPB on JAPAN chirp radar
Date: Wed, 9 Sep 2015 10:28:44 -0700
Message-ID: <1441819724-25344-1-git-send-email-poh@qca.qualcomm.com>
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

The number of pulses per burst on Japan chirp radar is
between 1 and 3. The previous value, 20, is representing
number of bursts, but since current DFS detector is using
pulse detection other than bursts, use the pulse number
for correct radar detection.
Also using the highest number helps to avoid false detection.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pattern_detector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index 656ce42..5aa053a 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -121,7 +121,7 @@ static const struct radar_detector_specs jp_radar_ref_types[] = {
 	JP_PATTERN(4, 0, 5, 150, 230, 1, 23, 50, false),
 	JP_PATTERN(5, 6, 10, 200, 500, 1, 16, 50, false),
 	JP_PATTERN(6, 11, 20, 200, 500, 1, 12, 50, false),
-	JP_PATTERN(7, 50, 100, 1000, 2000, 1, 20, 50, false),
+	JP_PATTERN(7, 50, 100, 1000, 2000, 1, 3, 50, false),
 	JP_PATTERN(5, 0, 1, 333, 333, 1, 9, 50, false),
 };
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
