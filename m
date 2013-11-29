Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmPhe-00047I-Ck
 for ath10k@lists.infradead.org; Fri, 29 Nov 2013 15:09:59 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: fix multi BSSID with WPA on FW 10.1
Date: Fri, 29 Nov 2013 16:09:23 +0100
Message-ID: <1385737763-10481-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

From: Michal Kazior <michal.kazior@tieto.com>

FW 10.1 seems to require the default key index to
be updated to point to group key after it is
installed. Otherwise Txed frames are corrupted.

Tested-by: Tomasz Skapski <tomasz.skapski@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b70a3b2..20821e0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2717,6 +2717,44 @@ static void ath10k_cancel_hw_scan(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static void ath10k_set_key_h_def_keyidx(struct ath10k *ar,
+				        struct ath10k_vif *arvif,
+				        enum set_key_cmd cmd,
+				        struct ieee80211_key_conf *key)
+{
+	u32 vdev_param = arvif->ar->wmi.vdev_param->def_keyid;
+	int ret;
+
+	/* 10.1 firmware branch requires default key index to be set to group
+	 * key index after installing it. Otherwise FW/HW Txes corrupted
+	 * frames with multi-vif APs. This is not required for main firmware
+	 * branch (e.g. 636).
+	 *
+	 * FIXME: This has been tested only in AP. It remains unknown if this
+	 * is required for multi-vif STA interfaces on 10.1 */
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return;
+
+	if (key->cipher == WLAN_CIPHER_SUITE_WEP40)
+		return;
+
+	if (key->cipher == WLAN_CIPHER_SUITE_WEP104)
+		return;
+
+	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
+		return;
+
+	if (cmd != SET_KEY)
+		return;
+
+	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+					key->keyidx);
+	if (ret)
+		ath10k_warn("failed to set group key as default key: %d\n",
+			    ret);
+}
+
 static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			  struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 			  struct ieee80211_key_conf *key)
@@ -2778,6 +2816,8 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		goto exit;
 	}
 
+	ath10k_set_key_h_def_keyidx(ar, arvif, cmd, key);
+
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find(ar, arvif->vdev_id, peer_addr);
 	if (peer && cmd == SET_KEY)
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
