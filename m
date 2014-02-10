Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCo4a-0006Y2-3q
 for ath10k@lists.infradead.org; Mon, 10 Feb 2014 10:26:45 +0000
Received: by mail-ee0-f53.google.com with SMTP id t10so2832812eei.12
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 02:26:18 -0800 (PST)
From: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Subject: [PATCH] ath10k: Set proper nss value for the peer
Date: Mon, 10 Feb 2014 11:25:25 +0100
Message-Id: <1392027925-8321-1-git-send-email-marek.kwaczynski@tieto.com>
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
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, linux-wireless@vger.kernel.org

It was found during testing the nss calculation does not
cover all corner cases. Station could request eq. only MCS8
and MCS9 (nss=2 specific). Next num_rates=2 so the driver
sets nss=(max((2+7)/8, 1))=1. Which is wrong. The in-driver
calculation was introduced prior (commit ddcc347b70
mac80211: fix rx_nss calculation for drivers with hw rc).
Since it's fixed, use mac80211 provided value from now.
End user will experience lower throuhputs than expected
if the nss is wrongly calculated.

Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 144b4d6..e6bf2e8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1149,7 +1149,7 @@ static void ath10k_peer_assoc_h_ht(struct ath10k *ar,
 			arg->peer_ht_rates.rates[n++] = i;
 
 	arg->peer_ht_rates.num_rates = n;
-	arg->peer_num_spatial_streams = max((n+7) / 8, 1);
+	arg->peer_num_spatial_streams = sta->rx_nss;
 
 	ath10k_dbg(ATH10K_DBG_MAC, "mac ht peer %pM mcs cnt %d nss %d\n",
 		   arg->addr,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
