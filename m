Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkAHY-0004Hb-1C
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 15:40:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id q10-v6so13392844wrd.4
 for <ath10k@lists.infradead.org>; Mon, 30 Jul 2018 08:40:13 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: [PATCH] ath10k: Limit available channels via DT ieee80211-freq-limit
Date: Mon, 30 Jul 2018 17:39:33 +0200
Message-Id: <20180730153933.3771-1-sven.eckelmann@openmesh.com>
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
Cc: linux-wireless@vger.kernel.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

Tri-band devices (1x 2.4GHz + 2x 5GHz) often incorporate special filters in
the RX and TX path. These filtered channel can in theory still be used by
the hardware but the signal strength is reduced so much that it makes no
sense.

There is already a DT property to limit the available channels but ath10k
has to manually call this functionality to limit the currrently set wiphy
channels further.

Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 95243b48a179..8ed37ffd320f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -18,6 +18,7 @@
 
 #include "mac.h"
 
+#include <net/cfg80211.h>
 #include <net/mac80211.h>
 #include <linux/etherdevice.h>
 #include <linux/acpi.h>
@@ -8306,6 +8307,7 @@ int ath10k_mac_register(struct ath10k *ar)
 		ar->hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
 	}
 
+	wiphy_read_of_freq_limits(ar->hw->wiphy);
 	ath10k_mac_setup_ht_vht_cap(ar);
 
 	ar->hw->wiphy->interface_modes =
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
