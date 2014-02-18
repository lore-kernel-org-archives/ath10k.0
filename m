Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFnyK-0005mC-DM
 for ath10k@lists.infradead.org; Tue, 18 Feb 2014 16:56:41 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  make TARGET_NUM_PEERS match WMI_MAX_KEY_INDEX.
Date: Tue, 18 Feb 2014 08:56:07 -0800
Message-Id: <1392742567-6134-1-git-send-email-greearb@candelatech.com>
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

This appears to fix the problem of running out of keys
in the firmware.  Possibly it only hides the problem,
however.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 89167d5..dede8e0 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -83,7 +83,7 @@ enum ath10k_mcast2ucast_mode {
 #define TARGET_NUM_PEERS			16
 #define TARGET_NUM_OFFLOAD_PEERS		0
 #define TARGET_NUM_OFFLOAD_REORDER_BUFS         0
-#define TARGET_NUM_PEER_KEYS			2
+#define TARGET_NUM_PEER_KEYS			(WMI_MAX_KEY_INDEX + 1) /* 4 */
 #define TARGET_NUM_TIDS		(2 * ((TARGET_NUM_PEERS) + (TARGET_NUM_VDEVS)))
 #define TARGET_TX_CHAIN_MASK			(BIT(0) | BIT(1) | BIT(2))
 #define TARGET_RX_CHAIN_MASK			(BIT(0) | BIT(1) | BIT(2))
@@ -125,7 +125,7 @@ enum ath10k_mcast2ucast_mode {
 
 #define TARGET_10X_NUM_OFFLOAD_PEERS		0
 #define TARGET_10X_NUM_OFFLOAD_REORDER_BUFS	0
-#define TARGET_10X_NUM_PEER_KEYS		2
+#define TARGET_10X_NUM_PEER_KEYS		(WMI_MAX_KEY_INDEX + 1) /* 4 */
 #define TARGET_10X_NUM_TIDS			256
 #define TARGET_10X_TX_CHAIN_MASK		(BIT(0) | BIT(1) | BIT(2))
 #define TARGET_10X_RX_CHAIN_MASK		(BIT(0) | BIT(1) | BIT(2))
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
