Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR4U1-0007MO-4y
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 18:47:58 +0000
From: greearb@candelatech.com
Subject: [PATCH v2] ath10k:  Fix getting stats from firmware.
Date: Fri, 21 Mar 2014 11:47:22 -0700
Message-Id: <1395427642-30884-1-git-send-email-greearb@candelatech.com>
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

Tested on 10.x firmware, and others report it at least
makes older firmware no more broken than it already was.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Remove spurious comment.

 drivers/net/wireless/ath/ath10k/wmi.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index fa1b9e0..c11f49a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2766,13 +2766,20 @@ enum wmi_stats_id {
 	WMI_REQUEST_AP_STAT	= 0x02
 };
 
+struct wlan_inst_rssi_args {
+	__le16 cfg_retry_count;
+	__le16 retry_count;
+};
+
 struct wmi_request_stats_cmd {
 	__le32 stats_id;
 
-	/*
-	 * Space to add parameters like
-	 * peer mac addr
-	 */
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
