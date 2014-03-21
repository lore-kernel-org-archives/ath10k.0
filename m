Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQs6y-0001Eo-UZ
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 05:35:21 +0000
Received: by mail-pa0-f46.google.com with SMTP id kp14so1941425pab.5
 for <ath10k@lists.infradead.org>; Thu, 20 Mar 2014 22:34:58 -0700 (PDT)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: fix the peer mac address in getting stats
Date: Fri, 21 Mar 2014 13:34:36 +0800
Message-Id: <1395380076-4306-1-git-send-email-yeohchunyeow@gmail.com>
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

Using the macro to convert the MAC address from WMI word
format to char array has lead to the wrong peer mac
address printed out while retrieving the peer stats from
FW. Fix this.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |    4 ++--
 drivers/net/wireless/ath/ath10k/wmi.h   |   10 ----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 6debd28..f95defa 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -252,8 +252,8 @@ void ath10k_debug_read_target_stats(struct ath10k *ar,
 			peer_stats = (struct wmi_peer_stats *)tmp;
 			s = &stats->peer_stat[i];
 
-			WMI_MAC_ADDR_TO_CHAR_ARRAY(&peer_stats->peer_macaddr,
-						   s->peer_macaddr);
+			memcpy(s->peer_macaddr, &peer_stats->peer_macaddr.addr,
+			       ETH_ALEN);
 			s->peer_rssi = __le32_to_cpu(peer_stats->peer_rssi);
 			s->peer_tx_rate =
 				__le32_to_cpu(peer_stats->peer_tx_rate);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e78a7ad..084bcc5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -198,16 +198,6 @@ struct wmi_mac_addr {
 	} __packed;
 } __packed;
 
-/* macro to convert MAC address from WMI word format to char array */
-#define WMI_MAC_ADDR_TO_CHAR_ARRAY(pwmi_mac_addr, c_macaddr) do { \
-	(c_macaddr)[0] =  ((pwmi_mac_addr)->word0) & 0xff; \
-	(c_macaddr)[1] = (((pwmi_mac_addr)->word0) >> 8) & 0xff; \
-	(c_macaddr)[2] = (((pwmi_mac_addr)->word0) >> 16) & 0xff; \
-	(c_macaddr)[3] = (((pwmi_mac_addr)->word0) >> 24) & 0xff; \
-	(c_macaddr)[4] =  ((pwmi_mac_addr)->word1) & 0xff; \
-	(c_macaddr)[5] = (((pwmi_mac_addr)->word1) >> 8) & 0xff; \
-	} while (0)
-
 struct wmi_cmd_map {
 	u32 init_cmdid;
 	u32 start_scan_cmdid;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
