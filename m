Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejwS2-0007aR-3Z
 for ath10k@lists.infradead.org; Fri, 09 Feb 2018 00:22:03 +0000
From: ryanhsu@codeaurora.org
Subject: [PATCH] ath10k: update the IRAM banks number for QCA9377
Date: Thu,  8 Feb 2018 16:20:31 -0800
Message-Id: <1518135631-29796-1-git-send-email-ryanhsu@codeaurora.org>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@codeaurora.org

From: Ryan Hsu <ryanhsu@codeaurora.org>

QCA9377 firmware update the IRAM banks from 4 to 9.

Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 355db6a..0c1029c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2216,7 +2216,7 @@ static int ath10k_pci_get_num_banks(struct ath10k *ar)
 		}
 		break;
 	case QCA9377_1_0_DEVICE_ID:
-		return 4;
+		return 9;
 	}
 
 	ath10k_warn(ar, "unknown number of banks, assuming 1\n");
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
