Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfNx0-0000gH-Az
 for ath10k@lists.infradead.org; Fri, 25 Sep 2015 08:01:50 +0000
From: Vivek Natarajan <nataraja@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: Use station's current operating mode from assoc
 request
Date: Fri, 25 Sep 2015 13:31:08 +0530
Message-ID: <1443168068-5719-1-git-send-email-nataraja@qti.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

The current number of spatial streams used by the client is advertised
as a separate IE in assoc request. Use this information to set
the NSS operating mode.

Fixes: 45c9abc059fa ("ath10k: implement more versatile set_bitrate_mask").
Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>
---
v2: Fix commit message

 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bb44161..5acebf5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2169,7 +2169,7 @@ static void ath10k_peer_assoc_h_ht(struct ath10k *ar,
 			arg->peer_ht_rates.rates[i] = i;
 	} else {
 		arg->peer_ht_rates.num_rates = n;
-		arg->peer_num_spatial_streams = max_nss;
+		arg->peer_num_spatial_streams = min(sta->rx_nss, max_nss);
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac ht peer %pM mcs cnt %d nss %d\n",
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
