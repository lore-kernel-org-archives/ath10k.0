Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WijqS-000707-Lf
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:24:10 +0000
Received: by mail-ee0-f54.google.com with SMTP id b57so2633270eek.27
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:23:46 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/5] ath10k: dont configure bssid for ap mode
Date: Fri,  9 May 2014 14:15:49 +0200
Message-Id: <1399637749-13489-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
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
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 78b427d..9b14ec8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2953,7 +2953,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 		arvif->u.ap.hidden_ssid = info->hidden_ssid;
 	}
 
-	if (changed & BSS_CHANGED_BSSID) {
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
