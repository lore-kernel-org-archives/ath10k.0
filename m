Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b0XdC-0005Vq-I5
 for ath10k@lists.infradead.org; Wed, 11 May 2016 17:09:07 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 13/21] ath10k: Document cycle count related counters.
Date: Wed, 11 May 2016 10:02:25 -0700
Message-Id: <1462986153-16318-14-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
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

They are not necessarily named in an intuitive manner,
so at least add some comments to help the next person.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 8 ++++----
 drivers/net/wireless/ath/ath10k/wmi.h  | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e7c228a..91b1f95 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -189,10 +189,10 @@ struct ath10k_fw_stats_pdev {
 
 	/* PDEV stats */
 	s32 ch_noise_floor;
-	u32 tx_frame_count;
-	u32 rx_frame_count;
-	u32 rx_clear_count;
-	u32 cycle_count;
+	u32 tx_frame_count; /* Cycles spent transmitting frames */
+	u32 rx_frame_count; /* Cycles spent receiving frames */
+	u32 rx_clear_count; /* Total channel busy time, evidently */
+	u32 cycle_count; /* Total on-channel time */
 	u32 phy_err_count;
 	u32 chan_tx_power;
 	u32 ack_rx_bad;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 8d9b5b3..91c7df5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4208,10 +4208,10 @@ struct wmi_10_2_stats_event {
  */
 struct wmi_pdev_stats_base {
 	__le32 chan_nf;
-	__le32 tx_frame_count;
-	__le32 rx_frame_count;
-	__le32 rx_clear_count;
-	__le32 cycle_count;
+	__le32 tx_frame_count; /* Cycles spent transmitting frames */
+	__le32 rx_frame_count; /* Cycles spent receiving frames */
+	__le32 rx_clear_count; /* Total channel busy time, evidently */
+	__le32 cycle_count; /* Total on-channel time */
 	__le32 phy_err_count;
 	__le32 chan_tx_pwr;
 } __packed;
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
