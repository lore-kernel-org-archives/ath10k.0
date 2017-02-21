Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgD7H-0006gn-4R
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 16:16:44 +0000
Received: by mail-lf0-x244.google.com with SMTP id 86so5300130lfv.0
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 08:16:20 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v4 07/21] ath10k: add sdio extra initializations
Date: Tue, 21 Feb 2017 17:15:27 +0100
Message-Id: <1487693741-10042-8-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
References: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Extra initializations needed by all sdio boards.
Derived from qcacld.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 83ab651..eae502e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -377,6 +377,27 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
 	complete(&ar->target_suspend);
 }
 
+static void ath10k_sdio_extra_initialization(struct ath10k *ar)
+{
+	u32 param = 0;
+
+	/* Turn on fwlog.
+	 */
+	ath10k_bmi_read32(ar, hi_option_flag, &param);
+	param &= ~(HI_OPTION_DISABLE_DBGLOG);
+	ath10k_bmi_write32(ar, hi_option_flag, param);
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
@@ -1916,6 +1937,9 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 	if (status)
 		goto err;
 
+	if (ar->hif.bus == ATH10K_BUS_SDIO)
+		ath10k_sdio_extra_initialization(ar);
+
 	ar->htc.htc_ops.target_send_suspend_complete =
 		ath10k_send_suspend_complete;
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
