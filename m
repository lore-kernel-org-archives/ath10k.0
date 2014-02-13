Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE1gN-0001ag-Gs
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 19:10:47 +0000
From: greearb@candelatech.com
Subject: [RFC] wmi:  Handle failure to start scan.
Date: Thu, 13 Feb 2014 11:09:54 -0800
Message-Id: <1392318594-32540-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

Properly clean up driver state in case firmware fails
to start scan for some reason.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 20f7c79..a5be0d3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -770,7 +770,25 @@ static int ath10k_wmi_event_scan(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_dbg(ATH10K_DBG_WMI, "WMI_SCAN_EVENT_PREEMPTED\n");
 		break;
 	case WMI_SCAN_EVENT_START_FAILED:
-		ath10k_dbg(ATH10K_DBG_WMI, "WMI_SCAN_EVENT_START_FAILED\n");
+		ath10k_warn("WMI_SCAN_EVENT_START_FAILED, reason: %i\n", reason);
+
+		ar->scan_channel = NULL;
+		if (!ar->scan.in_progress) {
+			ath10k_warn("scan-start-failed: no scan requested, ignoring\n");
+			break;
+		}
+
+		if (ar->scan.is_roc) {
+			ath10k_offchan_tx_purge(ar);
+
+			if (!ar->scan.aborting)
+				ieee80211_remain_on_channel_expired(ar->hw);
+		} else {
+			ieee80211_scan_completed(ar->hw, ar->scan.aborting);
+		}
+
+		del_timer(&ar->scan.timeout);
+		ar->scan.in_progress = false;
 		break;
 	default:
 		break;
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
