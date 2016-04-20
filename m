Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asvFG-0001fw-1h
 for ath10k@lists.infradead.org; Wed, 20 Apr 2016 16:44:54 +0000
Subject: [PATCH v2 0/8] ath10k: refactor firmware components
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 20 Apr 2016 19:44:22 +0300
Message-ID: <20160420164301.8801.12099.stgit@potku.adurom.net>
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

This series refactors various ath10k firmware components into struct
ath10k_fw_components which contains everything firmware related (board
files, meta data and so on). This makes it possible to kill
ath10k_tm_fetch_utf_firmware_api_2() from testmode.c.

Also REALLY old FW API 1 (firmware.bin and otp.bin) support is
removed.

v2:

o patch 1: remove all unused "firmware.bin" and "otp.bin" defines

o patch 2: remove a lefover FIXME comment, create local variable for
  ar->normal_mode_fw.fw_file.firmware

o patch 2: fix block comment styles

o patch 2: fix long lines

drivers/net/wireless/ath/ath10k/testmode.c:200: line over 90 characters
drivers/net/wireless/ath/ath10k/testmode.c:201: line over 90 characters

---

Kalle Valo (8):
      ath10k: remove deprecated firmware API 1 support
      ath10k: refactor firmware images to struct ath10k_fw_components
      ath10k: move fw_version inside struct ath10k_fw_file
      ath10k: move fw_features to struct ath10k_fw_file
      ath10k: move wmi_op_version to struct ath10k_fw_file
      ath10k: move htt_op_version to struct ath10k_fw_file
      ath10k: switch testmode to use ath10k_core_fetch_firmware_api_n()
      ath10k: remove enum ath10k_swap_code_seg_bin_type


 drivers/net/wireless/ath/ath10k/core.c     |  321 ++++++++++++----------------
 drivers/net/wireless/ath/ath10k/core.h     |   65 +++---
 drivers/net/wireless/ath/ath10k/debug.c    |   32 ++-
 drivers/net/wireless/ath/ath10k/htt.c      |    2 
 drivers/net/wireless/ath/ath10k/htt.h      |    1 
 drivers/net/wireless/ath/ath10k/htt_rx.c   |    2 
 drivers/net/wireless/ath/ath10k/htt_tx.c   |    9 +
 drivers/net/wireless/ath/ath10k/hw.h       |   12 -
 drivers/net/wireless/ath/ath10k/mac.c      |   21 +-
 drivers/net/wireless/ath/ath10k/pci.c      |    1 
 drivers/net/wireless/ath/ath10k/swap.c     |   44 ++--
 drivers/net/wireless/ath/ath10k/swap.h     |    9 -
 drivers/net/wireless/ath/ath10k/testmode.c |  197 +++--------------
 drivers/net/wireless/ath/ath10k/wmi.c      |   13 -
 drivers/net/wireless/ath/ath10k/wow.c      |    7 -
 15 files changed, 282 insertions(+), 454 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
