Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69529C54EBF
	for <ath10k@archiver.kernel.org>; Fri,  6 Jan 2023 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYafUr0YjCqYcfe5srz1qu1tqdgutAefA4jp1FpeIlw=; b=bo7XlwxBOi/BT8
	fD+oMDIGbb4bG0GjRDFrckmQEveOWRQesAWk84vuvCHNF9JIF5e2ATr/bqc46HuVKbq6Fd6EpqEKk
	mviaa6lkO/cZ68nZ3I22Zi/0Gctu3fIz1Id6LXNX7wMNRmY8L9fZmcB/O9uIt8jR+w4WVlZawaFIx
	t0FXGchlt1SDvYOa9kyLIN26MkIMNJ7YPA8QYDjpaycR3ELgax5+BeKBsAZ2UMbf71Zo3pT37uokF
	yWNVW9h7RNcv4RUqFf8INs7AQLSuT53Z1BzUZGGGa75GCIjxcj+9wEDGsm7eCcglH/+w+Iok1fIjT
	OBlmOQvGkjky50mrT/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkRO-007bPk-Ud; Fri, 06 Jan 2023 10:59:14 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDkRL-007bO5-2M
	for ath10k@lists.infradead.org; Fri, 06 Jan 2023 10:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673002751; x=1704538751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czBvPkOaTKzYlrTp7htNRXp6MXEfNLCtJhGdaz9BVkI=;
  b=hqYIyiL5AZDuIt9pQBU8/A35HSGNkJZ7QxnVFleO85m0b7VwHAuam/Ka
   3/zpqoU+hlNaFgRkv9XeMsWGvvDLtgA72GRxReKxn9RiYj5oZGw5hKluk
   kZ+Q2EdX84k5Ff0YXONIzUPtHm/wiy+ZuJcWNDigR+6jEcykdG/bXesn6
   bIjHM85yB/mKkfxEM5AF30wZDjv8uAxUHEaICPallU0OYl1f0JuUENKIM
   jA+RfR8LY4A0u/qRQHTv8tgoU1IX4BaWG2SGSIyZ4beCBqpV6/zU+f1BC
   fRlC9RNv+dTCjJm6i55cwag3m7/woQI5MBhvWy/6P2rabB/J/RO6tJNLI
   w==;
X-IronPort-AV: E=Sophos;i="5.96,305,1665439200"; 
   d="scan'208";a="28272863"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Jan 2023 11:59:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 06 Jan 2023 11:59:05 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 06 Jan 2023 11:59:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673002745; x=1704538745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czBvPkOaTKzYlrTp7htNRXp6MXEfNLCtJhGdaz9BVkI=;
  b=XQUigQXxv5ynyoISP8af8eDnLner2u0CQtzUDJhYOK9/g/WW5WHGE1A8
   N7cVpnVEkQANhC2ufX+wY/890u/y4Bx8A1qhNyNqXLaYoDrMf6Ju/WdzH
   sztBWbClcYRVVn/+iDjSeQpy+FYmcNbL1e6bXSUO9busdLSX23VBVz7y+
   CHjf6dspRyHtSSXQcx5qU/xP2rjxEnoruUmsQMhUa/LdHsy5UHHM5RvWN
   PvWseUu1Ev09wrFJQreDFs793AiXF37sePP4G7EAaaAfrWJD7pGXsbntG
   xb3q3wy3hOil0vWhcKeicFWEy3gltW6H7tUmNb2FcWZ/f6i0yOf+PDBsc
   g==;
X-IronPort-AV: E=Sophos;i="5.96,305,1665439200"; 
   d="scan'208";a="28272861"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Jan 2023 11:59:05 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9FC58280056;
	Fri,  6 Jan 2023 11:59:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC PATCH 2/2] ath10k: Add support for QCA9377 hw1.1 usb
Date: Fri,  6 Jan 2023 11:58:53 +0100
Message-Id: <20230106105853.3484381-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106105853.3484381-1-alexander.stein@ew.tq-group.com>
References: <20230106105853.3484381-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_025911_445830_501B96FD 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

This adds hw_param for QCA9377 hw1.1 usb device.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 28 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  8 ++++++++
 drivers/net/wireless/ath/ath10k/usb.c  |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f69dab55fa36..e67f1a852cd1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -646,6 +646,34 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
 	},
+	{
+		.id = QCA9377_HW_1_1_DEV_VERSION,
+		.dev_id = QCA9377_1_1_DEVICE_ID,
+		.bus = ATH10K_BUS_USB,
+		.name = "qca9377 hw1.1 usb",
+		.patch_load_addr = QCA9377_HW_1_1_PATCH_LOAD_ADDR,
+		.uart_pin = 19,
+		.otp_exe_param = 0,
+		.channel_counters_freq_hz = 88000,
+		.max_probe_resp_desc_thres = 0,
+		.cal_data_len = 8124,
+		.fw = {
+			.dir = QCA9377_HW_1_1_FW_DIR,
+			.board = QCA9377_HW_1_1_USB_BOARD_DATA_FILE,
+			.board_size = QCA9377_BOARD_DATA_SZ,
+			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
+		},
+		.hw_ops = &qca6174_ops,
+		.hw_clk = qca6174_clk,
+		.target_cpu_freq = 176000000,
+		.decap_align_bytes = 4,
+		.n_cipher_suites = 8,
+		.num_peers = TARGET_QCA9377_HL_NUM_PEERS,
+		.ast_skid_limit = 0x10,
+		.num_wds_entries = 0x20,
+		.uart_pin_workaround = true,
+		.start_once = true,
+	},
 	{
 		.id = QCA4019_HW_1_0_DEV_VERSION,
 		.dev_id = 0,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index ea3b5c5c6c9b..2e934d74d7cc 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -29,6 +29,7 @@ enum ath10k_bus {
 #define QCA9888_2_0_DEVICE_ID	(0x0056)
 #define QCA9984_1_0_DEVICE_ID	(0x0046)
 #define QCA9377_1_0_DEVICE_ID   (0x0042)
+#define QCA9377_1_1_DEVICE_ID   (0x9378)
 #define QCA9887_1_0_DEVICE_ID   (0x0050)
 
 /* QCA988X 1.0 definitions (unsupported) */
@@ -123,6 +124,13 @@ enum qca9377_chip_id_rev {
 #define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA9377_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
+/* QCA9377 1.1 definitions */
+#define QCA9377_HW_1_1_FW_DIR          ATH10K_FW_DIR "/QCA9377/hw1.1"
+#define QCA9377_HW_1_1_BOARD_DATA_FILE "board.bin"
+#define QCA9377_HW_1_1_SDIO_BOARD_DATA_FILE "board-sdio.bin"
+#define QCA9377_HW_1_1_USB_BOARD_DATA_FILE "board-usb.bin"
+#define QCA9377_HW_1_1_PATCH_LOAD_ADDR	0x1234
+
 /* QCA4019 1.0 definitions */
 #define QCA4019_HW_1_0_DEV_VERSION     0x01000000
 #define QCA4019_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA4019/hw1.0"
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index b0067af685b1..efb949158aa1 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1107,6 +1107,7 @@ static int ath10k_usb_pm_resume(struct usb_interface *interface)
 /* table of devices that work with this driver */
 static struct usb_device_id ath10k_usb_ids[] = {
 	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
+	{USB_DEVICE(0x0CF3, 0x9378)}, /* Qualcomm QCA9377-7 */
 	{ /* Terminating entry */ },
 };
 
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
