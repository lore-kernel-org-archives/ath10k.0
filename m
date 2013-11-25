Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x231.google.com ([2a00:1450:4013:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkvw2-0006CD-Ai
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 13:10:43 +0000
Received: by mail-ea0-f177.google.com with SMTP id n15so2325428ead.22
 for <ath10k@lists.infradead.org>; Mon, 25 Nov 2013 05:10:18 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/8] ath10k: pci fixes 2013-11-22
Date: Mon, 25 Nov 2013 14:06:19 +0100
Message-Id: <1385384787-12470-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
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

v2:
 * simplify ath10k_pci_irq_pending()
 * combine memory leak fix patch with a
   functionality decoupling (it's very closely
   related)
 * fix 'irq: nobody cared'
 * change MSI/MSI-X disabling parameters
 * some minor fixes & code shuffling to avoid
   forward declarations


Michal Kazior (8):
  ath10k: don't consume other's shared interrupts
  ath10k: split up pci irq code
  ath10k: don't use interrupts for BMI
  ath10k: decouple ath10k_pci_start_ce()
  ath10k: defer irq registration until hif start()
  ath10k: extract functions for legacy irq handling
  ath10k: re-add support for early fw indication
  ath10k: allow explicit MSI/MSI-X disabling

 drivers/net/wireless/ath/ath10k/ce.c  |  15 -
 drivers/net/wireless/ath/ath10k/ce.h  |   1 -
 drivers/net/wireless/ath/ath10k/hw.h  |   1 +
 drivers/net/wireless/ath/ath10k/pci.c | 577 ++++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/pci.h |   1 +
 5 files changed, 383 insertions(+), 212 deletions(-)

-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
