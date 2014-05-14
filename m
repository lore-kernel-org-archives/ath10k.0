Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkTFQ-0003IB-Pw
 for ath10k@lists.infradead.org; Wed, 14 May 2014 07:05:06 +0000
Received: by mail-ee0-f43.google.com with SMTP id d17so991982eek.16
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 00:04:40 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: warm reset fixes 2014-05-14
Date: Wed, 14 May 2014 08:57:36 +0200
Message-Id: <1400050658-2763-1-git-send-email-michal.kazior@tieto.com>
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

Warm reset was not able to recover from a device
crash so ath10k was falling back to cold reset
which would occasionally hang the system or
generate a data bus error with some device chips.

Warm reset now works a lot more reliably (at least
on my T430). It's able to recover from a "hard"
simulate fw crash and some firmware asserts I've
forced meaning it should recover in most cases
without falling back to the cold reset.

There's still one case of a crash warm reset is
incapable to recover from: IOMMU faults (when
supported and enabled and device tries to access
non-DMA mapped host memory) trigger device crash
and leave CE totally unresponsive before and after
the warm reset.


Michal Kazior (2):
  ath10k: improve warm reset reliability
  ath10k: retry warm reset a few times

 drivers/net/wireless/ath/ath10k/pci.c | 53 +++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
