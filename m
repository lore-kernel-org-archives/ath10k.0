Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmGKT-0004qH-Pc
 for ath10k@lists.infradead.org; Tue, 20 Sep 2016 08:23:06 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Ignore SWBA event for a vif if its marked for no
 beacon
Date: Tue, 20 Sep 2016 13:52:07 +0530
Message-ID: <1474359727-6854-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Ignore processing further in SWBA event scheduled for a vif, if mac80211
has marked the particular vif for stop beaconing and brought the vdev
down in 'ath10k_control_beaconing'. This should potentially avoid ath10k
warning/error messages while running continuous wifi down/up with max
number of vaps configured. Found this change during code walk through
and going through other beacon configuration related functions in ath10k

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index eb4ab6f..f37f178 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3514,6 +3514,12 @@ void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 			continue;
 		}
 
+		/* mac80211 would have already asked us to stop beaconing and
+		 * bring the vdev down, so continue in that case
+		 */
+		if (!arvif->is_up)
+			continue;
+
 		/* There are no completions for beacons so wait for next SWBA
 		 * before telling mac80211 to decrement CSA counter
 		 *
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
