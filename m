Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlsUB-0002gZ-FD
 for ath10k@lists.infradead.org; Fri, 12 Jul 2019 10:09:04 +0000
From: Isaac Hermida <isaac.hermida@digi.com>
Subject: [PATCH][master/pending] ath10k: assign new interfaces type to parent
 type
Date: Fri, 12 Jul 2019 12:08:46 +0200
Message-ID: <20190712100846.11158-1-isaac.hermida@digi.com>
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
Cc: linux-wireless@vger.kernel.org

This is needed to have the AP mode working for SDIO.
Tested with lastest master/pending code on a QCA6564 chip with firmware
firmware-sdio-6.bin_WLAN.RMH.4.4.1-00011-QCARMSWP-2

Signed-off-by: Isaac Hermida <isaac.hermida@digi.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e43a566eef77..2c4f8da98b24 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5150,6 +5150,9 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	arvif->ar = ar;
 	arvif->vif = vif;
 
+	// assign type of the new interface to the parent type (SDIO, PCI, etc)
+	ar->dev_type = arvif->ar->bus_param.dev_type;
+
 	INIT_LIST_HEAD(&arvif->list);
 	INIT_WORK(&arvif->ap_csa_work, ath10k_mac_vif_ap_csa_work);
 	INIT_DELAYED_WORK(&arvif->connection_loss_work,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
