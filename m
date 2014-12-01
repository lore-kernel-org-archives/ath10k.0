Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvQJq-0002mG-93
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 12:43:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Pull request: ath 20141201
Date: Mon, 1 Dec 2014 14:42:41 +0200
Message-ID: <871tojr16m.fsf@kamboji.qca.qualcomm.com>
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
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi John,

here's a pull request I'm hoping still to get to 3.19. The changelog is
below. Please let me know if you have any problems.

----------------------------------------------------------------------
Only ath10k changes this time and no major changes. Most visible are:

o new debugfs interface for runtime firmware debugging (Yanbo)

o fix shared WEP (Sujith)

o don't rebuild whenever kernel version changes (Johannes)

o lots of refactoring to make it easier to add new hw support (Michal)

There's also smaller fixes and improvements with no point of listing
here.

----------------------------------------------------------------------


The following changes since commit 47b6308b643302e642ca2a5cb6470926f7e1c428:

  ath9k: Move roc completion to the offchannel timer (2014-11-17 15:32:17 -0500)

are available in the git repository at:

  git://github.com/kvalo/ath.git for-linville

for you to fetch changes up to fe2407a889f7b6530b7e231e7c866f5c5d223657:

  ath10k: simplify rx ring size/fill calculation (2014-12-01 09:29:27 +0200)

----------------------------------------------------------------
Ben Greear (3):
      ath10k: add ATH10K_DBG_WMI_PRINT debug level
      ath10k: apply chainmask settings to vdev on creation
      ath10k: use configured nss instead of max nss

Johannes Berg (1):
      ath10k: don't rebuild all the time

Michal Kazior (23):
      ath10k: start using sk_buff_head
      ath10k: simplify Rx loop
      ath10k: refactor htt->rx_confused
      ath10k: unify rx undecapping
      ath10k: remove unused function argument
      ath10k: use rx descriptor for ppdu status extraction
      ath10k: report rx rate and signal for fragmented Rx
      ath10k: remove extra_tx_headroom
      ath10k: fix offchan reliability
      ath10k: make hw roc more reliable
      ath10k: fix offchannel cancel failures
      ath10k: don't drop corrupted mgmt frames
      ath10k: add missing goto
      ath10k: clean up num_peers locking
      ath10k: fix station count enforcement
      ath10k: add pointer constness to traces
      ath10k: fix wmi svc bitmap dbg print
      ath10k: add sanity checks for service bmap parsing
      ath10k: make wmi service bitmap non-debug
      ath10k: remove unused callback argument from struct ath10k_hif_cb::rx_completion
      ath10k: remove transfer_id from ath10k_hif_cb::tx_completion
      ath10k: prevent pci tx/rx starvation
      ath10k: simplify rx ring size/fill calculation

Sujith Manoharan (3):
      ath10k: fix shared WEP
      ath10k: fix locking for WEP keys
      ath10k: fix bug reported by lockdep

Vivek Natarajan (1):
      ath10k: do not limit RTS threshold value to 2347

Yanbo Li (2):
      ath10k: add register access debugfs interface
      ath10k: add memory dump debugfs interface

 drivers/net/wireless/ath/ath10k/core.c   |   13 +
 drivers/net/wireless/ath/ath10k/core.h   |   13 +-
 drivers/net/wireless/ath/ath10k/debug.c  |  262 ++++++-
 drivers/net/wireless/ath/ath10k/debug.h  |   10 +-
 drivers/net/wireless/ath/ath10k/hif.h    |   43 +-
 drivers/net/wireless/ath/ath10k/htc.c    |   13 +-
 drivers/net/wireless/ath/ath10k/htt.h    |    7 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c | 1169 +++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/htt_tx.c |    7 +-
 drivers/net/wireless/ath/ath10k/hw.h     |   15 +-
 drivers/net/wireless/ath/ath10k/mac.c    |  202 +++++-
 drivers/net/wireless/ath/ath10k/mac.h    |    4 +
 drivers/net/wireless/ath/ath10k/pci.c    |   28 +-
 drivers/net/wireless/ath/ath10k/trace.h  |   31 +-
 drivers/net/wireless/ath/ath10k/wmi.c    |   61 +-
 drivers/net/wireless/ath/ath10k/wmi.h    |  128 ++--
 16 files changed, 1257 insertions(+), 749 deletions(-)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
