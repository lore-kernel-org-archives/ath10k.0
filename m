Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4d1X-0008DH-7d
 for ath10k@lists.infradead.org; Thu, 20 Feb 2020 04:01:17 +0000
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: [PATCH] ath10k: fix not registering airtime of 11a station with WMM
 disable
Date: Thu, 20 Feb 2020 12:03:25 +0800
Message-Id: <1582171405-27236-1-git-send-email-yiboz@codeaurora.org>
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
Cc: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org

The tid of 11a station with WMM disable reported by FW is 0x10 in
tx completion. The tid 16 is mapped to a NULL txq since buffer
MMPDU capbility is not supported. Then 11a station's airtime will
not be registered due to NULL txq check. As a results, airtime of
11a station keeps unchanged in debugfs system.

Mask the tid along with IEEE80211_QOS_CTL_TID_MASK to make it in
the valid range.

Hardwares tested : QCA9984
Firmwares tested : 10.4-3.10-00047

Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 38a5814..f883f2a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2744,7 +2744,8 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 			continue;
 		}
 
-		tid = FIELD_GET(HTT_TX_PPDU_DUR_INFO0_TID_MASK, info0);
+		tid = FIELD_GET(HTT_TX_PPDU_DUR_INFO0_TID_MASK, info0) &
+						IEEE80211_QOS_CTL_TID_MASK;
 		tx_duration = __le32_to_cpu(ppdu_dur->tx_duration);
 
 		ieee80211_sta_register_airtime(peer->sta, tid, tx_duration, 0);
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
