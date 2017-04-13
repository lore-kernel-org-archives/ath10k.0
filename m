Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cya99-0000Wa-Gb
 for ath10k@lists.infradead.org; Thu, 13 Apr 2017 08:30:33 +0000
Subject: [PATCH v7 06/10] ath10k: add sdio extra initializations
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 13 Apr 2017 11:30:05 +0300
Message-ID: <149207220550.4590.5420612965578988206.stgit@potku.adurom.net>
In-Reply-To: <149207201649.4590.5821794186383265138.stgit@potku.adurom.net>
References: <149207201649.4590.5821794186383265138.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Erik Stromdahl <erik.stromdahl@gmail.com>

Extra initializations needed by all sdio boards.
Derived from qcacld.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 1b4c08b5eaa9..15a9549aad07 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -377,6 +377,21 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
 	complete(&ar->target_suspend);
 }
 
+static void ath10k_init_sdio(struct ath10k *ar)
+{
+	u32 param = 0;
+
+	ath10k_bmi_write32(ar, hi_mbox_io_block_sz, 256);
+	ath10k_bmi_write32(ar, hi_mbox_isr_yield_limit, 99);
+	ath10k_bmi_read32(ar, hi_acs_flags, &param);
+
+	param |= (HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET |
+		  HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET |
+		  HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE);
+
+	ath10k_bmi_write32(ar, hi_acs_flags, param);
+}
+
 static int ath10k_init_configure_target(struct ath10k *ar)
 {
 	u32 param_host;
@@ -1941,6 +1956,9 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 	if (status)
 		goto err;
 
+	if (ar->hif.bus == ATH10K_BUS_SDIO)
+		ath10k_init_sdio(ar);
+
 	ar->htc.htc_ops.target_send_suspend_complete =
 		ath10k_send_suspend_complete;
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
