Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWRQL-0000WD-LO
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 13:46:06 +0000
Subject: [PATCH v2 1/8] ath10k: prevent starting monitor without a vdev
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 16 Oct 2013 16:45:41 +0300
Message-ID: <20131016134541.25095.59430.stgit@localhost6.localdomain6>
In-Reply-To: <20131016134503.25095.8044.stgit@localhost6.localdomain6>
References: <20131016134503.25095.8044.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

From: Michal Kazior <michal.kazior@tieto.com>

This fixes issue with interface bridging.

Linux bridging sets promiscuous mode for all
interfaces that are in a bridge. This translates
to configure_filter() being called in a mac80211
driver.

Before the patch operational interface would be
started and upped again when promiscuous mode was
enabled causing all sorts of strange issues:

 * no HTT RX happening (i.e. no traffic)
 * FW crash upon driver reload/unload

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0b1cc51..527343d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2265,8 +2265,14 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 	*total_flags &= SUPPORTED_FILTERS;
 	ar->filter_flags = *total_flags;
 
+	/* Monitor must not be started if it wasn't created first.
+	 * Promiscuous mode may be started on a non-monitor interface - in
+	 * such case the monitor vdev is not created so starting the
+	 * monitor makes no sense. Since ath10k uses no special RX filters
+	 * (only BSS filter in STA mode) there's no need for any special
+	 * action here. */
 	if ((ar->filter_flags & FIF_PROMISC_IN_BSS) &&
-	    !ar->monitor_enabled) {
+	    !ar->monitor_enabled && ar->monitor_present) {
 		ath10k_dbg(ATH10K_DBG_MAC, "mac monitor %d start\n",
 			   ar->monitor_vdev_id);
 
@@ -2274,7 +2280,7 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 		if (ret)
 			ath10k_warn("Unable to start monitor mode\n");
 	} else if (!(ar->filter_flags & FIF_PROMISC_IN_BSS) &&
-		   ar->monitor_enabled) {
+		   ar->monitor_enabled && ar->monitor_present) {
 		ath10k_dbg(ATH10K_DBG_MAC, "mac monitor %d stop\n",
 			   ar->monitor_vdev_id);
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
