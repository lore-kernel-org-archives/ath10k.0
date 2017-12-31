Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eVhSc-0005ze-EL
 for ath10k@lists.infradead.org; Sun, 31 Dec 2017 17:31:48 +0000
Received: by mail-lf0-x244.google.com with SMTP id h5so8624822lfj.2
 for <ath10k@lists.infradead.org>; Sun, 31 Dec 2017 09:31:45 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 11/18] ath10k: add HTT RX HL ops
Date: Sun, 31 Dec 2017 18:29:18 +0100
Message-Id: <20171231172925.24014-12-erik.stromdahl@gmail.com>
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

Initial (empty) HTT RX ops for high latency devices.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 1432d5b3e9d3..f7d071ca8b76 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2917,11 +2917,16 @@ static const struct ath10k_htt_rx_ops htt_rx_ops_64 = {
 	.htt_reset_paddrs_ring = ath10k_htt_reset_paddrs_ring_64,
 };
 
+static const struct ath10k_htt_rx_ops htt_rx_ops_hl = {
+};
+
 void ath10k_htt_set_rx_ops(struct ath10k_htt *htt)
 {
 	struct ath10k *ar = htt->ar;
 
-	if (ar->hw_params.target_64bit)
+	if (ar->is_high_latency)
+		htt->rx_ops = &htt_rx_ops_hl;
+	else if (ar->hw_params.target_64bit)
 		htt->rx_ops = &htt_rx_ops_64;
 	else
 		htt->rx_ops = &htt_rx_ops_32;
-- 
2.15.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
