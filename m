Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyxIE-0006tT-Uj
 for ath10k@lists.infradead.org; Wed, 27 Feb 2019 11:22:32 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 0/2] Exdented HTT stats support and provide debugfs
Date: Wed, 27 Feb 2019 16:53:41 +0530
Message-Id: <1551266621-31981-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, vikpatel@codeaurora.org, arnagara@codeaurora.org, linux-wireless@vger.kernel.org

Extended the bit mask value for the HTT stats (Mu-MIMO related)
which are retrieved via tracing.

Provided debugfs provision to reset the HTT stats which helps to
get the aggregated stats via tracing. Before that we could not get
the accumulated stats.

Maharaja Kennadyrajan (2):
  ath10k: Extended the HTT stats support to retrieve Mu-MIMO related
    stats
  ath10k: Added support to reset HTT stats in debugfs

 drivers/net/wireless/ath/ath10k/core.h   |  1 +
 drivers/net/wireless/ath/ath10k/debug.c  | 47 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/htt.h    |  4 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  9 +++--
 4 files changed, 53 insertions(+), 8 deletions(-)

-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
