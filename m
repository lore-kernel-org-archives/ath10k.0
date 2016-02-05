Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRpWD-0005A5-Ba
 for ath10k@lists.infradead.org; Fri, 05 Feb 2016 23:10:25 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k: Document alloc_frag_desc_for_data_pkt config option.
Date: Fri,  5 Feb 2016 15:10:02 -0800
Message-Id: <1454713802-21244-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

This will help anyone trying to use the ack-rssi reporting
feature with the host-specified TX-rate option in 10.4 firmware.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e27a3ba..9f7cfc1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2678,9 +2678,14 @@ struct wmi_resource_config_10_4 {
 	 */
 	__le32 iphdr_pad_config;
 
-	/* qwrap configuration
+	/* qwrap configuration (bits 15-0)
 	 * 1  - This is qwrap configuration
 	 * 0  - This is not qwrap
+	 *
+	 * Bits 31-16 is alloc_frag_desc_for_data_pkt (1 enables, 0 disables)
+	 * In order to get ack-RSSI reporting and to specify the tx-rate for
+	 * individual frames, this option must be enabled.  This uses an extra
+	 * 4 bytes per tx-msdu descriptor, so don't enable it unless you need it.
 	 */
 	__le32 qwrap_config;
 } __packed;
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
