Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx58d-000857-VG
 for ath10k@lists.infradead.org; Fri, 22 Feb 2019 07:20:53 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 0/4] Fix inconsistencies observed in population of tx_stats in
 debugfs
Date: Fri, 22 Feb 2019 12:50:30 +0530
Message-Id: <1550820034-18603-1-git-send-email-svishnoi@codeaurora.org>
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

Surabhi Vishnoi (4):
  ath10k: Fix the incorrect updation of NSS data in tx stats
  ath10k: Fix the wrong updation of BW in tx_stats debugfs entry
  ath10k: Fix the wrong updation of SGI in tx_stats debugfs
  ath10k: Fix the wrong calculation ht_idx and idx of rate table for
    tx_stats

 drivers/net/wireless/ath/ath10k/debugfs_sta.c |  8 +++++---
 drivers/net/wireless/ath/ath10k/htt_rx.c      | 25 +++++++++++++------------
 drivers/net/wireless/ath/ath10k/wmi.h         |  3 ++-
 3 files changed, 20 insertions(+), 16 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
