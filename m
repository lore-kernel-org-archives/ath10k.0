Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDWHi-00028h-Ao
 for ath10k@lists.infradead.org; Tue, 20 Jan 2015 10:43:47 +0000
Received: by mail-we0-f182.google.com with SMTP id l61so11012687wev.13
 for <ath10k@lists.infradead.org>; Tue, 20 Jan 2015 02:43:23 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: remove sw encryption for pmf
Date: Tue, 20 Jan 2015 11:42:42 +0100
Message-Id: <1421750563-15945-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

From: Marek Kwaczynski <marek.kwaczynski@tieto.com>

Software encryption was never necessary.
Tested with fw 636 and fw 10.x.

Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9524bc5..78834c3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -58,10 +58,7 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_CCMP:
 		arg.key_cipher = WMI_CIPHER_AES_CCM;
-		if (arvif->vdev_type == WMI_VDEV_TYPE_AP)
-			key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV_MGMT;
-		else
-			key->flags |= IEEE80211_KEY_FLAG_SW_MGMT_TX;
+		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV_MGMT;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
 		arg.key_cipher = WMI_CIPHER_TKIP;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
