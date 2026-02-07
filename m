Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CEEE6B7C
	for <ath10k@archiver.kernel.org>; Sat,  7 Feb 2026 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6r1Tf3h0z0iSBNclliMh/VjEPgxlX2G5be+P4mBu2BQ=; b=isc3FNKOSXCXrYgw7eDJC+Lab4
	KtyvTuN7Y1TUGgY9sjd3yqHM/8e8/yUGIgDBHzt/fTZ9+/Pk3yS8wDMBhS4QRl2n2EjYMEK+0VDiY
	ysRNjYFFGdJJUwwXQLQwczBdYQLkxOUf3nTzx9CNAcC1/c/yEHuJBRrKsBDwM9z02y60EGC59RIRq
	+SI947ilng2fVWhho3qyHMyFIs823wh3vNpq4DjsEzTh/AQrYlttSFfnGfx7W30zDyVpmHGaX4AH2
	YqTe1aOsi15n8HX8bggPQ5SYRiH6E3GQiT+Km54boChc6xXqd7Bkfd/RRxNAW4hpvz03iUebK2vnu
	qRyLdsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodct-0000000CF1u-2E8u;
	Sat, 07 Feb 2026 08:25:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodcq-0000000CF1Q-2eSG
	for ath10k@lists.infradead.org;
	Sat, 07 Feb 2026 08:25:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso3438267e87.0
        for <ath10k@lists.infradead.org>; Sat, 07 Feb 2026 00:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770452706; x=1771057506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6r1Tf3h0z0iSBNclliMh/VjEPgxlX2G5be+P4mBu2BQ=;
        b=FbiK0W4lHNPgrhBukuyuRd9f9sVTt5Xm8twywJFRkbPzU7Yu5pgmx5r+p+GqaHePMl
         XoRYSlk+hOaVS79HmZZTGZS1jv3h0mxkdlY9Rb1gm8JRQ5cNMq7PAYYlX1ijy6AcdKzI
         eFs2rv2+x/qBxvhGngEWoOC9e1RK4mfj7R4ysK44nF/k6QP4jcOfuz4UbU7hTTGhs8BP
         k8HYfqHv5+lRuDadzZZdwF6iZjTihFkBDlcUEXsW6HNFZUoOMWXGmfGZh8hQYVD2HjHK
         JR8Tk2lxKYNOW2kdBuXd+YWSIKzan606gaqcHOxOAAvlKdnX6dM19nJSRzJFTn3RgA+y
         wihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770452706; x=1771057506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r1Tf3h0z0iSBNclliMh/VjEPgxlX2G5be+P4mBu2BQ=;
        b=xAkq4gCftgvflDaxQsEYmmJCLYciMFyTD1aTfwcsQtg8BMJwdOn2sXuqtKgTyTqCdF
         zErcCtXEnmpn6awgoy9XLx08/2Uq1EoY3PR9gfMzwrWeAWkkRBBx1o2zzHsXBB3Zw8TL
         zd+9BaEs++/80a2QZkKnIeK3oT8PtRNnzm3r1w9grb2g++/zAHpZcBZctYxUi+JE8emt
         9/CAoFX6AgslzGoMNangn/zkUh3N7zNTg1kffRcT73IcJ8TgBnDzSL3l5uX2T15qPpvW
         pYrr1z9XNc8j+bfKuDn+a0JZnA8g2cWJRwDf16sgCu9iXrTWFclREeiuEhtI06USUJrR
         AAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCzkSw5tUXUnJ8fv6ERlxeZdl8KnHuVWL69gOcbwCB1bTUSzhtB5aRLSiXyhSbHuR4vcgpq5g=@lists.infradead.org
X-Gm-Message-State: AOJu0YznfBvz8OBnKL/LlzUDH2zGur/P0QIKNwYfK/JwSge3J8/22iSK
	nOoHnb0DbW8JqJTDv/THW8K47L6/4riHsGE/bDIKRguI/P/nrT0c1KPW
