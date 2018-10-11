Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAaI1-0000b7-5g
 for ath10k@lists.infradead.org; Thu, 11 Oct 2018 12:42:06 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 0/2] ath10k: Add support to update tx rate to mac80211
Date: Thu, 11 Oct 2018 18:15:02 +0530
Message-Id: <1539261904-9016-1-git-send-email-akolli@codeaurora.org>
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

Tx rate was updated to nl80211/user using sta_statistics callback.
This rate can not be used for mac80211 mesh and ATF.

This patch adds support to update tx rate to mac80211

Anilkumar Kolli (2):
  mac80211: implement ieee80211_tx_rate_update to update rate
  ath10k: report tx rate using ieee80211_tx_rate_update()

 drivers/net/wireless/ath/ath10k/core.h   |    1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c |   70 +++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/wmi.h    |    1 +
 include/net/mac80211.h                   |   15 +++++++
 net/mac80211/status.c                    |   22 ++++++++++
 5 files changed, 103 insertions(+), 6 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
