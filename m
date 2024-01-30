Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C24CC46CD2
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIZlNpio2xRbKCelL+jH7Jv0TEbudBZ5ilP6roQWReA=; b=c5xl1BiYZZHq/0pr8KY353V61C
	cVZXBBy4adNNmig+MlQUtM6FwHFuaHEdvINxN2yu24ja7bxkeJlQ90tpimXvmogDSeRJCP6Y4Q5+V
	LpTT+zh262jP71apHviSG5KsUq4dgOInnu9h5datVs2+N+x6mC5JMVuvQ+eCsmR/aoHt18tRbUAU9
	5fKKSsSBnlrDLQOgptpcktebOJmL0YhyPgU3lWwR5AIRChMtN7g5UGATZ9BK0C5b7jIneW/i4+Ynb
	4QCknsje69gNYtKuIuV1DlMcDhawZ+pinEoKF9/zvIztC5gHRlSKoLhRfpvWq8509LFPvbtS/WS57
	XKGj+pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtt-0000000FSXx-3gXn;
	Tue, 30 Jan 2024 06:47:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtq-0000000FSVv-1KDU
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 06:47:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5102a877d50so3733675e87.0
        for <ath10k@lists.infradead.org>; Mon, 29 Jan 2024 22:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597230; x=1707202030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIZlNpio2xRbKCelL+jH7Jv0TEbudBZ5ilP6roQWReA=;
        b=MeuNd3v7O0AaEt3+NcUGH/dxJry7JkmlcJU9ppaMbHxIbYeMuZwA0LwECTJS1OMNue
         T3EqaejF50w6aTMEZjEOyrh8vPqGGzMsqE/UNJb7m6A4XqTKpm8zNGPDVOFBKketnaLE
         f24q6ok8gFqso8SEFHCE1UgRBW7ZGmfRleqFApI+ZfULrR0j90s1BsrhsEyixWnFG5/7
         SU2/XUS5xdnLo84bD2lzvMFYEJY8ZbLrNR5KqcR1GMveZZZdI22PBR+ZqFfrmuGlX5xI
         ErMqH8T6sSKVOWorGC2YvqxKVpv+3RPGO0dNkj/xXISPR1q1mXAGQne06RzRnnjDfCwr
         00Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597230; x=1707202030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIZlNpio2xRbKCelL+jH7Jv0TEbudBZ5ilP6roQWReA=;
        b=oO8Et7/014FKQkJVCFSTRq4FjwsytY/TPf0gKjustSsFB4kMaIrjWIBKBuUIq65b/a
         SHYwVDUPivGi2IP9CQ6tkzVgVzRUmZ6aTTu6Oj1MoCe86pcTIhv24HTi8ljkjzR1ryI+
         GAvXIMwli+ZW5pcgi3+mCExcDfLPhiTSHxs8ytx6HHSDOKNpo9tLGi2uPbPH7VrxzeB6
         wueGB2iRlKRmZkXYtPFyA+H72aTEUFw1bNsT0XPMAjXVcRjNjUuc6qr4xnfPwewOsRGD
         A6pgKxj00/uKodoQrQzeBEu1De3tjOvik86cEf8HmqfrNzfqzDZDIZkL1CBkQniX0MgE
         luyQ==
X-Gm-Message-State: AOJu0YxruZO8Y9zdvccvy0qKbrG9ZmIRpVu44Dr7rxZkbCVuxHJTW/N4
	kLKFs31g1Iw/Ybc1UEDxd+GgBhNVYyUQE5R0RgbCjJa6UkZEE0G1Jjf+Taituns=
X-Google-Smtp-Source: AGHT+IGIJ+oFaSjayPTR7DspAKUxRE/rmpexVTQ5OvG66TcD07PnSzDDWMlJxJOFbC1rISlDii7GYA==
X-Received: by 2002:a05:6512:234e:b0:511:1775:5a1b with SMTP id p14-20020a056512234e00b0051117755a1bmr1802509lfu.38.1706597229926;
        Mon, 29 Jan 2024 22:47:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d18-20020a056512369200b005101e1870aasm1367068lfs.162.2024.01.29.22.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:47:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 08:47:08 +0200
