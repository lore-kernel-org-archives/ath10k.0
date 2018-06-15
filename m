Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTnT7-0003Bb-2a
 for ath10k@lists.infradead.org; Fri, 15 Jun 2018 12:04:42 +0000
Received: by mail-lf0-x243.google.com with SMTP id q11-v6so14274567lfc.7
 for <ath10k@lists.infradead.org>; Fri, 15 Jun 2018 05:04:29 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH] ath10k: fix bug in masking of TID value
Date: Fri, 15 Jun 2018 14:01:53 +0200
Message-Id: <20180615120153.4677-1-erik.stromdahl@gmail.com>
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

Although the TID mask is 0xf, the modulus operation does still not
produce identical results as the bitwise and operator.

If the TID is 15, the modulus operation will "convert" it to 0, whereas
the bitwise and will keep it as 15.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 89157c5b5e5f..be5b52aaffa6 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1056,7 +1056,7 @@ static u8 ath10k_htt_tx_get_tid(struct sk_buff *skb, bool is_eth)
 	if (!is_eth && ieee80211_is_mgmt(hdr->frame_control))
 		return HTT_DATA_TX_EXT_TID_MGMT;
 	else if (cb->flags & ATH10K_SKB_F_QOS)
-		return skb->priority % IEEE80211_QOS_CTL_TID_MASK;
+		return skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 	else
 		return HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST;
 }
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
