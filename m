Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJeh6-0001dx-40
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 08:23:05 +0000
Subject: [PATCH v7 0/8] ath10k: firmware crash dump
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 19 Aug 2014 11:22:38 +0300
Message-ID: <20140819082038.16842.46876.stgit@potku.adurom.net>
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

new version of the firmware crash dump support for ath10k. Hopefully the last
one :)

Kalle

TODO for the future:

* atomic allocation in ath10k_pci_dump_dbglog() is bad. Should we
  allocate a big buffer with vmalloc and use that?

* dynamic allocation for BSS buffers

v7:

* really send "ath10k: print more driver info when firmware crashes",
  I had accidentally dropped it in previous series

* add ATH10K_FW_CRASH_DUMP_VERSION (Michal)

* remove extra newline (Michal)

* fix unprotected access of crashed_since_read in
  ath10k_fw_crash_dump_open() (Michal)

* take data_lock only once in ath10k_build_dump_file() (Michal)

* use vzalloc() instead of vmalloc() and memset() in
  ath10k_build_dump_file()

* fix memory leak in ath10k_debug_create() (Michal)

* always use little endian in the dump file and drop endian field from
  the dump file (Michal)

* print uuid in LE format

v6:

* fix vzalloc(sizeof(ar->debug.fw_crash_data)), fixes the crash I saw (Ben)

* "Target Register Dump" -> "firmware register dump"

* add ath10k_print_driver_info()

* take timestamp at crash time instead of crash-dump-gather time (Ben)

* fix locking comment in struct ath10k::fw (Ben)

* move "crash_data->crashed_since_read = true" to
  ath10k_debug_get_new_few_crash_data()

* ath10k_pci_hif_dump_area() holds the lock all the time so that we
  can guarantee that changes to ath10k_fw_crash_data are atomic

* take data_lock earlier in ath10k_build_dump_file() so that all
  access to crash_data is protected

* rename debugfs file fw_crash_dump

* fw_crash_dump debugfs files returns -ENODATA if there's no new
  crash dump

* store bss addresses and lengths as u32 in struct ath10k::fw

v5:

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

---

Ben Greear (5):
      ath10k: provide firmware crash info via debugfs
      ath10k: save firmware debug log messages
      ath10k: save firmware stack upon firmware crash
      ath10k: dump exception stack contents on firmware crash
      ath10k: save firmware RAM and ROM BSS sections on crash

Kalle Valo (3):
      ath10k: add ath10k_pci_diag_* helpers
      ath10k: rename ath10k_pci_hif_dump_area() to ath10k_pci_fw_crashed_dump()
      ath10k: print more driver info when firmware crashes


 drivers/net/wireless/ath/ath10k/core.c  |   71 +++++-
 drivers/net/wireless/ath/ath10k/core.h  |   45 ++++
 drivers/net/wireless/ath/ath10k/debug.c |  349 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/debug.h |   23 ++
 drivers/net/wireless/ath/ath10k/hw.h    |   34 +++
 drivers/net/wireless/ath/ath10k/pci.c   |  257 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/pci.h   |    3 
 drivers/net/wireless/ath/ath10k/wmi.c   |   10 +
 8 files changed, 746 insertions(+), 46 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
