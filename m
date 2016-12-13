Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGvzn-0004D3-E2
 for ath10k@lists.infradead.org; Tue, 13 Dec 2016 22:56:28 +0000
From: <ryanhsu@qca.qualcomm.com>
Subject: [PATCH V2] ath10k: fix incorrect txpower set by P2P_DEVICE interface
Date: Tue, 13 Dec 2016 14:55:19 -0800
Message-ID: <1481669719-3423-1-git-send-email-ryanhsu@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qca.qualcomm.com

From: Ryan Hsu <ryanhsu@qca.qualcomm.com>

Ath10k reports the phy capability that supports P2P_DEVICE interface.

When we use the P2P supported wpa_supplicant to start connection, it'll
create two interfaces, one is wlan0 (vdev_id=0) and one is P2P_DEVICE
p2p-dev-wlan0 which is for p2p control channel (vdev_id=1).

	ath10k_pci mac vdev create 0 (add interface) type 2 subtype 0
	ath10k_add_interface: vdev_id: 0, txpower: 0, bss_power: 0
	...
	ath10k_pci mac vdev create 1 (add interface) type 2 subtype 1
	ath10k_add_interface: vdev_id: 1, txpower: 0, bss_power: 0

And the txpower in per vif bss_conf will only be set to valid tx power when
the interface is assigned with channel_ctx.

But this P2P_DEVICE interface will never be used for any connection, so
that the uninitialized bss_conf.txpower=0 is assinged to the
arvif->txpower when interface created.

Since the txpower configuration is firmware per physical interface.
So the smallest txpower of all vifs will be the one limit the tx power
of the physical device, that causing the low txpower issue on other
active interfaces.

	wlan0: Limiting TX power to 21 (24 - 3) dBm
	ath10k_pci mac vdev_id 0 txpower 21
	ath10k_mac_txpower_recalc: vdev_id: 1, txpower: 0
	ath10k_mac_txpower_recalc: vdev_id: 0, txpower: 21
	ath10k_pci mac txpower 0

This issue only happens when we use the wpa_supplicant that supports
P2P or if we use the iw tool to create the control P2P_DEVICE interface.

Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index fe42bf5..6e1550b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4671,7 +4671,8 @@ static int ath10k_mac_txpower_recalc(struct ath10k *ar)
 	lockdep_assert_held(&ar->conf_mutex);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		WARN_ON(arvif->txpower < 0);
+		if (arvif->txpower <= 0)
+			continue;
 
 		if (txpower == -1)
 			txpower = arvif->txpower;
@@ -4679,8 +4680,8 @@ static int ath10k_mac_txpower_recalc(struct ath10k *ar)
 			txpower = min(txpower, arvif->txpower);
 	}
 
-	if (WARN_ON(txpower == -1))
-		return -EINVAL;
+	if (txpower == -1)
+		return 0;
 
 	ret = ath10k_mac_txpower_setup(ar, txpower);
 	if (ret) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
