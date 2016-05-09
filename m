Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1azupp-0007Zd-Dq
 for ath10k@lists.infradead.org; Mon, 09 May 2016 23:43:33 +0000
From: greearb@candelatech.com
Subject: [PATCH 13/21] ath10k: Document cycle count related counters.
Date: Mon,  9 May 2016 16:11:07 -0700
Message-Id: <1462835475-11079-14-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
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
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e7c228a..c4f649f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -189,10 +189,10 @@ struct ath10k_fw_stats_pdev {
 
 	/* PDEV stats */
 	s32 ch_noise_floor;
-	u32 tx_frame_count;
-	u32 rx_frame_count;
-	u32 rx_clear_count;
-	u32 cycle_count;
+	u32 tx_frame_count; /* cycles spent transmitting frames */
+	u32 rx_frame_count; /* cycles spent receiving frames */
+	u32 rx_clear_count; /* Total channel busy time, evidently */
+	u32 cycle_count; /* Total on-channel time */
 	u32 phy_err_count;
 	u32 chan_tx_power;
 	u32 ack_rx_bad;
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
