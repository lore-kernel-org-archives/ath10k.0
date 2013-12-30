Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VxXtq-000292-VG
 for ath10k@lists.infradead.org; Mon, 30 Dec 2013 08:08:35 +0000
Received: by mail-ee0-f53.google.com with SMTP id b57so4930960eek.40
 for <ath10k@lists.infradead.org>; Mon, 30 Dec 2013 00:08:06 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH] ath10k: disable STA KICKOUT in FW
Date: Mon, 30 Dec 2013 09:07:51 +0100
Message-Id: <1388390871-3932-1-git-send-email-marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org

Currently ath10k is not using STA KICKOUT firmware functionality.
In order to avoid unwanted FW events this functionality should be
disabled when not used.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5b45f3a..93416ab 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2292,11 +2292,20 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		u32 param_id;
+
 		ret = ath10k_peer_create(ar, arvif->vdev_id, vif->addr);
 		if (ret) {
 			ath10k_warn("Failed to create peer for AP: %d\n", ret);
 			goto err_vdev_delete;
 		}
+
+		param_id = ar->wmi.pdev_param->sta_kickout_th;
+
+		/* Disable STA KICKOUT functionality in FW */
+		ret = ath10k_wmi_pdev_set_param(ar, param_id, 0);
+		if (ret)
+			ath10k_warn("Failed to disable STA KICKOUT\n");
 	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
