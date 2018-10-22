Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEeRI-0004Qu-Rj
 for ath10k@lists.infradead.org; Mon, 22 Oct 2018 17:56:30 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
Date: Mon, 22 Oct 2018 23:25:14 +0530
Message-Id: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
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

Add infrastructure for per TID aggregation/retry count configurations
such as retry count and AMPDU aggregation control(disable/enable).
In some scenario reducing the number of retry count for a specific data
traffic can reduce the latency by proceeding with the next packet
instead of retrying the same packet more time. This will be useful
where the next packet can resume the operation without an issue.
Here added NL80211_CMD_SET_TID_CONFIG to support this operation by
accepting retry count and AMPDU aggregation control.
This command can accept STA mac addreess to make the configuration
station specific rather than applying to all the connected stations
to the netdev.

Tamizh chelvam (3):
  nl80211: Add netlink attribute for AMPDU aggregation enable/disable
  tid conf 3
  ath10k: Add support to configure TID specific configuration

Vasanthakumar Thiagarajan (1):
  New netlink command for TID specific configuration

Note:
 * This patchset rebased on top of [PATCH 0/6] wireless: Per-sta NoAck and offload support

 drivers/net/wireless/ath/ath10k/core.h |  23 ++++
 drivers/net/wireless/ath/ath10k/mac.c  | 240 +++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi.c  |   6 +-
 drivers/net/wireless/ath/ath10k/wmi.h  |   1 +
 include/net/cfg80211.h                 |  20 +++
 include/net/mac80211.h                 |  36 +++++
 include/uapi/linux/nl80211.h           |  90 +++++++++++++
 net/mac80211/cfg.c                     |  71 ++++++++++
 net/mac80211/driver-ops.h              |  16 +++
 net/mac80211/trace.h                   |  34 +++++
 net/wireless/nl80211.c                 | 103 ++++++++++++++
 net/wireless/rdev-ops.h                |  30 +++++
 net/wireless/trace.h                   |  50 +++++++
 13 files changed, 695 insertions(+), 25 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
