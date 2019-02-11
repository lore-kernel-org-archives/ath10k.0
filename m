Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtDDc-0004Sc-4s
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 15:10:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/6] ath10k: fix documentation in
 ath10k_wow_convert_8023_to_80211()
Date: Mon, 11 Feb 2019 17:09:46 +0200
Message-Id: <1549897787-28537-5-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
References: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

With W=1 there's a warning:

drivers/net/wireless/ath/ath10k/wow.c:93: warning: Function parameter or member 'new' not described in 'ath10k_wow_convert_8023_to_80211'
drivers/net/wireless/ath/ath10k/wow.c:93: warning: Function parameter or member 'old' not described in 'ath10k_wow_convert_8023_to_80211'

Fix it by changing the documentation marker '/**' to a normal code comment.
While at it, clean up the line wrapping.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wow.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index 36d4245c308e..b36fa0f8892e 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -77,7 +77,7 @@ static int ath10k_wow_cleanup(struct ath10k *ar)
 	return 0;
 }
 
-/**
+/*
  * Convert a 802.3 format to a 802.11 format.
  *         +------------+-----------+--------+----------------+
  * 802.3:  |dest mac(6B)|src mac(6B)|type(2B)|     body...    |
@@ -88,9 +88,8 @@ static int ath10k_wow_cleanup(struct ath10k *ar)
  * 802.11: |4B|dest mac(6B)| 6B |src mac(6B)|  8B  |type(2B)|  body...  |
  *         +--+------------+----+-----------+---------------+-----------+
  */
-static void ath10k_wow_convert_8023_to_80211
-					(struct cfg80211_pkt_pattern *new,
-					const struct cfg80211_pkt_pattern *old)
+static void ath10k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
+					     const struct cfg80211_pkt_pattern *old)
 {
 	u8 hdr_8023_pattern[ETH_HLEN] = {};
 	u8 hdr_8023_bit_mask[ETH_HLEN] = {};
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
