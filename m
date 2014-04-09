Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXoL8-00023A-So
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 08:58:40 +0000
Received: by mail-ee0-f48.google.com with SMTP id b57so1578025eek.7
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 01:58:14 -0700 (PDT)
From: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Subject: [PATCH v2 1/2] mac80211: add option to generate CCMP IVs only for
 mgmt frames
Date: Wed,  9 Apr 2014 10:57:36 +0200
Message-Id: <1397033857-2523-1-git-send-email-marek.kwaczynski@tieto.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, johannes@sipsolutions.net

Some chips can encrypt managment frames in HW, but
require generated IV in the frame. Add a key flag
that allows us to achieve this.

Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>
---

v2: fix missed prefix

 include/net/mac80211.h |   16 ++++++++++------
 net/mac80211/tx.c      |    5 +++--
 net/mac80211/wpa.c     |    7 +++++--
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2de7ff4..77689ca 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1202,14 +1202,18 @@ struct ieee80211_vif *wdev_to_ieee80211_vif(struct wireless_dev *wdev);
  *	fall back to software crypto. Note that this flag deals only with
  *	RX, if your crypto engine can't deal with TX you can also set the
  *	%IEEE80211_KEY_FLAG_SW_MGMT_TX flag to encrypt such frames in SW.
+ * @IEEE80211_KEY_FLAG_GENERATE_MGMT_IV_TX: This flag should be set by the
+ *	driver for a CCMP key to indicate that is requires IV generation
+ *	only for managment frames (MFP).
  */
 enum ieee80211_key_flags {
-	IEEE80211_KEY_FLAG_GENERATE_IV	= 1<<1,
-	IEEE80211_KEY_FLAG_GENERATE_MMIC= 1<<2,
-	IEEE80211_KEY_FLAG_PAIRWISE	= 1<<3,
-	IEEE80211_KEY_FLAG_SW_MGMT_TX	= 1<<4,
-	IEEE80211_KEY_FLAG_PUT_IV_SPACE = 1<<5,
-	IEEE80211_KEY_FLAG_RX_MGMT	= 1<<6,
+	IEEE80211_KEY_FLAG_GENERATE_IV		= 1<<1,
+	IEEE80211_KEY_FLAG_GENERATE_MMIC	= 1<<2,
+	IEEE80211_KEY_FLAG_PAIRWISE		= 1<<3,
+	IEEE80211_KEY_FLAG_SW_MGMT_TX		= 1<<4,
+	IEEE80211_KEY_FLAG_PUT_IV_SPACE		= 1<<5,
+	IEEE80211_KEY_FLAG_RX_MGMT		= 1<<6,
+	IEEE80211_KEY_FLAG_GENERATE_MGMT_IV_TX	= 1<<7,
 };
 
 /**
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 19d36d4..8a49272 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -625,8 +625,9 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
 				tx->key = NULL;
 			else
 				skip_hw = (tx->key->conf.flags &
-					   IEEE80211_KEY_FLAG_SW_MGMT_TX) &&
-					ieee80211_is_mgmt(hdr->frame_control);
+				   (IEEE80211_KEY_FLAG_SW_MGMT_TX |
+				    IEEE80211_KEY_FLAG_GENERATE_MGMT_IV_TX)) &&
+				    ieee80211_is_mgmt(hdr->frame_control);
 			break;
 		case WLAN_CIPHER_SUITE_AES_CMAC:
 			if (!ieee80211_is_mgmt(hdr->frame_control))
diff --git a/net/mac80211/wpa.c b/net/mac80211/wpa.c
index b8600e3..2ef2e40 100644
--- a/net/mac80211/wpa.c
+++ b/net/mac80211/wpa.c
@@ -450,8 +450,11 @@ static int ccmp_encrypt_skb(struct ieee80211_tx_data *tx, struct sk_buff *skb)
 
 	ccmp_pn2hdr(pos, pn, key->conf.keyidx);
 
-	/* hwaccel - with software CCMP header */
-	if (info->control.hw_key)
+	/* hwaccel - with software CCMP header or the HW needs
+	 * generated the IV
+	 */
+	if (info->control.hw_key ||
+	    (key->conf.flags & IEEE80211_KEY_FLAG_GENERATE_MGMT_IV_TX))
 		return 0;
 
 	pos += IEEE80211_CCMP_HDR_LEN;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
