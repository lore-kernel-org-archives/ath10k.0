Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1pdZ-0005dA-CL
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 08:11:39 +0000
From: <yintang@qti.qualcomm.com>
Subject: [PATCH V5 5/5] ath10k: Fix TDLS peer TX data failure issue on
 encryped AP
Date: Tue, 10 Oct 2017 16:13:05 +0800
Message-ID: <1507623185-9383-1-git-send-email-yintang@qti.qualcomm.com>
In-Reply-To: <TDLS for ath10k patch>
References: <TDLS for ath10k patch>
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

From: Yingying Tang <yintang@qti.qualcomm.com>

For WPA encryption, QCA6174 firmware(version: WLAN.RM.4.4) will unblock
data when M4 was sent successfully. For other encryption which didn't need
4-way handshake firmware will unblock the data when peer authorized. Since
TDLS is 3-way handshake host need send authorize cmd to firmware to unblock
data.

Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f6702cb..d2530f7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5841,6 +5841,10 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		ath10k_warn(ar, "Peer %pM disappeared!\n", peer_addr);
 	spin_unlock_bh(&ar->data_lock);
 
+	if (sta && sta->tdls)
+		ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
+					  WMI_PEER_AUTHORIZE, 1);
+
 exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
