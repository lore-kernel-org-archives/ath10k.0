Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcufT-00044g-3c
 for ath10k@lists.infradead.org; Thu, 25 Aug 2016 13:26:04 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCHv3 0/2] ath10k: Allow setting coverage class
Date: Thu, 25 Aug 2016 15:25:20 +0200
Message-Id: <20160825132522.30994-1-benjamin@sipsolutions.net>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Hi,

This revision of the patch has quite a number of changes, most notably the
handler to set the registers is now called from a work queue after a WMI
event.

The reason for this is that Sebastian reported that at least the WAVE2
chipsets do not behave well when the calls happen before the hardware is
initialized. This means we need to check ar->state, which in turn is
protected by conf_mutex, so the task is now pushed to the general work
queue to prevent having to hold the lock during the WMI event processing.

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

Changes in v2 were:
 * Move code into hw.c and run from new hw_ops depending on chip revision
 * Error message corrections

The patch assumes that a new hw_ops struct exists based on work by
Vasanthakumar. The rename patch is on top of "ath10k: Add provision for
Rx descriptor abstraction" and adjustment in either patchset will be
neccessary for merging.
What are the plans with regard to getting those patches merged (ath10k:
Padding related clean ups in rx)?

Benjamin Berg (2):
  ath10k: Rename hw_rx_desc_ops to hw_ops to use it for other purposes
  ath10k: Allow setting coverage class

 drivers/net/wireless/ath/ath10k/core.c |  35 +++++---
 drivers/net/wireless/ath/ath10k/core.h |  12 +++
 drivers/net/wireless/ath/ath10k/hw.c   | 143 ++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/hw.h   |  36 +++++++--
 drivers/net/wireless/ath/ath10k/mac.c  |  19 +++++
 drivers/net/wireless/ath/ath10k/wmi.c  |  37 +++++++++
 6 files changed, 263 insertions(+), 19 deletions(-)

-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
