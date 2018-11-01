Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIEux-0006BX-R5
 for ath10k@lists.infradead.org; Thu, 01 Nov 2018 15:29:58 +0000
Received: by mail-pf1-x442.google.com with SMTP id g21-v6so9500382pfi.7
 for <ath10k@lists.infradead.org>; Thu, 01 Nov 2018 08:29:45 -0700 (PDT)
From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] ath10k: fix some typo
Date: Thu,  1 Nov 2018 11:29:32 -0400
Message-Id: <20181101152932.22684-1-tiny.windzz@gmail.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net
Cc: Yangtao Li <tiny.windzz@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wow.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index a6b179f88d36..e834c25a9330 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -135,7 +135,7 @@ static void ath10k_wow_convert_8023_to_80211
 	       &old_hdr_mask->h_proto,
 	       sizeof(old_hdr_mask->h_proto));
 
-	/* Caculate new pkt_offset */
+	/* Calculate new pkt_offset */
 	if (old->pkt_offset < ETH_ALEN)
 		new->pkt_offset = old->pkt_offset +
 			offsetof(struct ieee80211_hdr_3addr, addr1);
@@ -146,7 +146,7 @@ static void ath10k_wow_convert_8023_to_80211
 	else
 		new->pkt_offset = old->pkt_offset + hdr_len + rfc_len - ETH_HLEN;
 
-	/* Caculate new hdr end offset */
+	/* Calculate new hdr end offset */
 	if (total_len > ETH_HLEN)
 		hdr_80211_end_offset = hdr_len + rfc_len;
 	else if (total_len > offsetof(struct ethhdr, h_proto))
-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
