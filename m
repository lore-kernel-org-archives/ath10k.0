Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOOzQ-0002Wh-Ce
 for ath10k@lists.infradead.org; Mon, 11 Dec 2017 14:23:30 +0000
From: Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: [PATCH v3 0/4] WMI changes for wcn3990
Date: Mon, 11 Dec 2017 19:52:51 +0530
Message-Id: <1513002175-2498-1-git-send-email-pillair@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

This patchset includes the WMI changes for wcn3390 to
Refactor service ready event parsing,
Add management frame tx by refernce over wmi,
Add hw parameters for wcn3990.

Changes since v2
- Fix ath-check warnings
  1) Using plain integer as NULL pointer
  2) incorrect type in assignment 
  3) braces {} are not necessary for single statement blocks

Rakesh Pillai (4):
  ath10k: WMI: modify svc bitmap parsing for wcn3990
  ath10k: WMI: Add management tx by reference support over wmi
  ath10k: WMI: get wmi init parameter values from hw params
  ath10k: WMI: add hw params entry for wcn3990

 drivers/net/wireless/ath/ath10k/core.c    |  55 +++++++++++
 drivers/net/wireless/ath/ath10k/core.h    |   3 +
 drivers/net/wireless/ath/ath10k/hw.c      |   2 +
 drivers/net/wireless/ath/ath10k/hw.h      |  14 +++
 drivers/net/wireless/ath/ath10k/mac.c     |   4 +-
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   9 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 146 ++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 113 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     |   2 +
 9 files changed, 329 insertions(+), 19 deletions(-)

-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
