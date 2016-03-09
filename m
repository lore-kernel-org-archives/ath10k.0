Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adYQb-0001gW-Do
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 07:21:06 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH v2] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
Date: Wed, 9 Mar 2016 12:50:02 +0530
Message-ID: <1457508003-16700-1-git-send-email-mohammed@qca.qualcomm.com>
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
To: linux-wireless@vger.kernel.org
Cc: mohammed@codeaurora.org, johannes@sipsolutions.net, kvalo@codeaurora.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Add support for new netlink attribute 'NL80211_STA_INFO_RX_DURATION'
This flag will be set when drivers can fill rx_duration (approximate
total air time(usecs) for all the frames from a connected client) via
'drv_sta_statistics' callback

Also make sta_info flags 'filled' as 64 bit to accommodate for new
per station stats. Extend 'PUT_SINFO' for supporting rx_duration
field and any new per sta information in future

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 include/net/cfg80211.h       |    5 ++++-
 include/uapi/linux/nl80211.h |    3 +++
 net/wireless/nl80211.c       |    3 ++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9bcaaf7..7897162 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1060,11 +1060,13 @@ struct cfg80211_tid_stats {
  * @rx_beacon: number of beacons received from this peer
  * @rx_beacon_signal_avg: signal strength average (in dBm) for beacons received
  *	from this peer
+ * @rx_duration: approximate total air time(usecs) for all the frames from a
+ *	connected client
  * @pertid: per-TID statistics, see &struct cfg80211_tid_stats, using the last
  *	(IEEE80211_NUM_TIDS) index for MSDUs not encapsulated in QoS-MPDUs.
  */
 struct station_info {
-	u32 filled;
+	u64 filled;
 	u32 connected_time;
 	u32 inactive_time;
 	u64 rx_bytes;
@@ -1103,6 +1105,7 @@ struct station_info {
 	u32 expected_throughput;
 
 	u64 rx_beacon;
+	u64 rx_duration;
 	u8 rx_beacon_signal_avg;
 	struct cfg80211_tid_stats pertid[IEEE80211_NUM_TIDS + 1];
 };
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 5b7b5eb..3de3975 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2464,6 +2464,8 @@ enum nl80211_sta_bss_param {
  *	TID+1 and the special TID 16 (i.e. value 17) is used for non-QoS frames;
  *	each one of those is again nested with &enum nl80211_tid_stats
  *	attributes carrying the actual values.
+ * @NL80211_STA_INFO_RX_DURATION: approximate total air time(usecs) for all the
+ *	frames from a connected client
  * @__NL80211_STA_INFO_AFTER_LAST: internal
  * @NL80211_STA_INFO_MAX: highest possible station info attribute
  */
@@ -2500,6 +2502,7 @@ enum nl80211_sta_info {
 	NL80211_STA_INFO_BEACON_RX,
 	NL80211_STA_INFO_BEACON_SIGNAL_AVG,
 	NL80211_STA_INFO_TID_STATS,
+	NL80211_STA_INFO_RX_DURATION,
 
 	/* keep last */
 	__NL80211_STA_INFO_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d4786f2..a81c016 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3719,7 +3719,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 		goto nla_put_failure;
 
 #define PUT_SINFO(attr, memb, type) do {				\
-	if (sinfo->filled & BIT(NL80211_STA_INFO_ ## attr) &&		\
+	if (sinfo->filled & (1ULL << NL80211_STA_INFO_ ## attr) &&	\
 	    nla_put_ ## type(msg, NL80211_STA_INFO_ ## attr,		\
 			     sinfo->memb))				\
 		goto nla_put_failure;					\
@@ -3745,6 +3745,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 	PUT_SINFO(LLID, llid, u16);
 	PUT_SINFO(PLID, plid, u16);
 	PUT_SINFO(PLINK_STATE, plink_state, u8);
+	PUT_SINFO(RX_DURATION, rx_duration, u64);
 
 	switch (rdev->wiphy.signal_type) {
 	case CFG80211_SIGNAL_TYPE_MBM:
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
