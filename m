Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSQOa-0008BC-HY
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 15:05:17 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Remove driver log suggesting QCA9887 support is
 experimental
Date: Wed, 27 Jul 2016 20:34:56 +0530
Message-ID: <1469631896-9852-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Support for QCA9887 is no longer experimental and if there are any issues
we need to address them

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index f06dd39..f3d943c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3144,7 +3144,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		pci_hard_reset = ath10k_pci_qca988x_chip_reset;
 		break;
 	case QCA9887_1_0_DEVICE_ID:
-		dev_warn(&pdev->dev, "QCA9887 support is still experimental, there are likely bugs. You have been warned.\n");
 		hw_rev = ATH10K_HW_QCA9887;
 		pci_ps = false;
 		pci_soft_reset = ath10k_pci_warm_reset;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
