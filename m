Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKo2O-0006OU-SH
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 12:33:50 +0000
Received: by mail-la0-f44.google.com with SMTP id el20so10154202lab.3
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 05:33:23 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/6] ath10k: ath10k: fixes 2014-08-07, part 2
Date: Fri, 22 Aug 2014 14:23:28 +0200
Message-Id: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
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

This is part 2 (of 3) of my patches. Split for
your reviewing pleasure.

This is related to irq handling only. Prepares for
more start/restart sequences fixes.

v2:
 * patch [1/6] is from part 1
 * patch [5/6] is new
 * some fixes, see notes
 * based on
   f2c7cb774e3e0a8152b1134015c245ba0abddfc6 and
   4 crash dump patches (v8) from Kalle


Michal Kazior (6):
  ath10k: move fw init print
  ath10k: fix legacy irq workaround
  ath10k: setup irq method in probe
  ath10k: split ce irq/handler setup
  ath10k: make sure to really disable irqs
  ath10k: remove early irq handling

 drivers/net/wireless/ath/ath10k/ce.c   |  36 ++--
 drivers/net/wireless/ath/ath10k/ce.h   |  12 +-
 drivers/net/wireless/ath/ath10k/core.c |   6 +-
 drivers/net/wireless/ath/ath10k/core.h |   1 -
 drivers/net/wireless/ath/ath10k/pci.c  | 320 +++++++++++++--------------------
 drivers/net/wireless/ath/ath10k/pci.h  |   1 -
 6 files changed, 142 insertions(+), 234 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
