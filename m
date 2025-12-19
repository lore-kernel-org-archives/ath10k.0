Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC4FD7879F
	for <ath10k@archiver.kernel.org>; Fri, 19 Dec 2025 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UwHoRYN0ckLey3iJ1nZsSnX6RQ3ya+uPXkQh6TLApt0=; b=p23rAQYkUbeescTJwBJDTaFVcR
	USDInyy1IOTf2x7KueKJwzCFcNmYZfPEDpymiheDvZX4arwgw1z6ekgH1Jg8dZ5328StDS4tH2lbh
	NP5zRY+EB2xA3OPfPp/8kWBjBcSYHmzqYNOXbyL95sXSW4Z/delvERDTg2dDsun3S//U2tZm0zjRk
	JGpVkWP7wI+J9MbH3DeSI9SDKWY2icZzky3O+rWJITGI/PLbLIHsxj5uWASsv6uC6XqAgKhFAqcYP
	ft/dBdKpNi3bIF8xivBY9ZJXfEFLSB7UpscQZhP1zRKs2Zf6zPsiYB46ZvdrOn9gxpusVO6vAmCDu
	mJ6ueFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeL7-0000000AiWL-2TL0;
	Fri, 19 Dec 2025 17:32:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeL4-0000000AiVz-3TCe
	for ath10k@lists.infradead.org;
	Fri, 19 Dec 2025 17:32:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1483535f8f.3
        for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766165545; x=1766770345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwHoRYN0ckLey3iJ1nZsSnX6RQ3ya+uPXkQh6TLApt0=;
        b=ePIOzbLwueyt0nVqyEdXUYnBOiTWmb3G+0byWsLwuxWE519T8yLc0ixB2uQzlgbxjU
         rAqeTmGJeUtteSx/L+PsqhjQyGUmPB8snPsauiVl9El2YD9ZvgTDBmZh1zleVa3eH9eL
         mCQUf2f9ZEEm451bcV2Bx7qhBGytV9xQlenCv9VeLTYvk0///jxaPtt4W3dWUS4NAarU
         kDm/KxAcGz3QPoZlyVcSSYrsgeTl3605BB1e2wCqgJcFwshVOt9SNgcnEKg0mEJ5jLYn
         qyxe8pc7mgInFg8z3vZwTCnnRkwAsmObYE6A1mi2UcgnOTDaex/zyrIeE6r+d89XHw4z
         RYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165545; x=1766770345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwHoRYN0ckLey3iJ1nZsSnX6RQ3ya+uPXkQh6TLApt0=;
        b=sYpqhff1KQHFv9YM6BrI0/WC8WT8uxQeGLu9RtGf65rU2Vf0npz8RG/82b5D0Y2Wtu
         TI5RbV9/QVsM1UL48IlF294nYisgyFLtZKjvp7GTBrzhS518lygZQpH8P7T3XmPUqFcW
         o9AHQD0cTMilhf0wxJxiVFSnbtRfGQ1iVU/TgWuybj1Pl7cUQSOB0NH2HlcCTcYX6OF4
         WbjrPsykob3olPH8i3UMdHJNtukUfSIqzdpd4rwlNlKNxqFO8pF6kVBt2aZ5js14XsmF
         SSPVSwzs5UP26RI7BcbhWwEa2wymLSITu/TBX84owoqP6hhKUQMPdy6JvHIKrJ2vfJeP
         mZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWVWzcGIyzqwSQkw1jNLZKsP+AYfxJ5OAdZDfGHeBa0CqlxoWJIQP8FJJqzqOkJndXa7ZCuoJ0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7bzCzqYszZqv3yurs122G3znJS+7bsnsjIgXXfjUN8gYR1Tjj
	M8CuG0FjrUiEcF4JXL4wvD2BIUtaRwySSDZoY2FfhoGxXWe89QKChc3/Aq2uz+fxY38=
