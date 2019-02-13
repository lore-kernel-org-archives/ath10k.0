Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtvHL-0004Um-7H
 for ath10k@lists.infradead.org; Wed, 13 Feb 2019 14:12:48 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Report low ack rssi based on the reason code
Date: Wed, 13 Feb 2019 19:42:30 +0530
Message-Id: <1550067150-8796-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

Firmware sends peer sta kickout event to the driver
along with the reason code for a particular peer.

Currently the sta kickout event is delivered to the
upper layer without checking if the reason code is
valid or not. This causes frequent disconnection of
the STA.

Report low ack rssi event to mac80211 only if the reason
code is valid.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  2 ++
 drivers/net/wireless/ath/ath10k/wmi.c     |  9 ++++++---
 drivers/net/wireless/ath/ath10k/wmi.h     | 12 ++++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 90617e1..63ca9c5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -885,6 +885,8 @@ static int ath10k_wmi_tlv_op_pull_peer_kick_ev(struct ath10k *ar,
 	}
 
 	arg->mac_addr = ev->peer_macaddr.addr;
+	arg->reason = __le32_to_cpu(ev->reason);
+	arg->reason_code_valid = true;
 
 	kfree(tb);
 	return 0;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b99b3a1..75707d6b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3393,9 +3393,6 @@ void ath10k_wmi_event_peer_sta_kickout(struct ath10k *ar, struct sk_buff *skb)
 		return;
 	}
 
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi event peer sta kickout %pM\n",
-		   arg.mac_addr);
-
 	rcu_read_lock();
 
 	sta = ieee80211_find_sta_by_ifaddr(ar->hw, arg.mac_addr, NULL);
@@ -3405,10 +3402,16 @@ void ath10k_wmi_event_peer_sta_kickout(struct ath10k *ar, struct sk_buff *skb)
 		goto exit;
 	}
 
+	if (arg.reason_code_valid &&
+	    arg.reason == WMI_PEER_STA_KICKOUT_REASON_UNSPECIFIED)
+		goto exit;
+
 	ieee80211_report_low_ack(sta, 10);
 
 exit:
 	rcu_read_unlock();
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi event peer sta kickout %pM reason code %d\n",
+		    arg.mac_addr, arg.reason);
 }
 
 /*
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 1f82f10..492ce0f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -6498,6 +6498,7 @@ struct wmi_10_4_chan_info_event {
 
 struct wmi_peer_sta_kickout_event {
 	struct wmi_mac_addr peer_macaddr;
+	__le32 reason;
 } __packed;
 
 #define WMI_CHAN_INFO_FLAG_COMPLETE BIT(0)
@@ -6737,6 +6738,8 @@ struct wmi_vdev_start_ev_arg {
 
 struct wmi_peer_kick_ev_arg {
 	const u8 *mac_addr;
+	u32 reason;
+	bool reason_code_valid;
 };
 
 struct wmi_swba_ev_arg {
@@ -6827,6 +6830,15 @@ struct wmi_pdev_bss_chan_info_event {
 	__le32 reserved;
 } __packed;
 
+enum wmi_peer_sta_kickout_reason {
+	WMI_PEER_STA_KICKOUT_REASON_UNSPECIFIED,
+	WMI_PEER_STA_KICKOUT_REASON_XRETRY,
+	WMI_PEER_STA_KICKOUT_REASON_INACTIVITY,
+	WMI_PEER_STA_KICKOUT_REASON_IBSS_DISCONNECT,
+	WMI_PEER_STA_KICKOUT_REASON_TDLS_DISCONNECT,
+	WMI_PEER_STA_KICKOUT_REASON_SA_QUERY_TIMEOUT,
+};
+
 /* WOW structures */
 enum wmi_wow_wakeup_event {
 	WOW_BMISS_EVENT = 0,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
