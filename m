Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9RRc-0002uD-A8
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 09:03:17 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: Add peer flush in ath10k_flush for STATION
Date: Mon,  8 Oct 2018 17:02:43 +0800
Message-Id: <1538989363-12386-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

In the noisy environment, if there are packets in the queue and can't
send out, the suspend timing will be more than 5 seconds due to the wait,
flush the queue to optimize the suspend timing, and let the upper layer to
retry the packets after resume.

Tested with QCA6174 PCI with firmware
WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
It's not a regression with new firmware releases.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
 drivers/net/wireless/ath/ath10k/mac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 97548f9..8df3cec 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6814,9 +6814,20 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			 u32 queues, bool drop)
 {
 	struct ath10k *ar = hw->priv;
-
-	if (drop)
+	struct ath10k_vif *arvif;
+	u32 bitmap;
+
+	if (drop) {
+		if (vif->type == NL80211_IFTYPE_STATION) {
+			bitmap = ~(1 << WMI_MGMT_TID);
+			list_for_each_entry(arvif, &ar->arvifs, list) {
+				if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
+					ath10k_wmi_peer_flush(ar, arvif->vdev_id,
+							      arvif->bssid, bitmap);
+			}
+		}
 		return;
+	}
 
 	mutex_lock(&ar->conf_mutex);
 	ath10k_mac_wait_tx_complete(ar);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
