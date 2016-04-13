Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqIkX-000664-3B
 for ath10k@lists.infradead.org; Wed, 13 Apr 2016 11:14:21 +0000
Subject: [PATCH v2 3/5] ath10k: prefer ether_addr_equal() or
 ether_addr_equal_unaligned() over memcmp()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 13 Apr 2016 14:13:49 +0300
Message-ID: <20160413111348.18823.57411.stgit@potku.adurom.net>
In-Reply-To: <20160413111247.18823.15952.stgit@potku.adurom.net>
References: <20160413111247.18823.15952.stgit@potku.adurom.net>
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

Fixes checkpatch warnings:

drivers/net/wireless/ath/ath10k/mac.c:452: Prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
drivers/net/wireless/ath/ath10k/mac.c:455: Prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
drivers/net/wireless/ath/ath10k/txrx.c:133: Prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c  |    4 ++--
 drivers/net/wireless/ath/ath10k/txrx.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 045bfc7e0279..9c848eb09d2e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -449,10 +449,10 @@ static int ath10k_mac_vif_update_wep_key(struct ath10k_vif *arvif,
 	lockdep_assert_held(&ar->conf_mutex);
 
 	list_for_each_entry(peer, &ar->peers, list) {
-		if (!memcmp(peer->addr, arvif->vif->addr, ETH_ALEN))
+		if (ether_addr_equal(peer->addr, arvif->vif->addr))
 			continue;
 
-		if (!memcmp(peer->addr, arvif->bssid, ETH_ALEN))
+		if (ether_addr_equal(peer->addr, arvif->bssid))
 			continue;
 
 		if (peer->keys[key->keyidx] == key)
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index c503ff601a54..8c7086989a71 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -130,7 +130,7 @@ struct ath10k_peer *ath10k_peer_find(struct ath10k *ar, int vdev_id,
 	list_for_each_entry(peer, &ar->peers, list) {
 		if (peer->vdev_id != vdev_id)
 			continue;
-		if (memcmp(peer->addr, addr, ETH_ALEN))
+		if (!ether_addr_equal(peer->addr, addr))
 			continue;
 
 		return peer;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
