Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8Rcd-0003tF-9H
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 12:21:11 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix some of the macro definitions of HTT_RX_IND
 message
Date: Thu, 2 Jun 2016 17:50:25 +0530
Message-ID: <1464870025-4557-1-git-send-email-vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

Only five bits are defined to pass tid information in HTT_RX_IND
message, so the mask which can be used to extract tid should be 0x1f
instead of the current 0x3f. Also, macros which can be used to extract
flush_valid and release_valid bits have to be left shifted one bit less
because these information follow the tid right after. This patch does
not really fix anything functionally because these macros are not used
currently.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 911c535..430a83e 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -485,10 +485,10 @@ struct htt_mgmt_tx_completion {
 	__le32 status;
 } __packed;
 
-#define HTT_RX_INDICATION_INFO0_EXT_TID_MASK  (0x3F)
+#define HTT_RX_INDICATION_INFO0_EXT_TID_MASK  (0x1F)
 #define HTT_RX_INDICATION_INFO0_EXT_TID_LSB   (0)
-#define HTT_RX_INDICATION_INFO0_FLUSH_VALID   (1 << 6)
-#define HTT_RX_INDICATION_INFO0_RELEASE_VALID (1 << 7)
+#define HTT_RX_INDICATION_INFO0_FLUSH_VALID   (1 << 5)
+#define HTT_RX_INDICATION_INFO0_RELEASE_VALID (1 << 6)
 
 #define HTT_RX_INDICATION_INFO1_FLUSH_START_SEQNO_MASK   0x0000003F
 #define HTT_RX_INDICATION_INFO1_FLUSH_START_SEQNO_LSB    0
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
