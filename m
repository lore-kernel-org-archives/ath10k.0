Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVYhR-0000hc-Eh
 for ath10k@lists.infradead.org; Wed, 20 Jun 2018 08:42:46 +0000
Received: by mail-lf0-x242.google.com with SMTP id n24-v6so3707714lfh.3
 for <ath10k@lists.infradead.org>; Wed, 20 Jun 2018 01:42:34 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 2/3] ath10k: sdio: allocate correct size for RECV_1MORE_BLOCK
 rx packets
Date: Wed, 20 Jun 2018 10:42:21 +0200
Message-Id: <20180620084222.3521-3-niklas.cassel@linaro.org>
In-Reply-To: <20180620084222.3521-1-niklas.cassel@linaro.org>
References: <20180620084222.3521-1-niklas.cassel@linaro.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: alagusankar@silex-india.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>

Without this, when receiving a packet that has this flag set
from firmware, we will read invalid trailer data from the packet,
which will be shown as various errors, e.g. "sdio mbox lookahead
is zero" or "invalid rx packet" or "payload length x exceeds max
htc length".

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/net/wireless/ath/ath10k/htc.h  | 1 +
 drivers/net/wireless/ath/ath10k/sdio.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index 34877597dd6a..cf1068dc3254 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -58,6 +58,7 @@ enum ath10k_htc_tx_flags {
 };
 
 enum ath10k_htc_rx_flags {
+	ATH10K_HTC_FLAGS_RECV_1MORE_BLOCK = 0x01,
 	ATH10K_HTC_FLAG_TRAILER_PRESENT = 0x02,
 	ATH10K_HTC_FLAG_BUNDLE_MASK     = 0xF0
 };
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index d46523b0472c..0c57d6aaa437 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -603,6 +603,9 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 		 * ATH10K_HTC_FLAG_BUNDLE_MASK flag set, all bundled
 		 * packet skb's have been allocated in the previous step.
 		 */
+		if (htc_hdr->flags & ATH10K_HTC_FLAGS_RECV_1MORE_BLOCK)
+			full_len += ATH10K_HIF_MBOX_BLOCK_SIZE;
+
 		ret = ath10k_sdio_mbox_alloc_rx_pkt(&ar_sdio->rx_pkts[i],
 						    act_len,
 						    full_len,
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
