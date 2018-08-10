Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1foH0m-0006yQ-Hq
 for ath10k@lists.infradead.org; Fri, 10 Aug 2018 23:40:06 +0000
Received: by mail-pl0-x243.google.com with SMTP id d5-v6so4644786pll.4
 for <ath10k@lists.infradead.org>; Fri, 10 Aug 2018 16:39:53 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: retrieve MAC address from firmware if provided
Date: Fri, 10 Aug 2018 16:39:48 -0700
Message-Id: <20180810233948.144792-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Devices may provide their own MAC address via system firmware (e.g.,
device tree), especially in the case where the device doesn't have a
useful EEPROM on which to store its MAC address (e.g., for integrated
Wifi).

Use the generic device helper to retrieve the MAC address, and (if
present) honor it above the MAC address advertised by the card.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c  | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index c40cd129afe7..840c1f039098 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/dmi.h>
 #include <linux/ctype.h>
 #include <asm/byteorder.h>
@@ -2602,6 +2603,8 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		ath10k_debug_print_board_info(ar);
 	}
 
+	device_get_mac_address(ar->dev, ar->mac_addr, sizeof(ar->mac_addr));
+
 	ret = ath10k_core_init_firmware_features(ar);
 	if (ret) {
 		ath10k_err(ar, "fatal problem with firmware features: %d\n",
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fd612d2905b0..3cfd98de8ad2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5449,7 +5449,8 @@ int ath10k_wmi_event_ready(struct ath10k *ar, struct sk_buff *skb)
 		   arg.mac_addr,
 		   __le32_to_cpu(arg.status));
 
-	ether_addr_copy(ar->mac_addr, arg.mac_addr);
+	if (is_zero_ether_addr(ar->mac_addr))
+		ether_addr_copy(ar->mac_addr, arg.mac_addr);
 	complete(&ar->wmi.unified_ready);
 	return 0;
 }
-- 
2.18.0.597.ga71716f1ad-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
