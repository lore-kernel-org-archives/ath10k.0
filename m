Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQwFp-0006rG-0d
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 10:00:45 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so2139022pdb.14
 for <ath10k@lists.infradead.org>; Fri, 21 Mar 2014 03:00:23 -0700 (PDT)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: add the Rx rate in FW stats
Date: Fri, 21 Mar 2014 18:00:14 +0800
Message-Id: <1395396014-24631-1-git-send-email-yeohchunyeow@gmail.com>
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

FW stats does provide the Rx rate information. Add this.
Tested with firmware 10.1.467.2-1.

Further investigation on firmware 999.999.0.636 indicates
that there is no Tx Rate and Rx Rate in the peer stats.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.h  |    1 +
 drivers/net/wireless/ath/ath10k/debug.c |    5 +++++
 drivers/net/wireless/ath/ath10k/wmi.h   |    1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index ad209a6..ca4cdab 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -119,6 +119,7 @@ struct ath10k_peer_stat {
 	u8 peer_macaddr[ETH_ALEN];
 	u32 peer_rssi;
 	u32 peer_tx_rate;
+	u32 peer_rx_rate;
 };
 
 struct ath10k_target_stats {
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index f95defa..4662cb7 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -257,6 +257,8 @@ void ath10k_debug_read_target_stats(struct ath10k *ar,
 			s->peer_rssi = __le32_to_cpu(peer_stats->peer_rssi);
 			s->peer_tx_rate =
 				__le32_to_cpu(peer_stats->peer_tx_rate);
+			s->peer_rx_rate =
+				__le32_to_cpu(peer_stats->peer_rx_rate);
 
 			tmp += sizeof(struct wmi_peer_stats);
 		}
@@ -425,6 +427,9 @@ static ssize_t ath10k_read_fw_stats(struct file *file, char __user *user_buf,
 		len += scnprintf(buf + len, buf_len - len, "%30s %u\n",
 				 "Peer TX rate",
 				 fw_stats->peer_stat[i].peer_tx_rate);
+		len += scnprintf(buf + len, buf_len - len, "%30s %u\n",
+				 "Peer RX rate",
+				 fw_stats->peer_stat[i].peer_rx_rate);
 		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
 	spin_unlock_bh(&ar->data_lock);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 084bcc5..2b2f0b7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2825,6 +2825,7 @@ struct wmi_peer_stats {
 	struct wmi_mac_addr peer_macaddr;
 	__le32 peer_rssi;
 	__le32 peer_tx_rate;
+	__le32 peer_rx_rate;
 } __packed;
 
 struct wmi_vdev_create_cmd {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
