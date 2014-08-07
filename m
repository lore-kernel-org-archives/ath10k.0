Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJmZ-0002n2-QG
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:48 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so10248263wiv.7
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:14:26 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/5] ath10k: fixes 2014-08-07, part 3
Date: Thu,  7 Aug 2014 11:05:03 +0200
Message-Id: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
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

This is part 3 (of 3) of my patches. Split for
your reviewing pleasure.

This is related to start/restart sequences.

This is based on:
  [PATCH 0/5] ath10k: fixes 2014-08-07, part 2


Michal Kazior (5):
  ath10k: rework posting pci rx buffers
  ath10k: dont reset the chip on hif_stop
  ath10k: ignore ar_pci->started in pipe cleanup
  ath10k: remove ar_pci->started
  ath10k: flush hif buffers before recovery

 drivers/net/wireless/ath/ath10k/ce.c   |  71 +++++----
 drivers/net/wireless/ath/ath10k/ce.h   |  16 +-
 drivers/net/wireless/ath/ath10k/core.c |   1 +
 drivers/net/wireless/ath/ath10k/hif.h  |   3 +-
 drivers/net/wireless/ath/ath10k/pci.c  | 279 ++++++++++++++++-----------------
 drivers/net/wireless/ath/ath10k/pci.h  |   4 +-
 6 files changed, 185 insertions(+), 189 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
