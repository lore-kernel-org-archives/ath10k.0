Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMIIj-0002mP-0r
 for ath10k@lists.infradead.org; Fri, 13 Feb 2015 15:37:05 +0000
From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: Increase AST table SKID length limit
Date: Fri, 13 Feb 2015 21:06:16 +0530
Message-ID: <1423841776-16288-1-git-send-email-sjegadee@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

The current SKID length configuration causes firmware
to reject peer creation for not able to allocate
AST entries for peers. This issue is observed when
least significant 3 bytes are used ramdomly to create
client MAC addresses.

AST table SKID length configuration is increased to
maximum value to fix this issue.

Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 460771f..7f04645 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -223,7 +223,7 @@ struct ath10k_pktlog_hdr {
 #define TARGET_10X_NUM_WDS_ENTRIES		32
 #define TARGET_10X_DMA_BURST_SIZE		0
 #define TARGET_10X_MAC_AGGR_DELIM		0
-#define TARGET_10X_AST_SKID_LIMIT		16
+#define TARGET_10X_AST_SKID_LIMIT		128
 #define TARGET_10X_NUM_STATIONS			128
 #define TARGET_10X_NUM_PEERS			((TARGET_10X_NUM_STATIONS) + \
 						 (TARGET_10X_NUM_VDEVS))
--
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
