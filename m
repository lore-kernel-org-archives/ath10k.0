Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iW0HP-00023P-Cq
 for ath10k@lists.infradead.org; Sat, 16 Nov 2019 15:46:35 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 200/237] ath10k: snoc: fix unbalanced clock error
 handling
Date: Sat, 16 Nov 2019 10:40:35 -0500
Message-Id: <20191116154113.7417-200-sashal@kernel.org>
In-Reply-To: <20191116154113.7417-1-sashal@kernel.org>
References: <20191116154113.7417-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Brian Norris <briannorris@chromium.org>

[ Upstream commit 82e60d920e8ad70cd9a280ab156566755f1fe4aa ]

Similar to regulator error handling, we should only start tearing down
the 'i - 1' clock when clock 'i' fails to enable. Otherwise, we might
end up with an unbalanced clock, where we never successfully enabled the
clock, but we try to disable it anyway.

Fixes: a6a793f98786 ("ath10k: vote for hardware resources for WCN3990")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index fa1843a7e0fda..e2d78f77edb70 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1190,7 +1190,7 @@ static int ath10k_wcn3990_clk_init(struct ath10k *ar)
 	return 0;
 
 err_clock_config:
-	for (; i >= 0; i--) {
+	for (i = i - 1; i >= 0; i--) {
 		clk_info = &ar_snoc->clk[i];
 
 		if (!clk_info->handle)
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
