Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMH6q-0000gj-UO
 for ath10k@lists.infradead.org; Wed, 18 Sep 2013 12:43:57 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: tx performance patches
Date: Wed, 18 Sep 2013 14:43:17 +0200
Message-ID: <1379508202-9660-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This patchset reduces CPU load and improves
improves TX performance on AP135 by additional
30mbps (give or take; 560mbps -> 590mbps), at
least on my testbed.


Michal Kazior (5):
  ath10k: use num_pending_tx instead of msdu id bitmap
  ath10k: avoid needless memset on TX path
  ath10k: decouple HTT TX completions
  ath10k: cleanup HTT TX functions
  ath10k: use msdu headroom to store txfrag

 drivers/net/wireless/ath/ath10k/core.h   |   12 +-
 drivers/net/wireless/ath/ath10k/htc.c    |    2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c |    4 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  249 ++++++++++++------------------
 drivers/net/wireless/ath/ath10k/mac.c    |    9 +-
 drivers/net/wireless/ath/ath10k/txrx.c   |   65 +++-----
 drivers/net/wireless/ath/ath10k/txrx.h   |    5 +-
 7 files changed, 131 insertions(+), 215 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
