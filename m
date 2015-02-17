Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNcuX-0000dm-9e
 for ath10k@lists.infradead.org; Tue, 17 Feb 2015 07:49:37 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V2 2/2] ath10k: Fix interrupt storm
Date: Tue, 17 Feb 2015 13:13:16 +0530
Message-ID: <1424158996-8830-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1424158996-8830-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1424158996-8830-1-git-send-email-vthiagar@qti.qualcomm.com>
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
index 3b5aaa3..66cc0a8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -969,6 +969,15 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 	ar->num_started_vdevs++;
 	ath10k_recalc_radar_detection(ar);
 
+	if (ar->filter_flags & FIF_PROMISC_IN_BSS) {
+		ar->filter_flags &= ~FIF_PROMISC_IN_BSS;
+		ath10k_dbg(ar, ATH10K_DBG_MAC,
+			   "mac disabling promiscuous mode because vdev is started\n");
+		ret = ath10k_monitor_recalc(ar);
+		if (ret)
+			ath10k_vdev_stop(arvif);
+	}
+
 	return ret;
 }
 
@@ -3476,6 +3485,13 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 
 	changed_flags &= SUPPORTED_FILTERS;
 	*total_flags &= SUPPORTED_FILTERS;
+	if (*total_flags & FIF_PROMISC_IN_BSS) {
+		if (ar->num_started_vdevs) {
+			ath10k_dbg(ar, ATH10K_DBG_MAC,
+				   "mac does not enable promiscuous mode when already a vdev is running\n");
+			*total_flags &= ~FIF_PROMISC_IN_BSS;
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
