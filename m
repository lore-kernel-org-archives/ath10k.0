Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqmX-00055V-5n
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:28:58 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh06.mail.saunalahti.fi (Postfix) with ESMTP id 46D0B69998
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:28:34 +0300 (EEST)
Subject: [PATCH v5 0/7] ath10k: firmware crash dump
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:28:25 +0300
Message-ID: <20140808201815.20713.85582.stgit@potku.adurom.net>
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

Hi,

here's my reworked Ben's patchset adding firmware crash dump support to ath10k.
Unfortunately this crashes when reading the stack dump from the firmware but
time run out for me to fix that and I wanted to send this for comments anyway.

I did quite a lot of changes, basically to simplify the code, remove ifdefs and
so on. Here's some sort of list what I did:

* dump_data->tv_sec and tv_nsec to 64 bits (because long can be 32 bits
  on some platforms)

* fix long lines

* renamed ath10k_dbg_save_fw_dbg_buffer() to ath10k_debug_dbglog_add()

* add helpers for ath10k_pci_diag* functions

* refactor and rename ath10k_pci_hif_dump_area()

* latest crash dump is always stored (instead of the oldest unread)

* add ath10k_debug_get_fw_crash_data()

* move fw_r?m_bss_* fields to ar->fw

* struct ath10k_fw_crash_data is allocated with vmalloc()

* atomic allocation in ath10k_pci_dump_bss() is bad, fix that by using vmalloc
  in module initialisation

* separate FW IE entries for BSS regions

* don't use ath10k_err()

* simplify locking and memory allocation for FW IE handling

* add uuid

* move struct ath10k_dump_file_data and enum ath10k_fw_error_dump_type to debug.c

* function and variable naming, using ath10k_fw_crash_ prefix etc

* change warning and debug messages to follow ath10k style

* add ath10k_debug_get_new_fw_crash_data() to avoid ifdefs in pci.c

And I still have TODO:

* rename crashed_since_read to crashed?

* atomic allocation in ath10k_pci_dump_dbglog() is bad. Should we
  allocate a big buffer with vmalloc and use that?

* what should ath10k_fw_error_dump_open() do if firmware hasn't
  crashed? check crashed_since_read and return zero len file? or an
  error code? -ENOMSG?

* should the crash dump file actually be in little endian? would that
  be easier/simpler?

* should ath10k_pci_hif_dump_area() hold the lock all the time? That
  way we would guarantee that changes to ath10k_fw_crash_data are
  atomic.

---

Ben Greear (5):
      ath10k: provide firmware crash info via debugfs
      ath10k: save firmware debug log messages
      ath10k: save firmware stack upon firmware crash
      ath10k: dump exception stack contents on firmware crash
      ath10k: save firmware RAM and ROM BSS sections on crash

Kalle Valo (2):
      ath10k: add ath10k_pci_diag_* helpers
      ath10k: rename ath10k_pci_hif_dump_area() to ath10k_pci_firmware_crashed()


 drivers/net/wireless/ath/ath10k/core.c  |   54 +++++
 drivers/net/wireless/ath/ath10k/core.h  |   43 ++++
 drivers/net/wireless/ath/ath10k/debug.c |  314 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.h |   22 ++
 drivers/net/wireless/ath/ath10k/hw.h    |   36 ++++
 drivers/net/wireless/ath/ath10k/pci.c   |  250 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/pci.h   |    3 
 drivers/net/wireless/ath/ath10k/wmi.c   |    6 +
 8 files changed, 701 insertions(+), 27 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
