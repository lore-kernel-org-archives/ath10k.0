Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3MA-0002k5-Fb
 for ath10k@lists.infradead.org; Tue, 28 Oct 2014 09:46:26 +0000
Received: by mail-la0-f41.google.com with SMTP id pn19so251330lab.14
 for <ath10k@lists.infradead.org>; Tue, 28 Oct 2014 02:46:04 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 0/3] ath10k: speed up recovery
Date: Tue, 28 Oct 2014 10:34:35 +0100
Message-Id: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
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

Patch #1 fixes a bug I've found while testing
patches #2 and #3. It's safe to cherry-pick it in
case patches #2 and/or #3 aren't accepted or need
a re-spin.

I've mainly used patch #2 to test reset and
recovery. It's pretty handy for (stress-)testing.

Patch #3 should improve recovery speed in some
cases. Notably when there's a long chain of WMI
commands involved which take a painfully long time
to timeout/complete if firmware crashes mid-way.

Note: Patches #2 and #3 depend on `ath10k: pci
related fixes 2014-10-09`. Without the patchset
patches #2 and #3 must not be applied. Patch #1 is
fine though.

v3:
 * skip shadow ring cleanup in #1

Michal Kazior (3):
  ath10k: fix possible bmi crash
  ath10k: expose hw restart via debugfs
  ath10k: speed up hw recovery

 drivers/net/wireless/ath/ath10k/ce.c     |  7 +++++++
 drivers/net/wireless/ath/ath10k/core.c   | 23 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h   |  5 +++++
 drivers/net/wireless/ath/ath10k/debug.c  |  7 ++++++-
 drivers/net/wireless/ath/ath10k/htt_tx.c |  1 -
 drivers/net/wireless/ath/ath10k/mac.c    | 14 ++++++++++++--
 drivers/net/wireless/ath/ath10k/mac.h    |  1 +
 drivers/net/wireless/ath/ath10k/pci.c    |  3 +++
 drivers/net/wireless/ath/ath10k/txrx.c   |  3 ++-
 drivers/net/wireless/ath/ath10k/wmi.c    |  5 ++++-
 10 files changed, 63 insertions(+), 6 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