Subject: [PATCH 3/3] wifi: ath10k: drop fw.eboard file name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-board-fw-v1-3-738f7c19a8c8@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yr9q5taAxzx5jxxmv1tRyH2+HoyzMTNzkhBu27q+7l0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluJtrbsu2CTKAvl9H5XQ/cJRM6VTif6qlSydVi
 EzPhKX+Iu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbibawAKCRCLPIo+Aiko
 1dH9B/0XaL30eMhfCcqfeZI5LYlwAC+ZdjQF02vG8KUQRjqGCvf6K/1fb3mac/phOkoXYpalOT/
 4FOnBv+qHbylchHd8eBnw3S20LnMj59pxRHl7totV1aiIsepBEcLu0L85drAlNNr6bWeK8K7GQD
 R8mzON5WfYOt1SZqpcqxuzksL4TWk2Qow4r6QHvE75uLHkvlK42zmRmrIIDHKjbmadntQ+QL2dZ
 2K2vC+sOiFDjZclIpkLAxI4A0+7300tH3nuaPRtHu/O4Guj4FCvjR9TSaKkz8+oMaubr+ZBlquK
 XYrQVXhA9OkwcViNDMs4TnznjwWh3iy2OW8xrT8sQQknnBqf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_224714_400764_72258DFB 
X-CRM114-Status: GOOD (  12.82  )
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

Follow the example set up by previous commit and drop .fw.eboard
setting. Instead always use "eboard.bin" in this case. QCA9984 already
uses that file name, any (im)possible future users will just have to use
the same file name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +-------
 drivers/net/wireless/ath/ath10k/hw.h   | 3 +--
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e01a7b196b99..71ca1c1a528f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -448,7 +448,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 12064,
 		.fw = {
 			.dir = QCA9984_HW_1_0_FW_DIR,
-			.eboard = QCA9984_HW_1_0_EBOARD_DATA_FILE,
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 			.ext_board_size = QCA99X0_EXT_BOARD_DATA_SZ,
@@ -1294,13 +1293,8 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 		ar->normal_mode_fw.board_data = ar->normal_mode_fw.board->data;
 		ar->normal_mode_fw.board_len = ar->normal_mode_fw.board->size;
 	} else if (bd_ie_type == ATH10K_BD_IE_BOARD_EXT) {
-		if (!ar->hw_params.fw.eboard) {
-			ath10k_err(ar, "failed to find eboard file fw entry\n");
-			return -EINVAL;
-		}
-
 		fw = ath10k_fetch_fw_file(ar, ar->hw_params.fw.dir,
-					  ar->hw_params.fw.eboard);
+					  ATH10K_EBOARD_DATA_FILE);
 		ar->normal_mode_fw.ext_board = fw;
 		if (IS_ERR(ar->normal_mode_fw.ext_board))
 			return PTR_ERR(ar->normal_mode_fw.ext_board);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 12e8aebab1e9..48897e5eca06 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -102,7 +102,6 @@ enum qca9377_chip_id_rev {
 #define QCA9984_HW_DEV_TYPE		0xa
 #define QCA9984_HW_1_0_CHIP_ID_REV	0x0
 #define QCA9984_HW_1_0_FW_DIR		ATH10K_FW_DIR "/QCA9984/hw1.0"
-#define QCA9984_HW_1_0_EBOARD_DATA_FILE "eboard.bin"
 #define QCA9984_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA9888 2.0 defines */
@@ -152,6 +151,7 @@ enum qca9377_chip_id_rev {
 
 #define ATH10K_BOARD_DATA_FILE         "board.bin"
 #define ATH10K_BOARD_API2_FILE         "board-2.bin"
+#define ATH10K_EBOARD_DATA_FILE        "eboard.bin"
 
 #define REG_DUMP_COUNT_QCA988X 60
 
@@ -546,7 +546,6 @@ struct ath10k_hw_params {
 	struct ath10k_hw_params_fw {
 		const char *dir;
 		size_t board_size;
-		const char *eboard;
 		size_t ext_board_size;
 		size_t board_ext_size;
 	} fw;

-- 
2.39.2


