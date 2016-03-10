Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adsda-0006Ye-Ig
 for ath10k@lists.infradead.org; Thu, 10 Mar 2016 04:55:51 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH] ath10k: free cached fw bin contents when get board id fails
Date: Thu, 10 Mar 2016 10:25:07 +0530
Message-ID: <1457585707-11344-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

ath10k_core_probe_fw() simply returns error without freeing
cached firmware file content when get board id operation fails.
Free cached fw bin data in failure case to avoid memory leak.

Fixes: db0984e51a18 ("ath10k: select board data based on BMI chip id and board id")
Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4d31764..a76d8ac 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1833,7 +1833,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	if (ret && ret != -EOPNOTSUPP) {
 		ath10k_err(ar, "failed to get board id from otp: %d\n",
 			   ret);
-		return ret;
+		goto err_free_firmware_files;
 	}
 
 	ret = ath10k_core_fetch_board_file(ar);
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
