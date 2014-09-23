Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWMNY-0000Tx-S3
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 09:27:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Pull request: ath 20140923
Date: Tue, 23 Sep 2014 12:26:58 +0300
Message-ID: <8738big00t.fsf@kamboji.qca.qualcomm.com>
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

a new pull request just with ath10k changes this time. Changelog below
and please let me know if there are any problems.

----------------------------------------------------------------------

The only new feature is testmode support from me. Ben added a new method
to crash the firmware with an assert for debug purposes. As usual, we
have lots of smaller fixes from Michal. Matteo fixed a Kconfig
dependency with debugfs. I fixed some warnings recently added to
checkpatch.

----------------------------------------------------------------------


The following changes since commit 6a5d088a923854569e20eac4f3f569926d5911ec:

  carl9170: tx: Replace rcu_assign_pointer() with RCU_INIT_POINTER() (2014-08-28 14:50:13 -0400)

are available in the git repository at:

  git://github.com/kvalo/ath.git for-linville

for you to fetch changes up to b25f32cb02155d68c690255ba846796a1c248fd3:

  ath10k: use ether_addr_copy() (2014-09-18 10:47:03 +0300)

----------------------------------------------------------------
Ben Greear (1):
      ath10k: support firmware crash-by-assert

Kalle Valo (12):
      ath10k: make ath10k_wmi_cmd_send() public
      ath10k: add testmode
      ath10k: fix parenthesis alignment warning in ath10k_htt_rx_alloc()
      ath10k: fix checkpatch warnings about parenthesis alignment
      ath10k: fix use of multiple blank lines
      ath10k: fix missing a blank line after declarations
      ath10k: fix space after a cast style errors
      ath10k: don't use return on void functions
      ath10k: else is not generally useful after a break or return
      ath10k: miscellaneous checkpatch fixes
      ath10k: reformat help text in ath10k_read_simulate_fw_crash()
      ath10k: use ether_addr_copy()

Matteo Croce (1):
      ath10k: ATH10K_DEBUGFS depends on DEBUG_FS

Michal Kazior (11):
      ath10k: re-enable interrupts properly in hw recovery
      ath10k: fix num_legacy_stations tracking
      ath10k: kill tasklets after free_irq
      ath10k: fix monitor start/stop sequences
      ath10k: stop monitor vdev for sta assoc
      ath10k: remove diag_*_access functions
      ath10k: add device/driver strings to tracepoints
      ath10k: don't access tx_info while overwriting it
      ath10k: move fw_crash_dump allocation
      ath10k: use proper service bitmap size
      ath10k: fix debugfs_create_dir() checking

 drivers/net/wireless/ath/ath10k/Kconfig      |    2 +-
 drivers/net/wireless/ath/ath10k/Makefile     |    1 +
 drivers/net/wireless/ath/ath10k/bmi.h        |    1 -
 drivers/net/wireless/ath/ath10k/ce.c         |    2 -
 drivers/net/wireless/ath/ath10k/ce.h         |   13 +-
 drivers/net/wireless/ath/ath10k/core.c       |  106 +++++--
 drivers/net/wireless/ath/ath10k/core.h       |   25 +-
 drivers/net/wireless/ath/ath10k/debug.c      |  102 ++++---
 drivers/net/wireless/ath/ath10k/debug.h      |   12 +
 drivers/net/wireless/ath/ath10k/hif.h        |    1 -
 drivers/net/wireless/ath/ath10k/htc.c        |   10 +-
 drivers/net/wireless/ath/ath10k/htc.h        |    1 -
 drivers/net/wireless/ath/ath10k/htt.c        |    2 +-
 drivers/net/wireless/ath/ath10k/htt.h        |    3 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c     |   54 ++--
 drivers/net/wireless/ath/ath10k/htt_tx.c     |    2 -
 drivers/net/wireless/ath/ath10k/hw.h         |    2 +
 drivers/net/wireless/ath/ath10k/mac.c        |  192 ++++++-------
 drivers/net/wireless/ath/ath10k/pci.c        |  183 ++++--------
 drivers/net/wireless/ath/ath10k/rx_desc.h    |    1 -
 drivers/net/wireless/ath/ath10k/targaddrs.h  |    1 -
 drivers/net/wireless/ath/ath10k/testmode.c   |  382 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/testmode.h   |   46 ++++
 drivers/net/wireless/ath/ath10k/testmode_i.h |   70 +++++
 drivers/net/wireless/ath/ath10k/trace.h      |  105 +++++--
 drivers/net/wireless/ath/ath10k/txrx.c       |    2 +-
 drivers/net/wireless/ath/ath10k/wmi.c        |  103 ++++---
 drivers/net/wireless/ath/ath10k/wmi.h        |   33 +--
 28 files changed, 1017 insertions(+), 440 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode.h
 create mode 100644 drivers/net/wireless/ath/ath10k/testmode_i.h

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
