Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhZ50-0007RM-4b
 for ath10k@lists.infradead.org; Mon, 13 Apr 2015 07:46:51 +0000
Received: by lbbuc2 with SMTP id uc2so52196526lbb.2
 for <ath10k@lists.infradead.org>; Mon, 13 Apr 2015 00:46:26 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 2/2] ath10k: don't disable PS when not connected
Date: Mon, 13 Apr 2015 09:45:41 +0200
Message-Id: <1428911141-6534-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1428911141-6534-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1428911141-6534-1-git-send-email-janusz.dziedzic@tieto.com>
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

Don't disable PS while we are not connected.
In other case we will get higher power consumption.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 52c5b1f..b896dd4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1730,7 +1730,13 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 		enable_ps = false;
 	}
 
-	if (enable_ps) {
+	if (!arvif->is_started) {
+		/* enable power save mode while not connected,
+		 * in other case after iface up we will get
+		 * higher power consumption - firmware design
+		 */
+		psmode = WMI_STA_PS_MODE_ENABLED;
+	} else if (enable_ps) {
 		psmode = WMI_STA_PS_MODE_ENABLED;
 		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
