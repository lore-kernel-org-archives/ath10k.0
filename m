Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0nu2-0001Wi-1x
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 08:54:46 +0000
Received: by mail-wg0-f46.google.com with SMTP id x13so16750935wgg.19
 for <ath10k@lists.infradead.org>; Tue, 16 Dec 2014 00:54:23 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH 2/2] ath10k: send (re)assoc peer command when NSS changed
Date: Tue, 16 Dec 2014 09:53:00 +0100
Message-Id: <1418719980-19753-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Assoc peer command contain information about NSS.
When we will get IEEE80211_RC_NSS_CHANGED we should
also send (re) assoc peer command to be sure firmware
will know about it and RC will work correctly.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c9e7995..05fd620 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3592,8 +3592,9 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 				    sta->addr, smps, err);
 	}
 
-	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED) {
-		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac update sta %pM supp rates\n",
+	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED ||
+	    changed & IEEE80211_RC_NSS_CHANGED) {
+		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac update sta %pM supp rates/nss\n",
 			   sta->addr);
 
 		err = ath10k_station_assoc(ar, arvif->vif, sta, true);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
