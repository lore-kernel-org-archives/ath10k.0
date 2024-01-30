Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87A5C48286
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB6ewtrAfr0F1qcvx2dtB/htAGC0PSXtCaPOD4+cgUM=; b=WzXm1xheo6Xl/M8C3bN1msa5We
	FqCaLLCRtHWF9pfVjDW0ChDeBxePJE6AjngdNcd9+MQbkOnbdJw5uT6pycqDM3i0Le4n6PT50P5xh
	n2yLrVlTMMPjYZ6fy/PPXqHXge/TXSWvLIihRRv6F18du6CGObMI7p80l7iJ2y5OzO1dLZQCgdySZ
	izbq+nipCuDoEXgXMinMKTFbh/IsUuP9EruTGMqNS9Dw3uf3TgaGnJfUm2W3fLLc0C42UmveuJkiw
	914AOCjzFKqxCzejhNgvxt//Pcgj7uGl43zV24OnJgEI5LIfkS1b4mSMYZDRJg/MiDBoc40TrHSwM
	+T4I3eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtt-0000000FSXj-0yaa;
	Tue, 30 Jan 2024 06:47:17 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtn-0000000FSVf-3WIl
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 06:47:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso4418322e87.2
        for <ath10k@lists.infradead.org>; Mon, 29 Jan 2024 22:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597229; x=1707202029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sB6ewtrAfr0F1qcvx2dtB/htAGC0PSXtCaPOD4+cgUM=;
        b=YbYKPXvkVJXUYs806N0illjsEOwZtBN1eENeK/LqdL2GDjgxLpUJT+XrJGERexnEfD
         guUrPfc5j5AImvGUitP97kYghliWyGX8Zh4cdzdZXya27wl1GIea6BLmYlytr7V29QZe
         VyIUFCytKA+954Wo3Xh7M+Wr5TpfaHOv67kT59HDQEJgBlLngyu2AUgck0b+k8WvS7EF
         MQ2AadcDa0z8gjkKAs83tWzc8mSQmDHyNG5qjbzoQ0YYuQX+HQzN6B2FhGeCubKm1NQv
         1/Kkha0pMKRNLTE3Z2yHJZVoDP9RtwsjH59bRpZ1oF6CH/55B/IFPiM3pv4My6ONCO2G
         y7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597229; x=1707202029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sB6ewtrAfr0F1qcvx2dtB/htAGC0PSXtCaPOD4+cgUM=;
        b=mevRnJ5AsPd6S49a9ShCpBw9LLOXBpN3eaAJLyGEgfZ3cL5B/WRvdtRM4kqkvjssmd
         A/IdBYT8Kt+hw8mdzzVs1B6ENBwoLhFciWKobRjkxN6XUe3xoAqa8shSj0RdA/MWki5R
         UPawRJUCYnec/UVO9PggpY9+jbqs63dqC8o4CY4j6LIJUQeGYWGrEAy0mMD5DKxwRKIg
         FA3vLjVYRyVBArPG2UQv43M+xhWrKJUpFZEYrexVuJwrIEj5M+QIMkVmA47yDsU/Grog
         YMT4iKK8hU0+Dj2nLN94XTKfgy2B+ZekxmMEE1x7PHOz0HLYCdIrqVkFee+Peec27vSr
         6hyQ==
X-Gm-Message-State: AOJu0Yznid7MOuQ13Ch0tIdB8fXgDAJaBLmIIB1LWunmWayOPdPYkhAX
	8JKwYus/XDP2111oHVauS2gsjlnN3BS6L7QL2NmJxLu1BHCemT1ZjZMAi91nYlE=
X-Google-Smtp-Source: AGHT+IEVAhrEOTIJ56mEyR5ADNQhiaQ0XwzJ3gC6fzdlkD3WAUnd6god9QTZmEPpX2r55hHQWGbuMg==
X-Received: by 2002:a05:6512:3707:b0:50e:ca86:658a with SMTP id z7-20020a056512370700b0050eca86658amr4297278lfr.45.1706597229087;
        Mon, 29 Jan 2024 22:47:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d18-20020a056512369200b005101e1870aasm1367068lfs.162.2024.01.29.22.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:47:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 08:47:07 +0200
