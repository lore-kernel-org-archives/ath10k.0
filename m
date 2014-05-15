Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkrM8-0002ua-AZ
 for ath10k@lists.infradead.org; Thu, 15 May 2014 08:49:36 +0000
Received: by mail-ee0-f49.google.com with SMTP id e53so401560eek.36
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 01:49:14 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 5/5] ath10k: dont configure bssid for ap mode
Date: Thu, 15 May 2014 10:42:04 +0200
Message-Id: <1400143324-14911-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
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

FW creates self-peer for AP internally.

This prevents ath10k from trying to create
explicit self-peer during hw recovery and thus
prevents a timeout and a warning during teardown:

  ath10k: removing stale peer $AP_BSSID from vdev_id 0

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * add comment why CHANGED_BSSID is skipped for AP [Kalle]

 drivers/net/wireless/ath/ath10k/mac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e474eca..5b01b82 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2961,7 +2961,12 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 		arvif->u.ap.hidden_ssid = info->hidden_ssid;
 	}
 
-	if (changed & BSS_CHANGED_BSSID) {
+	/*
+	 * Firmware manages AP self-peer internally so make sure to not create
+	 * it in driver. Otherwise AP self-peer deletion may timeout later.
+	 */
+	if (changed & BSS_CHANGED_BSSID &&
+	    vif->type != NL80211_IFTYPE_AP) {
 		if (!is_zero_ether_addr(info->bssid)) {
 			ath10k_dbg(ATH10K_DBG_MAC,
 				   "mac vdev %d create peer %pM\n",
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
