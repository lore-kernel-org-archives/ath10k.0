Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3uHu-0001x4-Th
 for ath10k@lists.infradead.org; Wed, 13 Mar 2019 03:10:40 +0000
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: [PATCH v2] fq: fix fq_tin tx bytes overflow
Date: Wed, 13 Mar 2019 11:08:25 +0800
Message-Id: <1552446505-15444-1-git-send-email-yiboz@codeaurora.org>
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
Cc: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org

Currently, we are using u32 for tx_bytes in fq_tin.
If the throughput stays more than 1.2Gbps, tx_bytes
statistics overflow in about 1 min.

In order to allow us to trace the tx_bytes statistics
for longer time in high throughput, change its type
from u32 to u64.

Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
---
 include/net/fq.h              | 2 +-
 net/mac80211/debugfs_netdev.c | 2 +-
 net/mac80211/debugfs_sta.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/net/fq.h b/include/net/fq.h
index ac944a6..70f8b12 100644
--- a/include/net/fq.h
+++ b/include/net/fq.h
@@ -53,7 +53,7 @@ struct fq_tin {
 	u32 overlimit;
 	u32 collisions;
 	u32 flows;
-	u32 tx_bytes;
+	u64 tx_bytes;
 	u32 tx_packets;
 };
 
diff --git a/net/mac80211/debugfs_netdev.c b/net/mac80211/debugfs_netdev.c
index cff0fb3..8d66f41 100644
--- a/net/mac80211/debugfs_netdev.c
+++ b/net/mac80211/debugfs_netdev.c
@@ -499,7 +499,7 @@ static ssize_t ieee80211_if_fmt_aqm(
 	len = scnprintf(buf,
 			buflen,
 			"ac backlog-bytes backlog-packets new-flows drops marks overlimit collisions tx-bytes tx-packets\n"
-			"%u %u %u %u %u %u %u %u %u %u\n",
+			"%u %u %u %u %u %u %u %u %llu %u\n",
 			txqi->txq.ac,
 			txqi->tin.backlog_bytes,
 			txqi->tin.backlog_packets,
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index 3aa618d..e54a6d6 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -168,7 +168,7 @@ static ssize_t sta_aqm_read(struct file *file, char __user *userbuf,
 			continue;
 		txqi = to_txq_info(sta->sta.txq[i]);
 		p += scnprintf(p, bufsz+buf-p,
-			       "%d %d %u %u %u %u %u %u %u %u %u 0x%lx(%s%s%s)\n",
+			       "%d %d %u %u %u %u %u %u %u %llu %u 0x%lx(%s%s%s)\n",
 			       txqi->txq.tid,
 			       txqi->txq.ac,
 			       txqi->tin.backlog_bytes,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
