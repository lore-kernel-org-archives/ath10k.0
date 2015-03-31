Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd5rT-0005QV-Gp
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 23:46:24 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2 1/2] ath: define JP DFS patterns separated from FCC
Date: Tue, 31 Mar 2015 16:44:42 -0700
Message-ID: <413e207292d5c52cd621912762e6d4a40a8dfc48.1427845453.git.poh@qca.qualcomm.com>
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

Separate Japan's DFS pattern from FCC to control PPB threshold.

Currently all the radar detectors use the same threshold rate at
50%, but it's not able to achieve if data traffic rate is higher
than 40% because WLAN baseband used by ath9k and ath10k often fails
detecting radar pulses, so that SW cannot get enough radar reports
to achieve the rate.

Since Japan's W53 band requires 50% data traffic during its DFS
test we need to apply different threshold rate than others on it.
Hence define its own pattern to give flexibility to threshold rate.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pattern_detector.c | 29 +++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index b1de8c6..2d4ad45 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -41,7 +41,8 @@ struct radar_types {
 
 /* percentage on ppb threshold to trigger detection */
 #define MIN_PPB_THRESH	50
-#define PPB_THRESH(PPB) ((PPB * MIN_PPB_THRESH + 50) / 100)
+#define PPB_THRESH_RATE(PPB, RATE) ((PPB * RATE + 100 - RATE) / 100)
+#define PPB_THRESH(PPB) PPB_THRESH_RATE(PPB, MIN_PPB_THRESH)
 #define PRF2PRI(PRF) ((1000000 + PRF / 2) / PRF)
 /* percentage of pulse width tolerance */
 #define WIDTH_TOLERANCE 5
@@ -96,17 +97,23 @@ static const struct radar_types fcc_radar_types = {
 	.radar_types		= fcc_radar_ref_types,
 };
 
-#define JP_PATTERN FCC_PATTERN
+#define JP_PATTERN(ID, WMIN, WMAX, PMIN, PMAX, PRF, PPB, RATE, CHIRP)	\
+{								\
+	ID, WIDTH_LOWER(WMIN), WIDTH_UPPER(WMAX),		\
+	PMIN - PRI_TOLERANCE,					\
+	PMAX * PRF + PRI_TOLERANCE, PRF, PPB * PRF,		\
+	PPB_THRESH_RATE(PPB, RATE), PRI_TOLERANCE, CHIRP	\
+}
 static const struct radar_detector_specs jp_radar_ref_types[] = {
-	JP_PATTERN(0, 0, 1, 1428, 1428, 1, 18, false),
-	JP_PATTERN(1, 2, 3, 3846, 3846, 1, 18, false),
-	JP_PATTERN(2, 0, 1, 1388, 1388, 1, 18, false),
-	JP_PATTERN(3, 1, 2, 4000, 4000, 1, 18, false),
-	JP_PATTERN(4, 0, 5, 150, 230, 1, 23, false),
-	JP_PATTERN(5, 6, 10, 200, 500, 1, 16, false),
-	JP_PATTERN(6, 11, 20, 200, 500, 1, 12, false),
-	JP_PATTERN(7, 50, 100, 1000, 2000, 1, 20, false),
-	JP_PATTERN(5, 0, 1, 333, 333, 1, 9, false),
+	JP_PATTERN(0, 0, 1, 1428, 1428, 1, 18, 50, false),
+	JP_PATTERN(1, 2, 3, 3846, 3846, 1, 18, 50, false),
+	JP_PATTERN(2, 0, 1, 1388, 1388, 1, 18, 50, false),
+	JP_PATTERN(3, 1, 2, 4000, 4000, 1, 18, 50, false),
+	JP_PATTERN(4, 0, 5, 150, 230, 1, 23, 50, false),
+	JP_PATTERN(5, 6, 10, 200, 500, 1, 16, 50, false),
+	JP_PATTERN(6, 11, 20, 200, 500, 1, 12, 50, false),
+	JP_PATTERN(7, 50, 100, 1000, 2000, 1, 20, 50, false),
+	JP_PATTERN(5, 0, 1, 333, 333, 1, 9, 50, false),
 };
 
 static const struct radar_types jp_radar_types = {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
