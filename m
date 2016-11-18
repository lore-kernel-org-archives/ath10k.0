Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7om1-0005rZ-Ib
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 19:24:34 +0000
Received: by mail-qk0-x244.google.com with SMTP id x190so34214175qkb.0
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 11:24:11 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 00/11] ath10k sdio support
Date: Fri, 18 Nov 2016 20:22:40 +0100
Message-Id: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
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

Changes since last version:

The BMI patch (no. 6 in the previous version) has been removed since
it is not used by the last (major) sdio patch.

The QCA65XX enum patch (no. 10 in the previous version) was also
removed since it was considered not necessary.

Added a new patch (no. 3) that removes two unused members in
struct ath10k_htc_ep. These removals makes it possible to connect
the HTC control endpoint before wait target (just as ath6kl does).

Updated commit comments for a few patches.

Other updates according to the comments from Michal Kazior and
Kalle Valo.

The new version was built and tested against:
tag: ath-201611151509


*Original description*

This patch series adds sdio support to ath10k.

Overview:
A new HIF layer: sdio/mailbox.
The current HIF ops are unaltered even though some ops
are not applicable for sdio.

The HTC layer has only suffered minor modifications:
- A few new functions for handling the mailbox specific
  RX trailers (lookahead reports)
- Some minor refactorization of the existing code
  (patches 3 and 4)

This is not included in this patch series:

- HTT High latency RX and TX support
- Full integration in core.c

The following basic tests have been made so far:

BMI fw load and firmware startup (all the steps in ath10k_core_start).
This means:

- HTT service connect
- WMI control service connect
- WMI unified init

The above mentioned bullets where verified with a QCA6584 chipset.

I have not been able to test the patch series together with
ath10k pcie hardware, but I will do so as soon as I can get
my hands on some hardware.

The patches have been built and tested against the ath tree:
git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
branch/tag: master/ath-201611090123

Erik Stromdahl (11):
  ath10k: htc: made static function public
  ath10k: htc: rx trailer lookahead support
  ath10k: htc: Removal of unused struct members
  ath10k: htc: Changed order of wait target and ep connect
  ath10k: htc: refactorization
  ath10k: htc: Added ATH10K_HTC_FLAG_BUNDLE_LSB
  ath10k: Added SDIO dbg masks
  ath10k: Added ATH10K_BUS_SDIO enum
  ath10k: Mailbox address definitions
  ath10k: Added more host_interest members
  ath10k: Added sdio support

 drivers/net/wireless/ath/ath10k/Kconfig     |    6 +
 drivers/net/wireless/ath/ath10k/Makefile    |    3 +
 drivers/net/wireless/ath/ath10k/core.h      |    3 +
 drivers/net/wireless/ath/ath10k/debug.h     |    2 +
 drivers/net/wireless/ath/ath10k/htc.c       |  214 ++-
 drivers/net/wireless/ath/ath10k/htc.h       |   38 +-
 drivers/net/wireless/ath/ath10k/hw.h        |   53 +
 drivers/net/wireless/ath/ath10k/sdio.c      | 1860 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/sdio.h      |  276 ++++
 drivers/net/wireless/ath/ath10k/targaddrs.h |   24 +
 10 files changed, 2407 insertions(+), 72 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/sdio.c
 create mode 100644 drivers/net/wireless/ath/ath10k/sdio.h

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
