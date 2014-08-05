Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEeRl-0000yZ-23
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 13:06:40 +0000
Received: by mail-we0-f182.google.com with SMTP id k48so987375wev.27
 for <ath10k@lists.infradead.org>; Tue, 05 Aug 2014 06:05:54 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 0/2] ath10k: scan fixes 2014-07-21
Date: Tue,  5 Aug 2014 14:54:42 +0200
Message-Id: <1407243284-19803-1-git-send-email-michal.kazior@tieto.com>
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

v2:
 * addressed some comments from Kalle
 * fixed a few more issues


Michal Kazior (2):
  ath10k: simplify scan debug prints
  ath10k: introduce a stricter scan state machine

 drivers/net/wireless/ath/ath10k/core.c |   5 +-
 drivers/net/wireless/ath/ath10k/core.h |  27 +++-
 drivers/net/wireless/ath/ath10k/mac.c  | 238 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/mac.h  |   4 +-
 drivers/net/wireless/ath/ath10k/wmi.c  | 208 +++++++++++++++++++---------
 5 files changed, 317 insertions(+), 165 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
