Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x230.google.com ([2a00:1450:4013:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlJM2-00056k-Iy
 for ath10k@lists.infradead.org; Tue, 26 Nov 2013 14:11:07 +0000
Received: by mail-ea0-f176.google.com with SMTP id h14so3620054eaj.35
 for <ath10k@lists.infradead.org>; Tue, 26 Nov 2013 06:10:41 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/3] ath10k: use nss provided by mac80211
Date: Tue, 26 Nov 2013 14:57:38 +0100
Message-Id: <1385474260-22385-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385474260-22385-1-git-send-email-michal.kazior@tieto.com>
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-1-git-send-email-michal.kazior@tieto.com>
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

Calculating STA NSS just from the mcs rateset is
not the greatest idea.

This should prevent connectivity issues if
mac80211 is ever to set rx_nss to something other
rather than base on max mcs map. As an example
operation mode change notification in assoc
request may change rx_nss initial values in the
future.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b70a3b2..15eda44 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -925,7 +925,7 @@ static void ath10k_peer_assoc_h_basic(struct ath10k *ar,
 	else
 		arg->peer_listen_intval = ar->hw->conf.listen_interval;
 
-	arg->peer_num_spatial_streams = 1;
+	arg->peer_num_spatial_streams = max_t(u32, 1, sta->rx_nss);
 
 	/*
 	 * The assoc capabilities are available only in managed mode.
@@ -1075,7 +1075,6 @@ static void ath10k_peer_assoc_h_ht(struct ath10k *ar,
 			arg->peer_ht_rates.rates[n++] = i;
 
 	arg->peer_ht_rates.num_rates = n;
-	arg->peer_num_spatial_streams = max((n+7) / 8, 1);
 
 	ath10k_dbg(ATH10K_DBG_MAC, "mac ht peer %pM mcs cnt %d nss %d\n",
 		   arg->addr,
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
