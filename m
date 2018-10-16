Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCF2I-0002uV-Rq
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 02:24:44 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH net-next] ath10k: fix copy-paste error in
 ath10k_qmi_setup_msa_resources()
Date: Tue, 16 Oct 2018 02:35:16 +0000
Message-ID: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

The return value from devm_memremap() is not checked correctly.
The test is done against a wrong variable. This patch fix it.

Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 56cb183..c2cbb41 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -931,7 +931,7 @@ static int ath10k_qmi_setup_msa_resources(struct ath10k_qmi *qmi, u32 msa_size)
 		qmi->msa_mem_size = resource_size(&r);
 		qmi->msa_va = devm_memremap(dev, qmi->msa_pa, qmi->msa_mem_size,
 					    MEMREMAP_WT);
-		if (!qmi->msa_pa) {
+		if (!qmi->msa_va) {
 			dev_err(dev, "failed to map memory region: %pa\n", &r.start);
 			return -EBUSY;
 		}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
