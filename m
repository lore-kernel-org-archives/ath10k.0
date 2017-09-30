Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyLj7-0001Pb-H4
 for ath10k@lists.infradead.org; Sat, 30 Sep 2017 17:39:03 +0000
Received: by mail-pg0-x244.google.com with SMTP id y192so1837329pgd.5
 for <ath10k@lists.infradead.org>; Sat, 30 Sep 2017 10:38:37 -0700 (PDT)
From: silexcommon@gmail.com
Subject: [PATCH 05/11] ath10k_sdio: use clean packet headers
Date: Sat, 30 Sep 2017 23:07:42 +0530
Message-Id: <1506793068-27445-6-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
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
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org

From: Alagu Sankar <alagusankar@silex-india.com>

HTC header carries junk values that may be interpreted by the firmware
differently. Enable credit update only if flow control is enabled for
the corresponding endpoint.

PLL clock setting sequence does not mask the PLL_CONTROL
register value. Side effect of not masking the values is not known as
the entire pll clock setting sequence is undocumented.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 4 +++-
 drivers/net/wireless/ath/ath10k/hw.c  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 75c2a3e..23e7216 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -84,11 +84,13 @@ static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 	struct ath10k_htc_hdr *hdr;
 
 	hdr = (struct ath10k_htc_hdr *)skb->data;
+	memset(hdr, 0, sizeof(struct ath10k_htc_hdr));
 
 	hdr->eid = ep->eid;
 	hdr->len = __cpu_to_le16(skb->len - sizeof(*hdr));
 	hdr->flags = 0;
-	hdr->flags |= ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE;
+	if (ep->tx_credit_flow_enabled)
+		hdr->flags |= ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE;
 
 	spin_lock_bh(&ep->htc->tx_lock);
 	hdr->seq_no = ep->seq_no++;
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 07df7c6..2092392 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -812,6 +812,8 @@ static int ath10k_hw_qca6174_enable_pll_clock(struct ath10k *ar)
 	if (ret)
 		return -EINVAL;
 
+	reg_val &= ~(WLAN_PLL_CONTROL_REFDIV_MASK | WLAN_PLL_CONTROL_DIV_MASK |
+		     WLAN_PLL_CONTROL_NOPWD_MASK);
 	reg_val |= (SM(hw_clk->refdiv, WLAN_PLL_CONTROL_REFDIV) |
 		    SM(hw_clk->div, WLAN_PLL_CONTROL_DIV) |
 		    SM(1, WLAN_PLL_CONTROL_NOPWD));
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
