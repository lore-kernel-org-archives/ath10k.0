Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YM19w-0006Os-Fg
 for ath10k@lists.infradead.org; Thu, 12 Feb 2015 21:18:53 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 3/3] ath: Enhance radar detection by looking up chirp
Date: Thu, 12 Feb 2015 13:17:05 -0800
Message-ID: <1423775825-19498-3-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1423775825-19498-1-git-send-email-poh@qca.qualcomm.com>
References: <1423775825-19498-1-git-send-email-poh@qca.qualcomm.com>
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

Certain radar types such as FCC radar type 5 are using chirp
in their pulses, hence looking up the chirp status will enhance
to avoid false radar detection.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/dfs_pri_detector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/dfs_pri_detector.c b/drivers/net/wireless/ath/dfs_pri_detector.c
index 43b6081..1b5ad19 100644
--- a/drivers/net/wireless/ath/dfs_pri_detector.c
+++ b/drivers/net/wireless/ath/dfs_pri_detector.c
@@ -390,6 +390,10 @@ static struct pri_sequence *pri_detector_add_pulse(struct pri_detector *de,
 	if ((ts - de->last_ts) < rs->max_pri_tolerance)
 		/* if delta to last pulse is too short, don't use this pulse */
 		return NULL;
+	/* radar detector spec needs chirp, but not detected */
+	if (rs->chirp && rs->chirp != event->chirp)
+		return NULL;
+
 	de->last_ts = ts;
 
 	max_updated_seq = pseq_handler_add_to_existing_seqs(de, ts);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
