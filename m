Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJly-0002OQ-BK
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:10 +0000
Received: by mail-wg0-f45.google.com with SMTP id x12so3866689wgg.16
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:48 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: fixes 2014-08-07, part 2
Date: Thu,  7 Aug 2014 11:04:15 +0200
Message-Id: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
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

This is based on:
  [PATCH 0/6] ath10k: fixes 2014-08-07, part 1


Michal Kazior (5):
  ath10k: fix legacy irq workaround
  ath10k: setup irq method in probe
  ath10k: remove early irq handling
  ath10k: split ce irq/handler setup
  ath10k: unmask ce irqs after posting rx buffers

 drivers/net/wireless/ath/ath10k/ce.c   |  36 ++---
 drivers/net/wireless/ath/ath10k/ce.h   |  12 +-
 drivers/net/wireless/ath/ath10k/core.h |   1 -
 drivers/net/wireless/ath/ath10k/pci.c  | 281 ++++++++++-----------------------
 4 files changed, 99 insertions(+), 231 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
