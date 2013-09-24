Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOSNR-000744-L1
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 13:10:06 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: improve RX performance
Date: Tue, 24 Sep 2013 15:09:13 +0200
Message-ID: <1380028158-861-1-git-send-email-michal.kazior@tieto.com>
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

This patchset gives clear RX performance
improvement on AP135. Throughput is at least
doubled (300mbps -> 600mbps, UDP RX, 2x2).

This contains a workaround for
retransmission/duplication recovery.

There's a pending patch for mac80211 that will
allow proper individiual A-MSDU subframe
reporting.

Changes since RFC:
 * comments fixes (Kalle)
 * one patch extracted/split (Kalle)
 * commit message adjustments


Michal Kazior (5):
  ath10k: report A-MSDU subframes individually
  ath10k: document decap modes
  ath10k: cleanup RX decap handling
  ath10k: fix Native Wifi decap mode RX
  ath10k: align RX frames properly

 drivers/net/wireless/ath/ath10k/htt_rx.c  |  273 ++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/hw.h      |    6 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h |   24 ++-
 drivers/net/wireless/ath/ath10k/txrx.c    |    2 +
 4 files changed, 158 insertions(+), 147 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
