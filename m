Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW8UF-0007Rg-Go
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 17:32:52 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so9108491pdi.5
 for <ath10k@lists.infradead.org>; Tue, 15 Oct 2013 10:32:28 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/7] ath10k: prevent starting monitor without a vdev
Date: Tue, 15 Oct 2013 10:29:50 -0700
Message-Id: <1381858196-17000-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
References: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
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
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 049eca2..9f26fcf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2205,8 +2205,13 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 	*total_flags &= SUPPORTED_FILTERS;
 	ar->filter_flags = *total_flags;
 
+	/* Monitor must not be started if it wasn't created first. Promiscuous
+	 * mode may be started on a non-monitor interface - in such case the monitor
+	 * vdev is not created so starting the monitor makes no sense. Since
+	 * ath10k uses no special RX filters (only BSS filter in STA mode)
+	 * there's no need for any special action here. */
 	if ((ar->filter_flags & FIF_PROMISC_IN_BSS) &&
-	    !ar->monitor_enabled) {
+	    !ar->monitor_enabled && ar->monitor_present) {
 		ath10k_dbg(ATH10K_DBG_MAC, "mac monitor %d start\n",
 			   ar->monitor_vdev_id);
 
@@ -2214,7 +2219,7 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
 		if (ret)
 			ath10k_warn("Unable to start monitor mode\n");
 	} else if (!(ar->filter_flags & FIF_PROMISC_IN_BSS) &&
-		   ar->monitor_enabled) {
+		   ar->monitor_enabled && ar->monitor_present) {
 		ath10k_dbg(ATH10K_DBG_MAC, "mac monitor %d stop\n",
 			   ar->monitor_vdev_id);
 
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
