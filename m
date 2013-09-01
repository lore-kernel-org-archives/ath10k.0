Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG2vY-0000QM-BW
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 08:22:33 +0000
Subject: [PATCH v2 0/2] ath10k: detect hw1.0 boards
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 01 Sep 2013 11:22:06 +0300
Message-ID: <20130901082007.1930.79088.stgit@localhost6.localdomain6>
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

Here's a patchset which detects hw1.0 from the
chip id register and fails the probe if found.

v2:

o use SOC_CHIP_ID_REV_MASK

o move detection to core.c so that it's not just PCI
  specific

o add debugfs file for reading the chip id

---

Kalle Valo (2):
      ath10k: check chip id from the soc register during probe
      ath10k: add chip_id file to debugfs


 drivers/net/wireless/ath/ath10k/core.c  |   35 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/core.h  |    3 ++-
 drivers/net/wireless/ath/ath10k/debug.c |   22 +++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h    |    8 +++++++
 drivers/net/wireless/ath/ath10k/pci.c   |   15 ++++++++++++-
 5 files changed, 79 insertions(+), 4 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
