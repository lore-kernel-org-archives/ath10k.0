Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLYFe-0003Sa-9Q
 for ath10k@lists.infradead.org; Mon, 16 Sep 2013 12:50:03 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 0/4] ath10k: improve RX performance
Date: Mon, 16 Sep 2013 14:49:13 +0200
Message-ID: <1379335757-15180-1-git-send-email-michal.kazior@tieto.com>
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

Patches depend on my RFC patch "mac80211: support
reporting A-MSDU subframes individually".


Michal.


Michal Kazior (4):
  ath10k: report A-MSDU subframes individually
  ath10k: document decap modes
  ath10k: cleanup RX decap handling
  ath10k: align RX frames properly

 drivers/net/wireless/ath/ath10k/htt.h     |    1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |  251 ++++++++++++-----------------
 drivers/net/wireless/ath/ath10k/hw.h      |    6 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h |   24 ++-
 drivers/net/wireless/ath/ath10k/txrx.c    |    5 +
 5 files changed, 135 insertions(+), 152 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
