Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMvjC-0003nJ-42
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 10:15:19 +0000
Received: by lbbyj8 with SMTP id yj8so21577188lbb.0
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 03:14:55 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: fix peer limit enforcement
Date: Wed,  5 Aug 2015 12:15:24 +0200
Message-Id: <1438769724-29438-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1438769724-29438-1-git-send-email-michal.kazior@tieto.com>
References: <1438769724-29438-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Firmware peer entries are involved in internal
firmware vdev structures. This was not accounted
for and could lead firmware to crash due to asking
it to do more than it could.

Fixes: 039a0051ec1a ("ath10k: allocate fw resources for iface combinations")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4f6dddac8e43..29ad1d3deb82 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -598,11 +598,19 @@ ath10k_mac_get_any_chandef_iter(struct ieee80211_hw *hw,
 static int ath10k_peer_create(struct ath10k *ar, u32 vdev_id, const u8 *addr,
 			      enum wmi_peer_type peer_type)
 {
+	struct ath10k_vif *arvif;
+	int num_peers = 0;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	if (ar->num_peers >= ar->max_num_peers)
+	num_peers = ar->num_peers;
+
+	/* Each vdev consumes a peer entry as well */
+	list_for_each_entry(arvif, &ar->arvifs, list)
+		num_peers++;
+
+	if (num_peers >= ar->max_num_peers)
 		return -ENOBUFS;
 
 	ret = ath10k_wmi_peer_create(ar, vdev_id, addr, peer_type);
@@ -4086,6 +4094,11 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
 	}
 
+	if (ar->num_peers >= ar->max_num_peers) {
+		ath10k_warn(ar, "refusing vdev creation due to insufficient peer entry resources in firmware\n");
+		return -ENOBUFS;
+	}
+
 	if (ar->free_vdev_map == 0) {
 		ath10k_warn(ar, "Free vdev map is empty, no more interfaces allowed.\n");
 		ret = -EBUSY;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
