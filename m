Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsSXT-0008Hb-Cg
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 07:56:44 +0000
Received: by mail-wg0-f48.google.com with SMTP id n12so393318wgh.19
 for <ath10k@lists.infradead.org>; Thu, 05 Jun 2014 00:56:17 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: pci fixes 2014-06-05
Date: Thu,  5 Jun 2014 09:48:38 +0200
Message-Id: <1401954520-3365-1-git-send-email-michal.kazior@tieto.com>
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

I've found a few issues while I was testing ath10k
in QEMU/KVM with PCI passthrough. The second patch
is something that I've found while analysing the
bmi race and I don't think anyone experienced
problems associated with it.

There's still a weird synchronization issue with
(what I think is) iomap write propagation. The
initial fw bootup interrupt doesn't come in and
it seems CE interrupts are unmasked with a lag
because explicit polling after ctl_resp timeout
seems to be sufficient to work around it. I
suspect this might be a virtualization problem
rather than ath10k. Ideas, anyone?


Michal Kazior (2):
  ath10k: fix bmi exchange tx/rx race
  ath10k: sanitize tx ring index access properly

 drivers/net/wireless/ath/ath10k/ce.c  | 11 +++++++----
 drivers/net/wireless/ath/ath10k/pci.c | 11 +++--------
 drivers/net/wireless/ath/ath10k/pci.h |  3 ++-
 3 files changed, 12 insertions(+), 13 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
