Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz1IO-0002cv-B1
 for ath10k@lists.infradead.org; Fri, 03 Jan 2014 09:44:00 +0000
Received: by mail-pb0-f52.google.com with SMTP id uo5so15426595pbc.25
 for <ath10k@lists.infradead.org>; Fri, 03 Jan 2014 01:43:39 -0800 (PST)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: fix the MAC address of peer statistic
Date: Fri,  3 Jan 2014 17:43:27 +0800
Message-Id: <1388742207-15694-1-git-send-email-yeohchunyeow@gmail.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Fix the MAC address of wmi_peer_stats so that it is
printed correctly. This is tested and verified using
firmware version 999.999.0.636.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |    3 +++
 drivers/net/wireless/ath/ath10k/wmi.h   |   14 +++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 6bdfad3..eec3439 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -242,6 +242,9 @@ void ath10k_debug_read_target_stats(struct ath10k *ar,
 		}
 	}
 
+	/* The first peer is self MAC address, ignore this */
+	num_peer_stats--;
+
 	if (num_peer_stats) {
 		struct wmi_peer_stats *peer_stats;
 		struct ath10k_peer_stat *s;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 0087d69..106a23e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -200,12 +200,12 @@ struct wmi_mac_addr {
 
 /* macro to convert MAC address from WMI word format to char array */
 #define WMI_MAC_ADDR_TO_CHAR_ARRAY(pwmi_mac_addr, c_macaddr) do { \
-	(c_macaddr)[0] =  ((pwmi_mac_addr)->word0) & 0xff; \
-	(c_macaddr)[1] = (((pwmi_mac_addr)->word0) >> 8) & 0xff; \
-	(c_macaddr)[2] = (((pwmi_mac_addr)->word0) >> 16) & 0xff; \
-	(c_macaddr)[3] = (((pwmi_mac_addr)->word0) >> 24) & 0xff; \
-	(c_macaddr)[4] =  ((pwmi_mac_addr)->word1) & 0xff; \
-	(c_macaddr)[5] = (((pwmi_mac_addr)->word1) >> 8) & 0xff; \
+	(c_macaddr)[0] = (((pwmi_mac_addr)->word0) >> 24) & 0xff; \
+	(c_macaddr)[1] = (((pwmi_mac_addr)->word0) >> 16) & 0xff; \
+	(c_macaddr)[2] = (((pwmi_mac_addr)->word0) >> 8) & 0xff; \
+	(c_macaddr)[3] =  ((pwmi_mac_addr)->word0) & 0xff; \
+	(c_macaddr)[4] = (((pwmi_mac_addr)->word1) >> 24) & 0xff; \
+	(c_macaddr)[5] = (((pwmi_mac_addr)->word1) >> 16) & 0xff; \
 	} while (0)
 
 struct wmi_cmd_map {
@@ -2820,9 +2820,9 @@ struct wmi_vdev_stats {
  * TODO: add more stats
  */
 struct wmi_peer_stats {
+	__le32 peer_tx_rate;	/* TBA */
 	struct wmi_mac_addr peer_macaddr;
 	__le32 peer_rssi;
-	__le32 peer_tx_rate;
 } __packed;
 
 struct wmi_vdev_create_cmd {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
