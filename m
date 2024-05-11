Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E170C25B5F
	for <ath10k@archiver.kernel.org>; Sat, 11 May 2024 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9tzUVfN0KhpYmc4a0OVLANN4g1WHLu0Epz797hO85s=; b=DixDVHUt557tPRtMVtfjH9U1fR
	uFC9uYn4qxKchiyB4ah0VXX+UNs660SvA5IVv3Kw9+eu9hs6OQOxHa7fJOkxS8aWMuSeMaEwFrk6G
	8mcpdcXJEXr/xM9nPZfVe3Y+LzJOraY+3EB6zZTPWoRMlT2Kir2oZMb3lC8S34BxF/ZTg3oXOnX05
	p4M8dt6eIEKj9lunCfN8NJFBb4/bSNEF01wFaGyA4tT3pA6fXHDktAUVO1Gp5HWUoz64Y31yE7Jhq
	XRH4MhIpgI4h5wqoDrdHrEMN/NA6brAkp54rMbzzI+3jaHPp07S+lnoaKB4JpzinEJv6xneCFKHYb
	aww+OIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5kIs-00000007kHG-1S3H;
	Sat, 11 May 2024 10:50:10 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5kIo-00000007kGK-1jIl
	for ath10k@lists.infradead.org;
	Sat, 11 May 2024 10:50:08 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5206a5854adso3079732e87.0
        for <ath10k@lists.infradead.org>; Sat, 11 May 2024 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715424600; x=1716029400; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9tzUVfN0KhpYmc4a0OVLANN4g1WHLu0Epz797hO85s=;
        b=YE+DwDL93OvkiSmZs2RbA6JoaX7n0dBTgnbSy2J7eXJVgr3m5a7fbpXkgxmiD1LIb1
         h+/CazumUG8RvE+zVEapAayhpo5PGd31iwVIrs00A2KfT5pEoDACMZ1g+dmh/ra5cDFb
         TWTYeQYdZ1hs68WR5ycAKRH6VK8qcU+xVTcXUKiFz/WBBHG1xr4E6dsjMiR3BBlzNp/2
         +krSrnli+wXaTCyHd5Dy3ljDBnyj/f3rpzntoLkxkFWahtt2bCRnPsBwUmcjoS11wRC9
         9XhRE2WOC0YbDLhhKi/kBx0DOIKVNLxkkQQZ4k1iR9My+yf1SKrzI/7VZ4JtMlQff6SY
         q9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715424600; x=1716029400;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9tzUVfN0KhpYmc4a0OVLANN4g1WHLu0Epz797hO85s=;
        b=aow4yTmhCzpPh8JODriPGqXwKwZ0L2/1y6Xx+LfL3eR2i5FSa7Kope10fEebAmFBDD
         Fe0GT6JmRKKrEnZwpYcBYg+p5URCMYAF5rusZubEH9WX4yY+fGRwh/nR+ce+x+LmJd/1
         dXZ9Dg2g+YHMM4RvRqM8zumBjdPV9Kvc7XwqrvAE7UVrIuGjUaDZN/xzFbh/TMFwlEJ5
         ArjIdRpRNkdI/lh31lN6TFX5EqB8y3q5g7dPyq52jaOcOfQQh04dPLtjnVdkZwaB/otM
         dWho49WSFCsELXflVWX1yq21U8aXCHLPozMZoITAB5E0pbXpzTM2+0hwb2VpQXouQJZB
         W2xg==
X-Forwarded-Encrypted: i=1; AJvYcCXxPMbS4ujaK8sw1HZ6E1UgqG/f/0q/P3h4givmcagKcsuNN3XoUjHMXBSAJq5hayFV4HUMBb6Op4oFWb+AxkkDM/CquuFIL89LfA==
X-Gm-Message-State: AOJu0Yxb6RMkDIoOw4ofXWPz2EbhGvpsNhGGR7TaFP3hGMwleJvfSxj+
	SwOzFw5/mcPMDVBLfIIJps8BhJe9dLe/n5sHxo1DInyMm1/zCNn+LeJIH0pajTo=
X-Google-Smtp-Source: AGHT+IGg+LWGczogLtLGUqJNhxQs6r274MI2gwKo2vyNt3nMaj1fq1HgKXfUA3uoPSWXwMPjRHzuzQ==
X-Received: by 2002:ac2:4d84:0:b0:517:87ba:aff3 with SMTP id 2adb3069b0e04-5221016e7f3mr3060938e87.43.1715424600467;
        Sat, 11 May 2024 03:50:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad59asm996021e87.45.2024.05.11.03.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 03:49:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 May 2024 13:49:59 +0300
Subject: [PATCH] wifi: ath10k: fix QCOM_RPROC_COMMON dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-ath10k-snoc-dep-v1-1-9666e3af5c27@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFZNP2YC/x3MTQqAIBBA4avErBtQqaiuEi38mXIINDQiCO+et
 PwW772QKTFlmJsXEt2cOYYK2TZgvQ47IbtqUEJ1opcS9eWlODCHaNHRieOg9OS0osEYqNWZaOP
 nPy5rKR8f52+UYQAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Stephen Boyd <swboyd@chromium.org>, 
 Rakesh Pillai <quic_pillair@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4y7Qf+jN6LlUE0OdF/F/rEDDNHszeU8elr9PJ2tH+iE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP01XglM6PDpJ5FKRfpGy+Q6xENazUhdYgRoDQ
 //KWcLhheaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj9NVwAKCRCLPIo+Aiko
 1UIQB/49CRde93czh84lwUe7x1+pSFX90yrLwvtSOJXkI28HtFMfoiuu1exAppUo1eypZPewm0V
 MbiceretlnNrsNuh2ac19xj2SWWJjhxLwGVsUzP7BPuqk+u1o5Dg9nTGIBD9gMqt8VrYJodpFBf
 3TjBdR/HjcZRPAXteOsDXzLNU3DWZC3w3blS3jlXOIJ9tihUQq29OHqIDlrTYhkx6DE04Jaavm2
 bOLwrClPDvn3VTK/Yh7DZnQBFRtnNQQ8F/czV+oTxF8EO03m1/QgJSOjRTBP8XJtNmSurL4SlcF
 LHCnykEkypVGalLOetMDKiKiQNom/6J2fWakD55YJc86mMAO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_035006_587206_6ED344C2 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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

If ath10k_snoc is built-in, while Qualcomm remoteprocs are built as
modules, compilation fails with:

/usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: in function `ath10k_modem_init':
drivers/net/wireless/ath/ath10k/snoc.c:1534: undefined reference to `qcom_register_ssr_notifier'
/usr/bin/aarch64-linux-gnu-ld: drivers/net/wireless/ath/ath10k/snoc.o: in function `ath10k_modem_deinit':
drivers/net/wireless/ath/ath10k/snoc.c:1551: undefined reference to `qcom_unregister_ssr_notifier'

Add corresponding dependency to ATH10K_SNOC Kconfig entry so that it's
built as module if QCOM_RPROC_COMMON is built as module too.

Fixes: 747ff7d3d742 ("ath10k: Don't always treat modem stop events as crashes")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index e6ea884cafc1..4f385f4a8cef 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -45,6 +45,7 @@ config ATH10K_SNOC
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_SMEM
+	depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=n
 	select QCOM_SCM
 	select QCOM_QMI_HELPERS
 	help

---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240511-ath10k-snoc-dep-862a9da2e6bb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


