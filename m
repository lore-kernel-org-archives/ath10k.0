Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWkZE-0003xN-B4
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 11:17:05 +0000
Subject: [PATCH v3 0/3] ath10k: export calibration data to user space
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 24 Sep 2014 14:16:39 +0300
Message-ID: <20140924111416.6539.95299.stgit@potku.adurom.net>
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

Here's a small patchset exporting firmware calibration data to user space. This
makes it easier to debug various calibration data related problems.

Please comment.

v3:

* patch 1: fix comment style (Michal)

* patch 3: use ath10k_debug_ prefix (Michal)

v2:

* never unmask the diagnostic window copy engine pipe in
  ath10k_ce_enable_interrupts()

* add locking for diag_read_mem()/diag_write_mem()

---

Kalle Valo (3):
      ath10k: don't enable interrupts for the diagnostic window
      ath10k: add diag_read() to hif ops
      ath10k: add cal_data debugfs file


 drivers/net/wireless/ath/ath10k/ce.c    |   27 ++++++----
 drivers/net/wireless/ath/ath10k/ce.h    |   13 +++++
 drivers/net/wireless/ath/ath10k/debug.c |   82 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hif.h   |   10 ++++
 drivers/net/wireless/ath/ath10k/hw.h    |    2 +
 drivers/net/wireless/ath/ath10k/pci.c   |   51 ++++++++++++-------
 6 files changed, 155 insertions(+), 30 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
