Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0SHL-0006LF-Q7
 for ath10k@lists.infradead.org; Thu, 13 Sep 2018 14:07:34 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath10k: Remove duplicated includes
Date: Thu, 13 Sep 2018 22:01:21 +0800
Message-ID: <20180913140121.23152-1-yuehaibing@huawei.com>
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
To: ath10k@lists.infradead.org, kvalo@codeaurora.org
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net

remove duplicated include from ath10k driver.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/htt.h     | 1 -
 drivers/net/wireless/ath/ath10k/mac.c     | 1 -
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 5d3ff80..eaf3a00 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -29,7 +29,6 @@
 #include "htc.h"
 #include "hw.h"
 #include "rx_desc.h"
-#include "hw.h"
 
 enum htt_dbg_stats_type {
 	HTT_DBG_STATS_WAL_PDEV_TXRX = 1 << 0,
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 496772d..e37ea39 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -30,7 +30,6 @@
 #include "htt.h"
 #include "txrx.h"
 #include "testmode.h"
-#include "wmi.h"
 #include "wmi-tlv.h"
 #include "wmi-ops.h"
 #include "wow.h"
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index cdc1e64..6c6656d6 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -19,7 +19,6 @@
 #include "debug.h"
 #include "mac.h"
 #include "hw.h"
-#include "mac.h"
 #include "wmi.h"
 #include "wmi-ops.h"
 #include "wmi-tlv.h"
-- 
2.7.0



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
