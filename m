Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1HZ4-0007fS-Rg
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 17:39:46 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 3/3] ath10k: apply Mesh subtype when Mesh interface created.
Date: Tue, 24 Nov 2015 09:37:35 -0800
Message-ID: <1448386655-13936-4-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
References: <1448386655-13936-1-git-send-email-poh@qca.qualcomm.com>
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

QCA988X firmware starting from 10.2.4.70.12-2 has capability to support
Mesh Control Field Present bit in QoS field in native Wi-Fi mode.
Hence apply Mesh subtype according to the WMI service map.

Firmware will allows unicast, broadcast, multicast, and WDS frame
(FromDS = 1 and ToDS = 1) to be received via the interface, once Mesh
subtype is used.

The firmware and this patch together make native Wi-Fi mode comply to
IEEE802.11s Mesh frame in open mode, but the firmware doesn't yet
support secured Mesh mode.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6637854..6d151a2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4361,7 +4361,9 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
 		break;
 	case NL80211_IFTYPE_MESH_POINT:
-		if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
+		if (test_bit(WMI_SERVICE_MESH, ar->wmi.svc_map)) {
+			arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH;
+		} else if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
 			ret = -EINVAL;
 			ath10k_warn(ar, "must load driver with rawmode=1 to add mesh interfaces\n");
 			goto err;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
