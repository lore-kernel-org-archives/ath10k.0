Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMcIb-0005eG-NK
 for ath10k@lists.infradead.org; Sun, 27 Sep 2020 19:25:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id c18so9499703wrm.9
 for <ath10k@lists.infradead.org>; Sun, 27 Sep 2020 12:25:24 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] ath10k: Try to get mac-address from dts
Date: Sun, 27 Sep 2020 21:25:13 +0200
Message-Id: <20200927192515.86-1-ansuelsmth@gmail.com>
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
To: "0001-ath10k-Try-to-get-mac-address-from-dts . patchKalle Valo" <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>

Most of embedded device that have the ath10k wifi integrated store the
mac-address in nvmem partitions. Try to fetch the mac-address using the
standard 'of_get_mac_address' than in all the check also try to fetch the
address using the nvmem api searching for a defined 'mac-address' cell.
Mac-address defined in the dts have priority than any other address found.

Tested-on: QCA9984 hw1.0 PCI 10.4

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5f4e12196..9ed7b9883 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -8,6 +8,8 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/of_net.h>
+#include <linux/property.h>
 #include <linux/property.h>
 #include <linux/dmi.h>
 #include <linux/ctype.h>
@@ -2961,8 +2963,12 @@ EXPORT_SYMBOL(ath10k_core_stop);
 static int ath10k_core_probe_fw(struct ath10k *ar)
 {
 	struct bmi_target_info target_info;
+	const char *mac;
 	int ret = 0;
 
+	/* register the platform to be found by the of api */
+	of_platform_device_create(ar->dev->of_node, NULL, NULL);
+
 	ret = ath10k_hif_power_up(ar, ATH10K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
 		ath10k_err(ar, "could not power on hif bus (%d)\n", ret);
@@ -3062,6 +3068,10 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 
 	device_get_mac_address(ar->dev, ar->mac_addr, sizeof(ar->mac_addr));
 
+	mac = of_get_mac_address(ar->dev->of_node);
+	if (!IS_ERR(mac))
+		ether_addr_copy(ar->mac_addr, mac);
+
 	ret = ath10k_core_init_firmware_features(ar);
 	if (ret) {
 		ath10k_err(ar, "fatal problem with firmware features: %d\n",
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
