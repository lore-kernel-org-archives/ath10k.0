Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqC69-0004B8-9k
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 06:17:22 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] Revert "ath10k: send (re)assoc peer command when NSS changed"
Date: Mon, 26 Feb 2018 11:46:32 +0530
Message-Id: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, linux-wireless@vger.kernel.org

This reverts commit 55884c045d31a29cf69db8332d1064a1b61dd159.

When Ath10k is in AP mode and an unassociated STA sends a VHT action frame
(Operating Mode Notification for the NSS change) periodically to AP this causes
ath10k to call ath10k_station_assoc() which sends WMI_PEER_ASSOC_CMDID during
NSS update. Over the time (with a certain client it can happen within 15 mins
when there are over 500 of these VHT action frames) continuous calls of
WMI_PEER_ASSOC_CMDID cause firmware to assert due to resource exhaust.

To my knowledge setting WMI_PEER_NSS peer param itself enough to handle NSS
updates and no need to call ath10k_station_assoc(). So revert the original
commit from 2014 as it's unclear why the change was really needed.
Now the firmware assert doesn't happen anymore.

Issue observed in QCA9984 platform with firmware version:10.4-3.5.3-00053.
This Change tested in QCA9984 with firmware version: 10.4-3.5.3-00053 and
QCA988x platform with firmware version: 10.2.4-1.0-00036.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ebb3f1b..800a86e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6028,9 +6028,8 @@ static void ath10k_sta_rc_update_wk(struct work_struct *wk)
 				    sta->addr, smps, err);
 	}
 
-	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED ||
-	    changed & IEEE80211_RC_NSS_CHANGED) {
-		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac update sta %pM supp rates/nss\n",
+	if (changed & IEEE80211_RC_SUPP_RATES_CHANGED) {
+		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac update sta %pM supp rates\n",
 			   sta->addr);
 
 		err = ath10k_station_assoc(ar, arvif->vif, sta, true);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
