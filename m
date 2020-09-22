Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKnpj-0000zT-0i
 for ath10k@lists.infradead.org; Tue, 22 Sep 2020 19:20:12 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/2] mac80211: Support not iterating over not-sdata-in-driver
 ifaces
Date: Tue, 22 Sep 2020 12:19:56 -0700
Message-Id: <20200922191957.25257-1-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Allow drivers to request that interface-iterator does NOT iterate
over interfaces that are not sdata-in-driver.  This will allow
us to fix crashes in ath10k (and possibly other drivers).

To summarize Johannes' explanation:

Consider

add interface wlan0
add interface wlan1
iterate active interfaces -> wlan0 wlan1
add interface wlan2
iterate active interfaces -> wlan0 wlan1 wlan2

If you apply this scenario to a restart, which ought to be functionally
equivalent to the normal startup, just compressed in time, you're
basically saying that today you get

add interface wlan0
add interface wlan1
iterate active interfaces -> wlan0 wlan1 wlan2 << problem here
add interface wlan2
iterate active interfaces -> wlan0 wlan1 wlan2

which yeah, totally seems wrong.

But fixing that to be

add interface wlan0
add interface wlan1
iterate active interfaces ->
<nothing>
add interface wlan2
iterate active interfaces -> <nothing>
(or
maybe -> wlan0 wlan1 wlan2 if the reconfig already completed)

This is also at least somewhat wrong, but better to not iterate
over something that exists in the driver than iterate over something
that does not.  Originally the first issue was causing crashes in
testing with lots of station vdevs on an ath10k radio, combined
with firmware crashing.

I ran with a similar patch for years with no obvious bad results,
including significant testing with ath9k and ath10k.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 include/net/mac80211.h | 4 ++++
 net/mac80211/util.c    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 66e2bfd165e82..9c4bffcaed404 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5344,11 +5344,15 @@ void ieee80211_sched_scan_stopped(struct ieee80211_hw *hw);
  * @IEEE80211_IFACE_ITER_RESUME_ALL: During resume, iterate over all
  *	interfaces, even if they haven't been re-added to the driver yet.
  * @IEEE80211_IFACE_ITER_ACTIVE: Iterate only active interfaces (netdev is up).
+ * @IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER: Skip any interfaces where SDATA
+ *	is not in the driver.  This may fix crashes during firmware recovery
+ *	for instance.
  */
 enum ieee80211_interface_iteration_flags {
 	IEEE80211_IFACE_ITER_NORMAL	= 0,
 	IEEE80211_IFACE_ITER_RESUME_ALL	= BIT(0),
 	IEEE80211_IFACE_ITER_ACTIVE	= BIT(1),
+	IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER	= BIT(2),
 };
 
 /**
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index c8504ffc71a11..f3bc05217f741 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -733,6 +733,9 @@ static void __iterate_interfaces(struct ieee80211_local *local,
 		if (!(iter_flags & IEEE80211_IFACE_ITER_RESUME_ALL) &&
 		    active_only && !(sdata->flags & IEEE80211_SDATA_IN_DRIVER))
 			continue;
+		if ((iter_flags & IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER) &&
+		    !(sdata->flags & IEEE80211_SDATA_IN_DRIVER))
+			continue;
 		if (ieee80211_sdata_running(sdata) || !active_only)
 			iterator(data, sdata->vif.addr,
 				 &sdata->vif);
-- 
2.26.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
