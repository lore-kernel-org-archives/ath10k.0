Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSNEy-0001m5-HJ
 for ath10k@lists.infradead.org; Thu, 29 Nov 2018 14:24:29 +0000
Date: Thu, 29 Nov 2018 17:24:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] ath10k: remove an unnecessary NULL check
Message-ID: <20181129142406.GV3073@unbuntlaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181129103214.5tudci6izlfaasqx@kili.mountain>
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
To: Kalle Valo <kvalo@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org

The "survey" pointer is the address of an array element.  We know that
it can't be NULL so this check can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Resending with linux-wireless Cc for patchwork.

 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 659513bf4ddc..6a04727b63ce 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2578,7 +2578,7 @@ static void ath10k_wmi_event_chan_info_unpaired(struct ath10k *ar,
 
 	survey = &ar->survey[idx];
 
-	if (!params->mac_clk_mhz || !survey)
+	if (!params->mac_clk_mhz)
 		return;
 
 	memset(survey, 0, sizeof(*survey));
-- 
2.11.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
