Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFYUl-0001Ck-87
 for ath10k@lists.infradead.org; Thu, 16 Jul 2015 02:01:55 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH v3 2/3] ath10k: redefine rx_ppdu_end_common structure to cover
 qca99x0
Date: Wed, 15 Jul 2015 19:01:20 -0700
Message-ID: <378147cac1ea1c963173360837080dfcc9af7ba5.1437011880.git.poh@qca.qualcomm.com>
In-Reply-To: <cover.1437011880.git.poh@qca.qualcomm.com>
References: <cover.1437011880.git.poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

rx_ppdu_end_common structure is valid for both of qca998x and
qca6174, but not for qca99x0 since it has new additional members.
Hence update the common structure to cover qca99x0 as well.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/rx_desc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index 492b5a5..6cb078d 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -891,13 +891,13 @@ struct rx_ppdu_end_common {
 	__le32 evm_p15;
 	__le32 tsf_timestamp;
 	__le32 wb_timestamp;
-	u8 locationing_timestamp;
-	u8 phy_err_code;
-	__le16 flags; /* %RX_PPDU_END_FLAGS_ */
-	__le32 info0; /* %RX_PPDU_END_INFO0_ */
 } __packed;
 
 struct rx_ppdu_end_qca988x {
+	u8 locationing_timestamp;
+	u8 phy_err_code;
+	__le16 flags; /* %RX_PPDU_END_FLAGS_ */
+	__le32 info0; /* %RX_PPDU_END_INFO0_ */
 	__le16 bb_length;
 	__le16 info1; /* %RX_PPDU_END_INFO1_ */
 } __packed;
@@ -909,6 +909,10 @@ struct rx_ppdu_end_qca988x {
 #define RX_PPDU_END_RTT_NORMAL_MODE            BIT(31)
 
 struct rx_ppdu_end_qca6174 {
+	u8 locationing_timestamp;
+	u8 phy_err_code;
+	__le16 flags; /* %RX_PPDU_END_FLAGS_ */
+	__le32 info0; /* %RX_PPDU_END_INFO0_ */
 	__le32 rtt; /* %RX_PPDU_END_RTT_ */
 	__le16 bb_length;
 	__le16 info1; /* %RX_PPDU_END_INFO1_ */
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
