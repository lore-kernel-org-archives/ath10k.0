Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab7Sw-0002AT-Px
 for ath10k@lists.infradead.org; Wed, 02 Mar 2016 14:09:27 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] iw: Add support for NL80211_STA_INFO_RX_DURATION netlink
 attribute
Date: Wed, 2 Mar 2016 19:38:57 +0530
Message-ID: <1456927737-32111-1-git-send-email-mohammed@qca.qualcomm.com>
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

Enable support for parsing per station rx-duration (usecs)
via adding support for new netlink attribute NL80211_STA_INFO_RX_DURATION

rx_duration is total air time(usecs) for unicast data/management frames
from the connected client. This will get dumped as part ofi
iw dev wlan#N station dump

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 nl80211.h |    3 +++
 station.c |    5 +++++
 2 files changed, 8 insertions(+)

diff --git a/nl80211.h b/nl80211.h
index 5b7b5eb..f510206 100644
--- a/nl80211.h
+++ b/nl80211.h
@@ -2464,6 +2464,8 @@ enum nl80211_sta_bss_param {
  *	TID+1 and the special TID 16 (i.e. value 17) is used for non-QoS frames;
  *	each one of those is again nested with &enum nl80211_tid_stats
  *	attributes carrying the actual values.
+ * @NL80210_STA_INFO_RX_DURATION: total rx time(usecs) spent for receiving data
+ * 	frames from this peer. This is driver/firmware implementation specific
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
diff --git a/station.c b/station.c
index b5ccf4a..a730db1 100644
--- a/station.c
+++ b/station.c
@@ -147,6 +147,7 @@ static int print_sta_handler(struct nl_msg *msg, void *arg)
 		[NL80211_STA_INFO_NONPEER_PM] = { .type = NLA_U32},
 		[NL80211_STA_INFO_CHAIN_SIGNAL] = { .type = NLA_NESTED },
 		[NL80211_STA_INFO_CHAIN_SIGNAL_AVG] = { .type = NLA_NESTED },
+		[NL80211_STA_INFO_RX_DURATION] = { .type = NLA_U64 },
 	};
 	char *chain;
 
@@ -226,6 +227,10 @@ static int print_sta_handler(struct nl_msg *msg, void *arg)
 		printf("\n\trx bitrate:\t%s", buf);
 	}
 
+	if (sinfo[NL80211_STA_INFO_RX_DURATION])
+		printf("\n\trx duration:\t%lld us",
+		       (unsigned long long)nla_get_u64(sinfo[NL80211_STA_INFO_RX_DURATION]));
+
 	if (sinfo[NL80211_STA_INFO_EXPECTED_THROUGHPUT]) {
 		uint32_t thr;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
