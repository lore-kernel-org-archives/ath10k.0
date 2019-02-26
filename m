Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyZ23-0001Ll-C8
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 09:28:12 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH v2 0/4] Fix inconsistencies observed in population of tx_stats
 in debugfs
Date: Tue, 26 Feb 2019 14:57:54 +0530
Message-Id: <1551173278-20926-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

There are some inconsistencies observed while filling various peer tx stats in tx_stats
debugfs entry per sta.

This patchset fixes the wrong updation of NSS, SGI, Bandwidth and rate_table in tx_stats
debugfs entry per sta.

Changes from v1:
-Initialized the uninitialized variable flags in [Patch 3/4]

Surabhi Vishnoi (4):
  ath10k: Fix the incorrect updation of NSS data in tx stats
  ath10k: Fix the wrong updation of BW in tx_stats debugfs entry
  ath10k: Fix the wrong updation of SGI in tx_stats debugfs
  ath10k: Fix the wrong calculation ht_idx and idx of rate table for
    tx_stats

 drivers/net/wireless/ath/ath10k/debugfs_sta.c |  7 ++++---
 drivers/net/wireless/ath/ath10k/htt_rx.c      | 26 ++++++++++++++------------
 drivers/net/wireless/ath/ath10k/wmi.h         |  3 ++-
 3 files changed, 20 insertions(+), 16 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
