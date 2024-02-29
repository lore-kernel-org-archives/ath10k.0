Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C91C5475B
	for <ath10k@archiver.kernel.org>; Thu, 29 Feb 2024 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZckEXqrOjxn0koqiB/6wfRPJyR0DoXpMrLNFVSetg1w=; b=JqdUhHPlgYluYLkVMNTvIDby8j
	X548X1j2kjbHeqlaAHpuXeakG7Y00yA3VHxWMLmzLOfzxMlXWcZdEfWbhZkO0mkI43q2/Avfis/qZ
	l0YQaJq3nC5kE4h5cxn0PgCreWsITr5o9MtT4nGgcUFjoftOLUpjT8dXpuzn8kUyeA7bNbiia3hVh
	QRhXXDI2BuauaQKlJJthw920jJ/Rfd4n/n2/k/uW/X/t9XNvGfN71xl3qHxhidcYvZzd7Alq1V8Z4
	qk+ELkk/GK8UdxvN1CMNhdXc6tOEJGFvIHwz2peqPWwvn4cNkdLLEiD0u4GbzlEVyI/x2hvM003DD
	4x+M5e3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX4j-0000000Bt8A-2nf5;
	Thu, 29 Feb 2024 03:27:13 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfX4g-0000000Bt6U-2ZKt
	for ath10k@lists.infradead.org;
	Thu, 29 Feb 2024 03:27:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 289A3C006E
	for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 22:33:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1709177584; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZckEXqrOjxn0koqiB/6wfRPJyR0DoXpMrLNFVSetg1w=;
	b=kN3JdVMQgE2lGrHFn9mJn17x6q3WimNEbSSF3PV8GnNF3cRT0xvtxC0uNLHRnIZ06xOos3
	oCZ4Nh2rH3MMFuC1Rn2+yZH3u4sBCEqFEx+2iDF3zgxnL4k4yu6QDB5avbO5TbIT5fxxez
	Osv6wvIddNDwtJESsBkMiZCte7d8XLY=
From: Felix Kaechele <felix@kaechele.ca>
To: ath10k@lists.infradead.org
Subject: [RFC PATCH 1/1] wifi: ath10k: add support for QCA9379 hw1.0 SDIO
Date: Wed, 28 Feb 2024 22:27:00 -0500
Message-ID: <20240229032700.414415-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229032700.414415-1-felix@kaechele.ca>
References: <20240229032700.414415-1-felix@kaechele.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_192711_010650_874A8C4C 
X-CRM114-Status: GOOD (  16.18  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Add support for the QCA9379 chipset. Analogous to the vendor qcacld driver
this change treats the QCA9379 family the same as the QCA9377 family.

The card generally works and connects to a variety of networks (open,
WPA2-PSK, WPA3 Personal) but currently does not roam cleanly and will
reauthenticate, causing intermittent loss of connectivity.

This change was tested on a device that uses a LITE-ON WCBN3510A card.

Tested-on: QCA9379 hw1.0 SDIO WLAN.NPL.1.6-00163-QCANPLSWPZ-1

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 drivers/net/wireless/ath/ath10k/core.c      | 35 +++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h        | 11 +++++++
 drivers/net/wireless/ath/ath10k/pci.c       |  2 ++
 drivers/net/wireless/ath/ath10k/sdio.c      |  5 ++-
 drivers/net/wireless/ath/ath10k/targaddrs.h |  3 ++
 include/linux/mmc/sdio_ids.h                |  1 +
 6 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9ce6f49ab261..6daf26d06885 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -661,6 +661,40 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.delay_unmap_buffer = false,
 		.mcast_frame_registration = false,
 	},
