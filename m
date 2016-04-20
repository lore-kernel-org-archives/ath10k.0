Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1astcN-0007J7-1b
 for ath10k@lists.infradead.org; Wed, 20 Apr 2016 15:00:42 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH 1/4] ath10k: Move rx_location_info out of struct rx_pkt_end
Date: Wed, 20 Apr 2016 20:29:13 +0530
Message-ID: <1461164356-9158-2-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1461164356-9158-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1461164356-9158-1-git-send-email-vthiagar@qti.qualcomm.com>
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

Define rx_location_info in struct rx_ppdu_end_qca99x0 after
rx_pkt_end. This is to prepare rx_ppdu_end for QCA9984 chip.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/rx_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index ca8d168..3e7dfaa 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -994,7 +994,6 @@ struct rx_pkt_end {
 	__le32 info0; /* %RX_PKT_END_INFO0_ */
 	__le32 phy_timestamp_1;
 	__le32 phy_timestamp_2;
-	__le32 rx_location_info; /* %RX_LOCATION_INFO_ */
 } __packed;
 
 enum rx_phy_ppdu_end_info0 {
@@ -1067,6 +1066,7 @@ struct rx_phy_ppdu_end {
 
 struct rx_ppdu_end_qca99x0 {
 	struct rx_pkt_end rx_pkt_end;
+	__le32 rx_location_info; /* %RX_LOCATION_INFO_ */
 	struct rx_phy_ppdu_end rx_phy_ppdu_end;
 	__le32 rx_timing_offset; /* %RX_PPDU_END_RX_TIMING_OFFSET_ */
 	__le32 rx_info; /* %RX_PPDU_END_RX_INFO_ */
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
