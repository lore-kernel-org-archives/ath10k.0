Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8gF9-0005pF-8u
 for ath10k@lists.infradead.org; Fri, 13 Sep 2019 07:43:48 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] ath10k: fix spelling mistake "eanble" -> "enable"
Date: Fri, 13 Sep 2019 08:43:39 +0100
Message-Id: <20190913074339.27280-1-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a ath10k_warn warning message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 12dad659bf68..a3d612f5f652 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7418,7 +7418,7 @@ static bool ath10k_mac_set_vht_bitrate_mask_fixup(struct ath10k *ar,
 	err = ath10k_wmi_peer_set_param(ar, arvif->vdev_id, sta->addr,
 					WMI_PEER_PARAM_FIXED_RATE, rate);
 	if (err)
-		ath10k_warn(ar, "failed to eanble STA %pM peer fixed rate: %d\n",
+		ath10k_warn(ar, "failed to enable STA %pM peer fixed rate: %d\n",
 			    sta->addr, err);
 
 	return true;
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
