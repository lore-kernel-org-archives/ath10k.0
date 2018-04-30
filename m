Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD2Ha-0003n0-U0
 for ath10k@lists.infradead.org; Mon, 30 Apr 2018 06:27:32 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 0/2 linux-stable-4.4] ath10k: rebuild crypto header in rx data
 frames 
Date: Mon, 30 Apr 2018 11:56:25 +0530
Message-Id: <1525069587-19281-1-git-send-email-srirrama@codeaurora.org>
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
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, ath10k@lists.infradead.org

ath10k has a replay detection issue which was fixed in v4.14 and we would
like to get this security fix also to linux-stable-4.4.But for that it
depends on 3 mac80211 patches so the below mac80211 commits needs to be
picked first in the same order and then apply this patchset.

f980ebc058c2 : mac80211: allow not sending MIC up from driver for HW crypto
f631a77ba920 : mac80211: allow same PN for AMSDU sub-frames  
cef0acd4d7d4 : mac80211: Add RX flag to indicate ICV stripped

These patches should be applied in that order(commit f980ebc058c2 first)
and they should apply cleanly with 3-way merge.

Sriram R (2):
  ath10k: Add new hw param to identify alignment for different chipsets
  ath10k: rebuild crypto header in rx data frames

 drivers/net/wireless/ath/ath10k/core.c    |   8 +++
 drivers/net/wireless/ath/ath10k/core.h    |   4 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 108 +++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/rx_desc.h |   3 +
 4 files changed, 107 insertions(+), 16 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
