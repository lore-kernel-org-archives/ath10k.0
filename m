Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDM-0000Cg-BC
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:33 +0000
Received: by mail-ea0-f175.google.com with SMTP id l15so485443eak.20
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 00/12] ath10k: pci fixes 2013-10-30
Date: Wed, 30 Oct 2013 12:42:14 +0100
Message-Id: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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

This patchset contains a slew of PCI/CE cleanups
and fixes. The aim of the patchset is to deal with
CE null dereference bugs Ben has been reporting on
the mailing list for some time now.

I've done some brief testing and don't see any
major regressions. I wasn't able to reproduce the
reported bugs though. @Ben: Could you perhaps test
this, please?


Michal Kazior (12):
  ath10k: remove ar_pci->ce_count
  ath10k: don't forget to kill fw error tasklet
  ath10k: split tasklet killing function
  ath10k: rename function to match it's role
  ath10k: make sure to mask all CE irqs
  ath10k: fix ath10k_ce_init() failpath
  ath10k: remove meaningless check
  ath10k: use ath10k_do_pci_wake/sleep
  ath10k: propagate ath10k_ce_disable_interrupts() errors
  ath10k: guard against CE corruption from firmware
  ath10k: re-arrange PCI init code
  ath10k: add some debug prints

 drivers/net/wireless/ath/ath10k/ce.c  |  56 ++++++---
 drivers/net/wireless/ath/ath10k/ce.h  |   3 +-
 drivers/net/wireless/ath/ath10k/htc.c |   5 +
 drivers/net/wireless/ath/ath10k/pci.c | 221 ++++++++++++++++++----------------
 drivers/net/wireless/ath/ath10k/pci.h |   3 -
 5 files changed, 161 insertions(+), 127 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
