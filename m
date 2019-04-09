Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDwBC-0001kp-1e
 for ath10k@lists.infradead.org; Tue, 09 Apr 2019 19:13:11 +0000
Received: by mail-lj1-x242.google.com with SMTP id f18so15484484lja.10
 for <ath10k@lists.infradead.org>; Tue, 09 Apr 2019 12:13:09 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [PATCH 1/6] ath10k: use clean packet headers
Date: Tue,  9 Apr 2019 21:08:46 +0200
Message-Id: <20190409190851.4557-2-erik.stromdahl@gmail.com>
In-Reply-To: <20190409190851.4557-1-erik.stromdahl@gmail.com>
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
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
Cc: Alagu Sankar <alagusankar@silex-india.com>

From: Alagu Sankar <alagusankar@silex-india.com>

HTC header carries junk values that may be interpreted by the firmware
differently. Enable credit update only if flow control is enabled for
the corresponding endpoint.

PLL clock setting sequence does not mask the PLL_CONTROL
register value. Side effect of not masking the values is not known as
the entire pll clock setting sequence is undocumented.

Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 1 +
 drivers/net/wireless/ath/ath10k/hw.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 805a7f8a04f2..1d4d1a1992fe 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -73,6 +73,7 @@ static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 	struct ath10k_htc_hdr *hdr;
 
 	hdr = (struct ath10k_htc_hdr *)skb->data;
+	memset(hdr, 0, sizeof(struct ath10k_htc_hdr));
 
 	hdr->eid = ep->eid;
 	hdr->len = __cpu_to_le16(skb->len - sizeof(*hdr));
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index ad082b7d7643..cfc232f1fdbc 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -814,6 +814,8 @@ static int ath10k_hw_qca6174_enable_pll_clock(struct ath10k *ar)
 	if (ret)
 		return -EINVAL;
 
+	reg_val &= ~(WLAN_PLL_CONTROL_REFDIV_MASK | WLAN_PLL_CONTROL_DIV_MASK |
+		     WLAN_PLL_CONTROL_NOPWD_MASK);
 	reg_val |= (SM(hw_clk->refdiv, WLAN_PLL_CONTROL_REFDIV) |
 		    SM(hw_clk->div, WLAN_PLL_CONTROL_DIV) |
 		    SM(1, WLAN_PLL_CONTROL_NOPWD));
-- 
2.19.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
