Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e3yQS-0006n8-Qf
 for ath10k@lists.infradead.org; Mon, 16 Oct 2017 05:58:58 +0000
From: <yintang@qti.qualcomm.com>
Subject: [PATCH V6 1/5] mac80211: Enable TDLS peer buffer STA feature
Date: Mon, 16 Oct 2017 14:00:29 +0800
Message-ID: <1508133633-23214-2-git-send-email-yintang@qti.qualcomm.com>
In-Reply-To: <1508133633-23214-1-git-send-email-yintang@qti.qualcomm.com>
References: <TDLS for ath10k patches V6>
 <1508133633-23214-1-git-send-email-yintang@qti.qualcomm.com>
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
 include/net/mac80211.h |    4 ++++
 net/mac80211/tdls.c    |    5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f8149ca..5928123 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2067,6 +2067,9 @@ struct ieee80211_txq {
  *	The stack will not do fragmentation.
  *	The callback for @set_frag_threshold should be set as well.
  *
+ * @IEEE80211_HW_SUPPORTS_TDLS_BUFFER_STA: Hardware support buffer STA when
+ *	TDLS is established.
+ *
  * @NUM_IEEE80211_HW_FLAGS: number of hardware flags, used for sizing arrays
  */
 enum ieee80211_hw_flags {
@@ -2109,6 +2112,7 @@ enum ieee80211_hw_flags {
 	IEEE80211_HW_TX_FRAG_LIST,
 	IEEE80211_HW_REPORTS_LOW_ACK,
 	IEEE80211_HW_SUPPORTS_TX_FRAG,
+	IEEE80211_HW_SUPPORTS_TDLS_BUFFER_STA,
 
 	/* keep last, obviously */
 	NUM_IEEE80211_HW_FLAGS
diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index 91093d4..8231466 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -47,6 +47,8 @@ static void ieee80211_tdls_add_ext_capab(struct ieee80211_sub_if_data *sdata,
 			   NL80211_FEATURE_TDLS_CHANNEL_SWITCH;
 	bool wider_band = ieee80211_hw_check(&local->hw, TDLS_WIDER_BW) &&
 			  !ifmgd->tdls_wider_bw_prohibited;
+	bool buffer_sta = ieee80211_hw_check(&local->hw,
+					     SUPPORTS_TDLS_BUFFER_STA);
 	struct ieee80211_supported_band *sband = ieee80211_get_sband(sdata);
 	bool vht = sband && sband->vht_cap.vht_supported;
 	u8 *pos = skb_put(skb, 10);
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
