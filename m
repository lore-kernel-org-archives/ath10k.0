Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao3a8-0001ec-Bx
 for ath10k@lists.infradead.org; Thu, 07 Apr 2016 06:38:20 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 2/3] ath10k: remove unnecessary warning for probe response
 drops
Date: Thu, 7 Apr 2016 12:07:30 +0530
Message-ID: <1460011051-8272-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1460011051-8272-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1460011051-8272-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

qca99x0 and qca4019 solutions limit probe responses transmissions.
Logging warning message for each probe response drop is flooding
kernel log unnecessary with " failed to increase tx mgmt pending
count: -16, dropping". Hence reducing log level to debug.

Reported-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 20d72e29dfa1..b0e613bc10a5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3994,8 +3994,8 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 
 		ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_mgmt, is_presp);
 		if (ret) {
-			ath10k_warn(ar, "failed to increase tx mgmt pending count: %d, dropping\n",
-				    ret);
+			ath10k_dbg(ar, ATH10K_DBG_MAC, "failed to increase tx mgmt pending count: %d, dropping\n",
+				   ret);
 			ath10k_htt_tx_dec_pending(htt);
 			spin_unlock_bh(&ar->htt.tx_lock);
 			ieee80211_free_txskb(ar->hw, skb);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
