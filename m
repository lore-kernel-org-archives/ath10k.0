Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E094C46CD2
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqLDmmgNVt25kz9DvyJPnFFAmvKedGK3XgbaetyElYk=; b=3j6Pzrr0xKP4YYNQNcr2g7dNnK
	EABXznyoRE3WlR64HesUElWkrvVDC0JS/3N7F+Ef6yGikj6VQAXaATtavJbsGcobohe+KmlOgCfgW
	wz07yLcW3sSOIzVtfTCUTcC+am4HzoeNhvu0stX6QYh36Go3uEtX6QbZ1dhlXBiaF5azEtO1IJx09
	1tpntZUFxp2kUDtExxC/ML3zHRbtymALneweRxMQLKWSde5HODJLrkFfb7jX7B3lFcnlzv9VYIBKv
	jywC/ivM7wdaZUQDQWKD234+f2jpY4j93AeibzYMhY5HhXlVF5K8QxCRmcRPWZpRUCP3i6VSKvz2s
	wjPwx22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtq-0000000FSXJ-29tH;
	Tue, 30 Jan 2024 06:47:14 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhtn-0000000FSVD-19ap
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 06:47:12 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2cf3a0b2355so43039741fa.0
        for <ath10k@lists.infradead.org>; Mon, 29 Jan 2024 22:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597228; x=1707202028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqLDmmgNVt25kz9DvyJPnFFAmvKedGK3XgbaetyElYk=;
        b=PrrcyquZs3cg53ZDRV50V9QrwGL5mvxtGbZOhIgFru6yBJuaI2NU1ovNHoN5vq0r+e
         4KFtA1Hk73UkJtugtIum7JHWFyLrDsofCwhtASezyGNXH9yilc8+5OF80SMYD+I16XyY
         H7WJPURTvUmXEPveiVI8ochU9luOp+FLq0Nv5XNPx2qOQ2OG1uXQzXrGP+I4dQJOlmtd
         DZIpbUDw9zzwWxpmJ1PkXhmLZle7O28PHXAtKZa9GPMjydN+SF1PQZo/2B6EVxKjSmg3
         Udk5ybvW0VYpzkLlK4K13k7ws0PoP2ZDNKl+oJ3Wcthl+SxuJC4cjg3LXPWTi7zFWkWB
         xHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597228; x=1707202028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqLDmmgNVt25kz9DvyJPnFFAmvKedGK3XgbaetyElYk=;
        b=bLoPMnPYsdjidTq1dYlze6qcuLnpqfck2zZnP0cNGAoje7lcFdMKVtBU4pdiwYOOt4
         b5lrc8K+Rpv30bhTLPhaYmOPhxfHvsE6nB/RuSakeU8XoUqy6ZH2eLfQVjd2KyNKHXFs
         dNQ4/KHPfDMcYECkmTd47rQ6YfFVN4fR3CjCDA1JHcvkvUR50+LmgcKEkIw0ExnZJEB4
         aaf9pgC/vjSczBuXfpdtLcY0JIJGk4ydHV56Dx0eVilIIo+/kw7nfxqYrMrcoKY6M8I+
         AiGdQzBNhoVJ8lW613QHxlth2YGzBzghXytDuSYl5yFPL0pgtx3P79N5W9IbCYOBApc4
         5UCQ==
X-Gm-Message-State: AOJu0Yxl8xgOLfARdve+hwL1ne8tAN4RfX1EhIjKcbZKHJvyNzqaD2uS
	lRshLe5ejfSKrdk6DG+JDzaobL8IjpBaXHYrziTLh0KWynX4AckEmq8My4l1BT/hTQNjjHCaKmF
	d
