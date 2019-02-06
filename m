Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grM6P-0006ma-V5
 for ath10k@lists.infradead.org; Wed, 06 Feb 2019 12:14:56 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 3/3] ath10k: Request credit report if flow control enabled
 on ep
Date: Wed,  6 Feb 2019 17:44:33 +0530
Message-Id: <20190206121433.11606-4-govinds@codeaurora.org>
In-Reply-To: <20190206121433.11606-1-govinds@codeaurora.org>
References: <20190206121433.11606-1-govinds@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

FW credit flow control is enabled for only WMI ctrl
service(CE3) but credit update is requested unconditionally
on all HTC services as part of HTC tx in CE3/CE0/CE4.

This is causing WOW failure as FW is not expecting credit
report request on other end-points(CE0/CE4).

Request credit report only on those endpoints where
credit flow control is enabled.

Testing:
    Tested on WCN3990 HW.
    Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 7654a21323ce..5aa57a01c033 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -88,7 +88,8 @@ static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 	hdr->eid = ep->eid;
 	hdr->len = __cpu_to_le16(skb->len - sizeof(*hdr));
 	hdr->flags = 0;
-	hdr->flags |= ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE;
+	if (ep->tx_credit_flow_enabled)
+		hdr->flags |= ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE;
 
 	spin_lock_bh(&ep->htc->tx_lock);
 	hdr->seq_no = ep->seq_no++;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
