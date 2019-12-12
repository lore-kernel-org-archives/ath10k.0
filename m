Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifS2b-0006fr-TW
 for ath10k@lists.infradead.org; Thu, 12 Dec 2019 17:14:19 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Fix setting txpower to zero.
Date: Thu, 12 Dec 2019 09:14:09 -0800
Message-Id: <20191212171409.21041-1-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org, kvalo@qca.qualcomm.com, ath10k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Do not ignore 0 txpower setting unless the vif is of type p2p.

This should fix regression in:

commit 88407beb1b1462f706a1950a355fd086e1c450b6
Author: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Date:   Tue Dec 13 14:55:19 2016 -0800

    ath10k: fix incorrect txpower set by P2P_DEVICE interface

Tested (without p2p in use) on 9984 with ath10k-ct firmware, but I don't think
this is firmware specific.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 289d03da14b2..1c5e1b5570f8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5902,11 +5902,18 @@ static int ath10k_mac_txpower_recalc(struct ath10k *ar)
 {
 	struct ath10k_vif *arvif;
 	int ret, txpower = -1;
+	int p2p_st;
+
+	p2p_st = ath10k_wmi_get_vdev_subtype(ar, WMI_VDEV_SUBTYPE_P2P_DEVICE);
 
 	lockdep_assert_held(&ar->conf_mutex);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (arvif->txpower <= 0)
+		/* p2p may not initialize txpower, and we should ignore it
+		 * in that case.
+		 */
+		if ((arvif->txpower < 0) ||
+		    ((arvif->txpower == 0) && (arvif->vdev_subtype == p2p_st)))
 			continue;
 
 		if (txpower == -1)
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