X-Google-Smtp-Source: AGHT+IFsP81hA9bair2VUa2XT1uNWy0tiHBHvQkTXa0XnR6j+jkWbfPDs75In/v+SdeLMLGSVR+YCA==
X-Received: by 2002:ac2:58d0:0:b0:50e:e557:f1c4 with SMTP id u16-20020ac258d0000000b0050ee557f1c4mr4305021lfo.0.1706597228312;
        Mon, 29 Jan 2024 22:47:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d18-20020a056512369200b005101e1870aasm1367068lfs.162.2024.01.29.22.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:47:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 08:47:06 +0200
Subject: [PATCH 1/3] wifi: ath10k: populate board data for WCN3990
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-board-fw-v1-1-738f7c19a8c8@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4sXJMfjR+PTrADSaa6VnyMvVcG0wetxthgIIrXFaUnw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluJtqvjuD743H/VMeFlPphDaQqqClmuEC0fOYj
 d6+r7C1DxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbibagAKCRCLPIo+Aiko
 1f6nB/997EijkV3o+y7zhXxJBfDxsPhIOCLhx9ejOnp15LAm8Jy8EEjrZFbUto8oGgozTZuQ7f8
 3f86N2joD6TAxgcLWn5jVzanBUJRuGNlh1B/TalPP9Fx5sSlV4ijcuRUwvT+hbSBs86t5RsZ/iW
 fsg/MVdzu0arN6LwZIQhez4IZ5kx4BHQWIGo9Clyi+qV9JHpdHovIpoBOVcY52r4sOHullMfFsK
 BZzrdLU9uJoMPb7/UTNmncpkS9d7inihWFzBdKM3MANUsdJLPl6GvIRMU4YAgOeARicHEh1XfkL
 BbX2e2VLiLuXQOdvqldVyhreiYYUBEfsh+ndOY9/neFhbtvF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_224711_354935_A4957518 
X-CRM114-Status: GOOD (  10.98  )
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

Specify board data size (and board.bin filename) for the WCN3990
platform.

Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Fixes: 03a72288c546 ("ath10k: wmi: add hw params entry for wcn3990")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c      | 3 +++
 drivers/net/wireless/ath/ath10k/hw.h        | 1 +
 drivers/net/wireless/ath/ath10k/targaddrs.h | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0032f8aa892f..4e3736d7aff7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -720,6 +720,9 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.max_spatial_stream = 4,
 		.fw = {
 			.dir = WCN3990_HW_1_0_FW_DIR,
+			.board = WCN3990_HW_1_0_BOARD_DATA_FILE,
+			.board_size = WCN3990_BOARD_DATA_SZ,
+			.board_ext_size = WCN3990_BOARD_EXT_DATA_SZ,
 		},
 		.sw_decrypt_mcast_mgmt = true,
 		.rx_desc_ops = &wcn3990_rx_desc_ops,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 93c073091996..9aa2d821b507 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -133,6 +133,7 @@ enum qca9377_chip_id_rev {
 /* WCN3990 1.0 definitions */
 #define WCN3990_HW_1_0_DEV_VERSION	ATH10K_HW_WCN3990
 #define WCN3990_HW_1_0_FW_DIR		ATH10K_FW_DIR "/WCN3990/hw1.0"
+#define WCN3990_HW_1_0_BOARD_DATA_FILE "board.bin"
 
 #define ATH10K_FW_FILE_BASE		"firmware"
 #define ATH10K_FW_API_MAX		6
diff --git a/drivers/net/wireless/ath/ath10k/targaddrs.h b/drivers/net/wireless/ath/ath10k/targaddrs.h
index ec556bb88d65..ba37e6c7ced0 100644
--- a/drivers/net/wireless/ath/ath10k/targaddrs.h
+++ b/drivers/net/wireless/ath/ath10k/targaddrs.h
@@ -491,4 +491,7 @@ struct host_interest {
 #define QCA4019_BOARD_DATA_SZ	  12064
 #define QCA4019_BOARD_EXT_DATA_SZ 0
 
+#define WCN3990_BOARD_DATA_SZ	  26328
+#define WCN3990_BOARD_EXT_DATA_SZ 0
+
 #endif /* __TARGADDRS_H__ */

-- 
2.39.2


