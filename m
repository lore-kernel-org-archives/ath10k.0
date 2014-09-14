Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XT6Kf-0003xh-Cx
 for ath10k@lists.infradead.org; Sun, 14 Sep 2014 09:42:58 +0000
Subject: [PATCH 00/10] ath10k: checkpatch fixes from v3.17
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 14 Sep 2014 12:49:55 +0300
Message-ID: <20140914094728.9063.32593.stgit@x230>
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

Hi,

some fixes to recently added checkpatch warnings. Please review.

Kalle

---

Kalle Valo (10):
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


 drivers/net/wireless/ath/ath10k/bmi.h       |    1 
 drivers/net/wireless/ath/ath10k/ce.c        |    2 -
 drivers/net/wireless/ath/ath10k/ce.h        |   13 ++---
 drivers/net/wireless/ath/ath10k/debug.c     |   33 ++++++--------
 drivers/net/wireless/ath/ath10k/hif.h       |    1 
 drivers/net/wireless/ath/ath10k/htc.c       |   10 +---
 drivers/net/wireless/ath/ath10k/htc.h       |    1 
 drivers/net/wireless/ath/ath10k/htt.c       |    2 -
 drivers/net/wireless/ath/ath10k/htt.h       |    3 -
 drivers/net/wireless/ath/ath10k/htt_rx.c    |   52 +++++++++++----------
 drivers/net/wireless/ath/ath10k/htt_tx.c    |    2 -
 drivers/net/wireless/ath/ath10k/mac.c       |   45 ++++++++----------
 drivers/net/wireless/ath/ath10k/pci.c       |   37 ++++++++-------
 drivers/net/wireless/ath/ath10k/rx_desc.h   |    1 
 drivers/net/wireless/ath/ath10k/targaddrs.h |    1 
 drivers/net/wireless/ath/ath10k/txrx.c      |    2 -
 drivers/net/wireless/ath/ath10k/wmi.c       |   66 ++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/wmi.h       |   17 ++-----
 18 files changed, 132 insertions(+), 157 deletions(-)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
