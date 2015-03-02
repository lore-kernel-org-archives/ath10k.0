Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSOay-00051X-A3
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 11:33:09 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V4 2/2] ath10k: Fix interrupt storm
Date: Mon, 2 Mar 2015 16:58:00 +0530
Message-ID: <1425295680-2269-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1425295680-2269-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1425295680-2269-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

Promiscuous mode is enabled when wlan interface is added to
bridge. ath10k creates a monitor mode when promiscuous mode
is enabled. When monitor vdev is running along with other
vdev(s) there is a huge number of interrupts generated
especially in noisy condition. Fix this by not enabling
promiscuous(monitor) mode when already a vdev is running.
As disabling promiscuous mode may have issues with 4-address
bridging in STA mode, the change is done specific to non-sta/ibss
mode types. This does not change the support of virtual interface of
type monitor along with other vdevs of any type.

This could fix management frame drop in fw due to unavailable
buffers because in monitor mode device receives everything seen
on the air. In noisy condition, disabling monitor mode helps assoc
go through without any issue.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   34 +++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3b5aaa3..c220c51 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -766,6 +766,26 @@ static int ath10k_monitor_stop(struct ath10k *ar)
 	return 0;
 }
 
+static bool ath10k_mac_should_disable_promisc(struct ath10k *ar)
+{
+	struct ath10k_vif *arvif;
+
+	if (!(ar->filter_flags & FIF_PROMISC_IN_BSS))
+		return true;
+
+	if (!ar->num_started_vdevs)
+		return false;
+
+	list_for_each_entry(arvif, &ar->arvifs, list)
+		if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
+			return false;
+
+	ath10k_dbg(ar, ATH10K_DBG_MAC,
+		   "mac disabling promiscuous mode because vdev is started\n");
+	ar->filter_flags &= ~FIF_PROMISC_IN_BSS;
+	return true;
+}
+
 static int ath10k_monitor_recalc(struct ath10k *ar)
 {
 	bool should_start;
@@ -773,7 +793,7 @@ static int ath10k_monitor_recalc(struct ath10k *ar)
 	lockdep_assert_held(&ar->conf_mutex);
 
 	should_start = ar->monitor ||
-		       ar->filter_flags & FIF_PROMISC_IN_BSS ||
+		       !ath10k_mac_should_disable_promisc(ar);
 		       test_bit(ATH10K_CAC_RUNNING, &ar->dev_flags);
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC,
@@ -910,7 +930,7 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 	struct ath10k *ar = arvif->ar;
 	struct cfg80211_chan_def *chandef = &ar->chandef;
 	struct wmi_vdev_start_request_arg arg = {};
-	int ret = 0;
+	int ret = 0, ret2;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -969,6 +989,16 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 	ar->num_started_vdevs++;
 	ath10k_recalc_radar_detection(ar);
 
+	ret = ath10k_monitor_recalc(ar);
+	if (ret) {
+		ath10k_warn(ar, "mac failed to recalc monitor for vdev %i restart %d: %d\n",
+			    arg.vdev_id, restart, ret);
+		ret2 = ath10k_vdev_stop(arvif);
+		if (ret2)
+			ath10k_warn(ar, "mac failed to stop vdev %i restart %d: %d\n",
+				    arg.vdev_id, restart, ret2);
+	}
+
 	return ret;
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
