Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ys9ZX-0005Ic-Uw
 for ath10k@lists.infradead.org; Tue, 12 May 2015 12:46:08 +0000
Received: by lbbzk7 with SMTP id zk7so4868964lbb.0
 for <ath10k@lists.infradead.org>; Tue, 12 May 2015 05:45:45 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] amth10k: fix promisc handling
Date: Tue, 12 May 2015 12:45:36 +0000
Message-Id: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
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

Patch df1404650ccb ("mac80211: remove support for
IFF_PROMISC") removed promiscuous flag propagation
to drivers.

However the patch was designed against ath10k
without 548462133d98 ("ath10k: fix interrupt
storm").

After merge the code drifted into being no longer
correct and due to monitor vdev being
overzealously started caused IBSS to crash on
999.999.0.636 for QCA988X (this firmware revision
is known to have issues with monitor vdev).

This patch keeps expectations of commit
548462133d98 (i.e. reduce irq storm by not
enabling monitor vdev for AP) and doesn't break
existing (known) setups that imply promiscuous
mode on network interfaces.

Contrary to what it looks like 548462133d98
functionality is not reverted since the intention
was a subset of what df1404650ccb did.

Fixes: c17c997d5613 ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 425dbe271495..594eb369ff7f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1031,22 +1031,6 @@ static int ath10k_monitor_stop(struct ath10k *ar)
 	return 0;
 }
 
-static bool ath10k_mac_should_disable_promisc(struct ath10k *ar)
-{
-	struct ath10k_vif *arvif;
-
-	if (!ar->num_started_vdevs)
-		return false;
-
-	list_for_each_entry(arvif, &ar->arvifs, list)
-		if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
-			return false;
-
-	ath10k_dbg(ar, ATH10K_DBG_MAC,
-		   "mac disabling promiscuous mode because vdev is started\n");
-	return true;
-}
-
 static bool ath10k_mac_monitor_vdev_is_needed(struct ath10k *ar)
 {
 	int num_ctx;
@@ -1065,7 +1049,6 @@ static bool ath10k_mac_monitor_vdev_is_needed(struct ath10k *ar)
 		return false;
 
 	return ar->monitor ||
-	       !ath10k_mac_should_disable_promisc(ar) ||
 	       test_bit(ATH10K_CAC_RUNNING, &ar->dev_flags);
 }
 
@@ -1267,7 +1250,7 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif,
 {
 	struct ath10k *ar = arvif->ar;
 	struct wmi_vdev_start_request_arg arg = {};
-	int ret = 0, ret2;
+	int ret = 0;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -1326,16 +1309,6 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif,
 	ar->num_started_vdevs++;
 	ath10k_recalc_radar_detection(ar);
 
-	ret = ath10k_monitor_recalc(ar);
-	if (ret) {
-		ath10k_warn(ar, "mac failed to recalc monitor for vdev %i restart %d: %d\n",
-			    arg.vdev_id, restart, ret);
-		ret2 = ath10k_vdev_stop(arvif);
-		if (ret2)
-			ath10k_warn(ar, "mac failed to stop vdev %i restart %d: %d\n",
-				    arg.vdev_id, restart, ret2);
-	}
-
 	return ret;
 }
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
