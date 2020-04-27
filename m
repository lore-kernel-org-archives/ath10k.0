Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT1Dq-0003C8-KE
 for ath10k@lists.infradead.org; Mon, 27 Apr 2020 10:42:48 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH net-next] ath10k: fix possible memory leak in
 ath10k_bmi_lz_data_large()
Date: Mon, 27 Apr 2020 10:43:48 +0000
Message-ID: <20200427104348.13570-1-weiyongjun1@huawei.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

'cmd' is malloced in ath10k_bmi_lz_data_large() and should be freed
before leaving from the error handling cases, otherwise it will cause
memory leak.

Fixes: d58f466a5dee ("ath10k: add large size for BMI download data for SDIO")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index ea908107581d..5b6db6e66f65 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -380,6 +380,7 @@ static int ath10k_bmi_lz_data_large(struct ath10k *ar, const void *buffer, u32 l
 						  NULL, NULL);
 		if (ret) {
 			ath10k_warn(ar, "unable to write to the device\n");
+			kfree(cmd);
 			return ret;
 		}




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
