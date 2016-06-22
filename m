Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.riverbed.com ([208.70.196.45])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFiIs-0003vu-Lc
 for ath10k@lists.infradead.org; Wed, 22 Jun 2016 13:34:52 +0000
From: Eduardo Abinader <eduardo.abinader@riverbed.com>
Subject: [PATCH] ath10k: remove extra space on ath10k_update_channel_list
Message-ID: <576A93E2.9050901@riverbed.com>
Date: Wed, 22 Jun 2016 15:34:26 +0200
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: kvalo@qca.qualcomm.com

just to comply to coding style.

Signed-off-by: Eduardo Abinader <eduardo.abinader@riverbed.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d4b7a16..d5f8e95 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2939,7 +2939,7 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 			if (channel->flags & IEEE80211_CHAN_DISABLED)
 				continue;
 
-			ch->allow_ht   = true;
+			ch->allow_ht = true;
 
 			/* FIXME: when should we really allow VHT? */
 			ch->allow_vht = true;
-- 
2.5.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
