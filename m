Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6tQM-00050W-6F
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 07:47:11 +0000
From: mkenna@codeaurora.org
Subject: [PATCH] ath10k: Fix a typo in ath10k_wmi_set_wmm_param()
Date: Fri, 13 Apr 2018 13:18:31 +0530
Message-Id: <1523605711-1874-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org

From: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Fix a typo in the function ath10k_wmi_set_wmm_param().

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c5e1ca5..727c965 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7648,7 +7648,7 @@ void ath10k_wmi_set_wmm_param(struct wmi_wmm_params *params,
 	cmd->param = __cpu_to_le32(param);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
-		   "wmi pdev get tcp config param:%d\n", param);
+		   "wmi pdev get tpc config param %d\n", param);
 	return skb;
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
