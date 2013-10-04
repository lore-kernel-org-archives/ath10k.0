Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRyBT-0001NT-Mc
 for ath10k@lists.infradead.org; Fri, 04 Oct 2013 05:44:17 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT v2 0/4] ath10k: fixes
Date: Fri, 4 Oct 2013 07:43:41 +0200
Message-ID: <1380865425-3791-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
References: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This patchset addresses recently spotted issue
with (yet another) scheduling while atomic bug
(the other being WEP key index setting). This one
is related to hw_config() and powersave settings.
This comes from recent changes I've done to
HTC/WMI. WMI commands can block now so it's
illegal to call them in an atomic context anymore.

ath10k needs to setup some settings per-vdev (i.e.
per-interface) such as powersave, rts, fragmentation.
Until now mac80211 iteration functions were used.
However using non-atomic iteration function variant
doesn't solve the problem as it introduces an
issue with iflist_mtx deadlock in some cases.

I briefly tried to reproduce the issue Kalle
reported but was unsuccessful thus the "/RFT".

v2:
 * fix kbuild test robot warning
   (uninitialized `ret`)
 * add patch #4 that removes code that becomes
   unnecessary after patch #3


Michal Kazior (4):
  ath10k: fix add_interface failure handling
  ath10k: track vif list internally
  ath10k: fix scheduling while atomic config bug
  ath10k: remove unnecessary checks

 drivers/net/wireless/ath/ath10k/core.c |    2 +
 drivers/net/wireless/ath/ath10k/core.h |    3 +
 drivers/net/wireless/ath/ath10k/mac.c  |  200 +++++++++++++++-----------------
 3 files changed, 97 insertions(+), 108 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
