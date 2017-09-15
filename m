Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsoOb-0004Jh-VP
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 11:02:57 +0000
From: <yintang@qti.qualcomm.com>
Subject: [TDLS PATCH V1 1/5] mac80211: Enable TDLS peer buffer STA feature
Date: Fri, 15 Sep 2017 19:03:36 +0800
Message-ID: <1505473420-22932-2-git-send-email-yintang@qti.qualcomm.com>
In-Reply-To: <1505473420-22932-1-git-send-email-yintang@qti.qualcomm.com>
References: <TDLS for ath10k>
 <1505473420-22932-1-git-send-email-yintang@qti.qualcomm.com>
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

Enable TDLS peer buffer STA feature.
Set extended capability bit to enable buffer STA when driver
support it.

Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
---
 include/net/cfg80211.h |    3 +++
 net/mac80211/tdls.c    |    5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index f12fa52..edefc25 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -3249,6 +3249,8 @@ struct cfg80211_ops {
  *	beaconing mode (AP, IBSS, Mesh, ...).
  * @WIPHY_FLAG_HAS_STATIC_WEP: The device supports static WEP key installation
  *	before connection.
+ * @WIPHY_FLAG_SUPPORT_TDLS_BUFFER_ST: Device support buffer STA when TDLS is
+ *	established.
  */
 enum wiphy_flags {
 	/* use hole at 0 */
@@ -3275,6 +3277,7 @@ enum wiphy_flags {
 	WIPHY_FLAG_SUPPORTS_5_10_MHZ		= BIT(22),
 	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
 	WIPHY_FLAG_HAS_STATIC_WEP		= BIT(24),
+	WIPHY_FLAG_SUPPORT_TDLS_BUFFER_STA      = BIT(25),
 };
 
 /**
diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index 91093d4..f99e379 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -49,6 +49,8 @@ static void ieee80211_tdls_add_ext_capab(struct ieee80211_sub_if_data *sdata,
 			  !ifmgd->tdls_wider_bw_prohibited;
 	struct ieee80211_supported_band *sband = ieee80211_get_sband(sdata);
 	bool vht = sband && sband->vht_cap.vht_supported;
+	bool buffer_sta =
+		local->hw.wiphy->flags & WIPHY_FLAG_SUPPORT_TDLS_BUFFER_STA;
 	u8 *pos = skb_put(skb, 10);
 
 	*pos++ = WLAN_EID_EXT_CAPABILITY;
@@ -56,7 +58,8 @@ static void ieee80211_tdls_add_ext_capab(struct ieee80211_sub_if_data *sdata,
 	*pos++ = 0x0;
 	*pos++ = 0x0;
 	*pos++ = 0x0;
-	*pos++ = chan_switch ? WLAN_EXT_CAPA4_TDLS_CHAN_SWITCH : 0;
+	*pos++ = (chan_switch ? WLAN_EXT_CAPA4_TDLS_CHAN_SWITCH : 0) |
+		 (buffer_sta ? WLAN_EXT_CAPA4_TDLS_BUFFER_STA : 0);
 	*pos++ = WLAN_EXT_CAPA5_TDLS_ENABLED;
 	*pos++ = 0;
 	*pos++ = 0;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
