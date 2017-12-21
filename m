Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRwlO-0000ZV-Uh
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 09:04:50 +0000
From: Govind Singh <govinds@qti.qualcomm.com>
Subject: [PATCH 00/10] *** HTT/CE changes for WCN3990 ***
Date: Thu, 21 Dec 2017 14:30:49 +0530
Message-Id: <1513846859-23639-1-git-send-email-govinds@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Govind Singh <govinds@qti.qualcomm.com>, linux-wireless@vger.kernel.org

This change adds HTT/CE layer support for WCN3990 target.
WCN3990 is the integrated chipset using System NOC
interconnect. This chipset uses 37 bit addressing mode,
due to this 64bit rx ring desc, tx desc and ce desc
support is added to enable extended addressing range.

These changes are validated on QCA6174 and WCN3990 target.

Govind Singh (9):
  ath10k: Update rx descriptor for WCN3990 target
  ath10k: Add support for 64 bit HTT in-order indication msg
  ath10k: Add support for 64 bit htt rx ring cfg
  ath10k: Add support for 64 bit HTT frag descriptor
  ath10k: Add support for htt_data_tx_desc_64 descriptor
  ath10k: Add hw param for rx ring size support
  ath10k: Add paddrs_ring_64 support for 64bit target
  ath10k: Use dma_addr_t for ce buffers to support 64bit target
  ath10k: Add support for 64 bit ce descriptor

Rakesh Pillai (1):
  ath10k: Add hw param for 64-bit address support

 drivers/net/wireless/ath/ath10k/ce.c      | 634 +++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/ce.h      |  58 ++-
 drivers/net/wireless/ath/ath10k/core.c    |  26 ++
 drivers/net/wireless/ath/ath10k/htt.c     |   7 +-
 drivers/net/wireless/ath/ath10k/htt.h     | 142 ++++++-
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 182 +++++++--
 drivers/net/wireless/ath/ath10k/htt_tx.c  | 598 +++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/hw.h      |   6 +
 drivers/net/wireless/ath/ath10k/mac.c     |   2 +-
 drivers/net/wireless/ath/ath10k/pci.c     |  10 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h |  50 +++
 11 files changed, 1507 insertions(+), 208 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
