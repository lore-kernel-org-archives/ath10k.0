Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtDDa-0004Rc-OE
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 15:10:00 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/6] ath10k: align ath10k_htt_txbuf structures
Date: Mon, 11 Feb 2019 17:09:45 +0200
Message-Id: <1549897787-28537-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
References: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

With W=1 GCC warns:

drivers/net/wireless/ath/ath10k/htt.h:1746:1: warning: alignment 1 of 'struct ath10k_htt_txbuf_32' is less than 4 [-Wpacked-not-aligned]
drivers/net/wireless/ath/ath10k/htt.h:1753:1: warning: alignment 1 of 'struct ath10k_htt_txbuf_64' is less than 4 [-Wpacked-not-aligned]

Fix that by using __align(4). Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 005fad94edad..d194bbe18fc3 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1743,14 +1743,14 @@ struct ath10k_htt_txbuf_32 {
 	struct ath10k_htc_hdr htc_hdr;
 	struct htt_cmd_hdr cmd_hdr;
 	struct htt_data_tx_desc cmd_tx;
-} __packed;
+} __packed __aligned(4);
 
 struct ath10k_htt_txbuf_64 {
 	struct htt_data_tx_desc_frag frags[2];
 	struct ath10k_htc_hdr htc_hdr;
 	struct htt_cmd_hdr cmd_hdr;
 	struct htt_data_tx_desc_64 cmd_tx;
-} __packed;
+} __packed __aligned(4);
 
 struct ath10k_htt {
 	struct ath10k *ar;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
