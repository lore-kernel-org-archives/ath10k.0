Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xc9Ag-0002De-0Z
 for ath10k@lists.infradead.org; Thu, 09 Oct 2014 08:34:03 +0000
Received: by mail-wi0-f176.google.com with SMTP id hi2so12394584wib.15
 for <ath10k@lists.infradead.org>; Thu, 09 Oct 2014 01:33:37 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: pci related fixes 2014-10-09
Date: Thu,  9 Oct 2014 10:22:25 +0200
Message-Id: <1412842950-14098-1-git-send-email-michal.kazior@tieto.com>
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

Other 3 fix and cleanup device resetting.

Hopefully this will make ath10k a little more
robust when it comes to warm reset.

As a side effect of the changes ath10k now boots a
little faster (slightly over a second instead of
two).


Michal Kazior (5):
  ath10k: re-disable interrupts after target init
  ath10k: mask/unmask msi fw irq
  ath10k: make warm reset a bit safer and faster
  ath10k: split reset logic from power up
  ath10k: replace power up/down with reset callback

 drivers/net/wireless/ath/ath10k/core.c     |   7 +-
 drivers/net/wireless/ath/ath10k/hif.h      |  22 +--
 drivers/net/wireless/ath/ath10k/hw.h       |   1 +
 drivers/net/wireless/ath/ath10k/mac.c      |   8 +-
 drivers/net/wireless/ath/ath10k/pci.c      | 299 +++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/testmode.c |   8 +-
 6 files changed, 164 insertions(+), 181 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
