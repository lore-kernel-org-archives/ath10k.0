Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNvdi-0002ai-RW
 for ath10k@lists.infradead.org; Fri, 25 Oct 2019 09:12:12 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] ath10k: remove unneeded semicolon
Date: Fri, 25 Oct 2019 17:10:41 +0800
Message-ID: <20191025091041.34056-1-yuehaibing@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

remove unneeded semicolon.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9f0e7b4..d95b63f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2073,7 +2073,7 @@ static void ath10k_htt_rx_mpdu_desc_pn_hl(struct htt_hl_rx_desc *rx_desc,
 	case 24:
 		pn->pn24 = __le32_to_cpu(rx_desc->pn_31_0);
 		break;
-	};
+	}
 }
 
 static bool ath10k_htt_rx_pn_cmp48(union htt_rx_pn_t *new_pn,
-- 
2.7.4



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
