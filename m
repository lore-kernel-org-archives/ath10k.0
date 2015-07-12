Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEICh-00069V-E4
 for ath10k@lists.infradead.org; Sun, 12 Jul 2015 14:26:04 +0000
Received: by iebmu5 with SMTP id mu5so220394280ieb.1
 for <ath10k@lists.infradead.org>; Sun, 12 Jul 2015 07:25:40 -0700 (PDT)
Date: Sun, 12 Jul 2015 10:25:32 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150712142532.GA24495@localhost>
References: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
 <20150706214921.GF23012@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20150706214921.GF23012@localhost>
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

On Mon, Jul 06, 2015 at 05:49:21PM -0400, Bob Copeland wrote:
> Here's the latest patch-in-progress but I haven't tested it; it also
> requires the AID series I sent to l-w last week (and still requires the
> filters be disabled).  Once I get an hour to run it through the paces
> and also fix the filter issue then I plan to send upstream.

Ok, so I've tested it now and I'm having some problems with raw mode
on latest driver.  On top of previously posted patch, I have the following
(not sure if the various checksum changes are really needed, but tried
to have it match last working patch).

It looks like unicast self-protected action frames (peering) works fine, but
broadcast multihop action frames (PREQs) never go over the air.  Does
this sound familiar to anyone?

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index a60ef7d..6da3952 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -513,7 +513,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 
 	flags1 |= SM((u16)vdev_id, HTT_DATA_TX_DESC_FLAGS1_VDEV_ID);
 	flags1 |= SM((u16)tid, HTT_DATA_TX_DESC_FLAGS1_EXT_TID);
-	if (msdu->ip_summed == CHECKSUM_PARTIAL) {
+	if (msdu->ip_summed == CHECKSUM_PARTIAL &&
+	    skb_cb->txmode != ATH10K_HW_TXRX_RAW) {
 		flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L3_OFFLOAD;
 		flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L4_OFFLOAD;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index aa81880..e136e9c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3636,12 +3636,9 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 		ath10k_tx_h_8023(skb);
 		break;
 	case ATH10K_HW_TXRX_RAW:
-		/* FIXME: Packet injection isn't implemented. It should be
-		 * doable with firmware 10.2 on qca988x.
-		 */
-		WARN_ON_ONCE(1);
-		ieee80211_free_txskb(hw, skb);
-		return;
+		ath10k_tx_h_add_p2p_noa_ie(ar, vif, skb);
+		ath10k_tx_h_seq_no(vif, skb);
+		break;
 	}
 
 	if (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN) {
@@ -4053,6 +4050,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
 	enum wmi_sta_powersave_param param;
+	enum ath10k_hw_txrx_mode tx_mode = ATH10K_HW_TXRX_NATIVE_WIFI;
 	int ret = 0;
 	u32 value;
 	int bit;
@@ -4109,6 +4107,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
 		break;
 	case NL80211_IFTYPE_MESH_POINT:
+		tx_mode = ATH10K_HW_TXRX_RAW;
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 		break;
 	case NL80211_IFTYPE_AP:
@@ -4193,7 +4192,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
 	vdev_param = ar->wmi.vdev_param->tx_encap_type;
 	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
-					ATH10K_HW_TXRX_NATIVE_WIFI);
+					tx_mode);
 	/* 10.X firmware does not support this VDEV parameter. Do not warn */
 	if (ret && ret != -EOPNOTSUPP) {
 		ath10k_warn(ar, "failed to set vdev %i TX encapsulation: %d\n",
@@ -6969,7 +6968,7 @@ int ath10k_mac_register(struct ath10k *ar)
 		goto err_free;
 	}
 
-	ar->hw->netdev_features = NETIF_F_HW_CSUM;
+	/* ar->hw->netdev_features = NETIF_F_HW_CSUM; */
 
 	if (config_enabled(CPTCFG_ATH10K_DFS_CERTIFIED)) {
 		/* Init ath dfs pattern detector */

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
