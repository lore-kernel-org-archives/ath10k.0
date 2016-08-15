Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZIF4-0002uB-6i
 for ath10k@lists.infradead.org; Mon, 15 Aug 2016 13:47:50 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] ath10k: fix memory leak on caldata on error exit path
Date: Mon, 15 Aug 2016 14:46:25 +0100
Message-Id: <1471268785-11576-1-git-send-email-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

caldata is not being free'd on the error exit path, causing
a memory leak. kfree it to fix the leak.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 9a22c47..886337c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2725,6 +2725,7 @@ static int ath10k_pci_hif_fetch_cal_eeprom(struct ath10k *ar, void **data,
 	return 0;
 
 err_free:
+	kfree(caldata);
 	kfree(data);
 
 	return -EINVAL;
-- 
2.8.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
