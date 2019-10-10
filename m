Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIO8j-00057O-J6
 for ath10k@lists.infradead.org; Thu, 10 Oct 2019 02:25:19 +0000
Received: by mail-pf1-x449.google.com with SMTP id r7so3569155pfg.2
 for <ath10k@lists.infradead.org>; Wed, 09 Oct 2019 19:25:16 -0700 (PDT)
Date: Wed,  9 Oct 2019 19:25:00 -0700
Message-Id: <20191010022502.141862-1-kyan@google.com>
Mime-Version: 1.0
Subject: [PATCH v3 0/2] Implement Airtime-based Queue Limit (AQL)
From: Kan Yan <kyan@google.com>
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
To: johannes@sipsolutions.net
Cc: Kan Yan <kyan@google.com>, make-wifi-fast@lists.bufferbloat.net, toke@redhat.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, yiboz@codeaurora.org, nbd@nbd.name

This patch series implements Airtime-based Queue Limit (AQL) in the mac80211 and Ath10k driver. It is based on an earlier version from the ChromiumOS tree[0].

This version has been tested with QCA9884 platform with 4.14 kernel. Tests show AQL is able to reduce latency by an order of magnitude in a congested environment without negative impact on the throughput.

[0] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1703105/7

Kan Yan (2):
  mac80211: Implement Airtime-based Queue Limit (AQL)
  ath10k: Enable Airtime-based Queue Limit (AQL)

 drivers/net/wireless/ath/ath10k/htt_rx.c |  1 +
 drivers/net/wireless/ath/ath10k/mac.c    |  8 ++-
 drivers/net/wireless/ath/ath10k/txrx.c   | 11 +++-
 include/net/cfg80211.h                   |  7 +++
 include/net/mac80211.h                   | 43 +++++++++++++
 net/mac80211/debugfs.c                   | 78 ++++++++++++++++++++++++
 net/mac80211/debugfs_sta.c               | 43 ++++++++++---
 net/mac80211/ieee80211_i.h               |  4 ++
 net/mac80211/main.c                      |  8 ++-
 net/mac80211/sta_info.c                  | 30 +++++++++
 net/mac80211/sta_info.h                  |  4 ++
 net/mac80211/tx.c                        | 46 +++++++++++++-
 12 files changed, 263 insertions(+), 20 deletions(-)

-- 
Changes from v1:
 - Fix checkpatch error.
 - Keep iterate the list of active_txq until an eligible txq's deficit become non-negative in ieee80211_next_txq(), instead of break the loop after one iteration.
 - Enforce the AQL limit in ath10k's pull mode in ath10k_htt_rx_tx_fetch_ind()

Changes from v2:
 - More coding style fixes.
 - Fixed a bug that txq is not removed from the active_txqs list when txq.sta is null.
 - Removed AQL queue limit check from ieee80211_txq_may_transmit(), so at least one frame will be sent to the firmware when called from ath10k_htt_rx_tx_fetch_ind() in ath10k's poll mode.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
