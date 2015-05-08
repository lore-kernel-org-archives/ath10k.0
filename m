Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqePS-0000LU-5T
 for ath10k@lists.infradead.org; Fri, 08 May 2015 09:17:31 +0000
Received: by lbbuc2 with SMTP id uc2so48907158lbb.2
 for <ath10k@lists.infradead.org>; Fri, 08 May 2015 02:17:02 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/3] ath10k: fix idle power consumption
Date: Fri,  8 May 2015 09:13:07 +0000
Message-Id: <1431076388-24800-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1431076388-24800-1-git-send-email-michal.kazior@tieto.com>
References: <1431076388-24800-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

From: Janusz Dziedzic <janusz.dziedzic@tieto.com>

mac80211 can update vif powersave state while
disconnected. Firmware doesn't behave nicely and
consumes more power than necessary if PS is
disabled on a non-started vdev. Hence
force-enable PS for non-running vdevs.

This reduces power drain on QCA61X4 from 88mA to
36mA when interface is up and not associated.
QCA988X wasn't measured.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 425dbe271495..9f576ca99f86 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1735,7 +1735,14 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 		enable_ps = false;
 	}
 
-	if (enable_ps) {
+	if (!arvif->is_started) {
+		/* mac80211 can update vif powersave state while disconnected.
+		 * Firmware doesn't behave nicely and consumes more power than
+		 * necessary if PS is disabled on a non-started vdev. Hence
+		 * force-enable PS for non-running vdevs.
+		 */
+		psmode = WMI_STA_PS_MODE_ENABLED;
+	} else if (enable_ps) {
 		psmode = WMI_STA_PS_MODE_ENABLED;
 		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
