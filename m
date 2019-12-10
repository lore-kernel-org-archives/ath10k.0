Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ien0Y-0007Rk-T1
 for ath10k@lists.infradead.org; Tue, 10 Dec 2019 21:25:28 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 012/292] ath10k: add cleanup in ath10k_sta_state()
Date: Tue, 10 Dec 2019 16:20:31 -0500
Message-Id: <20191210212511.11392-12-sashal@kernel.org>
In-Reply-To: <20191210212511.11392-1-sashal@kernel.org>
References: <20191210212511.11392-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Wenwen Wang <wenwen@cs.uga.edu>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Wenwen Wang <wenwen@cs.uga.edu>

[ Upstream commit 334f5b61a6f29834e881923b98d1e27e5ce9620d ]

If 'sta->tdls' is false, no cleanup is executed, leading to memory/resource
leaks, e.g., 'arsta->tx_stats'. To fix this issue, perform cleanup before
go to the 'exit' label.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 0606416dc9712..f99e6d22f6224 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6548,8 +6548,12 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 
 		spin_unlock_bh(&ar->data_lock);
 
-		if (!sta->tdls)
+		if (!sta->tdls) {
+			ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
+			ath10k_mac_dec_num_stations(arvif, sta);
+			kfree(arsta->tx_stats);
 			goto exit;
+		}
 
 		ret = ath10k_wmi_update_fw_tdls_state(ar, arvif->vdev_id,
 						      WMI_TDLS_ENABLE_ACTIVE);
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
