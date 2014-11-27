Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtvJ4-0006OG-4E
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 09:24:11 +0000
Received: by mail-wi0-f181.google.com with SMTP id r20so7630412wiv.14
 for <ath10k@lists.infradead.org>; Thu, 27 Nov 2014 01:23:43 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 0/7] ath10k: add support for new wmi-tlv backend
Date: Thu, 27 Nov 2014 10:11:14 +0100
Message-Id: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
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

First 2 patches are simple fixes. Patch 3 isn't
strictly related to wmi-tlv but I decided to
include it anyway. Other patches gradually
implement wmi-tlv.

There's a bunch of false-positive checkpatch
warnings regarding `CHECK: No space is necessary
after a cast`.

v2:
 * a lot of fixes (see notes on patch #7)

Michal Kazior (7):
  ath10k: fix wmi svc bitmap dbg print
  ath10k: add sanity checks for service bmap parsing
  ath10k: make wmi service bitmap non-debug
  ath10k: implement intermediate event args
  ath10k: introduce wmi ops
  ath10k: make some wmi functions public
  ath10k: implement wmi-tlv backend

 drivers/net/wireless/ath/ath10k/Makefile   |    1 +
 drivers/net/wireless/ath/ath10k/ce.c       |    2 +
 drivers/net/wireless/ath/ath10k/core.c     |    4 +
 drivers/net/wireless/ath/ath10k/core.h     |    6 +-
 drivers/net/wireless/ath/ath10k/debug.c    |   12 +-
 drivers/net/wireless/ath/ath10k/debug.h    |    9 -
 drivers/net/wireless/ath/ath10k/hw.h       |    9 +
 drivers/net/wireless/ath/ath10k/mac.c      |   47 +
 drivers/net/wireless/ath/ath10k/spectral.c |    1 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h  |  820 ++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c  | 2218 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h  | 1380 +++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c      | 1359 ++++++++++-------
 drivers/net/wireless/ath/ath10k/wmi.h      |  386 +++--
 14 files changed, 5593 insertions(+), 661 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-ops.h
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-tlv.c
 create mode 100644 drivers/net/wireless/ath/ath10k/wmi-tlv.h

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
