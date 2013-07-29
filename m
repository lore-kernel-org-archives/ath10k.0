Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3izt-0005Fv-C5
 for ath10k@lists.infradead.org; Mon, 29 Jul 2013 08:40:06 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 2/3] mac80211: add support for scan chan_time parameter
Date: Mon, 29 Jul 2013 10:39:17 +0200
Message-ID: <1375087158-22077-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
References: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
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
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

This allows mac80211-based drivers that support
hw_scan() to get chan_time paremter.

This also makes mac80211-based drivers that don't
support hw_scan() to respect the chan_time
parameter.

The effective minimum channel time for swscan
drivers is the probe delay. hw_scan drivers may
have their own limits.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 net/mac80211/scan.c |   22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index 08afe74..e8b1aca 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -443,7 +443,18 @@ static void ieee80211_scan_state_send_probe(struct ieee80211_local *local,
 	 * After sending probe requests, wait for probe responses
 	 * on the channel.
 	 */
-	*next_delay = IEEE80211_CHANNEL_TIME;
+	if (local->scan_req->chan_time) {
+		/*
+		 * Account probe delay to compute the delay needed to reach
+		 * chan_time on a given channel.
+		 */
+		*next_delay = msecs_to_jiffies(local->scan_req->chan_time);
+		if (*next_delay > IEEE80211_PROBE_DELAY)
+			*next_delay -= IEEE80211_PROBE_DELAY;
+		else
+			*next_delay = 0;
+	} else
+		*next_delay = IEEE80211_CHANNEL_TIME;
 	local->next_scan_state = SCAN_DECISION;
 }
 
@@ -485,6 +496,7 @@ static int __ieee80211_start_scan(struct ieee80211_sub_if_data *sdata,
 			req->n_channels * sizeof(req->channels[0]);
 		local->hw_scan_req->ie = ies;
 		local->hw_scan_req->flags = req->flags;
+		local->hw_scan_req->chan_time = req->chan_time;
 
 		local->hw_scan_band = 0;
 
@@ -532,6 +544,9 @@ static int __ieee80211_start_scan(struct ieee80211_sub_if_data *sdata,
 			next_delay = IEEE80211_CHANNEL_TIME;
 		}
 
+		if (req->chan_time)
+			next_delay = msecs_to_jiffies(req->chan_time);
+
 		/* Now, just wait a bit and we are all done! */
 		ieee80211_queue_delayed_work(&local->hw, &local->scan_work,
 					     next_delay);
@@ -696,7 +711,10 @@ static void ieee80211_scan_state_set_channel(struct ieee80211_local *local,
 	 */
 	if (chan->flags & IEEE80211_CHAN_PASSIVE_SCAN ||
 	    !local->scan_req->n_ssids) {
-		*next_delay = IEEE80211_PASSIVE_CHANNEL_TIME;
+		if (local->scan_req->chan_time)
+			*next_delay = msecs_to_jiffies(local->scan_req->chan_time);
+		else
+			*next_delay = IEEE80211_PASSIVE_CHANNEL_TIME;
 		local->next_scan_state = SCAN_DECISION;
 		return;
 	}
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
