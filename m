Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvrX-0000Ux-Fj
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 17:15:41 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [RFC 6/7] ath10k: Add deliver to stack from thread context
Date: Tue, 21 Jul 2020 22:44:25 +0530
Message-Id: <1595351666-28193-7-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

When the receive packets are submitted to the stack
from a thread context, the NAPI handle should be passed
as NULL to the function ieee80211_rx_napi. This will
make sure that the packets are submitted to stack via
non-napi method

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index becbd56..85c169c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1321,7 +1321,10 @@ static void ath10k_process_rx(struct ath10k *ar, struct sk_buff *skb)
 	trace_ath10k_rx_hdr(ar, skb->data, skb->len);
 	trace_ath10k_rx_payload(ar, skb->data, skb->len);
 
-	ieee80211_rx_napi(ar->hw, NULL, skb, &ar->napi);
+	if (in_serving_softirq())
+		ieee80211_rx_napi(ar->hw, NULL, skb, &ar->napi);
+	else
+		ieee80211_rx_napi(ar->hw, NULL, skb, NULL);
 }
 
 static int ath10k_htt_rx_nwifi_hdrlen(struct ath10k *ar,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
