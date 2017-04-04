Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvHEf-0005lp-JZ
 for ath10k@lists.infradead.org; Tue, 04 Apr 2017 05:42:35 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCHv3 0/2] cfg80211: mac80211: BTCOEX feature support
Date: Tue, 4 Apr 2017 11:12:36 +0530
Message-ID: <1491284558-1915-1-git-send-email-c_traja@qti.qualcomm.com>
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

This patchset add support for BTCOEX feature to enable/disable and
modifying btcoex priority value via nl80211

Tamizh chelvam (2):
  cfg80211: Add support to enable or disable btcoex and  set
    btcoex_priority
  mac80211: Add support to enable or disable btcoex and set btcoex
    priority value

v3 :
  * Introduced NL80211_EXT_FEATURE_BTCOEX_PRIORITY to expose
    btcoex priority support and removed bool variable.

v2 :
  * Introduced NL80211_CMD_SET_BTCOEX to enable/disable btcoex and
    to set/modify btcoex_priority.
  * Added bool variable in wiphy structure to advertise btcoex_priority
    feature and removed BITMAP calculation for btcoex_priority value.

 include/net/cfg80211.h       |   35 ++++++++++++++++++++++++++++++++
 include/net/mac80211.h       |    5 +++++
 include/uapi/linux/nl80211.h |   20 +++++++++++++++++++
 net/mac80211/cfg.c           |    9 +++++++++
 net/mac80211/driver-ops.h    |   15 ++++++++++++++
 net/mac80211/trace.h         |   20 +++++++++++++++++++
 net/wireless/nl80211.c       |   45 ++++++++++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |   13 ++++++++++++
 net/wireless/trace.h         |   17 ++++++++++++++++
 9 files changed, 179 insertions(+)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
