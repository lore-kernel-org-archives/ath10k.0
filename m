Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYIts-0001pK-42
 for ath10k@lists.infradead.org; Wed, 18 Mar 2015 18:41:04 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: enable channel 144 on 5GHz band
Date: Wed, 18 Mar 2015 11:39:18 -0700
Message-ID: <1426703958-8005-1-git-send-email-poh@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Enable channel 144 on 5GHz band since 802.11ac introduced it.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 341f3c8..56de3dc 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5480,6 +5480,7 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
 	CHAN5G(132, 5660, 0),
 	CHAN5G(136, 5680, 0),
 	CHAN5G(140, 5700, 0),
+	CHAN5G(144, 5720, 0),
 	CHAN5G(149, 5745, 0),
 	CHAN5G(153, 5765, 0),
 	CHAN5G(157, 5785, 0),
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
