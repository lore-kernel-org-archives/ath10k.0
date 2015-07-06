Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCEGn-0007am-NN
 for ath10k@lists.infradead.org; Mon, 06 Jul 2015 21:49:46 +0000
Received: by iecuq6 with SMTP id uq6so122456618iec.2
 for <ath10k@lists.infradead.org>; Mon, 06 Jul 2015 14:49:24 -0700 (PDT)
Date: Mon, 6 Jul 2015 17:49:21 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150706214921.GF23012@localhost>
References: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
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
To: Freddy Lee <flee@cococorp.com>
Cc: ath10k@lists.infradead.org

On Mon, Jul 06, 2015 at 02:25:36PM -0700, Freddy Lee wrote:
> Hi Bob,
> 
> I applied the mesh fix to OpenWRT (r45590 and r62020). It works great
> (thanks, Bob!), but with a potentially unforeseen consequence: When an
> Archer C7 with these changes is configured to be a 5GHz AP, clients
> are unable to connect normally. Experiments show that the client is
> registered as a station, but pings don't complete (in many cases, not
> even DHCP completes). Tested clients include one commercial phone
> (Samsung Galaxy S5 running Lollipop) and another Archer C7.
> 
> Without these changes, these same clients can connect to the AP all day long.

Hmm, well, there were definitely some hacks in that version, like
setting the SSID to "A" for all vif types :)

Here's the latest patch-in-progress but I haven't tested it; it also
requires the AID series I sent to l-w last week (and still requires the
filters be disabled).  Once I get an hour to run it through the paces
and also fix the filter issue then I plan to send upstream.

From 2b7ad687190dce02bd3082b6e7145a4e01f9fb11 Mon Sep 17 00:00:00 2001
From: Bob Copeland <me@bobcopeland.com>
Date: Sun, 5 Jul 2015 08:03:28 -0400
Subject: [PATCH] ath10k: implement mesh support

Add support for mesh to ath10k.  We simply use an AP virtual
interface in the firmware in order to enable beaconing
without TSF adoption, and use the raw (802.11) transmit mode.

Some basic tests with TCP iperf using 2 ath10k devices and a couple
of ath9k devices:

   2-node VHT mesh:
   4-node linear multihop HT20 (ath9k -> ath10k -> ath9k -> ath10k):

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 609ca86..2501c47 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3136,7 +3136,8 @@ ath10k_tx_h_get_txmode(struct ath10k *ar, struct ieee80211_vif *vif,
 	const struct ieee80211_hdr *hdr = (void *)skb->data;
 	__le16 fc = hdr->frame_control;
 
-	if (!vif || vif->type == NL80211_IFTYPE_MONITOR)
+	if (!vif || vif->type == NL80211_IFTYPE_MONITOR ||
+	    vif->type == NL80211_IFTYPE_MESH_POINT)
 		return ATH10K_HW_TXRX_RAW;
 
 	if (ieee80211_is_mgmt(fc))
@@ -4184,6 +4185,9 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_ADHOC:
 		arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
 		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		arvif->vdev_type = WMI_VDEV_TYPE_AP;
+		break;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 
@@ -4550,6 +4554,13 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 		if (ret)
 			ath10k_warn(ar, "failed to update beacon template: %d\n",
 				    ret);
+
+		if (vif->type == NL80211_IFTYPE_MESH_POINT) {
+			/* mesh doesn't use SSID but firmware needs it */
+			strlcpy(arvif->u.ap.ssid, "mesh",
+				sizeof(arvif->u.ap.ssid));
+			arvif->u.ap.ssid_len = 4;
+		}
 	}
 
 	if (changed & BSS_CHANGED_AP_PROBE_RESP) {
@@ -5285,6 +5296,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
 		/*
 		 * New association.
@@ -5320,6 +5332,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		    new_state == IEEE80211_STA_AUTH &&
 		    (vif->type == NL80211_IFTYPE_AP ||
+		     vif->type == NL80211_IFTYPE_MESH_POINT ||
 		     vif->type == NL80211_IFTYPE_ADHOC)) {
 		/*
 		 * Disassociation.
@@ -6572,6 +6585,9 @@ static const struct ieee80211_iface_limit ath10k_if_limits[] = {
 	{
 	.max	= 7,
 	.types	= BIT(NL80211_IFTYPE_AP)
+#ifdef CONFIG_MAC80211_MESH
+		| BIT(NL80211_IFTYPE_MESH_POINT)
+#endif
 	},
 };
 
@@ -6579,6 +6595,9 @@ static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
 	{
 	.max	= 8,
 	.types	= BIT(NL80211_IFTYPE_AP)
+#ifdef CONFIG_MAC80211_MESH
+		| BIT(NL80211_IFTYPE_MESH_POINT)
+#endif
 	},
 };
 
@@ -6871,6 +6890,7 @@ int ath10k_mac_register(struct ath10k *ar)
 
 	ar->hw->wiphy->interface_modes =
 		BIT(NL80211_IFTYPE_STATION) |
+		BIT(NL80211_IFTYPE_MESH_POINT) |
 		BIT(NL80211_IFTYPE_AP);
 
 	ar->hw->wiphy->available_antennas_rx = ar->supp_rx_chainmask;
-- 
2.1.4


-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
