Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya1fc-0000GC-EL
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 12:41:29 +0000
Received: by lagg8 with SMTP id g8so132970913lag.1
 for <ath10k@lists.infradead.org>; Mon, 23 Mar 2015 05:41:05 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: load device specific board files
Date: Mon, 23 Mar 2015 12:38:19 +0000
Message-Id: <1427114301-18886-1-git-send-email-michal.kazior@tieto.com>
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

Until now it was okay to use a very generic board
data since OTP was supposed to fill in the blanks
(except some cases in which a complete cal data is
provided via cal-pci-xxx or device tree).

However since qca6174 this has changed. It is now
necessary to load specific board file for
different designs in driver. The OTP must still be
run.

Some devices with different subsystem
vendor/device ids may share the same board file.
Driver could maintain a subsystem vendor/device
id to design id however I prefer to just leave
this to userspace (e.g. symlinks). Thoughts?


Michal Kazior (2):
  ath10k: share board file loading code across FW APIs
  ath10k: allow loading device specific board files

 drivers/net/wireless/ath/ath10k/core.c  | 109 +++++++++++++++++++++-----------
 drivers/net/wireless/ath/ath10k/core.h  |   3 +
 drivers/net/wireless/ath/ath10k/debug.c |   6 +-
 drivers/net/wireless/ath/ath10k/pci.c   |   5 ++
 4 files changed, 84 insertions(+), 39 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
