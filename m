Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3NF5-0006BS-Nb
 for ath10k@lists.infradead.org; Mon, 11 Mar 2019 15:53:32 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 0/2] Fix tx stats inconsistencies
Date: Mon, 11 Mar 2019 21:23:20 +0530
Message-Id: <1552319602-17795-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

The rate table indexes and the NSS values are
incorrect, causing the tx stats to be displayed
incorrectly.

This patchset fix these issues in the tx stats
displayed via debugfs.

Rakesh Pillai (2):
  ath10k: Fix rate table updation in tx stats
  ath10k: Fix NSS tx stats for legacy rates

 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
