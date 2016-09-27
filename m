Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bos4M-0007ua-W8
 for ath10k@lists.infradead.org; Tue, 27 Sep 2016 13:05:14 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: [PATCH v4] ath10k: Cleanup calling ath10k_htt_rx_h_unchain
Date: Tue, 27 Sep 2016 13:04:44 +0000
Message-ID: <1474981503694.62077@qti.qualcomm.com>
References: <1474981300-15945-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1474981300-15945-1-git-send-email-mohammed@qca.qualcomm.com>
Content-Language: en-IN
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

apologies please ignore this , wrong patch due to confusing v4 tag
 
please review,

[PATCH] ath10k: Cleanup calling ath10k_htt_rx_h_unchain

________________________________________
From: Shajakhan, Mohammed Shafi (Mohammed Shafi)
Sent: 27 September 2016 18:31
To: ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org; linux-wireless@vger.kernel.org; Shajakhan, Mohammed Shafi (Mohammed Shafi)
Subject: [PATCH v4] ath10k: Cleanup calling ath10k_htt_rx_h_unchain

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

'ath10k_htt_rx_h_unchain' is need to be called only if the return
value from 'ath10k_htt_rx_amsdu_pop' is 1('chained msdu's'), this
change makes it more explicit and avoids doing a skb_peek, fetching
rx descriptor pointer, checking rx msdu decap format for the case of
ret = 0 (unchained msdus). Found this change during code walk through,
not sure if this addresses any issue.

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 7ae9349..e51dace 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1459,8 +1459,7 @@ static int ath10k_unchain_msdu(struct sk_buff_head *amsdu)
 }

 static void ath10k_htt_rx_h_unchain(struct ath10k *ar,
-                                   struct sk_buff_head *amsdu,
-                                   bool chained)
+                                   struct sk_buff_head *amsdu)
 {
        struct sk_buff *first;
        struct htt_rx_desc *rxd;
@@ -1471,9 +1470,6 @@ static void ath10k_htt_rx_h_unchain(struct ath10k *ar,
        decap = MS(__le32_to_cpu(rxd->msdu_start.common.info1),
                   RX_MSDU_START_INFO1_DECAP_FORMAT);

-       if (!chained)
-               return;
-
        /* FIXME: Current unchaining logic can only handle simple case of raw
         * msdu chaining. If decapping is other than raw the chaining may be
         * more complex and this isn't handled by the current code. Don't even
@@ -1550,7 +1546,11 @@ static int ath10k_htt_rx_handle_amsdu(struct ath10k_htt *htt)
        }

        ath10k_htt_rx_h_ppdu(ar, &amsdu, rx_status, 0xffff);
-       ath10k_htt_rx_h_unchain(ar, &amsdu, ret > 0);
+
+       /* only for ret = 1 indicates chained msdus */
+       if (ret > 0)
+               ath10k_htt_rx_h_unchain(ar, &amsdu);
+
        ath10k_htt_rx_h_filter(ar, &amsdu, rx_status);
        ath10k_htt_rx_h_mpdu(ar, &amsdu, rx_status);
        ath10k_htt_rx_h_deliver(ar, &amsdu, rx_status);
--
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
