Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8DY-0001Lz-PN
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 00:55:50 +0000
Received: by mail-pl1-x643.google.com with SMTP id u6-v6so3918278plz.4
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 17:55:34 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 4/4] ath10k: snoc: fix unbalanced clock error handling
Date: Fri, 12 Oct 2018 17:55:04 -0700
Message-Id: <20181013005504.46399-4-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-1-briannorris@chromium.org>
References: <20181013005504.46399-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Govind Singh <govinds@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Similar to regulator error handling, we should only start tearing down
the 'i - 1' clock when clock 'i' fails to enable. Otherwise, we might
end up with an unbalanced clock, where we never successfully enabled the
clock, but we try to disable it anyway.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 5a8e87339df2..a835599a8d55 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1470,7 +1470,7 @@ static int ath10k_snoc_clk_init(struct ath10k *ar)
 	return 0;
 
 err_clock_config:
-	for (; i >= 0; i--) {
+	for (i = i - 1; i >= 0; i--) {
 		clk_info = &ar_snoc->clk[i];
 
 		if (!clk_info->handle)
-- 
2.19.1.331.ge82ca0e54c-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
