Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIgP1-0003Wo-CB
 for ath10k@lists.infradead.org; Sun, 08 Sep 2013 14:55:53 +0000
Subject: [PATCH 0/8] ath10k: boot, bmi and mac debug message cleanup
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 08 Sep 2013 17:55:25 +0300
Message-ID: <20130908145435.3136.49168.stgit@localhost6.localdomain6>
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

Simple message log cleanup. Please review.

---

Kalle Valo (8):
      ath10k: add BMI log level
      ath10k: rename ATH10K_DBG_CORE to BOOT
      ath10k: cleanup debug messages in core.c
      ath10k: add boot debug messages to pci.c and ce.c
      ath10k: add boot debug messages to htc.c
      ath10k: add boot messages to htt.c
      ath10k: clean mac.c debug messages
      ath10k: print phymode as a string


 drivers/net/wireless/ath/ath10k/bmi.c    |   42 ++++---
 drivers/net/wireless/ath/ath10k/ce.c     |    8 +
 drivers/net/wireless/ath/ath10k/core.c   |   11 +-
 drivers/net/wireless/ath/ath10k/debug.h  |    3 
 drivers/net/wireless/ath/ath10k/htc.c    |   16 +--
 drivers/net/wireless/ath/ath10k/htt_rx.c |    2 
 drivers/net/wireless/ath/ath10k/htt_tx.c |    2 
 drivers/net/wireless/ath/ath10k/mac.c    |  185 ++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/pci.c    |    6 +
 drivers/net/wireless/ath/ath10k/wmi.h    |   42 +++++++
 10 files changed, 197 insertions(+), 120 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
