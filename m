Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMxZZ-0002Si-J9
 for ath10k@lists.infradead.org; Thu, 28 Aug 2014 11:08:58 +0000
Received: by mail-la0-f45.google.com with SMTP id pn19so717192lab.18
 for <ath10k@lists.infradead.org>; Thu, 28 Aug 2014 04:08:35 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: stop monitor vdev for sta assoc
Date: Thu, 28 Aug 2014 12:58:17 +0200
Message-Id: <1409223497-19946-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1409223497-19946-1-git-send-email-michal.kazior@tieto.com>
References: <1409223497-19946-1-git-send-email-michal.kazior@tieto.com>
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

This prevents some fw revisions from crashing in
many cases when user is trying to run a
promiscuous station interface (e.g. sniffing,
4addr bridge).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 19562a7..bf8a402 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3169,8 +3169,16 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_ASSOC) {
-		if (info->assoc)
+		if (info->assoc) {
+			/* Workaround: Make sure monitor vdev is not running
+			 * when associating to prevent some firmware revisions
+			 * (e.g. 10.1 and 10.2) from crashing.
+			 */
+			if (ar->monitor_started)
+				ath10k_monitor_stop(ar);
 			ath10k_bss_assoc(hw, vif, info);
+			ath10k_monitor_recalc(ar);
+		}
 	}
 
 exit:
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
