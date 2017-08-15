Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhX82-0000gt-AH
 for ath10k@lists.infradead.org; Tue, 15 Aug 2017 08:23:12 +0000
Subject: [PATCH 0/6] ath10k: firmware ramdump support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 15 Aug 2017 11:22:36 +0300
Message-ID: <150278532045.22482.14490702801292107536.stgit@potku.adurom.net>
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
 drivers/net/wireless/ath/ath10k/core.h     |   17 
 drivers/net/wireless/ath/ath10k/coredump.c |  993 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/coredump.h |  225 ++++++
 drivers/net/wireless/ath/ath10k/debug.c    |  275 --------
 drivers/net/wireless/ath/ath10k/debug.h    |   16 
 drivers/net/wireless/ath/ath10k/hw.h       |    1 
 drivers/net/wireless/ath/ath10k/pci.c      |  220 ++++++
 9 files changed, 1480 insertions(+), 299 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/coredump.c
 create mode 100644 drivers/net/wireless/ath/ath10k/coredump.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
