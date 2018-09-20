Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2r8v-0007J2-1G
 for ath10k@lists.infradead.org; Thu, 20 Sep 2018 05:04:48 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/2] ath10k: Disable napi before resource cleanup to avoid
 "use after free"
Date: Thu, 20 Sep 2018 10:34:26 +0530
Message-Id: <20180920050426.4113-2-govinds@codeaurora.org>
In-Reply-To: <20180920050426.4113-1-govinds@codeaurora.org>
References: <20180920050426.4113-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

CE buffers are cleaned up prior to napi disable and this is causing
NULL pointer dereference due to "use after free".

Disable napi before resource cleanup to avoid "use after free".

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index dd043b858c8e..6da951eea345 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -911,9 +911,9 @@ static void ath10k_snoc_buffer_cleanup(struct ath10k *ar)
 static void ath10k_snoc_hif_stop(struct ath10k *ar)
 {
 	ath10k_snoc_irq_disable(ar);
-	ath10k_snoc_buffer_cleanup(ar);
 	napi_synchronize(&ar->napi);
 	napi_disable(&ar->napi);
+	ath10k_snoc_buffer_cleanup(ar);
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif stop\n");
 }
 
-- 
2.18.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
