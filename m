Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwr6p-0002AR-AV
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 16:22:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 0/4] ath10k: small fixes for SDIO support
Date: Thu, 21 Feb 2019 18:21:54 +0200
Message-Id: <1550766118-31703-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Wen has refactored some of the Alagu's fixes and wrote one of his own. I then
cleaned up the commit logs.

Alagu Sankar (3):
  ath10k: sdio: set hi_acs_flags
  ath10k: sdio: disable fwlog prints
  ath10k: don't report unset rssi values to mac80211

Wen Gong (1):
  ath10k: sdio: reset chip on power_down()

 drivers/net/wireless/ath/ath10k/core.c   | 19 ++++++++++++++++---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 12 +++++++++---
 drivers/net/wireless/ath/ath10k/sdio.c   | 24 ++++++++++++++++--------
 3 files changed, 41 insertions(+), 14 deletions(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
