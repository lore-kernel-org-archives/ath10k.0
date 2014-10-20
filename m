Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgC51-0001kb-PE
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 12:28:56 +0000
Received: by mail-la0-f47.google.com with SMTP id pv20so3873451lab.34
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 05:28:27 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/6] ath10k: pci related fixes 2014-10-09
Date: Mon, 20 Oct 2014 14:14:36 +0200
Message-Id: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
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

First 2 patches address some irq issues.

Other 4 fix and cleanup device resetting.

Hopefully this will make ath10k a little more
robust when it comes to warm reset.

As a side effect of the changes ath10k now boots a
little faster (slightly over a second instead of
two).

v2:
 * don't remove power_up/down [Kalle]
 * fix CE crash [Janusz]
 * remove irq workaround in patch #2


Michal Kazior (6):
  ath10k: re-disable interrupts after target init
  ath10k: mask/unmask msi fw irq
  ath10k: split ce pipe init/alloc further
  ath10k: make warm reset a bit safer and faster
  ath10k: split reset logic from power up
  ath10k: don't reset chip on power_down

 drivers/net/wireless/ath/ath10k/ce.c  |  56 +++--
 drivers/net/wireless/ath/ath10k/ce.h  |   8 +-
 drivers/net/wireless/ath/ath10k/hw.h  |   1 +
 drivers/net/wireless/ath/ath10k/pci.c | 390 +++++++++++++++++-----------------
 4 files changed, 227 insertions(+), 228 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
