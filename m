Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454CEC433EF
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 03:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMINdkqe3h/eOzZilP5Yr+K5Sq8ej+k8cKYsPbo1W4I=; b=BSkSCYnUAjDKZg
	HoD96tfKP/l0rEZH01SUVehDVhFw6qdsQm9PG8ES5Cgy71nWxL0zjUVNRmmQxi6HfxaoYuIiGt57A
	MT0ZbFT4rqCXSdelgM9m1s7wVkrc9W2kz18+GlJMmbKO+UAlzBup+CDnzFfEZdc5/WJK+81XBE7KW
	YGoGn4bzGIqKG5w87Zc0mfNQ1SUwkT9O2wSdZ9hHlMet4oJqjh2lU9/P8RKAZpWr2lxl99oMT5Nyk
	VMgIxy8cZOiBWehErIirNtJVNwkjsAbWPpJUMePoN4S4LcyQBUs4enhywWC4rc7DkWgG4sKXsSLI6
	AoM6Tgm0CejE0EtPJ7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqRMh-005lhr-QJ; Mon, 16 May 2022 03:25:47 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqRMd-005lfK-GA
 for ath10k@lists.infradead.org; Mon, 16 May 2022 03:25:44 +0000
Received: by mail-lj1-x232.google.com with SMTP id v4so16557915ljd.10
 for <ath10k@lists.infradead.org>; Sun, 15 May 2022 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iz4SrPxA+XQFoQwUknrCDAQupMGnQdDbuR8sbrlu8Sk=;
 b=E9sTIR/NkKpMWMm8b61H890gxiQAAOvHvyGGvEtwwK4OUvMrKiV/g2WahU2lqyxh6S
 DNnBycVxK9AdpySmFHaj6TVqHirdm+gIrPsIne4otZcffQkgtkYkSWvCyjGQd/Ok7zrU
 bVVjyHMHezvHduZZNMAYxQcLH9mRRFzL8QkDQQymJyaut6yP4jyfktzDqcC6+3MD5HQx
 uuI7629O8qwAYJ/hq62a1qfgw9r1lnrAwZlUfPHAcFJu4Ff1Gu3cM1GJhRu3C3cSQIgp
 bLiKfo+G1YBbxbVrmriCIQvfG5TY3hUxka1Hhv6sEp3YD6Y3MapFoOOsTWCKrRhICwmI
 L4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iz4SrPxA+XQFoQwUknrCDAQupMGnQdDbuR8sbrlu8Sk=;
 b=ad67dmHIsd3ARogHONGZdgbXr8MsOsR729bciSLJDAb7+cpuwx8W7S69nHFqMxAJtT
 /1Hlhdt9TonO3M+ZV28uniHI03u4kJSJG7IreuH1giJQ32eqnvmqay5e6C39V2EUUym4
 jtqRGB2lxbvfvPZHRnj6W4rHuZzpqnQV3jVXI+NjffdxQJ5IO0MhePM3EpoBa1wcYXOn
 z62dRvWCL8sTAwRtSczp3HM1258Rd1gCIvawtTrdqGiTS5uQfTouE11umW+2V2F6y4Ha
 RQr5FixQ/02ixQy5LhFfQTurNOlou2snGyu+xg/w5IGkPygvHLtqXjh25b1YZ6K5J25I
 dzEQ==
X-Gm-Message-State: AOAM530X9amrYpxh+pb99yejbj8lT8VNfggROZi3Up0c9eKtuQ/R44l+
 2CQItr3CL5tTyl4yMogc8io=
X-Google-Smtp-Source: ABdhPJxLBIUV2OSo4dC6VScWL0j68jvayrqqU1GRP6x8JTvhrMkt6ZtaMueRSRvOQiW16ndrqzj3FA==
X-Received: by 2002:a2e:87cb:0:b0:24f:81c:8940 with SMTP id
 v11-20020a2e87cb000000b0024f081c8940mr10389608ljj.423.1652671539752; 
 Sun, 15 May 2022 20:25:39 -0700 (PDT)
Received: from rsa-laptop.internal.lan ([217.25.229.52])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a2e9152000000b0024f3d1daee5sm1337251ljg.109.2022.05.15.20.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 20:25:39 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Edward Matijevic <motolav@gmail.com>, John Crispin <john@phrozen.org>,
 =?UTF-8?q?Old=C5=99ich=20Jedli=C4=8Dka?= <oldium.pro@gmail.com>,
 Tom Psyborg <pozega.tomislav@gmail.com>,
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 Zhijun You <hujy652@gmail.com>
Subject: [PATCH 3/4] ath10k: turn rawmode into frame_mode
Date: Mon, 16 May 2022 06:25:18 +0300
Message-Id: <20220516032519.29831-4-ryazanov.s.a@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_202543_584291_261C0348 
X-CRM114-Status: GOOD (  11.10  )
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

Changes since RFC:
 * changed position in series: #2 -> #3
 * rebased on top of latest ath-next

 drivers/net/wireless/ath/ath10k/core.c | 11 +++++++----
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 688177453b07..5654387acb4b 100644
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
 
@@ -2599,7 +2602,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
 	ar->htt.max_num_amsdu = ATH10K_HTT_MAX_NUM_AMSDU_DEFAULT;
 	ar->htt.max_num_ampdu = ATH10K_HTT_MAX_NUM_AMPDU_DEFAULT;
 
-	if (rawmode) {
+	if (ath10k_frame_mode == ATH10K_HW_TXRX_RAW) {
 		if (!test_bit(ATH10K_FW_FEATURE_RAW_MODE_SUPPORT,
 			      fw_file->fw_features)) {
 			ath10k_err(ar, "rawmode = 1 requires support from firmware");
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 8bfabbcfdb14..d70d7d088a2b 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1314,6 +1314,7 @@ static inline bool ath10k_peer_stats_enabled(struct ath10k *ar)
 	return false;
 }
 
+extern unsigned int ath10k_frame_mode;
 extern unsigned long ath10k_coredump_mask;
 
 void ath10k_core_napi_sync_disable(struct ath10k *ar);
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
