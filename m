Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMFPX-0008At-SI
 for ath10k@lists.infradead.org; Fri, 13 Feb 2015 12:31:57 +0000
Received: by mail-lb0-f173.google.com with SMTP id n10so15241589lbv.4
 for <ath10k@lists.infradead.org>; Fri, 13 Feb 2015 04:31:32 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: workaround qca6174 sta powersave issue
Date: Fri, 13 Feb 2015 13:30:15 +0100
Message-Id: <1423830616-7516-1-git-send-email-michal.kazior@tieto.com>
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

qca6184 WLAN.RM.2.0-00073 has a bug in sta
powersave state machine and requires peer param to
be poked to enable the powersave.

Calling this unconditionally should be safe for
other chips/firmwares.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d6d2f0f..8ed0ba6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1853,6 +1853,18 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
 	}
 
 	arvif->is_up = true;
+
+	/* Workaround: Some firmware revisions (tested with qca6174
+	 * WLAN.RM.2.0-00073) have buggy powersave state machine and must be
+	 * poked with peer param command.
+	 */
+	ret = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, arvif->bssid,
+					WMI_PEER_DUMMY_VAR, 1);
+	if (ret) {
+		ath10k_warn(ar, "failed to poke peer %pM param for ps workaround on vdev %i: %d\n",
+			    arvif->bssid, arvif->vdev_id, ret);
+		return;
+	}
 }
 
 static void ath10k_bss_disassoc(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 20ce360..c56de92 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4436,7 +4436,8 @@ enum wmi_peer_param {
 	WMI_PEER_AUTHORIZE  = 0x3,
 	WMI_PEER_CHAN_WIDTH = 0x4,
 	WMI_PEER_NSS        = 0x5,
-	WMI_PEER_USE_4ADDR  = 0x6
+	WMI_PEER_USE_4ADDR  = 0x6,
+	WMI_PEER_DUMMY_VAR  = 0xff, /* dummy parameter for STA PS workaround */
 };
 
 struct wmi_peer_set_param_cmd {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
