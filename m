Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vjqoj-0006PU-MK
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:30:43 +0000
Received: by mail-ea0-f180.google.com with SMTP id f15so523731eak.11
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:30:20 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: fix Tx status clearing
Date: Fri, 22 Nov 2013 14:26:59 +0100
Message-Id: <1385126819-15311-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Too much of tx info was being cleared. This caused
issues in some setups.

Reported-By: Matti Laakso <malaakso@elisanet.fi>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index d476b2c..2282980 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -75,7 +75,7 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	ath10k_report_offchan_tx(htt->ar, msdu);
 
 	info = IEEE80211_SKB_CB(msdu);
-	memset(info, 0, sizeof(*info));
+	memset(&info->status, 0, sizeof(info->status));
 
 	if (tx_done->discard) {
 		ieee80211_free_txskb(htt->ar->hw, msdu);
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
