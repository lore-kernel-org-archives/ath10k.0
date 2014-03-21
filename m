Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQmyN-0003ND-T2
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 00:06:08 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Fix getting stats from firmware.
Date: Thu, 20 Mar 2014 17:05:24 -0700
Message-Id: <1395360324-20433-1-git-send-email-greearb@candelatech.com>
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

Make the request command object the right size so that
firmware will not just throw it away.
Tested customized and upstream firmware.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index fa1b9e0..4946471 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2766,6 +2766,11 @@ enum wmi_stats_id {
 	WMI_REQUEST_AP_STAT	= 0x02
 };
 
+struct wlan_inst_rssi_args {
+	__le16 cfg_retry_count;
+	__le16 retry_count;
+};
+
 struct wmi_request_stats_cmd {
 	__le32 stats_id;
 
@@ -2773,6 +2778,12 @@ struct wmi_request_stats_cmd {
 	 * Space to add parameters like
 	 * peer mac addr
 	 */
+	__le32 vdev_id;
+	/* peer MAC address */
+	struct wmi_mac_addr peer_macaddr;
+
+	/* Instantaneous RSSI arguments */
+	struct wlan_inst_rssi_args inst_rssi_args;
 } __packed;
 
 /* Suspend option */
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
