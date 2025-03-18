Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11468C282EC
	for <ath10k@archiver.kernel.org>; Tue, 18 Mar 2025 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3UohDItqJbHSrPJP72i3dlPHwcSi2GhbxMj73jX1M+o=; b=jTMBlgs5oqQOZtVYfllg2KKRF7
	VTsWf48httuiQPPdGlsNYWvhiTT10kZy4gYMiC/n059o3PJUzxH/2iETJ9wZ7x7sGIOAr59fZlDpk
	I9Sd+GalocPsyEt0ClJ11w3NGFEIQRR2G4z3h1OAzbAnLydVm9cDdxrsNj/w6DDiYvLGsQKpYiNyY
	myaD/fNRa5DFmjBKM2KBO11uiEscQfRcHUjBHmI2um3a3F7hCQ9Zcg+Meu1uRlGnjlYDepLhqple7
	1KVjHca6Y2eR5PjcLoGnS1TUGYMBL0GocvVMHc6eml4qeDtN5Jj0JGNhjFt1xKnZsHdp6wOq8UYEK
	sLtZQirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tue6A-000000075FI-1gBU;
	Tue, 18 Mar 2025 21:03:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tudtp-000000073Zb-3Ime
	for ath10k@lists.infradead.org;
	Tue, 18 Mar 2025 20:50:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfe574976so24557545e9.1
        for <ath10k@lists.infradead.org>; Tue, 18 Mar 2025 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742331056; x=1742935856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3UohDItqJbHSrPJP72i3dlPHwcSi2GhbxMj73jX1M+o=;
        b=h8gZlDr4/q1wX9IGrb0yftJ1KZK3ZHDOWJvGXX+HmvigTBpuCIeCrQwhYPQmSyWZ41
         cZZs49r0uV8KyPGVKXUN7bv8Kag3kqJaTRSFcM+JqIbWqX3NT/o8GYpA1CecKq+Vu0QL
         n6NtcIF6VJilexD7Mjr+96ivg+RK5BDsVDkm5aJYj87x8lR1HcNo5JMLg+h6PcN0AaBg
         ahBk/099gHJBEi3IGuQ4Kh+AFnthJOiABzCYJNwhgVdOzT4J1XqWxGLhSTdEvffRgyFf
         6off1anpGOskq1rxZyToVT2OBVFtwMQIi5gkSQ97csixW09i1uXcrGQgJ8FgXCfEHZPU
         Zt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742331056; x=1742935856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UohDItqJbHSrPJP72i3dlPHwcSi2GhbxMj73jX1M+o=;
        b=Tfc2jo9SJkmgHfbqbW4COmHbI9xHViZGJGCeviBfthdHjOCKxhqdyP101j0paZUkJ2
         2evUyfNjCMRrJXS4SgrBjMVH3lbbD+ULG6NvGXrUo+8LHYozaZcgvZLfYMdhtyilN+I/
         Q89HeIRgJWX9aAzlsr3nTg183cN06K0yqRK10kbUPrVFXgzVfmkjPQfwDxLJ2c2dObwH
         6gZYD3wnxNP6We4RSCXHRnPKEnMua87ptOcGrOISwk05XXnuZXBCIRgPBqMx3YWAVMTn
         UkP5XPng8dS2Ec2zITm8lEcQTxTYERDtiyIYLkd/ax+dumc80Tfd6PdeCgSDjs4x3e2e
         /5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu9VCTrA1pZHGZxL31wvd4UnPJjcPxdfqJlbHy9BUK7r4FmABtRq9g5gOhYJ0wKKOpj4qT6IY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxY6nYtHHpqIpjI5hbXk2yUyLYZKmJPsSZrSzigi+dfNgs7M+xh
	o9oOMcWdO419Ej/3qrDZtS8pS0JUTkJI76JVoqnYG9rXzd8u2QYdAuje0ugLZeI=
X-Gm-Gg: ASbGnctV+IrxmvijB5plwLwoUZXEvEphyfPjmcDEdg0m5eBWKD/DelLcGEwdn8reAyb
	qTFav/g8XrQzmOJQBOpWQt6rF7jftetLri9Du2r+ZNKp6iG2DgLE6E0eCLmC+rSfNhHLzLThCiC
	8mJvPkSwVYI4LZAR+pt2T3yjrHei5fsPuYv3bW6RqEwuG4eZUY8BpscegQRcwp48MRL8amVLz7N
	2QPHtw/xfUnBzbyPzWRvsgzmU8LHxTp5mtbu4ndi2T7W1cwaq0XlBUcFVOmnGxm+9SSucfjKfNN
	EuAeQrbxk6kyDMUSnMEeFbq8Hikm2+PmG4jCAc5gZlJw0jYJCk8DnTi89uI=
X-Google-Smtp-Source: AGHT+IEMGi6XLwyG661+0/YviXfVdYcrgXqlOdZMjARlupJXDIehoNdeJwTWQOa9f4YxNoViNwD+pQ==
X-Received: by 2002:a05:6000:1785:b0:391:c78:8895 with SMTP id ffacd0b85a97d-39973b32028mr143871f8f.50.1742331055842;
        Tue, 18 Mar 2025 13:50:55 -0700 (PDT)
Received: from toyger.powerhub ([2a0a:ef40:1d11:ab01:97b:e453:3907:27d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm143198645e9.9.2025.03.18.13.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:50:55 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kalle Valo <kvalo@kernel.org>,
	Rakesh Pillai <quic_pillair@quicinc.com>,
	Surabhi Vishnoi <quic_svishnoi@quicinc.com>
Cc: phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
Date: Tue, 18 Mar 2025 20:50:27 +0000
Message-ID: <20250318205043.1043148-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_135057_822173_B4D0FBF2 
X-CRM114-Status: GOOD (  10.73  )
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

In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
recovery flow, but we still unconditionally call enable again in
ath10k_snoc_hif_start().

We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
before hif_start() is called, so instead check the
ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
recovery.

This fixes unbalanced IRQ enable splats that happen after recovering from
a crash.

Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash recovery")
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index de96c3939ea6..01e26f259fdf 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -936,9 +936,11 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
 
 	dev_set_threaded(ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
-	ath10k_snoc_irq_enable(ar);
+	/* IRQs are left enabled when we restart due to a firmware crash */
+	if (!test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
+		ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
 
 	clear_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);
 
-- 
2.48.1


