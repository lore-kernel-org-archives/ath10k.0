Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNPGP-0005Om-9L
 for ath10k@lists.infradead.org; Sat, 11 Apr 2020 23:10:16 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 023/108] ath10k: fix not registering airtime of
 11a station with WMM disable
Date: Sat, 11 Apr 2020 19:08:18 -0400
Message-Id: <20200411230943.24951-23-sashal@kernel.org>
In-Reply-To: <20200411230943.24951-1-sashal@kernel.org>
References: <20200411230943.24951-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Yibo Zhao <yiboz@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Yibo Zhao <yiboz@codeaurora.org>

[ Upstream commit f9680c75d187f2d5b9288c02f7a432041d4447b4 ]

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
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9f0e7b4943ec6..e30160418802f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2732,7 +2732,8 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
 			continue;
 		}
 
-		tid = FIELD_GET(HTT_TX_PPDU_DUR_INFO0_TID_MASK, info0);
+		tid = FIELD_GET(HTT_TX_PPDU_DUR_INFO0_TID_MASK, info0) &
+						IEEE80211_QOS_CTL_TID_MASK;
 		tx_duration = __le32_to_cpu(ppdu_dur->tx_duration);
 
 		ieee80211_sta_register_airtime(peer->sta, tid, tx_duration, 0);
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
