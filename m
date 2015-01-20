Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDVzg-0004wf-EC
 for ath10k@lists.infradead.org; Tue, 20 Jan 2015 10:25:09 +0000
Received: by mail-wi0-f170.google.com with SMTP id em10so3682434wid.1
 for <ath10k@lists.infradead.org>; Tue, 20 Jan 2015 02:24:46 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: disable sta keepalive
Date: Tue, 20 Jan 2015 11:24:00 +0100
Message-Id: <1421749440-10457-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1421749440-10457-1-git-send-email-michal.kazior@tieto.com>
References: <1421749440-10457-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Firmware revisions providing sta keepalive service
have it enabled by default.

mac80211 already does idle connection polling so
it makes no sense to duplicate this in ath10k.
mac80211 wouldn't even know of the offloaded
keepalive NullFunc frames.

This prevents sending out some extraneous frames
on the air.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 42 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h |  5 +++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9524bc5..3511f60 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1289,6 +1289,38 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 	return 0;
 }
 
+static int ath10k_mac_vif_disable_keepalive(struct ath10k_vif *arvif)
+{
+	struct ath10k *ar = arvif->ar;
+	struct wmi_sta_keepalive_arg arg = {};
+	int ret;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA)
+		return 0;
+
+	if (!test_bit(WMI_SERVICE_STA_KEEP_ALIVE, ar->wmi.svc_map))
+		return 0;
+
+	/* Some firmware revisions have a bug and ignore the `enabled` field.
+	 * Instead use the interval to disable the keepalive.
+	 */
+	arg.vdev_id = arvif->vdev_id;
+	arg.enabled = 1;
+	arg.method = WMI_STA_KEEPALIVE_METHOD_NULL_FRAME;
+	arg.interval = WMI_STA_KEEPALIVE_INTERVAL_DISABLE;
+
+	ret = ath10k_wmi_sta_keepalive(ar, &arg);
+	if (ret) {
+		ath10k_warn(ar, "failed to submit keepalive on vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**********************/
 /* Station management */
 /**********************/
@@ -3182,6 +3214,16 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
 	list_add(&arvif->list, &ar->arvifs);
 
+	/* It makes no sense to have firmware do keepalives. mac80211 already
+	 * takes care of this with idle connection polling.
+	 */
+	ret = ath10k_mac_vif_disable_keepalive(arvif);
+	if (ret) {
+		ath10k_warn(ar, "failed to disable keepalive on vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		goto err_vdev_delete;
+	}
+
 	vdev_param = ar->wmi.vdev_param->def_keyid;
 	ret = ath10k_wmi_vdev_set_param(ar, 0, vdev_param,
 					arvif->def_wep_key_idx);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 99f091d..5da61e8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4581,6 +4581,11 @@ enum wmi_sta_keepalive_method {
 	WMI_STA_KEEPALIVE_METHOD_UNSOLICITATED_ARP_RESPONSE = 2,
 };
 
+#define WMI_STA_KEEPALIVE_INTERVAL_DISABLE 0
+
+/* Firmware crashes if keepalive interval exceeds this limit */
+#define WMI_STA_KEEPALIVE_INTERVAL_MAX_SECONDS 0xffff
+
 /* note: ip4 addresses are in network byte order, i.e. big endian */
 struct wmi_sta_keepalive_arp_resp {
 	__be32 src_ip4_addr;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
