Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9Xv-0001ej-JQ
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 19:04:36 +0000
Received: by wicuv6 with SMTP id uv6so29613379wic.2
 for <ath10k@lists.infradead.org>; Tue, 27 Oct 2015 12:04:14 -0700 (PDT)
From: Punit Vara <punitvara@gmail.com>
Subject: [RESEND PATCH 07/10] net: wireless: iwlegacy: Remove unneeded
 variable ret
Date: Wed, 28 Oct 2015 00:32:42 +0530
Message-Id: <1445972565-14963-7-git-send-email-punitvara@gmail.com>
In-Reply-To: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
References: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, Punit Vara <punitvara@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

This patch is to the 3945-mac.c file that fixes up following warning
by coccicheck:

drivers/net/wireless/iwlegacy/3945-mac.c:247:5-8: Unneeded variable:
"ret". Return "- EOPNOTSUPP" on line 249

Return -EOPNOTSUPP directly instead of return using ret

Signed-off-by: Punit Vara <punitvara@gmail.com>
---
 drivers/net/wireless/iwlegacy/3945-mac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/iwlegacy/3945-mac.c b/drivers/net/wireless/iwlegacy/3945-mac.c
index af1b3e6..ff4dc44 100644
--- a/drivers/net/wireless/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/iwlegacy/3945-mac.c
@@ -244,9 +244,7 @@ il3945_set_dynamic_key(struct il_priv *il, struct ieee80211_key_conf *keyconf,
 static int
 il3945_remove_static_key(struct il_priv *il)
 {
-	int ret = -EOPNOTSUPP;
-
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static int
@@ -529,7 +527,6 @@ il3945_tx_skb(struct il_priv *il,
 		if (unlikely(tid >= MAX_TID_COUNT))
 			goto drop;
 	}
-
 	/* Descriptor for chosen Tx queue */
 	txq = &il->txq[txq_id];
 	q = &txq->q;
-- 
2.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
