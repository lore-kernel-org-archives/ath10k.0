Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFKeT-0006pS-BO
 for ath10k@lists.infradead.org; Mon, 17 Feb 2014 09:38:14 +0000
Received: by mail-ee0-f42.google.com with SMTP id b15so6966456eek.1
 for <ath10k@lists.infradead.org>; Mon, 17 Feb 2014 01:37:51 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC/RFT 0/7] ath10k: performance improvements
Date: Mon, 17 Feb 2014 10:32:36 +0100
Message-Id: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

These patches aim at reducing host CPU load and
thus improve performance on low-end systems.

In my setup I get a relative improvement of
100mbps for both UDP Tx and Rx.

               Tx ----->
laptop:eth---eth:AP135:ath10k---ath10k:laptop
               <----- Rx


Michal Kazior (7):
  ath10k: remove DMA mapping wrappers
  ath10k: remove is_aborted from skb_cb
  ath10k: replace send_head() with tx_sg()
  ath10k: bypass htc for htt tx path
  ath10k: batch htt tx/rx completions
  ath10k: remove pci completion list
  ath10k: minimize coherent dma accesses

 drivers/net/wireless/ath/ath10k/ce.c     |  16 +-
 drivers/net/wireless/ath/ath10k/ce.h     |   9 +-
 drivers/net/wireless/ath/ath10k/core.h   |  33 +--
 drivers/net/wireless/ath/ath10k/hif.h    |  25 +-
 drivers/net/wireless/ath/ath10k/htc.c    |  25 +-
 drivers/net/wireless/ath/ath10k/htt.h    |  16 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 152 +++++++-----
 drivers/net/wireless/ath/ath10k/htt_tx.c | 207 ++++++++--------
 drivers/net/wireless/ath/ath10k/mac.c    |   4 +-
 drivers/net/wireless/ath/ath10k/pci.c    | 389 +++++++------------------------
 drivers/net/wireless/ath/ath10k/pci.h    |  28 ---
 drivers/net/wireless/ath/ath10k/txrx.c   |  15 +-
 drivers/net/wireless/ath/ath10k/wmi.c    |  17 +-
 13 files changed, 382 insertions(+), 554 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
