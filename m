Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbPZl-0005GL-6O
 for ath10k@lists.infradead.org; Fri, 27 Mar 2015 08:25:10 +0000
Received: by lagg8 with SMTP id g8so64690957lag.1
 for <ath10k@lists.infradead.org>; Fri, 27 Mar 2015 01:24:42 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: fix arvif->wep_keys clearing
Date: Fri, 27 Mar 2015 08:21:55 +0000
Message-Id: <1427444516-974-1-git-send-email-michal.kazior@tieto.com>
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

The variable should be cleared regardless of
whether there's a peer associated with the key or
not.

This fixes case when user first associates with 2
WEP keys and then disconnects and connects with 1
WEP key. This resulted in WEP key count being 2 in
the driver leading to default keyidx fixup
failure.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9b8313dcb888..9d873900257d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4101,6 +4101,13 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	key->hw_key_idx = key->keyidx;
 
+	if (is_wep) {
+		if (cmd == SET_KEY)
+			arvif->wep_keys[key->keyidx] = key;
+		else
+			arvif->wep_keys[key->keyidx] = NULL;
+	}
+
 	/* the peer should not disappear in mid-way (unless FW goes awry) since
 	 * we already hold conf_mutex. we just make sure its there now. */
 	spin_lock_bh(&ar->data_lock);
@@ -4126,11 +4133,6 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		flags |= WMI_KEY_GROUP;
 
 	if (is_wep) {
-		if (cmd == SET_KEY)
-			arvif->wep_keys[key->keyidx] = key;
-		else
-			arvif->wep_keys[key->keyidx] = NULL;
-
 		if (cmd == DISABLE_KEY)
 			ath10k_clear_vdev_key(arvif, key);
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
