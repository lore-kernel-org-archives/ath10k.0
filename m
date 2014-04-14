Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x234.google.com ([2a00:1450:4013:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZdBu-00084q-3s
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 09:28:39 +0000
Received: by mail-ee0-f52.google.com with SMTP id e49so6197810eek.25
 for <ath10k@lists.infradead.org>; Mon, 14 Apr 2014 02:28:11 -0700 (PDT)
From: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Subject: [PATCH 1/2 V3] mac80211: add option to generate CCMP IVs only for
 mgmt frames
Date: Mon, 14 Apr 2014 11:27:21 +0200
Message-Id: <1397467642-23544-1-git-send-email-marek.kwaczynski@tieto.com>
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
 include/net/mac80211.h |   16 ++++++++++------
 net/mac80211/wpa.c     |    5 ++++-
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2de7ff4..80d7a5e 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1202,14 +1202,18 @@ struct ieee80211_vif *wdev_to_ieee80211_vif(struct wireless_dev *wdev);
  *	fall back to software crypto. Note that this flag deals only with
  *	RX, if your crypto engine can't deal with TX you can also set the
  *	%IEEE80211_KEY_FLAG_SW_MGMT_TX flag to encrypt such frames in SW.
+ * @IEEE80211_KEY_FLAG_GENERATE_IV_MGMT: This flag should be set by the
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
+	IEEE80211_KEY_FLAG_GENERATE_IV		= BIT(1),
+	IEEE80211_KEY_FLAG_GENERATE_MMIC	= BIT(2),
+	IEEE80211_KEY_FLAG_PAIRWISE		= BIT(3),
+	IEEE80211_KEY_FLAG_SW_MGMT_TX		= BIT(4),
+	IEEE80211_KEY_FLAG_PUT_IV_SPACE		= BIT(5),
+	IEEE80211_KEY_FLAG_RX_MGMT		= BIT(6),
+	IEEE80211_KEY_FLAG_GENERATE_IV_MGMT	= BIT(7),
 };
 
 /**
diff --git a/net/mac80211/wpa.c b/net/mac80211/wpa.c
index b8600e3..5b16a36 100644
--- a/net/mac80211/wpa.c
+++ b/net/mac80211/wpa.c
@@ -406,7 +406,10 @@ static int ccmp_encrypt_skb(struct ieee80211_tx_data *tx, struct sk_buff *skb)
 
 	if (info->control.hw_key &&
 	    !(info->control.hw_key->flags & IEEE80211_KEY_FLAG_GENERATE_IV) &&
-	    !(info->control.hw_key->flags & IEEE80211_KEY_FLAG_PUT_IV_SPACE)) {
+	    !(info->control.hw_key->flags & IEEE80211_KEY_FLAG_PUT_IV_SPACE) &&
+	    !((info->control.hw_key->flags &
+	      IEEE80211_KEY_FLAG_GENERATE_IV_MGMT) &&
+	      ieee80211_is_mgmt(hdr->frame_control))) {
 		/*
 		 * hwaccel has no need for preallocated room for CCMP
 		 * header or MIC fields
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
