Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XssGm-0006hr-Ic
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 11:57:29 +0000
From: Vivek Natarajan <nataraja@qti.qualcomm.com>
Subject: [PATCH] ath: Fix a false radar detection pattern
Date: Mon, 24 Nov 2014 17:26:22 +0530
Message-ID: <1416830183-2985-1-git-send-email-nataraja@qti.qualcomm.com>
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
To: linville@tuxdriver.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

For FCC and JP, in one of the radar patterns, PPB and PRF seems to be
interchanged leading to frequent incorrect radar detections.

Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pattern_detector.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index 7a16686..0e383ef 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -86,7 +86,7 @@ static const struct radar_detector_specs fcc_radar_ref_types[] = {
 	FCC_PATTERN(1, 0, 5, 150, 230, 1, 23),
 	FCC_PATTERN(2, 6, 10, 200, 500, 1, 16),
 	FCC_PATTERN(3, 11, 20, 200, 500, 1, 12),
-	FCC_PATTERN(4, 50, 100, 1000, 2000, 20, 1),
+	FCC_PATTERN(4, 50, 100, 1000, 2000, 1, 20),
 	FCC_PATTERN(5, 0, 1, 333, 333, 1, 9),
 };
 
@@ -105,7 +105,7 @@ static const struct radar_detector_specs jp_radar_ref_types[] = {
 	JP_PATTERN(4, 0, 5, 150, 230, 1, 23),
 	JP_PATTERN(5, 6, 10, 200, 500, 1, 16),
 	JP_PATTERN(6, 11, 20, 200, 500, 1, 12),
-	JP_PATTERN(7, 50, 100, 1000, 2000, 20, 1),
+	JP_PATTERN(7, 50, 100, 1000, 2000, 1, 20),
 	JP_PATTERN(5, 0, 1, 333, 333, 1, 9),
 };
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