X-Gm-Gg: AY/fxX6M2NwJJ9oepRB7ytG8jY0q9DYBAsovZX1ON4xy5f0fTeXOTDQoIgQRd2bHdo0
	LtzqAdw9jvlZU1Wk057v+z43aKi9SbQzDDxvZN27lCjJWqObHUf1UgAufJdM1EN+JJVEPWIP06o
	Z4QYviZimtHufevpSQ1c51IiA9zMWp6yxR8THS99vRZRkbgGjulDAXcEQ6OUuVk4UjyjaVk4xfX
	rBcsHV1dXEKu8AcEhAnNTRpV9apxDTKpMczvDJmvMueWVPJsYbzwoCY/FSVJB74d2QsmEOaUnds
	aSgEtDbg3raKj66HrkvZ2Gz8Nv7uajGyLjnMYvN9RcxF1GH6zwSNxjC3VMRbi4JZssa/xgWGoR+
	S7J833DnVLFCrYdkqnCeBMLZ7dClhY5+ZoVDDyWkC/qWMmblLYBJxKsXlUCvFb1vE8r5BU3P8lD
	xYXu2mEWKUYrOiR0WhHJ6StiF8ZA82R3J5xbDg4TPcmYOVFEVnUvVSIB0nlUT5EpGpBKPScK3sV
	RM=
X-Google-Smtp-Source: AGHT+IEg4pPUc8/Q170AaZf7FYqcz8uROUOSAycDgkICbrJRTuPymfOwn98l5/ziSfJUCccINtj5Xg==
X-Received: by 2002:a5d:5f96:0:b0:430:f1e8:ed98 with SMTP id ffacd0b85a97d-4324e4cb8efmr4074083f8f.17.1766165544689;
        Fri, 19 Dec 2025 09:32:24 -0800 (PST)
Received: from localhost (p200300f65f006608b2d9668c60491dc9.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b2d9:668c:6049:1dc9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4324ea227casm6129410f8f.15.2025.12.19.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:32:24 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH v2] wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef CONFIG_PM_SLEEP
Date: Fri, 19 Dec 2025 18:32:18 +0100
Message-ID: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=rt0lFEmXebBaMS9sI6UDyRbyWki904m2XSOx26JxHEI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRYwhcJLnvpIJtU0AMygZlE7lT2uiPwCN+n6tn MRr/ee4e4qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUWMIQAKCRCPgPtYfRL+ TnIlCACDhfva2bnNvWGJqTs+RYgiGpn0toEFs+gQ1UlKiMDN8PStPMVR3+5oS77nVCBWSItIeQ6 iS0B9Z209X6nlZaX+ZRJ65cJuNPQzvwuogR0gjtTGlx2EkQ4Nz3RdDxWgl4MbpKk2pIoCjHGvYQ Ol8tPBOnUIgV1Y9prpQnrvkzvo6E2gugxsd1Fl5wsNKHg4H89TvQbS4vIaBJ+pK3dbuwrBq+bXt Sy61GVjTAzn0TKtypqyJhcU8uLrYofEIeuB/X2d15SHsG+pEiRGBaMLTHdUa0dpsg9AmMlzimOp tcdaC2oVfT3DxFQoE4KeUPgmdKhcOHApbytw3myjOXtWQPXJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_093226_878520_8DBA39D2 
X-CRM114-Status: GOOD (  10.62  )
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

This increases build coverage and removes an ugly #ifdef block.

To prevent "defined but not used" warnings use
DEFINE_SIMPLE_DEV_PM_OPS() instead of the deprecated
SIMPLE_DEV_PM_OPS().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Changes since (implicit) v1: Switch to DEFINE_SIMPLE_DEV_PM_OPS() to
prevent warnings. Thanks to Baochen Qiang for the hint.

 drivers/net/wireless/ath/ath10k/sdio.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index c06d50db40b8..2e58fb1d2ca3 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
 #endif
 };
 
-#ifdef CONFIG_PM_SLEEP
-
 /* Empty handlers so that mmc subsystem doesn't remove us entirely during
  * suspend. We instead follow cfg80211 suspend/resume handlers.
  */
@@ -2172,16 +2170,8 @@ static int ath10k_sdio_pm_resume(struct device *device)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
-			 ath10k_sdio_pm_resume);
-
-#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
-
-#else
-
-#define ATH10K_SDIO_PM_OPS NULL
-
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
+				ath10k_sdio_pm_resume);
 
 static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
 {
@@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
 	.probe = ath10k_sdio_probe,
 	.remove = ath10k_sdio_remove,
 	.drv = {
-		.pm = ATH10K_SDIO_PM_OPS,
+		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
 	},
 };
 module_sdio_driver(ath10k_sdio_driver);

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


