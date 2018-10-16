Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCUJ5-0000rN-0Q
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 18:43:04 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 0/6] wireless: Per-sta NoAck and offload support
Date: Wed, 17 Oct 2018 00:11:05 +0530
Message-Id: <1539715271-14325-1-git-send-email-tamizhr@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

Adds infrastructure for driver to offload NoAck functionality,
driver like ath10k could make use of it. Also extends the
current ndev wide NoAck policy to per-station, with sta level
NoAck policy configuration userspace could selectively turn off/on
Noack based on various connection parameters of the station.

Tamizh chelvam (2):
  ath10k: Add wmi command support for station specific TID config
  ath10k: Add support for station specific noack TID policy

Vasanthakumar Thiagarajan (4):
  mac80211: Add NoAck policy functionality offload infrastructure
  nl80211/mac80211: Extend NoAck policy command with peer MAC address
  mac80211: Apply per-peer NoAck tid bitmap configuration
  mac80211: Advertise per-peer NoAck policy support

 include/net/cfg80211.h       |   12 +++++++++--
 include/net/mac80211.h       |   13 ++++++++++++
 include/uapi/linux/nl80211.h |   16 +++++++++++++-
 net/mac80211/cfg.c           |   48 ++++++++++++++++++++++++++++++++++++++----
 net/mac80211/driver-ops.h    |   22 +++++++++++++++++++
 net/mac80211/ieee80211_i.h   |    2 +-
 net/mac80211/iface.c         |    4 ++++
 net/mac80211/main.c          |    4 ++++
 net/mac80211/sta_info.c      |    2 ++
 net/mac80211/sta_info.h      |    3 +++
 net/mac80211/trace.h         |   25 ++++++++++++++++++++++
 net/mac80211/tx.c            |    4 +++-
 net/mac80211/wme.c           |   35 +++++++++++++++++++++++++++++-
 net/wireless/nl80211.c       |   22 ++++++++++++++-----
 net/wireless/rdev-ops.h      |    7 +++---
 net/wireless/trace.h         |   15 +++++++------
 16 files changed, 210 insertions(+), 24 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
