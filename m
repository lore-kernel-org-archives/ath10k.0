Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yd0jn-0003y1-Ct
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 18:18:10 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 2/2] ath: lower JP W53 band DFS detection threshold around 30%
Date: Tue, 31 Mar 2015 11:16:25 -0700
Message-ID: <1427825785-21389-2-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1427825785-21389-1-git-send-email-poh@qca.qualcomm.com>
References: <1427825785-21389-1-git-send-email-poh@qca.qualcomm.com>
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

Japan's W53 band requires 50% data traffic during its DFS test,
but WLAN baseband used by ath9k and ath10k is not able to achieve
current threshold rate, 50%, under the data traffic rate.
In other words, HW occasionally fails detecting radar pulses,
so that SW cannot get enough radar reports to achieve the rate.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pattern_detector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index 8d1e082..7ad1932 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -105,8 +105,8 @@ static const struct radar_types fcc_radar_types = {
 	PPB_THRESH_JP(PPB, RATE), PRI_TOLERANCE, CHIRP	\
 }
 static const struct radar_detector_specs jp_radar_ref_types[] = {
-	JP_PATTERN(0, 0, 1, 1428, 1428, 1, 18, 50, false),
-	JP_PATTERN(1, 2, 3, 3846, 3846, 1, 18, 50, false),
+	JP_PATTERN(0, 0, 1, 1428, 1428, 1, 18, 29, false),
+	JP_PATTERN(1, 2, 3, 3846, 3846, 1, 18, 29, false),
 	JP_PATTERN(2, 0, 1, 1388, 1388, 1, 18, 50, false),
 	JP_PATTERN(3, 1, 2, 4000, 4000, 1, 18, 50, false),
 	JP_PATTERN(4, 0, 5, 150, 230, 1, 23, 50, false),
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
