Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8oxO-00079s-Sj
 for ath10k@lists.infradead.org; Tue, 26 Mar 2019 16:29:47 +0000
Received: by mail-lf1-x144.google.com with SMTP id b7so4604724lfg.9
 for <ath10k@lists.infradead.org>; Tue, 26 Mar 2019 09:29:45 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 2/2] ath10k: add htt_h2t_aggr_cfg_msg op for high latency
 devices
Date: Tue, 26 Mar 2019 17:29:04 +0100
Message-Id: <20190326162904.6737-2-erik.stromdahl@gmail.com>
In-Reply-To: <20190326162904.6737-1-erik.stromdahl@gmail.com>
References: <20190326162904.6737-1-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Without this op, it will not be possible to configure aggregation for
high latency devices.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 8d533f5eb1aa..619c2b87b8bb 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1746,6 +1746,7 @@ static const struct ath10k_htt_tx_ops htt_tx_ops_hl = {
 	.htt_send_rx_ring_cfg = ath10k_htt_send_rx_ring_cfg_hl,
 	.htt_send_frag_desc_bank_cfg = ath10k_htt_send_frag_desc_bank_cfg_32,
 	.htt_tx = ath10k_htt_tx_hl,
+	.htt_h2t_aggr_cfg_msg = ath10k_htt_h2t_aggr_cfg_msg_32,
 };
 
 void ath10k_htt_set_tx_ops(struct ath10k_htt *htt)
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
