Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c46F5-0007VN-2S
 for ath10k@lists.infradead.org; Tue, 08 Nov 2016 13:15:11 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCH 0/4] cfg80211: mac80211: BTCOEX feature support
Date: Tue, 8 Nov 2016 18:45:28 +0530
Message-ID: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
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
To: linux-wireless@vger.kernel.org
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, johannes@sipsolutions.net, tamizhchelvam@codeaurora.org, ath10k@lists.infradead.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patchset add support for BTCOEX feature to enable/disable btcoex
and modifying btcoex priority value via nl80211.

Tamizh chelvam (4):
  cfg80211: Add support to enable or disable btcoex
  cfg80211: Add new NL80211_CMD_SET_BTCOEX_PRIORITY to support BTCOEX
  mac80211: Add support to enable or disable btcoex
  mac80211: Add support to update btcoex priority value

 include/net/cfg80211.h       |   68 ++++++++++++++++++++++++
 include/net/mac80211.h       |   11 ++++
 include/uapi/linux/nl80211.h |   43 +++++++++++++++
 net/mac80211/cfg.c           |   17 ++++++
 net/mac80211/driver-ops.h    |   26 +++++++++
 net/mac80211/trace.h         |   14 +++++
 net/wireless/nl80211.c       |  119 ++++++++++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |   24 +++++++++
 net/wireless/trace.h         |   48 +++++++++++++++++
 9 files changed, 370 insertions(+)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
