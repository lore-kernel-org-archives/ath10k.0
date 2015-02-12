Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLlwP-0006M6-EG
 for ath10k@lists.infradead.org; Thu, 12 Feb 2015 05:03:53 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix interrupt storm
Date: Thu, 12 Feb 2015 10:29:22 +0530
Message-ID: <1423717162-7788-1-git-send-email-vthiagar@qti.qualcomm.com>
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
is enabled. When monitor vdev is runing along with other
vdev(s) there is a huge number of interrupts generated
especially in noisy condition. Fix this by not enabling
promiscuous(monitor) mode when already a vdev is running.
This does not change the support of virtual interface of
type monitor along with other vdevs.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d6d2f0f..310e608 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -932,6 +932,14 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 		return ret;
 	}
 
+	if (ar->filter_flags & FIF_PROMISC_IN_BSS) {
+		ar->filter_flags &= ~FIF_PROMISC_IN_BSS;
+		ath10k_dbg(ar, ATH10K_DBG_MAC, "Disabling promiscuous mode when we start a vdev\n");
+		ret = ath10k_monitor_recalc(ar);
+		if (ret)
+			return ret;
+	}
+
 	ar->num_started_vdevs++;
 	ath10k_recalc_radar_detection(ar);
 
@@ -3369,6 +3377,14 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 
 	changed_flags &= SUPPORTED_FILTERS;
 	*total_flags &= SUPPORTED_FILTERS;
+	if (*total_flags & FIF_PROMISC_IN_BSS) {
+		if (ar->num_started_vdevs) {
+			ath10k_dbg(ar, ATH10K_DBG_MAC,
+				   "Not enabling promiscuous mode when already a vdev is running\n");
+			mutex_unlock(&ar->conf_mutex);
+			return;
+		}
+	}
 	ar->filter_flags = *total_flags;
 
 	ret = ath10k_monitor_recalc(ar);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
