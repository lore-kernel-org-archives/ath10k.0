Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab810-0006hQ-U1
 for ath10k@lists.infradead.org; Wed, 02 Mar 2016 14:44:39 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix firmware assert in monitor mode
Date: Wed, 2 Mar 2016 20:13:52 +0530
Message-ID: <1456929832-6147-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

commit 166de3f1895d ("ath10k: remove supported chain mask") had revealed
an issue on monitor mode. Configuring NSS upon monitor interface
creation is causing target assert in all qca9888x and qca6174 firmware.
Firmware assert issue can be reproduced by below sequence even after
reverting commit 166de3f1895d ("ath10k: remove supported chain mask").

ip link set wlan0 down
iw wlan0 set type monitor
iw phy0 set antenna 7
ip link set wlan0 up

This issue is originally reported on qca9888 with 10.1 firmware.

Fixes: 5572a95b4b ("ath10k: apply chainmask settings to vdev on creation")
Reported-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 78999c9..c42866d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4489,7 +4489,10 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err_vdev_delete;
 	}
 
-	if (ar->cfg_tx_chainmask) {
+	/* Configuring number of spatial stream for monitor interface is causing
+	 * target assert in qca9888 and qca6174.
+	 */
+	if (ar->cfg_tx_chainmask && (vif->type != NL80211_IFTYPE_MONITOR)) {
 		u16 nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
 
 		vdev_param = ar->wmi.vdev_param->nss;
-- 
2.7.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
