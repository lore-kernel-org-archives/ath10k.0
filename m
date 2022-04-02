Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240FAC433EF
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfNPb92LupIXLUf8CvsqjXsXPlGPguL/JFChsl1Fq/g=; b=he5pStu2aV1KwO
	zZLAIJb7bhizxL8Zf7PpQmr2eFwzeRqbIKzbdN4oviCXCwDPncIRD8mwnSisSDZMvfQ61gSp5FHr6
	Ddw5R6lUaSZDTqVutuhLIVbCkQ+NiCDQK/C0UHAybuUxjm4Y3Q5f7fizIOT/6oOnl1cUibzriZl3t
	qLtwSIcZIPMvkziv0CwpofZQk8Sjm9BKoNp75g3WxoPvqnKo1ywW/GduqQKofnNuPfaQVcVhdJJKE
	aK2l3Liyi/zHK8lb5xEawYnZvLfZjVBGoOUqFxeaOPS0IBc0a60plluKfbHiNkoqT/q1HMvhufeCK
	DYiD9ZmBvvb1ZZygHJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nafnm-009UUc-Ck; Sat, 02 Apr 2022 15:36:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nafnh-009UTP-BA
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 15:36:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id p10so9811776lfa.12
 for <ath10k@lists.infradead.org>; Sat, 02 Apr 2022 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cTmv43jH0Iq3c4QiJ+kkvctk9uHUSzlLivy0WU5Wggg=;
 b=naqi4WqqB32+j9dHXl18mUWb1WCHP9yd6IQlkvYXDQVCWAtryaj3hASMowXWD8H9di
 FhyPON5z4qF/7zoB6SQj8zEPkBDVrP2gWKFefheqP05dwZPWR8p/I+7URpOS+JmcvgYl
 kjs1X7UH9KIzLp8uRF3mKMAxUa2/sFqOujlVDkd3JzYs32wScGNXLPraE4KEALfzgzJ1
 qTU+pL4dMwOdp1dANe/k4vbVUYtP9bYPGFUFOBKGkRB1nt73asN3XDbtvJzgm1VQ8X5j
 9xwVwMurOTgrkg46WB83hcJe7uaFu0wYP2EFyddVApT85+mZAhguAHUnYwMVNT+GuiwF
 McWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cTmv43jH0Iq3c4QiJ+kkvctk9uHUSzlLivy0WU5Wggg=;
 b=L8IqxWYFLZznZ/jp56b8utPKMM/BbfS2HBaXwmKt/nw9JqiAU+H6t3NWVREGcqVjTJ
 JxXdCc7XAwzgaEulzgpF+sGbwt8M7AKSMPX1jzMtJG7Jz5m5ppn2WJmkZj9TQRY3vgKc
 tz/D9lzv8DdbAm9BZZq6D5UU6mXuUELfEhgTrDFujuYJXpwg0yJRMr7qnA4nUSx8siwY
 /bOroC8QpKNHzKOrhEgwGqDPptI0XI7WhDm7YBF06gqWgb8EU1HYtWlBeCb1DtXU9Hj8
 MxxZgUQCiqCx27+sqYmybDnE6mtjRKopqMomugvacpWfZDXzo8+x8HpoDZcJF0RwHzCI
 d0Wg==
X-Gm-Message-State: AOAM531rEb/khuzgyb6diISQQeLWADUGQSaC8TkBK+ieFuOE2kTunUJ7
 a1d8Kh6Zc/E1at9CwGPdBZGpYNXYlAo=
X-Google-Smtp-Source: ABdhPJw/N2op2Uxi/kwz4LGjYFJh3Qqomck6LBPlozNwSrrNumk2iSuJopvVid2EZYAmC8bTzD+X1w==
X-Received: by 2002:a05:6512:151f:b0:44a:2508:1d01 with SMTP id
 bq31-20020a056512151f00b0044a25081d01mr17193123lfb.675.1648913786384; 
 Sat, 02 Apr 2022 08:36:26 -0700 (PDT)
Received: from rsa-laptop.rossosh.lan ([217.25.229.52])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2e3512000000b0024b12b5044csm52884ljz.89.2022.04.02.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 08:36:26 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 2/3] ath10k: turn rawmode into frame_mode
Date: Sat,  2 Apr 2022 18:36:14 +0300
Message-Id: <20220402153615.9593-3-ryazanov.s.a@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
References: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_083629_445047_24321AB4 
X-CRM114-Status: GOOD (  11.23  )
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

Turn boolean rawmode module param into integer frame_mode param that
contains value from ath10k_hw_txrx_mode enum. As earlier the default
param value is non-RAW (native Wi-Fi) encapsulation. The param name
is selected to be consistent with the similar ath11k param.

This is a preparation step for upcoming encapsulation offloading
support.

Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 11 +++++++----
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2092bfd02cd1..b74b6f5a7178 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -33,9 +33,11 @@ EXPORT_SYMBOL(ath10k_debug_mask);
 static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
-static bool rawmode;
 static bool fw_diag_log;
 
+/* frame mode values are mapped as per enum ath10k_hw_txrx_mode */
+unsigned int ath10k_frame_mode = ATH10K_HW_TXRX_NATIVE_WIFI;
+
 unsigned long ath10k_coredump_mask = BIT(ATH10K_FW_CRASH_DUMP_REGISTERS) |
 				     BIT(ATH10K_FW_CRASH_DUMP_CE_DATA);
 
@@ -44,15 +46,16 @@ module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
 module_param_named(cryptmode, ath10k_cryptmode_param, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param(skip_otp, bool, 0644);
-module_param(rawmode, bool, 0644);
 module_param(fw_diag_log, bool, 0644);
+module_param_named(frame_mode, ath10k_frame_mode, uint, 0644);
 module_param_named(coredump_mask, ath10k_coredump_mask, ulong, 0444);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
 MODULE_PARM_DESC(cryptmode, "Crypto mode: 0-hardware, 1-software");
-MODULE_PARM_DESC(rawmode, "Use raw 802.11 frame datapath");
+MODULE_PARM_DESC(frame_mode,
+		 "Datapath frame mode (0: raw, 1: native wifi (default))");
 MODULE_PARM_DESC(coredump_mask, "Bitfield of what to include in firmware crash file");
 MODULE_PARM_DESC(fw_diag_log, "Diag based fw log debugging");
 
@@ -2588,7 +2591,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 	ar->htt.max_num_amsdu = ATH10K_HTT_MAX_NUM_AMSDU_DEFAULT;
 	ar->htt.max_num_ampdu = ATH10K_HTT_MAX_NUM_AMPDU_DEFAULT;
 
-	if (rawmode) {
+	if (ath10k_frame_mode == ATH10K_HW_TXRX_RAW) {
 		if (!test_bit(ATH10K_FW_FEATURE_RAW_MODE_SUPPORT,
 			      fw_file->fw_features)) {
 			ath10k_err(ar, "rawmode = 1 requires support from firmware");
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 9f6680b3be0a..a27d450bbeb8 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1317,6 +1317,7 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
 	return false;
 }
 
+extern unsigned int ath10k_frame_mode;
 extern unsigned long ath10k_coredump_mask;
 
 void ath10k_core_napi_sync_disable(struct ath10k *ar);
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
