Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT3A3-0003Ss-Br
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 06:52:03 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 1/2] ath10k: fix rts profile for second rate series
Date: Wed, 4 Mar 2015 12:20:46 +0530
Message-ID: <1425451847-14505-1-git-send-email-rmanohar@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

By default rts protection is enabled in firmware for the second
rateset. Currently ath10k selects RTS profile (only for software
retries), when legacy stations are associated or asked by mac80211.
On congested environment, when AP is running in HT/VHT mode and
there are no legacy clients associated, this will impact the
robustness. Also enabling RTS protection only for second rateset will
not impact performance on clear environment. Fix that.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 84a243e..37141b3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -798,12 +798,14 @@ static int ath10k_recalc_rtscts_prot(struct ath10k_vif *arvif)
 
 	vdev_param = ar->wmi.vdev_param->enable_rtscts;
 
-	if (arvif->use_cts_prot || arvif->num_legacy_stations > 0)
-		rts_cts |= SM(WMI_RTSCTS_ENABLED, WMI_RTSCTS_SET);
+	rts_cts |= SM(WMI_RTSCTS_ENABLED, WMI_RTSCTS_SET);
 
 	if (arvif->num_legacy_stations > 0)
 		rts_cts |= SM(WMI_RTSCTS_ACROSS_SW_RETRIES,
 			      WMI_RTSCTS_PROFILE);
+	else
+		rts_cts |= SM(WMI_RTSCTS_FOR_SECOND_RATESERIES,
+			      WMI_RTSCTS_PROFILE);
 
 	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
 					 rts_cts);
-- 
2.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
