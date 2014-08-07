Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJlM-00027Y-1S
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:13:32 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so10246258wiv.7
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:06 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/6] ath10k: fixes 2014-08-07, part 1
Date: Thu,  7 Aug 2014 11:03:26 +0200
Message-Id: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
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

This is part 1 (of 3) of my patches. Split for
your reviewing pleasure.

This one is mostly non-functional (just cleanups)
except the removal of soc powersave.


Michal Kazior (6):
  ath10k: embed ar_pci inside ar
  ath10k: remove target soc ps code
  ath10k: remove pci features var
  ath10k: group some pci probing helpers
  ath10k: remove htc->stopped
  ath10k: move fw init print

 drivers/net/wireless/ath/ath10k/ce.c   |  68 +------
 drivers/net/wireless/ath/ath10k/core.c |  50 ++---
 drivers/net/wireless/ath/ath10k/core.h |   6 +-
 drivers/net/wireless/ath/ath10k/htc.c  |  16 --
 drivers/net/wireless/ath/ath10k/htc.h  |   5 +-
 drivers/net/wireless/ath/ath10k/mac.c  |   4 +-
 drivers/net/wireless/ath/ath10k/mac.h  |   2 +-
 drivers/net/wireless/ath/ath10k/pci.c  | 358 +++++++++++----------------------
 drivers/net/wireless/ath/ath10k/pci.h  |  78 ++-----
 9 files changed, 163 insertions(+), 424 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
