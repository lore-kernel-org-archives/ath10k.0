Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coACL-0005N8-8S
 for ath10k@lists.infradead.org; Wed, 15 Mar 2017 14:46:47 +0000
Subject: [PATCH v5 00/10] ath10k: sdio support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 15 Mar 2017 16:46:12 +0200
Message-ID: <148958913141.25727.15769281552095255609.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

I did some changes while reviewing Erik's SDIO patches. Only compile
tested, I don't have any SDIO boards at the moment.

Changes in v5:

* promote from RFC to PATCH

* move "ath10k: sdio support" patch to last

* in "ath10k: sdio get target info" fix sparse warning by changing tmp
  variable to __le32:

drivers/net/wireless/ath/ath10k/bmi.c:145:19: warning: cast to restricted __le32

* fix checkpatch warnings by renaming to struct ath10k_htc_lookahead_bundle:

drivers/net/wireless/ath/ath10k/htc.c:265: line over 90 characters
drivers/net/wireless/ath/ath10k/htc.c:357: line over 90 characters

* use switch statement in ath10k_core_get_fw_name()

* remove enable of fwlog from ath10k_sdio_extra_initialization(),
  that's not sdio specific and should be enabled separately (with a
  module parameter?)

* rename ath10k_sdio_extra_initialization() to ath10k_init_sdio()

* add warning to probe() that sdio support is not complete

* unify error and debug messagess

* whitespace changes

* move variable declarations to the beginning of the function

* remove unnecessary gotos

* small cosmetic changes

* add FIXME comments to unclear cases

still todo:

o fix remaining memory leaks (if any)

o endian support, eg ath10k_sdio_hif_set_mbox_sleep()

o are ath10k_sdio_io() and ath10k_sdio_read_write_sync() really
  necessary? looks like just an unnecessary abstraction layer

o write commit log for patch "ath10k: sdio support"

o improve Kconfig description


---

Erik Stromdahl (10):
      ath10k: htc: made static function public
      ath10k: htc: rx trailer lookahead support
      ath10k: htc: move htc ctrl ep connect to htc_init
      ath10k: htc: refactorization
      ath10k: various sdio related definitions
      ath10k: add sdio extra initializations
      ath10k: sdio get target info
      ath10k: htc: ready_ext msg support
      ath10k: different fw file names for usb and sdio
      ath10k: sdio support


 drivers/net/wireless/ath/ath10k/Kconfig     |    6 
 drivers/net/wireless/ath/ath10k/Makefile    |    3 
 drivers/net/wireless/ath/ath10k/bmi.c       |   71 +
 drivers/net/wireless/ath/ath10k/bmi.h       |    2 
 drivers/net/wireless/ath/ath10k/core.c      |   40 -
 drivers/net/wireless/ath/ath10k/core.h      |    3 
 drivers/net/wireless/ath/ath10k/debug.h     |    2 
 drivers/net/wireless/ath/ath10k/htc.c       |  243 ++-
 drivers/net/wireless/ath/ath10k/htc.h       |   39 -
 drivers/net/wireless/ath/ath10k/hw.h        |   53 +
 drivers/net/wireless/ath/ath10k/sdio.c      | 2102 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/sdio.h      |  263 +++
 drivers/net/wireless/ath/ath10k/targaddrs.h |   24 
 13 files changed, 2773 insertions(+), 78 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/sdio.c
 create mode 100644 drivers/net/wireless/ath/ath10k/sdio.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
