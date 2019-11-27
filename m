Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZnrT-00013T-1j
 for ath10k@lists.infradead.org; Wed, 27 Nov 2019 03:19:30 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: set WMI_PEER_AUTHORIZE after a firmware crash
Date: Wed, 27 Nov 2019 03:19:24 +0000
Message-ID: <0101016eaadee369-fd09e9d4-d13b-4547-a4fe-0039577ad4b8-000000@us-west-2.amazonses.com>
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

After the firmware crashes ath10k recovers via ieee80211_reconfig(),
which eventually leads to firmware configuration and including the
encryption keys. However, because there is no new auth/assoc and
4-way-handshake, and firmware set the authorize flag after
4-way-handshake, so the authorize flag in firmware is not set in
firmware without 4-way-handshake. This will lead to a failure of data
transmission after recovery done when using encrypted connections like
WPA-PSK. Set authorize flag after installing keys to firmware will fix
the issue.

This was noticed by testing firmware crashing using simulate_fw_crash
debugfs file.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ae84f8e4e7dd..0829582c0d50 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6329,6 +6329,9 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta && sta->tdls)
 		ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
 					  ar->wmi.peer_param->authorize, 1);
+	else if (sta && cmd == SET_KEY && (key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+		ath10k_wmi_peer_set_param(ar, arvif->vdev_id, peer_addr,
+					  ar->wmi.peer_param->authorize, 1);
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
