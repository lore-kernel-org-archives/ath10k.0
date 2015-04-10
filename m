Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgZ1X-0001su-PE
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 13:31:08 +0000
Received: by layy10 with SMTP id y10so13320986lay.0
 for <ath10k@lists.infradead.org>; Fri, 10 Apr 2015 06:30:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/4] ath10k: set def key idx for ibss
Date: Fri, 10 Apr 2015 13:23:22 +0000
Message-Id: <1428672203-8604-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
References: <1428672203-8604-1-git-send-email-michal.kazior@tieto.com>
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

Some time ago there was a weird issue with AP
using wrong multicast keys and generating
corrupted traffic on 10.1 firmware.

Apparently a very similar problem applies for
IBSS-RSN on 999.999.0.636.

ath10k doesn't have IBSS-RSN enabled yet. This
patch is a prerequisite to support it.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 93f753cb839a..9428d75d0d76 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4691,10 +4691,14 @@ static void ath10k_set_key_h_def_keyidx(struct ath10k *ar,
 	 * frames with multi-vif APs. This is not required for main firmware
 	 * branch (e.g. 636).
 	 *
-	 * FIXME: This has been tested only in AP. It remains unknown if this
-	 * is required for multi-vif STA interfaces on 10.1 */
+	 * This is also needed for 636 fw for IBSS-RSN to work more reliably.
+	 *
+	 * FIXME: It remains unknown if this is required for multi-vif STA
+	 * interfaces on 10.1.
+	 */
 
-	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
+	if (arvif->vdev_type != WMI_VDEV_TYPE_AP &&
+	    arvif->vdev_type != WMI_VDEV_TYPE_IBSS)
 		return;
 
 	if (key->cipher == WLAN_CIPHER_SUITE_WEP40)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
