Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ6yi-00017C-Ku
 for ath10k@lists.infradead.org; Wed, 23 Oct 2013 22:32:37 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Log firmware debug prints and dbg logs.
Date: Wed, 23 Oct 2013 15:31:47 -0700
Message-Id: <1382567507-19154-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

This should aid in debugging firmware issues on standard
NIC hardware that does not have a serial port.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

NOTE:  This requires a previous patch sent privately to kvalo.

 drivers/net/wireless/ath/ath10k/debug.h |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c   | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 845c661..807bf03 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -33,6 +33,7 @@ enum ath10k_debug_mask {
 	ATH10K_DBG_MGMT		= 0x00000100,
 	ATH10K_DBG_DATA		= 0x00000200,
 	ATH10K_DBG_BMI		= 0x00000400,
+	ATH10K_DBG_FIRMWARE	= 0x00000800,
 	ATH10K_DBG_ANY		= 0xffffffff,
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index a796d0b..34cff8b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1046,7 +1046,12 @@ static void ath10k_wmi_event_echo(struct ath10k *ar, struct sk_buff *skb)
 
 static void ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb)
 {
-	ath10k_dbg(ATH10K_DBG_WMI, "WMI_DEBUG_MESG_EVENTID\n");
+	u32 *m = (u32 *)(skb->data);
+	ath10k_dbg(ATH10K_DBG_WMI, "WMI_DEBUG_MESG_EVENTID, dropped: %i\n",
+		   m[0]);
+	/* Format is dropped-count(u32) [message buffer]. */
+	if (ath10k_debug_mask & ATH10K_DBG_FIRMWARE)
+		ath10k_dbg_print_fw_dbg_buffer((u8 *)(&(m[1])), skb->len - 4);
 }
 
 static void ath10k_wmi_event_update_stats(struct ath10k *ar,
@@ -1402,7 +1407,10 @@ static void ath10k_wmi_event_profile_match(struct ath10k *ar,
 static void ath10k_wmi_event_debug_print(struct ath10k *ar,
 				  struct sk_buff *skb)
 {
+	struct wmi_debug_mesg_event *ev;
+	ev = (struct wmi_debug_mesg_event *)(skb->data);
 	ath10k_dbg(ATH10K_DBG_WMI, "WMI_DEBUG_PRINT_EVENTID\n");
+	ath10k_dbg(ATH10K_DBG_FIRMWARE, "%s\n", ev->bufp);
 }
 
 static void ath10k_wmi_event_pdev_qvit(struct ath10k *ar, struct sk_buff *skb)
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
