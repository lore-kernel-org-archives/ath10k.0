Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtDDd-0004UZ-Pu
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 15:10:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 6/6] ath10k: copy the whole struct ath10k_bus_params in
 ath10k_core_register()
Date: Mon, 11 Feb 2019 17:09:47 +0200
Message-Id: <1549897787-28537-6-git-send-email-kvalo@codeaurora.org>
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

Instead of copying fields one by one copy the whole structure. This way there's
no need to modify the function every time we add a new field to the struct.

Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6c1dd5f8d012..a1b2aea4a77f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2997,9 +2997,8 @@ static void ath10k_core_register_work(struct work_struct *work)
 int ath10k_core_register(struct ath10k *ar,
 			 const struct ath10k_bus_params *bus_params)
 {
-	ar->bus_param.chip_id = bus_params->chip_id;
-	ar->bus_param.dev_type = bus_params->dev_type;
-	ar->bus_param.link_can_suspend = bus_params->link_can_suspend;
+	ar->bus_param = *bus_params;
+
 	queue_work(ar->workqueue, &ar->register_work);
 
 	return 0;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
