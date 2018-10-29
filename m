Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH0w4-00036a-NJ
 for ath10k@lists.infradead.org; Mon, 29 Oct 2018 06:22:02 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH] ath10k: add amsdu support for monitor mode
Date: Mon, 29 Oct 2018 14:21:43 +0800
Message-Id: <1540794104-30957-1-git-send-email-yyuwang@codeaurora.org>
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

When processing HTT_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND,
if the length of a msdu is larger than the tailroom
of the rx skb, skb_over_panic issue will happen when
calling skb_put.
In monitor mode, amsdu will be handled in this path,
and msdu_len of the first msdu_desc is the length of
the entire amsdu, which might be larger than the
maximum length of a skb, in such case, it will hit
the issue upon.
To fix this issue, processing msdu list separately
for monitor mode.

Successfully tested with:
QCA6174 (FW version: RM.4.4.1.c2-00057-QCARMSWP-1).

Yu Wang (1):
  ath10k: add amsdu support for monitor mode

 drivers/net/wireless/ath/ath10k/htt_rx.c | 187 +++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