Subject: [PATCH 2/3] wifi: ath10k: drop chip-specific board data file name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-board-fw-v1-2-738f7c19a8c8@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=12196;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QyapfctrGj73bT5QgnbUk0U+e7Wa8sIGbhlY7BZtomU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluJtqiAQWkwp6PykmHbNQo9IJejjUMVikLG7bO
 l26mSfsPlmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbibagAKCRCLPIo+Aiko
 1ZnAB/4uJStWqqaEcCfMabZiSjnb4e9l9YxjHZnJc2AowfNS0Xw8s/v84kKbVrkzqc8y+yKVYdA
 0DKphlRI/R57N74okv/tII+cATwK2N8uoH/qmpx3gUCSL6KkwYmG6SA0eyDv0agaWsaRMrT6X/g
 uWfj65BK9EYm0vcnIrkXnnSerEo56l8V13bfT4+gHyTDJvZROVnGO9KT7wm8rfsft2rE87APXZI
 0lmftz+OWEK1trJroJk1B1q6jUANaqaqvQSwh/nZsryt7mIDxJ5tqHfRxBsFmyM1H4QLspW07/O
 rk3Y3z6YPzb7iYFFliOm4YujhFI9S+RWi6GZWDypXBMo06A7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_224711_923269_F298BE8F 
X-CRM114-Status: GOOD (  12.39  )
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

The .fw.board parameter predates board-2.bin support. For all the
platforms, which define this parameter, it is equal to "board.bin".
Other platforms (like WCN3990) ommit it, limiting the ability to
provide board-specific data file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 23 +----------------------
 drivers/net/wireless/ath/ath10k/hw.h   | 12 +-----------
 drivers/net/wireless/ath/ath10k/pci.c  | 10 +++++-----
 3 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 4e3736d7aff7..e01a7b196b99 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -75,7 +75,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 2116,
 		.fw = {
 			.dir = QCA988X_HW_2_0_FW_DIR,
-			.board = QCA988X_HW_2_0_BOARD_DATA_FILE,
 			.board_size = QCA988X_BOARD_DATA_SZ,
 			.board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
 		},
@@ -116,7 +115,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 2116,
 		.fw = {
 			.dir = QCA988X_HW_2_0_FW_DIR,
-			.board = QCA988X_HW_2_0_BOARD_DATA_FILE,
 			.board_size = QCA988X_BOARD_DATA_SZ,
 			.board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
 		},
@@ -158,7 +156,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 2116,
 		.fw = {
 			.dir = QCA9887_HW_1_0_FW_DIR,
-			.board = QCA9887_HW_1_0_BOARD_DATA_FILE,
 			.board_size = QCA9887_BOARD_DATA_SZ,
 			.board_ext_size = QCA9887_BOARD_EXT_DATA_SZ,
 		},
