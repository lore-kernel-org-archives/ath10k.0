Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjqTq-0005x6-1y
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:09:14 +0000
Received: by mail-ee0-f50.google.com with SMTP id e53so608021eek.23
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:08:40 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/8] ath10k: pci fixes 2013-11-22
Date: Fri, 22 Nov 2013 14:05:10 +0100
Message-Id: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
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

ath10k didn't play well with other devices on a
shared irq line. This patchset fixes support for
shared legacy interrupts. 

Some rework was necessary because ath10k was using
disable_irq and CE irq masking (which is not
sufficient for shared interrupts).

Since main irq handlers are now registered after
boot, BMI is now polling for CE updates. I haven't
observed any differences in boot speed.

Also this plugs a leak I spotted during rework and
adds an option for testing different irq modes.


Michal Kazior (8):
  ath10k: don't consume other's shared interrupts
  ath10k: split up pci irq code
  ath10k: fix memory leak on hif_start failpath
  ath10k: don't use interrupts for BMI
  ath10k: defer irq registration until hif start()
  ath10k: extract functions for legacy irq handling
  ath10k: re-add support for early fw indication
  ath10k: allow explicit MSI/MSI-X disabling

 drivers/net/wireless/ath/ath10k/hw.h  |   1 +
 drivers/net/wireless/ath/ath10k/pci.c | 503 ++++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/pci.h |   1 +
 3 files changed, 333 insertions(+), 172 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
