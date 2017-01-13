Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS9NK-0005cO-Oa
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 21:27:11 +0000
Received: by mail-lf0-x241.google.com with SMTP id q89so7066552lfi.1
 for <ath10k@lists.infradead.org>; Fri, 13 Jan 2017 13:26:45 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v3 0/8] ath10k sdio support
Date: Fri, 13 Jan 2017 22:26:03 +0100
Message-Id: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

This is the third version of the sdio RFC patch series.
The actual sdio code (patch 6) has been subject to a massive overhaul,
mainly as a result of Kalle's review comments.
It no longer has any strong resemblance of the original ath6kl code from
which it was originally based upon.

Previous pathes 6 to 10 have been merged into one single patch.

The previous series had a rework of the "HTC fake service" connect
(ep 0 connect) that introduced a race between the actual endpoint
connect and the HTC ready message. This issue has been addressed,
and the current patches (3 and 4) has been rewritten accordingly.

* overview of patches *

Patches 1 to 4 are more or less identical to the previous RFC, with an
exception for patch 3 that changes the "HTC fake service" connect
(mentioned above).

Patch 5 is a squashed version of previous patches 6 to 10.

Patch 6 is the actual sdio patch

Patches 7 to 8 are new and adds special sdio versions of BMI get
target info and HTC ready.

The new version was built and tested against:
tag: ath-201701121109

Erik Stromdahl (8):
  ath10k: htc: made static function public
  ath10k: htc: rx trailer lookahead support
  ath10k: htc: move htc ctrl ep connect to htc_init
  ath10k: htc: refactorization
  ath10k: various sdio related definitions
  ath10k: sdio support
  ath10k: sdio get target info
  ath10k: htc: ready_ext msg support

 drivers/net/wireless/ath/ath10k/Kconfig     |    6 +
 drivers/net/wireless/ath/ath10k/Makefile    |    3 +
 drivers/net/wireless/ath/ath10k/bmi.c       |   70 +
 drivers/net/wireless/ath/ath10k/bmi.h       |    2 +
 drivers/net/wireless/ath/ath10k/core.c      |    5 +-
 drivers/net/wireless/ath/ath10k/core.h      |    3 +
 drivers/net/wireless/ath/ath10k/debug.h     |    2 +
 drivers/net/wireless/ath/ath10k/htc.c       |  241 ++-
 drivers/net/wireless/ath/ath10k/htc.h       |   39 +-
 drivers/net/wireless/ath/ath10k/hw.h        |   53 +
 drivers/net/wireless/ath/ath10k/sdio.c      | 2105 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/sdio.h      |  259 ++++
 drivers/net/wireless/ath/ath10k/targaddrs.h |   24 +
 13 files changed, 2737 insertions(+), 75 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/sdio.c
 create mode 100644 drivers/net/wireless/ath/ath10k/sdio.h

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
