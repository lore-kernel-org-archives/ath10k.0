Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAZJA-0006AY-Og
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 12:43:46 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [RFC PATCH 0/2] ath10k: provide survey info as accumulated data
Date: Wed, 18 Sep 2019 14:42:57 +0200
Message-Id: <20190918124259.17804-1-sven@narfation.org>
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
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

Hi,

it was observed that ath9k provides accumulated survey counters but ath10k
neither provides deltas nor accumulated counters. Instead it returns
some value which was returned at some point from the firmware.

But as it turns out, this data is not reliable. To make it more useful,
ath10k has to:

* retrieve counters rather frequently for hardware which is known to use
  firmware versions with low number counter bits (for only 14-30s)
* clean up received counter values 
* accumulate counters from firmware

A comparison of the resulting output with these fixes can be seen under
https://stats.freifunk-vogtland.net/d/ffv_node/nodeinfo?orgId=1&var-node=ac86749f4d60&fullscreen&panelId=5&from=1568782046974&to=1568807068706

The left side of the graph shows the output before the patches were applied
and the right side the output with the patches applied. Just as reference, an
ath9k device in the same building is
https://stats.freifunk-vogtland.net/d/ffv_node/nodeinfo?orgId=1&var-node=ac86740037e0&fullscreen&panelId=5&from=1568782046974&to=1568807068706

Kind regards,
	Sven

Sven Eckelmann (2):
  ath10k: report survey info as accumulated values
  ath10k: regularly fetch survey counters

 drivers/net/wireless/ath/ath10k/core.c |  8 ++++
 drivers/net/wireless/ath/ath10k/core.h |  3 ++
 drivers/net/wireless/ath/ath10k/hw.c   | 13 +++--
 drivers/net/wireless/ath/ath10k/mac.c  | 52 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.h  |  3 ++
 drivers/net/wireless/ath/ath10k/wmi.c  | 66 ++++++++++++++++++++++----
 6 files changed, 130 insertions(+), 15 deletions(-)

-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
