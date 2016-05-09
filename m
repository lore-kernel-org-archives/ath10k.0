Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1azuLO-0007S5-Uc
 for ath10k@lists.infradead.org; Mon, 09 May 2016 23:12:07 +0000
From: greearb@candelatech.com
Subject: [PATCH 04/21] ath10k: rate-limit packet tx errors
Date: Mon,  9 May 2016 16:10:58 -0700
Message-Id: <1462835475-11079-5-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

When firmware crashes, stack can continue to send packets
for a bit, and existing code was spamming logs.

So, rate-limit the error message for tx failures.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index cd3016d..42cac32 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3432,8 +3432,9 @@ static int ath10k_mac_tx_submit(struct ath10k *ar,
 	}
 
 	if (ret) {
-		ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
-			    ret);
+		if (net_ratelimit())
+			ath10k_warn(ar, "failed to transmit packet, dropping: %d\n",
+				    ret);
 		ieee80211_free_txskb(ar->hw, skb);
 	}
 
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
