Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSNX9-00022S-6Z
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 13:38:44 +0000
Subject: [PATCH v2 0/6] ath10k: firmware ramdump support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 22 Dec 2017 15:38:12 +0200
Message-ID: <151394982311.9382.1300230032038350642.stgit@potku.adurom.net>
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

here are patches adding firmware ramdump support to make it easier to
debug firmware crashes. This also removes the depracated fw_crash_dump
debugfs file.

Kalle

v2:

o patch 2: fix conflict in due to commit dafa42036012 ("ath10k: use 64-bit crash dump timestamps")

o patch 2: fix build errors when CONFIG_DEV_COREDUMP is disabled:

drivers/net/wireless/ath/ath10k/coredump.c:24:30: error: redefinition of 'ath10k_coredump_new'
drivers/net/wireless/ath/ath10k/coredump.c:130:5: error: redefinition of 'ath10k_coredump_submit'

o patch 5: fix coccinelli warning:

drivers/net/wireless/ath/ath10k/pci.c:1561:2-3: Unneeded semicolon

o patch 5: fix coccinelli warning:
  
drivers/net/wireless/ath/ath10k/pci.c:1522:6-15: WARNING: Unsigned expression compared with zero: skip_size < 0

  by changing the check to:

  if (cur_section->end > next_section->start) {

o patch 5: fix error handling when calling ath10k_pci_set_ram_config()

---

Alan Liu (1):
      ath10k: add memory dump support for QCA6174/QCA9377

Kalle Valo (5):
      ath10k: remove deprecated fw_crash_dump debugfs file
      ath10k: refactor firmware crashdump code to coredump.c
      ath10k: detach coredump.c from debug.c
      ath10k: add coredump_mask module parameter
      ath10k: add memory dump support QCA988X


 drivers/net/wireless/ath/ath10k/Makefile   |    1 
 drivers/net/wireless/ath/ath10k/core.c     |   31 +
 drivers/net/wireless/ath/ath10k/core.h     |   18 -
 drivers/net/wireless/ath/ath10k/coredump.c |  993 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/coredump.h |  225 ++++++
 drivers/net/wireless/ath/ath10k/debug.c    |  275 --------
 drivers/net/wireless/ath/ath10k/debug.h    |   16 
 drivers/net/wireless/ath/ath10k/hw.h       |    1 
 drivers/net/wireless/ath/ath10k/pci.c      |  221 ++++++
 9 files changed, 1482 insertions(+), 299 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/coredump.c
 create mode 100644 drivers/net/wireless/ath/ath10k/coredump.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
