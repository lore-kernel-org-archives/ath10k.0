Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcAMU-0000GQ-Dj
 for ath10k@lists.infradead.org; Thu, 09 Oct 2014 09:50:19 +0000
Received: by mail-wg0-f46.google.com with SMTP id l18so838750wgh.17
 for <ath10k@lists.infradead.org>; Thu, 09 Oct 2014 02:49:52 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/3] ath10k: speed up recovery
Date: Thu,  9 Oct 2014 11:38:44 +0200
Message-Id: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
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


Michal Kazior (3):
  ath10k: fix possible bmi crash
  ath10k: expose hw restart via debugfs
  ath10k: speed up hw recovery

 drivers/net/wireless/ath/ath10k/ce.c    |  7 +++++++
 drivers/net/wireless/ath/ath10k/core.c  | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h  |  5 +++++
 drivers/net/wireless/ath/ath10k/debug.c |  7 ++++++-
 drivers/net/wireless/ath/ath10k/mac.c   | 14 ++++++++++++--
 drivers/net/wireless/ath/ath10k/mac.h   |  1 +
 drivers/net/wireless/ath/ath10k/pci.c   |  3 +++
 drivers/net/wireless/ath/ath10k/txrx.c  |  3 ++-
 drivers/net/wireless/ath/ath10k/wmi.c   |  4 ++++
 9 files changed, 56 insertions(+), 4 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