@@ -199,7 +196,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 0,
 		.fw = {
 			.dir = QCA6174_HW_3_0_FW_DIR,
-			.board = QCA6174_HW_3_0_BOARD_DATA_FILE,
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
@@ -236,7 +232,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA6174_HW_2_1_FW_DIR,
-			.board = QCA6174_HW_2_1_BOARD_DATA_FILE,
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
@@ -277,7 +272,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA6174_HW_2_1_FW_DIR,
-			.board = QCA6174_HW_2_1_BOARD_DATA_FILE,
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
@@ -318,7 +312,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA6174_HW_3_0_FW_DIR,
-			.board = QCA6174_HW_3_0_BOARD_DATA_FILE,
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
@@ -360,7 +353,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.fw = {
 			/* uses same binaries as hw3.0 */
 			.dir = QCA6174_HW_3_0_FW_DIR,
-			.board = QCA6174_HW_3_0_BOARD_DATA_FILE,
 			.board_size = QCA6174_BOARD_DATA_SZ,
 			.board_ext_size = QCA6174_BOARD_EXT_DATA_SZ,
 		},
@@ -409,7 +401,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 12064,
 		.fw = {
 			.dir = QCA99X0_HW_2_0_FW_DIR,
-			.board = QCA99X0_HW_2_0_BOARD_DATA_FILE,
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
@@ -457,7 +448,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 12064,
 		.fw = {
 			.dir = QCA9984_HW_1_0_FW_DIR,
-			.board = QCA9984_HW_1_0_BOARD_DATA_FILE,
 			.eboard = QCA9984_HW_1_0_EBOARD_DATA_FILE,
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
@@ -510,7 +500,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 12064,
 		.fw = {
 			.dir = QCA9888_HW_2_0_FW_DIR,
-			.board = QCA9888_HW_2_0_BOARD_DATA_FILE,
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 		},
@@ -556,7 +545,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA9377_HW_1_0_FW_DIR,
-			.board = QCA9377_HW_1_0_BOARD_DATA_FILE,
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
@@ -597,7 +585,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA9377_HW_1_0_FW_DIR,
-			.board = QCA9377_HW_1_0_BOARD_DATA_FILE,
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
@@ -640,7 +627,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 8124,
 		.fw = {
 			.dir = QCA9377_HW_1_0_FW_DIR,
-			.board = QCA9377_HW_1_0_BOARD_DATA_FILE,
 			.board_size = QCA9377_BOARD_DATA_SZ,
 			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
 		},
@@ -680,7 +666,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 12064,
 		.fw = {
 			.dir = QCA4019_HW_1_0_FW_DIR,
-			.board = QCA4019_HW_1_0_BOARD_DATA_FILE,
 			.board_size = QCA4019_BOARD_DATA_SZ,
 			.board_ext_size = QCA4019_BOARD_EXT_DATA_SZ,
 		},
@@ -720,7 +705,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.max_spatial_stream = 4,
 		.fw = {
 			.dir = WCN3990_HW_1_0_FW_DIR,
-			.board = WCN3990_HW_1_0_BOARD_DATA_FILE,
 			.board_size = WCN3990_BOARD_DATA_SZ,
 			.board_ext_size = WCN3990_BOARD_EXT_DATA_SZ,
 		},
@@ -1291,11 +1275,6 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 	char boardname[100];
 
 	if (bd_ie_type == ATH10K_BD_IE_BOARD) {
-		if (!ar->hw_params.fw.board) {
-			ath10k_err(ar, "failed to find board file fw entry\n");
-			return -EINVAL;
-		}
-
 		scnprintf(boardname, sizeof(boardname), "board-%s-%s.bin",
 			  ath10k_bus_str(ar->hif.bus), dev_name(ar->dev));
 
@@ -1305,7 +1284,7 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 		if (IS_ERR(ar->normal_mode_fw.board)) {
 			fw = ath10k_fetch_fw_file(ar,
 						  ar->hw_params.fw.dir,
-						  ar->hw_params.fw.board);
+						  ATH10K_BOARD_DATA_FILE);
 			ar->normal_mode_fw.board = fw;
 		}
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 9aa2d821b507..12e8aebab1e9 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -39,14 +39,12 @@ enum ath10k_bus {
 #define QCA988X_HW_2_0_VERSION		0x4100016c
 #define QCA988X_HW_2_0_CHIP_ID_REV	0x2
 #define QCA988X_HW_2_0_FW_DIR		ATH10K_FW_DIR "/QCA988X/hw2.0"
-#define QCA988X_HW_2_0_BOARD_DATA_FILE	"board.bin"
 #define QCA988X_HW_2_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA9887 1.0 definitions */
 #define QCA9887_HW_1_0_VERSION		0x4100016d
 #define QCA9887_HW_1_0_CHIP_ID_REV	0
 #define QCA9887_HW_1_0_FW_DIR		ATH10K_FW_DIR "/QCA9887/hw1.0"
-#define QCA9887_HW_1_0_BOARD_DATA_FILE	"board.bin"
 #define QCA9887_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA6174 target BMI version signatures */
@@ -85,11 +83,9 @@ enum qca9377_chip_id_rev {
 };
 
 #define QCA6174_HW_2_1_FW_DIR		ATH10K_FW_DIR "/QCA6174/hw2.1"
-#define QCA6174_HW_2_1_BOARD_DATA_FILE	"board.bin"
 #define QCA6174_HW_2_1_PATCH_LOAD_ADDR	0x1234
 
 #define QCA6174_HW_3_0_FW_DIR		ATH10K_FW_DIR "/QCA6174/hw3.0"
-#define QCA6174_HW_3_0_BOARD_DATA_FILE	"board.bin"
 #define QCA6174_HW_3_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA99X0 1.0 definitions (unsupported) */
@@ -99,7 +95,6 @@ enum qca9377_chip_id_rev {
 #define QCA99X0_HW_2_0_DEV_VERSION     0x01000000
 #define QCA99X0_HW_2_0_CHIP_ID_REV     0x1
 #define QCA99X0_HW_2_0_FW_DIR          ATH10K_FW_DIR "/QCA99X0/hw2.0"
-#define QCA99X0_HW_2_0_BOARD_DATA_FILE "board.bin"
 #define QCA99X0_HW_2_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA9984 1.0 defines */
@@ -107,7 +102,6 @@ enum qca9377_chip_id_rev {
 #define QCA9984_HW_DEV_TYPE		0xa
 #define QCA9984_HW_1_0_CHIP_ID_REV	0x0
 #define QCA9984_HW_1_0_FW_DIR		ATH10K_FW_DIR "/QCA9984/hw1.0"
-#define QCA9984_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA9984_HW_1_0_EBOARD_DATA_FILE "eboard.bin"
 #define QCA9984_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
@@ -116,24 +110,20 @@ enum qca9377_chip_id_rev {
 #define QCA9888_HW_DEV_TYPE		0xc
 #define QCA9888_HW_2_0_CHIP_ID_REV	0x0
 #define QCA9888_HW_2_0_FW_DIR		ATH10K_FW_DIR "/QCA9888/hw2.0"
-#define QCA9888_HW_2_0_BOARD_DATA_FILE "board.bin"
 #define QCA9888_HW_2_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA9377 1.0 definitions */
 #define QCA9377_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA9377/hw1.0"
-#define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA9377_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA4019 1.0 definitions */
 #define QCA4019_HW_1_0_DEV_VERSION     0x01000000
 #define QCA4019_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA4019/hw1.0"
-#define QCA4019_HW_1_0_BOARD_DATA_FILE "board.bin"
 #define QCA4019_HW_1_0_PATCH_LOAD_ADDR  0x1234
 
 /* WCN3990 1.0 definitions */
 #define WCN3990_HW_1_0_DEV_VERSION	ATH10K_HW_WCN3990
 #define WCN3990_HW_1_0_FW_DIR		ATH10K_FW_DIR "/WCN3990/hw1.0"
-#define WCN3990_HW_1_0_BOARD_DATA_FILE "board.bin"
 
 #define ATH10K_FW_FILE_BASE		"firmware"
 #define ATH10K_FW_API_MAX		6
@@ -160,6 +150,7 @@ enum qca9377_chip_id_rev {
 #define ATH10K_FIRMWARE_MAGIC               "QCA-ATH10K"
 #define ATH10K_BOARD_MAGIC                  "QCA-ATH10K-BOARD"
 
+#define ATH10K_BOARD_DATA_FILE         "board.bin"
 #define ATH10K_BOARD_API2_FILE         "board-2.bin"
 
 #define REG_DUMP_COUNT_QCA988X 60
@@ -554,7 +545,6 @@ struct ath10k_hw_params {
 
 	struct ath10k_hw_params_fw {
 		const char *dir;
-		const char *board;
 		size_t board_size;
 		const char *eboard;
 		size_t ext_board_size;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 3de2de6d44bc..bc15a996f1bb 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3826,28 +3826,28 @@ MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API2_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API3_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API4_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_FW_API5_FILE);
-MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" QCA988X_HW_2_0_BOARD_DATA_FILE);
+MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_BOARD_DATA_FILE);
 MODULE_FIRMWARE(QCA988X_HW_2_0_FW_DIR "/" ATH10K_BOARD_API2_FILE);
 
 /* QCA9887 1.0 firmware files */
 MODULE_FIRMWARE(QCA9887_HW_1_0_FW_DIR "/" ATH10K_FW_API5_FILE);
-MODULE_FIRMWARE(QCA9887_HW_1_0_FW_DIR "/" QCA9887_HW_1_0_BOARD_DATA_FILE);
+MODULE_FIRMWARE(QCA9887_HW_1_0_FW_DIR "/" ATH10K_BOARD_DATA_FILE);
 MODULE_FIRMWARE(QCA9887_HW_1_0_FW_DIR "/" ATH10K_BOARD_API2_FILE);
 
 /* QCA6174 2.1 firmware files */
 MODULE_FIRMWARE(QCA6174_HW_2_1_FW_DIR "/" ATH10K_FW_API4_FILE);
 MODULE_FIRMWARE(QCA6174_HW_2_1_FW_DIR "/" ATH10K_FW_API5_FILE);
-MODULE_FIRMWARE(QCA6174_HW_2_1_FW_DIR "/" QCA6174_HW_2_1_BOARD_DATA_FILE);
+MODULE_FIRMWARE(QCA6174_HW_2_1_FW_DIR "/" ATH10K_BOARD_DATA_FILE);
 MODULE_FIRMWARE(QCA6174_HW_2_1_FW_DIR "/" ATH10K_BOARD_API2_FILE);
 
 /* QCA6174 3.1 firmware files */
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_FW_API4_FILE);
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_FW_API5_FILE);
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_FW_API6_FILE);
-MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" QCA6174_HW_3_0_BOARD_DATA_FILE);
+MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_BOARD_DATA_FILE);
 MODULE_FIRMWARE(QCA6174_HW_3_0_FW_DIR "/" ATH10K_BOARD_API2_FILE);
 
 /* QCA9377 1.0 firmware files */
 MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" ATH10K_FW_API6_FILE);
 MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" ATH10K_FW_API5_FILE);
-MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" QCA9377_HW_1_0_BOARD_DATA_FILE);
+MODULE_FIRMWARE(QCA9377_HW_1_0_FW_DIR "/" ATH10K_BOARD_DATA_FILE);

-- 
2.39.2


