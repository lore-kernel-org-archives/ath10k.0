Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYufX-0003aZ-0R
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 11:00:48 +0000
Received: by lbbrr9 with SMTP id rr9so8031873lbb.0
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 04:00:23 -0700 (PDT)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH v4 0/6] ath10k: add basic tdls support
Date: Fri, 20 Mar 2015 12:02:53 +0100
Message-Id: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>

This patchset introduces tdls funtionality without tdls peer uapsd
and tdls channel switching. Tdls is supported by qca6174 hardware 
what is indicated by firmware through supported services.
Tdls station when authorized requires some parameters that are filled in 
by rate control initialization. Rate control for tdls is initialized
at proper time in mac80211 patch:
mac80211: initialize rate control earlier for tdls station

So tdls funtionality implemented by this patchset depends on 
mac80211: initialize rate control earlier for tdls station

v2:
-introduce tdls peer counter
-minor changes after review

v3:
-more minor changes after review
-replace tdls peer counter variable by iterate station function

v4:
-provide functions for counting tdls station per vif and tdls vifs
-handle maximum number of tdls vifs
-split code into more patches

Marek Puzyniak (5):
  ath10k: make peer type configurable
  ath10k: store max tdls vdevs that fw can handle
  ath10k: update station counting
  ath10k: add wmi support for tdls
  ath10k: introduce basic tdls functionality

Michal Kazior (1):
  ath10k: unify tx mode and dispatch

 drivers/net/wireless/ath/ath10k/core.c    |   1 +
 drivers/net/wireless/ath/ath10k/core.h    |   3 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |   8 -
 drivers/net/wireless/ath/ath10k/htt_tx.c  |  30 ++-
 drivers/net/wireless/ath/ath10k/hw.h      |   1 +
 drivers/net/wireless/ath/ath10k/mac.c     | 391 +++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/mac.h     |   8 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  50 +++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 160 +++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  53 ++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   3 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |  43 ++++
 12 files changed, 664 insertions(+), 87 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
