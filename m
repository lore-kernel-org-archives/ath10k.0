Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7L7E-00088l-7w
 for ath10k@lists.infradead.org; Thu, 17 Nov 2016 11:44:29 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCHv2 0/4] ath10k: Add support for BTCOEX feature.
Date: Thu, 17 Nov 2016 17:14:20 +0530
Message-ID: <1479383064-25718-1-git-send-email-c_traja@qti.qualcomm.com>
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
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Tamizh chelvam <c_traja@qti.qualcomm.com>, tamizhchelvam@codeaurora.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patch set add support to enable/disable BTCOEX via nl80211,
also support to update BTCOEX priority value for 10.4 based firmware.
Document the dt entry in qcom,ath10k.txt and reads btcoex support
flag and btcoex gpio pin detail from dt.

Tamizh chelvam (4):
  ath10k: Add support to enable or disable btcoex via nl80211
  ath10k: Add support to update btcoex priority value via nl80211
  dt: bindings: add new dt entry for BTCOEX feature in qcom,ath10k.txt
  ath10k: Add support to read btcoex related data from DT

V2:

 * Added device tree list in CC
 * fixed mutex unlock issue in 
   "ath10k: Add support to update btcoex priority value via nl80211"

 .../bindings/net/wireless/qcom,ath10k.txt          |    4 +
 drivers/net/wireless/ath/ath10k/core.c             |   44 +++++-
 drivers/net/wireless/ath/ath10k/core.h             |    9 ++
 drivers/net/wireless/ath/ath10k/debug.c            |   40 +-----
 drivers/net/wireless/ath/ath10k/mac.c              |  140 +++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/mac.h              |    1 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h          |   19 +++
 drivers/net/wireless/ath/ath10k/wmi.c              |   20 +++
 drivers/net/wireless/ath/ath10k/wmi.h              |   20 +++
 9 files changed, 261 insertions(+), 36 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
