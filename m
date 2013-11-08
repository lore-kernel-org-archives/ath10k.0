Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VegDi-0004TK-U7
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:11:07 +0000
Received: by mail-ee0-f53.google.com with SMTP id e51so780689eek.26
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:10:45 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 00/13] ath10k: pci fixes 2013-10-30
Date: Fri,  8 Nov 2013 08:01:22 +0100
Message-Id: <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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

This patchset contains a slew of PCI/CE cleanups
and fixes. The aim of the patchset is to deal with
CE null dereference bugs Ben has been reporting on
the mailing list for some time now.

v2:
 * fix prints
 * fix commit messages
 * add additional patch
   (ath10k: reset device upon stopping/power down)


Michal Kazior (13):
  ath10k: remove ar_pci->ce_count
  ath10k: don't forget to kill fw error tasklet
  ath10k: split tasklet killing function
  ath10k: rename ath10k_pci_reset_target()
  ath10k: make sure to mask all CE irqs
  ath10k: fix ath10k_ce_init() failpath
  ath10k: remove meaningless check
  ath10k: use ath10k_do_pci_wake/sleep
  ath10k: propagate ath10k_ce_disable_interrupts() errors
  ath10k: guard against CE corruption from firmware
  ath10k: re-arrange PCI init code
  ath10k: add and fix some PCI prints
  ath10k: reset device upon stopping/power down

 drivers/net/wireless/ath/ath10k/ce.c  |  57 +++++--
 drivers/net/wireless/ath/ath10k/ce.h  |   3 +-
 drivers/net/wireless/ath/ath10k/htc.c |   5 +
 drivers/net/wireless/ath/ath10k/pci.c | 293 ++++++++++++++++++----------------
 drivers/net/wireless/ath/ath10k/pci.h |   3 -
 5 files changed, 205 insertions(+), 156 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
