Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnC5R-000682-DT
 for ath10k@lists.infradead.org; Mon, 22 Jun 2020 02:21:30 +0000
Received: by mail-qk1-x741.google.com with SMTP id 80so2403110qko.7
 for <ath10k@lists.infradead.org>; Sun, 21 Jun 2020 19:21:26 -0700 (PDT)
From: Zekun Shen <bruceshenzk@gmail.com>
Subject: [PATCH] net: ath10k: santity check for ep connectivity
Date: Sun, 21 Jun 2020 22:20:54 -0400
Message-Id: <20200622022055.16028-1-bruceshenzk@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Zekun Shen <bruceshenzk@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Function ep_rx_complete is being called without NULL checking
in ath10k_htc_rx_completion_handler. Without such check, mal-
formed packet is able to cause jump to NULL.

ep->service_id seems a good candidate for sanity check as it is
used in usb.c.

Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 31df6dd04..e00794d97 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -450,6 +450,11 @@ void ath10k_htc_rx_completion_handler(struct ath10k *ar, struct sk_buff *skb)
 
 	ep = &htc->endpoint[eid];
 
+	if (ep->service_id == 0) {
+		ath10k_warn(ar, "HTC Rx: ep %d is not connect\n", eid);
+		goto out;
+	}
+
 	payload_len = __le16_to_cpu(hdr->len);
 
 	if (payload_len + sizeof(*hdr) > ATH10K_HTC_MAX_LEN) {
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
