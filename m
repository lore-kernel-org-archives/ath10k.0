Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMumG-0004jC-7c
 for ath10k@lists.infradead.org; Thu, 28 Aug 2014 08:09:52 +0000
Received: by mail-la0-f45.google.com with SMTP id pn19so475366lab.4
 for <ath10k@lists.infradead.org>; Thu, 28 Aug 2014 01:09:29 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix num_legacy_stations tracking
Date: Thu, 28 Aug 2014 09:59:39 +0200
Message-Id: <1409212779-5212-1-git-send-email-michal.kazior@tieto.com>
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

If a station was reassociated, i.e. due to change
of supported rates update via sta_rc_update() the
num_legacy_stations would be (incorrectly) bumped
up leading to unbalanced usage of the var. This in
turn could lock rtscts protection up as enabled.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b858c82..4e30e57 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1615,7 +1615,7 @@ static int ath10k_station_assoc(struct ath10k *ar, struct ath10k_vif *arvif,
 		return ret;
 	}
 
-	if (!sta->wme) {
+	if (!sta->wme && !reassoc) {
 		arvif->num_legacy_stations++;
 		ret  = ath10k_recalc_rtscts_prot(arvif);
 		if (ret) {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
