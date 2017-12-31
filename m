Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eVhSf-0005zQ-A2
 for ath10k@lists.infradead.org; Sun, 31 Dec 2017 17:32:00 +0000
Received: by mail-lf0-x243.google.com with SMTP id y71so1215205lfd.12
 for <ath10k@lists.infradead.org>; Sun, 31 Dec 2017 09:31:44 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 10/18] ath10k: add HTT TX HL ops
Date: Sun, 31 Dec 2017 18:29:17 +0100
Message-Id: <20171231172925.24014-11-erik.stromdahl@gmail.com>
In-Reply-To: <20171231172925.24014-1-erik.stromdahl@gmail.com>
References: <20171231172925.24014-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Initial HTT TX ops for high latency devices.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 4d0bfb47d162..321f131e417d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1565,11 +1565,17 @@ static const struct ath10k_htt_tx_ops htt_tx_ops_64 = {
 	.htt_free_txbuff = ath10k_htt_tx_free_cont_txbuf_64,
 };
 
+static const struct ath10k_htt_tx_ops htt_tx_ops_hl = {
+	.htt_send_frag_desc_bank_cfg = ath10k_htt_send_frag_desc_bank_cfg_32,
+};
+
 void ath10k_htt_set_tx_ops(struct ath10k_htt *htt)
 {
 	struct ath10k *ar = htt->ar;
 
-	if (ar->hw_params.target_64bit)
+	if (ar->is_high_latency)
+		htt->tx_ops = &htt_tx_ops_hl;
+	else if (ar->hw_params.target_64bit)
 		htt->tx_ops = &htt_tx_ops_64;
 	else
 		htt->tx_ops = &htt_tx_ops_32;
-- 
2.15.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
