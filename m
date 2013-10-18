Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX6yu-0006Gb-BI
 for ath10k@lists.infradead.org; Fri, 18 Oct 2013 10:08:32 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: extend number of AP interfaces for 10.X firmware
Date: Fri, 18 Oct 2013 12:07:58 +0200
Message-ID: <1382090878-22216-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
References: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This firmware can support up to 8 AP interfaces.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index af046c4..dc65dcd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3255,7 +3255,7 @@ static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
 	.types	= BIT(NL80211_IFTYPE_STATION)
 	},
 	{
-	.max	= 7,
+	.max	= 8,
 	.types	= BIT(NL80211_IFTYPE_AP)
 	},
 };
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
