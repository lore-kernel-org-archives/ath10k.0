Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQWmi-0004az-76
 for ath10k@lists.infradead.org; Wed, 25 Feb 2015 07:53:33 +0000
Received: by lbvp9 with SMTP id p9so2136381lbv.0
 for <ath10k@lists.infradead.org>; Tue, 24 Feb 2015 23:53:02 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH v2 0/4] ath10k: add basic tdls support
Date: Wed, 25 Feb 2015 08:55:07 +0100
Message-Id: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
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
by rate control initialization. Because of that this patches contains
one patch for mac80211 which moves rate control initialization before
calling drivers station state with transition to authorized state.

v2:
-introduce tdls peer counter
-minor changes after review

Marek Puzyniak (3):
  ath10k: make peer type configurable
  mac80211: initialize rate control earlier for tdls station
  ath10k: introduce basic tdls functionality

Michal Kazior (1):
  ath10k: unify tx mode and dispatch

 drivers/net/wireless/ath/ath10k/core.h    |   3 +
 drivers/net/wireless/ath/ath10k/htt_rx.c  |   8 -
 drivers/net/wireless/ath/ath10k/htt_tx.c  |  30 ++-
 drivers/net/wireless/ath/ath10k/mac.c     | 307 +++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/mac.h     |   8 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h |  50 ++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 157 ++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h |  52 +++++
 drivers/net/wireless/ath/ath10k/wmi.c     |   3 +-
 drivers/net/wireless/ath/ath10k/wmi.h     |  43 +++++
 net/mac80211/cfg.c                        |  20 +-
 11 files changed, 597 insertions(+), 84 deletions(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
