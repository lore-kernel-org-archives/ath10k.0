Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beNpl-00016K-Fv
 for ath10k@lists.infradead.org; Mon, 29 Aug 2016 14:46:47 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 0/5] ath10k: Allow setting coverage class and rx cleanups
Date: Mon, 29 Aug 2016 16:45:52 +0200
Message-Id: <20160829144557.11678-1-benjamin@sipsolutions.net>
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
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Michal Kazior <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

OK, another revision adding the fast path as suggested by Ben Greear. Only
other change is that I am submitting it together with Vasanthakumar's cleanup
patches to allow merging both into ath-next in one go.

Changes in v4:
 * Only queue register setting work if coverage class is non-zero
 * Add cleanup patches from Vasanthakumar into series

Changes in v3:
 * Only update register values if hardware is initialized
 * Use the SM/MS macros instead of manual bitshifts and masks
 * Use the hardware phyclk register instead of assuming a clock speed
 * Force dbglog_mask of ~0 and dbglog_level of at least WARN if active
 * Only call code for selected WMI events

The last two items are a bit of a guess for me. In particular it looks like
the default log level is already WARN, but I suppose that this should be good
enough to get reports for internal chip resets. I have no way of verifying
this myself though.


Benjamin Berg (1):
  ath10k: Allow setting coverage class

Vasanthakumar Thiagarajan (4):
  ath10k: Move ath10k_hw_params definition to hw.h
  ath10k: Add provision for Rx descriptor abstraction
  ath10k: Properly remove padding from the start of rx payload
  ath10k: Remove 4-addr padding related hw_param configuration

 drivers/net/wireless/ath/ath10k/core.c   |  32 +++++--
 drivers/net/wireless/ath/ath10k/core.h   |  61 +++---------
 drivers/net/wireless/ath/ath10k/htt_rx.c |  36 +++++---
 drivers/net/wireless/ath/ath10k/hw.c     | 154 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h     |  99 ++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/mac.c    |  19 ++++
 drivers/net/wireless/ath/ath10k/wmi.c    |  48 ++++++++++
 7 files changed, 373 insertions(+), 76 deletions(-)

-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
