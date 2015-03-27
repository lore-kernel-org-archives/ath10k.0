Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbXd1-0001BO-GJ
 for ath10k@lists.infradead.org; Fri, 27 Mar 2015 17:01:04 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath: use PRI value given by spec for fixed PRI
Date: Fri, 27 Mar 2015 09:59:50 -0700
Message-ID: <1427475590-2198-1-git-send-email-poh@qca.qualcomm.com>
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
 drivers/net/wireless/ath/dfs_pri_detector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/dfs_pri_detector.c b/drivers/net/wireless/ath/dfs_pri_detector.c
index 1b5ad19..fef459a 100644
--- a/drivers/net/wireless/ath/dfs_pri_detector.c
+++ b/drivers/net/wireless/ath/dfs_pri_detector.c
@@ -25,6 +25,8 @@ struct ath_dfs_pool_stats global_dfs_pool_stats = {};
 
 #define DFS_POOL_STAT_INC(c) (global_dfs_pool_stats.c++)
 #define DFS_POOL_STAT_DEC(c) (global_dfs_pool_stats.c--)
+#define GET_PRI_TO_USE(MIN, MAX, RUNTIME) \
+	(MIN + 16 == MAX - 16 ? MIN + 16 : RUNTIME)
 
 /**
  * struct pulse_elem - elements in pulse queue
@@ -243,7 +245,8 @@ static bool pseq_handler_create_sequences(struct pri_detector *pde,
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
