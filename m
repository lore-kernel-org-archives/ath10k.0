Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZMKm-0000dc-1a
 for ath10k@lists.infradead.org; Tue, 08 Sep 2015 17:05:28 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v2] ath: use PRI value given by spec for fixed PRI
Date: Tue, 8 Sep 2015 10:04:41 -0700
Message-ID: <f9db7f54d12e2589bcbb39215049d51a762d5d75.1441731619.git.poh@qca.qualcomm.com>
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

PRI value is used as divider when DFS detector analyzes candidate
radar pulses.
If PRI deviation is big from its origin PRI, DFS detector could miss
valid radar reports since HW often misses detecting radar pulses and
causes long interval value of pulses.

For instance from practical results, if runtime PRI is calculated as
1431 for fixed PRI value of 1428 and delta timestamp logs 15719,
the modular remainder will be 1409 and the delta between the remainder
and runtime PRI is 22 that is bigger than PRI tolerance which is 16.
As a result this radar report will be ignored even though it's valid.

By using spec defined PRI for fixed PRI, we can correct this error.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pattern_detector.c | 6 ------
 drivers/net/wireless/ath/dfs_pattern_detector.h | 5 +++++
 drivers/net/wireless/ath/dfs_pri_detector.c     | 6 +++++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index 656ce42..0cc89fd 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -21,12 +21,6 @@
 #include "dfs_pri_detector.h"
 #include "ath.h"
 
-/*
- * tolerated deviation of radar time stamp in usecs on both sides
- * TODO: this might need to be HW-dependent
- */
-#define PRI_TOLERANCE	16
-
 /**
  * struct radar_types - contains array of patterns defined for one DFS domain
  * @domain: DFS regulatory domain
diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.h b/drivers/net/wireless/ath/dfs_pattern_detector.h
index 25a43d6..92be353 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.h
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.h
@@ -21,6 +21,11 @@
 #include <linux/list.h>
 #include <linux/nl80211.h>
 
+/* tolerated deviation of radar time stamp in usecs on both sides
+ * TODO: this might need to be HW-dependent
+ */
+#define PRI_TOLERANCE	16
+
 /**
  * struct ath_dfs_pool_stats - DFS Statistics for global pools
  */
diff --git a/drivers/net/wireless/ath/dfs_pri_detector.c b/drivers/net/wireless/ath/dfs_pri_detector.c
index cc5c592..05b0464 100644
--- a/drivers/net/wireless/ath/dfs_pri_detector.c
+++ b/drivers/net/wireless/ath/dfs_pri_detector.c
@@ -25,6 +25,9 @@ struct ath_dfs_pool_stats global_dfs_pool_stats = {};
 
 #define DFS_POOL_STAT_INC(c) (global_dfs_pool_stats.c++)
 #define DFS_POOL_STAT_DEC(c) (global_dfs_pool_stats.c--)
+#define GET_PRI_TO_USE(MIN, MAX, RUNTIME) \
+	(MIN + PRI_TOLERANCE == MAX - PRI_TOLERANCE ? \
+	MIN + PRI_TOLERANCE : RUNTIME)
 
 /**
  * struct pulse_elem - elements in pulse queue
@@ -243,7 +246,8 @@ static bool pseq_handler_create_sequences(struct pri_detector *pde,
 		ps.count_falses = 0;
 		ps.first_ts = p->ts;
 		ps.last_ts = ts;
-		ps.pri = ts - p->ts;
+		ps.pri = GET_PRI_TO_USE(pde->rs->pri_min,
+			pde->rs->pri_max, ts - p->ts);
 		ps.dur = ps.pri * (pde->rs->ppb - 1)
 				+ 2 * pde->rs->max_pri_tolerance;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
