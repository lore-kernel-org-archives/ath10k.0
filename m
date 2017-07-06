Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT5e1-0005ci-2N
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 12:12:30 +0000
Subject: [PATCH v3 0/2] ath10k usb support
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 6 Jul 2017 15:11:42 +0300
Message-ID: <149934296332.20024.5652905816164718891.stgit@potku.adurom.net>
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

Here's v3 of usb support patches. I mostly cosmetic changes to follow
the style used elsewhere in ath10k. Only compile tested, but it should
still work :)

I think these are now ready for commit. I did have few open questions
(but they don't prevent committing these):

* why atomic allocations?

* why some of the error messages use ath10k_dbg()?

* ath10k_usb_submit_ctrl_out() & ath10k_usb_submit_ctrl_in(): is size == 0 a valid transmission?

Changelog:

v3:

* squash patches 1 and 2

* simplify is_trailer_only_msg()

* unify debug message style ("usb foo %d bar 0x%x")

* use %pK

* don't use __func__ in debug messages, make sure debug messages are unique 

* cosmetic style changes

* remove err labels which just have return and nothing else

* fix error handling in ath10k_usb_probe()

* update MODULE_DESCRIPTION()

v2:

* separate high latency code to a separate patchset

---

Erik Stromdahl (2):
      ath10k: various usb related definitions
      ath10k: add initial USB support


 drivers/net/wireless/ath/ath10k/Kconfig  |    7 
 drivers/net/wireless/ath/ath10k/Makefile |    3 
 drivers/net/wireless/ath/ath10k/core.c   |    1 
 drivers/net/wireless/ath/ath10k/core.h   |    3 
 drivers/net/wireless/ath/ath10k/debug.h  |    2 
 drivers/net/wireless/ath/ath10k/usb.c    | 1106 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/usb.h    |  128 +++
 7 files changed, 1250 insertions(+)
 create mode 100644 drivers/net/wireless/ath/ath10k/usb.c
 create mode 100644 drivers/net/wireless/ath/ath10k/usb.h


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
