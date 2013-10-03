Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRiiC-0002Ns-73
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 13:13:02 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 0/3] ath10k: fixes
Date: Thu, 3 Oct 2013 15:09:22 +0200
Message-ID: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
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
This comes from recent changes I've do to HTC/WMI.
WMI commands can now block so it's illegal to call
them in an atomic context anymore.

ath10k needs to setup some settings per-vdev (i.e.
per-interface) such as powersave, rts, fragmentation.
Until now mac80211 iteration functions were used.
However using non-atomic iteration function variant
doesn't solve the problem as it introduces an
issue with iflist_mtx deadlock in some cases.

I briefly tried to reproduce the issue Kalle
reported but was unsuccessful thus the "/RFT".



Michal Kazior (3):
  ath10k: fix add_interface failure handling
  ath10k: track vif list internally
  ath10k: fix scheduling while atomic config bug

 drivers/net/wireless/ath/ath10k/core.c |    2 +
 drivers/net/wireless/ath/ath10k/core.h |    3 +
 drivers/net/wireless/ath/ath10k/mac.c  |  199 ++++++++++++++++----------------
 3 files changed, 107 insertions(+), 97 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
