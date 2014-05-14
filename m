Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x233.google.com ([2a00:1450:4013:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkYDy-0005cL-Rw
 for ath10k@lists.infradead.org; Wed, 14 May 2014 12:23:55 +0000
Received: by mail-ee0-f51.google.com with SMTP id e51so1328398eek.10
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 05:23:32 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: fixes 2014-05-14
Date: Wed, 14 May 2014 14:16:24 +0200
Message-Id: <1400069786-9764-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This is another pair of patches.

It fixes a crash recently reported by Ben, but..

I've been able to find only a single code path
that called free_irq() twice in upstream code.
However it doesn't match the call trace reported
by Ben. I have to assume this is related to his
local patches or this is a very wierd case of
recovery race between userspace/mac80211/driver.


Michal Kazior (2):
  ath10k: fix core start sequence
  ath10k: prevent hif_stop being called twice

 drivers/net/wireless/ath/ath10k/core.c   | 101 +++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/htc.c    |   6 --
 drivers/net/wireless/ath/ath10k/htt.c    |  42 +------------
 drivers/net/wireless/ath/ath10k/htt.h    |  18 +++---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   4 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |   8 +--
 drivers/net/wireless/ath/ath10k/pci.c    |   3 +
 drivers/net/wireless/ath/ath10k/wmi.c    |   2 +-
 drivers/net/wireless/ath/ath10k/wmi.h    |   2 +-
 9 files changed, 79 insertions(+), 107 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