+	{
+		.id = QCA9379_HW_1_0_DEV_VERSION,
+		.dev_id = QCA9379_1_0_DEVICE_ID,
+		.bus = ATH10K_BUS_SDIO,
+		.name = "qca9379 hw1.0 sdio",
+		.patch_load_addr = QCA9379_HW_1_0_PATCH_LOAD_ADDR,
+		.uart_pin = 19,
+		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
+		.cal_data_len = 8124,
+		.fw = {
+			.dir = QCA9379_HW_1_0_FW_DIR,
+			.board = QCA9379_HW_1_0_BOARD_DATA_FILE,
+			.board_size = QCA9379_BOARD_DATA_SZ,
+			.board_ext_size = QCA9379_BOARD_EXT_DATA_SZ,
+		},
+		.rx_desc_ops = &qca988x_rx_desc_ops,
+		.hw_ops = &qca6174_ops,
+		.hw_clk = qca6174_clk,
+		.target_cpu_freq = 176000000,
+		.decap_align_bytes = 4,
+		.n_cipher_suites = 8,
+		.num_peers = TARGET_HL_TLV_NUM_PEERS,
+		.ast_skid_limit = 0x10,
+		.num_wds_entries = 0x20,
+		.uart_pin_workaround = true,
+		.credit_size_workaround = true,
+		.dynamic_sar_support = false,
+		.hw_restart_disconnect = false,
+		.use_fw_tx_credits = true,
+		.delay_unmap_buffer = false,
+		.mcast_frame_registration = false,
+	},
 	{
 		.id = QCA4019_HW_1_0_DEV_VERSION,
 		.dev_id = 0,
@@ -3585,6 +3619,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 		break;
 	case ATH10K_HW_QCA6174:
 	case ATH10K_HW_QCA9377:
+	case ATH10K_HW_QCA9379:
 		ar->regs = &qca6174_regs;
 		ar->hw_ce_regs = &qcax_ce_regs;
 		ar->hw_values = &qca6174_values;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 93c073091996..8f52695b46db 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -30,6 +30,7 @@ enum ath10k_bus {
 #define QCA9888_2_0_DEVICE_ID	(0x0056)
 #define QCA9984_1_0_DEVICE_ID	(0x0046)
 #define QCA9377_1_0_DEVICE_ID   (0x0042)
+#define QCA9379_1_0_DEVICE_ID   (0x0042)
 #define QCA9887_1_0_DEVICE_ID   (0x0050)
 
 /* QCA988X 1.0 definitions (unsupported) */
@@ -61,6 +62,9 @@ enum ath10k_bus {
 #define QCA9377_HW_1_0_DEV_VERSION	0x05020000
 #define QCA9377_HW_1_1_DEV_VERSION	0x05020001
 
+/* QCA9379 target BMI version signatures */
+#define QCA9379_HW_1_0_DEV_VERSION	0x05040000
+
 enum qca6174_pci_rev {
 	QCA6174_PCI_REV_1_1 = 0x11,
 	QCA6174_PCI_REV_1_3 = 0x13,
@@ -124,6 +128,11 @@ enum qca9377_chip_id_rev {
 #define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA9377_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
+/* QCA9379 1.0 definitions */
+#define QCA9379_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA9379/hw1.0"
+#define QCA9379_HW_1_0_BOARD_DATA_FILE "board.bin"
+#define QCA9379_HW_1_0_PATCH_LOAD_ADDR	0x1234
+
 /* QCA4019 1.0 definitions */
 #define QCA4019_HW_1_0_DEV_VERSION     0x01000000
 #define QCA4019_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA4019/hw1.0"
@@ -238,6 +247,7 @@ enum ath10k_hw_rev {
 	ATH10K_HW_QCA9888,
 	ATH10K_HW_QCA9984,
 	ATH10K_HW_QCA9377,
+	ATH10K_HW_QCA9379,
 	ATH10K_HW_QCA4019,
 	ATH10K_HW_QCA9887,
 	ATH10K_HW_WCN3990,
@@ -409,6 +419,7 @@ int ath10k_hw_diag_fast_download(struct ath10k *ar,
 #define QCA_REV_9888(ar) ((ar)->hw_rev == ATH10K_HW_QCA9888)
 #define QCA_REV_9984(ar) ((ar)->hw_rev == ATH10K_HW_QCA9984)
 #define QCA_REV_9377(ar) ((ar)->hw_rev == ATH10K_HW_QCA9377)
+#define QCA_REV_9379(ar) ((ar)->hw_rev == ATH10K_HW_QCA9379)
 #define QCA_REV_40XX(ar) ((ar)->hw_rev == ATH10K_HW_QCA4019)
 #define QCA_REV_WCN3990(ar) ((ar)->hw_rev == ATH10K_HW_WCN3990)
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5c34b156b4ff..903224fdac15 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1899,6 +1899,7 @@ void ath10k_pci_irq_msi_fw_mask(struct ath10k *ar)
 		 *  to mask irq/MSI.
 		 */
 		break;
+	case ATH10K_HW_QCA9379:
 	case ATH10K_HW_WCN3990:
 		break;
 	}
@@ -1927,6 +1928,7 @@ static void ath10k_pci_irq_msi_fw_unmask(struct ath10k *ar)
 		 *  to unmask irq/MSI.
 		 */
 		break;
+	case ATH10K_HW_QCA9379:
 	case ATH10K_HW_WCN3990:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 0ab5433f6cf6..a1e8f9783b5d 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1105,6 +1105,7 @@ static void ath10k_sdio_set_mbox_info(struct ath10k *ar)
 				ATH10K_HIF_MBOX0_EXT_WIDTH_ROME_2_0;
 		break;
 	case (SDIO_DEVICE_ID_ATHEROS_QCA9377 & 0x0F00):
+	case (SDIO_DEVICE_ID_ATHEROS_QCA9379 & 0x0F00):
 		mbox_info->ext_info[0].htc_ext_sz =
 			ATH10K_HIF_MBOX0_EXT_WIDTH_ROME_2_0;
 		break;
@@ -2597,7 +2598,8 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 
 	dev_id_base = (id->device & 0x0F00);
 	if (dev_id_base != (SDIO_DEVICE_ID_ATHEROS_AR6005 & 0x0F00) &&
-	    dev_id_base != (SDIO_DEVICE_ID_ATHEROS_QCA9377 & 0x0F00)) {
+	    dev_id_base != (SDIO_DEVICE_ID_ATHEROS_QCA9377 & 0x0F00) &&
+	    dev_id_base != (SDIO_DEVICE_ID_ATHEROS_QCA9379 & 0x0F00)) {
 		ret = -ENODEV;
 		ath10k_err(ar, "unsupported device id %u (0x%x)\n",
 			   dev_id_base, id->device);
@@ -2656,6 +2658,7 @@ static void ath10k_sdio_remove(struct sdio_func *func)
 static const struct sdio_device_id ath10k_sdio_devices[] = {
 	{SDIO_DEVICE(SDIO_VENDOR_ID_ATHEROS, SDIO_DEVICE_ID_ATHEROS_AR6005)},
 	{SDIO_DEVICE(SDIO_VENDOR_ID_ATHEROS, SDIO_DEVICE_ID_ATHEROS_QCA9377)},
+	{SDIO_DEVICE(SDIO_VENDOR_ID_ATHEROS, SDIO_DEVICE_ID_ATHEROS_QCA9379)},
 	{},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/targaddrs.h b/drivers/net/wireless/ath/ath10k/targaddrs.h
index ec556bb88d65..71782b153e75 100644
--- a/drivers/net/wireless/ath/ath10k/targaddrs.h
+++ b/drivers/net/wireless/ath/ath10k/targaddrs.h
@@ -481,6 +481,9 @@ struct host_interest {
 #define QCA9377_BOARD_DATA_SZ     QCA6174_BOARD_DATA_SZ
 #define QCA9377_BOARD_EXT_DATA_SZ 0
 
+#define QCA9379_BOARD_DATA_SZ     QCA6174_BOARD_DATA_SZ
+#define QCA9379_BOARD_EXT_DATA_SZ 0
+
 #define QCA99X0_BOARD_DATA_SZ	  12288
 #define QCA99X0_BOARD_EXT_DATA_SZ 0
 
diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 7fada7a714fe..181a284862d0 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -52,6 +52,7 @@
 #define SDIO_DEVICE_ID_ATHEROS_AR6004_19	0x0419
 #define SDIO_DEVICE_ID_ATHEROS_AR6005		0x050A
 #define SDIO_DEVICE_ID_ATHEROS_QCA9377		0x0701
+#define SDIO_DEVICE_ID_ATHEROS_QCA9379		0x0801
 
 #define SDIO_VENDOR_ID_BROADCOM			0x02d0
 #define SDIO_DEVICE_ID_BROADCOM_NINTENDO_WII	0x044b
-- 
2.44.0


