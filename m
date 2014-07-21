Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Bdw-0002lL-G1
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 11:20:33 +0000
Received: by mail-we0-f175.google.com with SMTP id t60so7411029wes.34
 for <ath10k@lists.infradead.org>; Mon, 21 Jul 2014 04:20:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: scan fixes 2014-07-21
Date: Mon, 21 Jul 2014 13:11:19 +0200
Message-Id: <1405941081-17359-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, sw@simonwunderlich.de

Hi,

This addresses an issue found by Janusz with
current spectral scan patches from Simon.

This goes along patch `ath10k: prevent endless pci rx
loop` I've posted a few days ago.

There seems to be a condition in firmware which
causes some WMI events to be not delivered by
firmware to host most likely due to CE/PCI pipe
being full (that's a guess judging by the huge
amount of phyerrs reported and their behaviour
while spectral scan is enabled). This also
suggests some SWBA events may be dropped by
firmware when spectral scan is running (same goes
for management rx).

@Simon: you may be interested in applying these
patches if you run into trouble while testing
spectral scan + hw_scan/hw_roc.

@Ben: since you reported some scan issues in the
past you may be interested in this as well.


Michal Kazior (2):
  ath10k: introduce a stricter scan state machine
  ath10k: simplify scan debug prints

 drivers/net/wireless/ath/ath10k/core.c |   4 +-
 drivers/net/wireless/ath/ath10k/core.h |  10 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 219 +++++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/mac.h  |   3 +-
 drivers/net/wireless/ath/ath10k/wmi.c  | 210 ++++++++++++++++++++++---------
 5 files changed, 290 insertions(+), 156 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
