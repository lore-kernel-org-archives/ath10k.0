Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1chcZs-0005qq-1C
 for ath10k@lists.infradead.org; Sat, 25 Feb 2017 13:40:02 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCHv2 0/4] cfg80211: mac80211: BTCOEX feature support
Date: Sat, 25 Feb 2017 19:07:49 +0530
Message-ID: <1488029873-14600-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, johannes@sipsolutions.net, ath10k@lists.infradead.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patchset add support for BTCOEX feature to enable/disable and
modifying btcoex priority value via nl80211

Tamizh chelvam (4):
  ath10k: Add support to enable or disable btcoex via nl80211
  ath10k: Add support to update btcoex priority value via nl80211
  dt: bindings: add new dt entry for BTCOEX feature in qcom,ath10k.txt
  ath10k: Add support to read btcoex related data from DT

v2 :
  * Introduced NL80211_CMD_SET_BTCOEX to enable/disable btcoex and
    to set/modify btcoex_priority.
  * Added bool variable in wiphy structure to advertise btcoex_priority
    feature and removed BITMAP calculation for btcoex_priority value.
 
 .../bindings/net/wireless/qcom,ath10k.txt          |    4 +
 drivers/net/wireless/ath/ath10k/core.c             |   44 ++++++++-
 drivers/net/wireless/ath/ath10k/core.h             |    9 ++
 drivers/net/wireless/ath/ath10k/debug.c            |   40 ++-------
 drivers/net/wireless/ath/ath10k/mac.c              |   94 +++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/mac.h              |    1 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h          |   19 ++++
 drivers/net/wireless/ath/ath10k/wmi.c              |   20 +++++
 drivers/net/wireless/ath/ath10k/wmi.h              |   20 +++++
 9 files changed, 215 insertions(+), 36 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
