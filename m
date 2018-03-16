Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewjRD-0007rj-UX
 for ath10k@lists.infradead.org; Fri, 16 Mar 2018 07:06:05 +0000
From: ryanhsu@codeaurora.org
Subject: [PATCH 2/2] ath10k: add FW API 6 firmware image for QCA9377
Date: Fri, 16 Mar 2018 00:05:42 -0700
Message-Id: <1521183942-4291-2-git-send-email-ryanhsu@codeaurora.org>
In-Reply-To: <1521183942-4291-1-git-send-email-ryanhsu@codeaurora.org>
References: <1521183942-4291-1-git-send-email-ryanhsu@codeaurora.org>
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

Firmware WLAN.TF.2.1-00014-QCARMSWP-1 now supports reading the board ID
information and also required 9 IRAM bank, which older ath10k version
don't have the support will fail to be enabled, so in order to maintain
the backward compatibility, we need to update the FW API to 6.

Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e9c3162..d2a3acd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3496,5 +3496,6 @@ static void __exit ath10k_pci_exit(void)
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_BOARD_API2_FILE);
 
 /* QCA9377 1.0 firmware files */
+MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" ATH10K_FW_API6_FILE);
 MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" ATH10K_FW_API5_FILE);
 MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" QCA9377_HW_1_0_BOARD_DATA_FILE);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
