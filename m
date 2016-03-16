Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ag8V7-0002pp-TZ
 for ath10k@lists.infradead.org; Wed, 16 Mar 2016 10:16:27 +0000
Received: by mail-lb0-x22b.google.com with SMTP id x1so44541608lbj.3
 for <ath10k@lists.infradead.org>; Wed, 16 Mar 2016 03:15:49 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFCv2 0/3] mac80211: implement fq codel
Date: Wed, 16 Mar 2016 11:17:55 +0100
Message-Id: <1458123478-1795-1-git-send-email-michal.kazior@tieto.com>
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
To: linux-wireless@vger.kernel.org
Cc: nbd@openwrt.org, emmanuel.grumbach@intel.com, netdev@vger.kernel.org, dave.taht@gmail.com, ath10k@lists.infradead.org, codel@lists.bufferbloat.net, Michal Kazior <michal.kazior@tieto.com>, make-wifi-fast@lists.bufferbloat.net, johannes@sipsolutions.net, Tim Shepard <shep@alum.mit.edu>

Hi,

Most notable changes:
 * fixes (duh); fairness should work better now,
 * EWMA codel target based on estimated service
   time,
 * new tx scheduling helper with in-flight
   duration limiting (same idea Emmanuel
   had for iwlwifi),
 * added a few debugfs hooks.
 * ath10k proof-of-concept that uses the new tx
   scheduling (will post results in separate
   email)

The patch grew pretty big and I plan on splitting
it before next submission. Any suggestions?

The tx scheduling probably needs more work and
testing. I didn't evaluate how CPU intensive it is
nor how it influences things like peak throughput
(lab conditions et al) yet.

I've uploaded a branch for convenience:

  https://github.com/kazikcz/linux/tree/fqmac-rfc-v2

This is based on Kalle's ath tree.


Michal Kazior (3):
  mac80211: implement fq_codel for software queuing
  ath10k: report per-station tx/rate rates to mac80211
  ath10k: use ieee80211_tx_schedule()

 drivers/net/wireless/ath/ath10k/core.c  |   2 -
 drivers/net/wireless/ath/ath10k/core.h  |   8 +-
 drivers/net/wireless/ath/ath10k/debug.c |  61 ++-
 drivers/net/wireless/ath/ath10k/mac.c   | 126 +++---
 drivers/net/wireless/ath/ath10k/wmi.h   |   2 +-
 include/net/mac80211.h                  |  96 ++++-
 net/mac80211/agg-tx.c                   |   8 +-
 net/mac80211/cfg.c                      |   2 +-
 net/mac80211/codel.h                    | 264 +++++++++++++
 net/mac80211/codel_i.h                  |  89 +++++
 net/mac80211/debugfs.c                  | 267 +++++++++++++
 net/mac80211/ieee80211_i.h              |  45 ++-
 net/mac80211/iface.c                    |  25 +-
 net/mac80211/main.c                     |   9 +-
 net/mac80211/rx.c                       |   2 +-
 net/mac80211/sta_info.c                 |  10 +-
 net/mac80211/sta_info.h                 |  27 ++
 net/mac80211/status.c                   |  64 ++++
 net/mac80211/tx.c                       | 658 ++++++++++++++++++++++++++++++--
 net/mac80211/util.c                     |  21 +-
 20 files changed, 1629 insertions(+), 157 deletions(-)
 create mode 100644 net/mac80211/codel.h
 create mode 100644 net/mac80211/codel_i.h

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
