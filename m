Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbOH7-0006DX-Eo
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 05:25:02 +0000
Received: by mail-bk0-f42.google.com with SMTP id my10so334384bkb.29
 for <ath10k@lists.infradead.org>; Tue, 29 Oct 2013 22:24:39 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Oct 2013 13:24:39 +0800
Message-ID: <CAPgLHd9o1oGjjM=9B2H0tB41t8Kinp_1Djp6aA=sW5Eo5M7jfA@mail.gmail.com>
Subject: [PATCH -next] ath10k: fix possible memory leak in ath10k_pci_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
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
To: kvalo@qca.qualcomm.com, linville@tuxdriver.com
Cc: yongjun_wei@trendmicro.com.cn, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

memory is malloced in ath10k_pci_probe() and should be freed before
leaving from the error handling cases, otherwise it will cause
memory leak.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index dff23d9..af01631 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2470,7 +2470,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ret = ath10k_do_pci_wake(ar);
 	if (ret) {
 		ath10k_err("Failed to get chip id: %d\n", ret);
-		return ret;
+		goto err_iomap;
 	}
 
 	chip_id = ath10k_pci_read32(ar,


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