X-Gm-Gg: AZuq6aJW8EOu8h/o4cpv1zlJUL0aADD7DUu+JD6vYvnyx1rhPyjlimVrrskrB0gb0eS
	27R08KiNwydW1aQWJjumUBoq6Ygw3Ceh1YTflcC37mScBgOUa/Zxkdjevz2LiOSlPlmLdEeoiuz
	OaQaNQHR+liMky7v8ylEP7JCxSkDe336KF7ZxALhLP9PhvyJqyg2gjDySeIDmG3uMbS2/5v2Cb1
	DiCt3to/26XoGFg1uO+rxTcPbrDMA3cuiO3K1HULtjZM4Lj4U6uf2p/aqHi0kYyIrCbPbDGx8iG
	vQmsu0i0D8FZqqLIawqTX3ghxWwwNI/6kiMiM8yaEC0NGYaLMMc5S6rY9gEe0LNrSdC/oktUQcN
	Ec0lnxfl5pZUToNzLS6P/IspN/uNwPBoCze9Dgpe6cJjFoYQqa1j+0piosqv0d86B6cSrhVvVqY
	XjbnjJqQw3Fojr47tP8D6lSloH3S64AuupAq+gCzzk+YCtH6JldlT4uAYddjTzNGpH/FCexHKcd
	Sfxm0iY3074DjA=
X-Received: by 2002:a05:6512:1593:b0:598:faf6:1009 with SMTP id 2adb3069b0e04-59e451834f9mr1551959e87.53.1770452705558;
        Sat, 07 Feb 2026 00:25:05 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63b043esm10666841fa.32.2026.02.07.00.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 00:25:03 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Raja Mani <rmani@qti.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Fix error handling in ath10k_ahb_clock_init()
Date: Sat,  7 Feb 2026 11:24:24 +0300
Message-ID: <20260207082424.596554-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_002508_711929_43CCF914 
X-CRM114-Status: UNSURE (   9.19  )
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

The devm_clk_get() function never returns NULL, it only returns valid
clock pointers or an ERR_PTR() on failure. Using IS_ERR_OR_NULL() is
incorrect and causes static analyzer warnings about passing zero to
PTR_ERR() when the theoretical NULL case is handled.

Fixes: 8beff219c528 ("ath10k: add clock ctrl related functions in ahb")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index eb8b35b6224d..7456f885d2b5 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -87,24 +87,24 @@ static int ath10k_ahb_clock_init(struct ath10k *ar)
 	dev = &ar_ahb->pdev->dev;
 
 	ar_ahb->cmd_clk = devm_clk_get(dev, "wifi_wcss_cmd");
-	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk)) {
+	if (IS_ERR(ar_ahb->cmd_clk)) {
 		ath10k_err(ar, "failed to get cmd clk: %ld\n",
 			   PTR_ERR(ar_ahb->cmd_clk));
-		return ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
+		return PTR_ERR(ar_ahb->cmd_clk);
 	}
 
 	ar_ahb->ref_clk = devm_clk_get(dev, "wifi_wcss_ref");
-	if (IS_ERR_OR_NULL(ar_ahb->ref_clk)) {
+	if (IS_ERR(ar_ahb->ref_clk)) {
 		ath10k_err(ar, "failed to get ref clk: %ld\n",
 			   PTR_ERR(ar_ahb->ref_clk));
-		return ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
+		return PTR_ERR(ar_ahb->ref_clk);
 	}
 
 	ar_ahb->rtc_clk = devm_clk_get(dev, "wifi_wcss_rtc");
-	if (IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
+	if (IS_ERR(ar_ahb->rtc_clk)) {
 		ath10k_err(ar, "failed to get rtc clk: %ld\n",
 			   PTR_ERR(ar_ahb->rtc_clk));
-		return ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
+		return PTR_ERR(ar_ahb->rtc_clk);
 	}
 
 	return 0;
-- 
2.43.0


