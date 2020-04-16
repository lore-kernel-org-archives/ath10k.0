Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP333-00045P-PF
 for ath10k@lists.infradead.org; Thu, 16 Apr 2020 11:51:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 0/4] ath10k: sdio: improve power consumption
Date: Thu, 16 Apr 2020 14:50:55 +0300
Message-Id: <1587037859-28873-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Hi,

here's a patchset for improving power consumption on SDIO with some refactoring
and some small cleanups afterwards.

v2:

* rename ath10k_hif_swap_mailbox() to make it usable for this

* small cleanups found while doing the refactoring

* compile tested only

Kalle Valo (3):
  ath10k: rename ath10k_hif_swap_mailbox() to ath10k_hif_start_post()
  ath10k: sdio: remove _hif_ prefix from functions not part of hif
    interface
  ath10k: hif: make send_complete_check op optional

Wen Gong (1):
  ath10k: improve power save performance for sdio

 drivers/net/wireless/ath/ath10k/core.c |   2 +-
 drivers/net/wireless/ath/ath10k/hif.h  |  11 ++-
 drivers/net/wireless/ath/ath10k/sdio.c | 168 +++++++++++++++++++++++----------
 drivers/net/wireless/ath/ath10k/sdio.h |  16 ++++
 drivers/net/wireless/ath/ath10k/usb.c  |  12 ---
 5 files changed, 139 insertions(+), 70 deletions(-)

-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
