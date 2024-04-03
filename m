Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729A5CD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0vV1TVhRuXYRf/9v8gYugm0cKFpboW4ZZINajTG3+I=; b=SUmuhjbp2MVi0GaDmhkaJ5JB3m
	sXUF1EQ5yB+kg/t5Uej1QaWfDkVRqPTfbSsb6vccA2sb72OpS1rXQ2c5aDNmT5mX/2RBFyFSjlZHD
	Xak4+tNODNFsVqNbiUgxYIkrueoNcFPiUdm01isFW/DNEt1jN2/XlSfbNrSc0y+yzyysr+YkF+/Bj
	Zf8NmbkWvWFoWCVxKaYy+8wNzWlw/UJGExoJj8fHjEZtrfidXkMJo6qdZr7nHoNLaynm8wgJpyheC
	qPBmozB+RN5eLWBpZGiDUQ9DrLUFaTbpOVdZCS3drTYvRx9kCBWnLJ17IAzVTjcxpCZ6HDcLsOb6L
	auRXzUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Qu-0000000GPzJ-0o3Z;
	Wed, 03 Apr 2024 14:17:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QZ-0000000GPjs-2S08
	for ath10k@bombadil.infradead.org;
	Wed, 03 Apr 2024 14:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=B0vV1TVhRuXYRf/9v8gYugm0cKFpboW4ZZINajTG3+I=; b=K5v7S+/37eqAh6mtga1deIhOJI
	CCWztoQ4XuV9FPxBcxsh31liC0SZ5x76w6kFOPtyguJ6FkAM8g7HSGFVjV6YMzTWNTSYUJz095NTu
	gFYPeRHJTaRaAO4kYZx1q9cRGx8hebiDRN2Kw9iS/K3gm9Xs/tp2JFrg3QNOtgoZHflM0M4g3f8C5
	+5YxR5nwSmYn6P7E4JK38oYSF/MdIu2FXNAnQRPXzFprV+yM6DyZjRJ8wKD1h1jAowRTqhXd5f1GS
	p7DpVBQGzfZeGZBbQliuH0mxbXbvwQHspNwgzLQIZWU2yH0rzeLg234uo+Qxu9wgPrmya5BzUnend
	5hiQW/Bg==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QU-00000004GWH-1thU
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56e0e1d162bso377538a12.1
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153836; x=1712758636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0vV1TVhRuXYRf/9v8gYugm0cKFpboW4ZZINajTG3+I=;
        b=I19H6mwwOiDJ0EA1ghvCz/80i+JjCla53Ow6r/L92OesnD/2VxB+zqZ5q8+N5FWTtZ
         iirDUzEcJGLQTDVLd15ZRd/zFYP8U/qC0fTVFXmm5aAEpn/zXKueTwJCNLwxZn3BlZV3
         qVxCQympkyxglQe5LB4Xq7qFrJXgSOP5fAzWY4WEYc1TAAlRjQIdVwZ/bocTqJmg9Yus
         VVtJDXO3YeEbUW8sC4yf3zHgPfPrjdh5eNwz0/xhPYkTboaJ1gVoXlzg2qj1f/12S3N/
         ckPkEQQfwOmdQpMoQbROS5gFA8X0hHUWgoACKkWyYaT2QQiRqLHa5r4t68Um1m+jq/ME
         kWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153836; x=1712758636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0vV1TVhRuXYRf/9v8gYugm0cKFpboW4ZZINajTG3+I=;
        b=hdcvmVZS5q3jV6eLA2+c54swsoNcFec4AMEh9gSKseZVdKuSv0DYokmOOopVJsiXD3
         kyz+R5Y2gBdscdGN2CZVsKHQx1yg4OSMELEl0m5UeaU/nlGVJP0/w7c43FD8U4bQqGiB
         +mIjAMAdRhWIrSzM1quuj0OwtV0GqNxrs70LDzRQ3hPP68JBPlIoOM/gN6ljWqIZzefO
         Wh1/9M9LvKrlQFj19p2+op2J8MxKxUt1P175/Af6hRQqxFbKnlZgvWpg8I+6QJ9wLz07
         dtHzTGOk6SepgQWDUDCG061Z3/jmHVRuCUgTqtT5IwEbWj1DVg9uergNUeI6QCW5DxQC
         rb0w==
X-Forwarded-Encrypted: i=1; AJvYcCUIrJrlAxVs3qODtxfeGecy4W+qo/3U2V+8KRs6dcCOCHdDikdUP/auMWeAZwozHz9+fVf+Dsyc4pgmaXvMjjNzd1eArtd67GSO5w==
X-Gm-Message-State: AOJu0YzMjCIa2uIVJDrYnp91buwBtusse/4HSQc5coxbv7zmlhjqY25P
	kHWFvUI9IfvVIXKYgJ0hABNNRIa0qyQ2h5yUPkMWlCnQXUioBtjdaq2SrkNZmh4=
X-Google-Smtp-Source: AGHT+IESXedZWS12j/IBeLIYCIeiTvUtDhGnVVmwc7Y65AKvMiVNSuQO/q5aF56JXsx/yKl9XqaeMg==
X-Received: by 2002:a17:906:b889:b0:a4e:101e:8a97 with SMTP id hb9-20020a170906b88900b00a4e101e8a97mr1828471ejb.65.1712153836735;
        Wed, 03 Apr 2024 07:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:55 +0200
Subject: [PATCH v2 6/7] wifi: mwifiex: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-6-ae46d6b955eb@linaro.org>
References: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
In-Reply-To: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=44MLP9zefnsNnal/9x3LUH01f3HB/XMi7tqRa1ODu/w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTe16dq1dJEsJSnP/kRyVGwLiEnTFn788+oV
 GGtYkan9UyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k3gAKCRDBN2bmhouD
 1/9kEACCfFciE1oJa5A3bFkEqBgQPN/py7DctCjUn70y9z0g5ME7fMcUi9khdsK8OM3rvoqne+o
 U8NNqieNKtAO9IMi2CPA1wC8M4Wh9e4SCx5XngbxiNWP9/eEAnHvBGxckTaLGtPrX0yqgvpb8zf
 8DDyI6avfAZTM75Goy/SBVEFEQHhNDXHBwAsHJfHHerATA2Eb0RtNfrdl6KZNHpw9dBki/Gqguq
 SmFaK64ZzF3NvOxY3j0bnSd7+TSXkt/XbCu94FYgP69uva7f608NittH/9PlF3lPqtwoMFZuite
 C72R5lG5ygVaTQrAjmpVPU+ptiW1S4WE56ZoAMnE13XJ40cnXSfWCTvHVkap0FYipYZJ2jbI6ZW
 T52u7f1yoFmxcJMxt+wi0OFJ5yr0sRPZ4ykTk0TE0FEnjdfZUTra0qpR1eTpP4SwDyNKwTHqerO
 7mCz2E+zeY7hHhvcaiaVLD67Zh3oiZaz7Gk0bCdz+AIZSS4+r/eIJZPXCi87hUJG7mzgB7kCyKO
 n629sK+58CEmUGqaqdYlJyFJhXPRHh0x3psIBUbElx8S/NNF8VpPJ+ayj+xk0YEQBcco9ZuQjVG
 XvGW/Qwa5uZQp0HPCL5SceQ0/zwQULALaSmtsD/ZYO5Jd3u1gzfyw0+kMi/gdZyZ+KN53+foAhu
 PLE3iIJrkQ+zufA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_151718_703210_BD74E9F3 
X-CRM114-Status: GOOD (  11.13  )
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

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Kalle Valo <kvalo@kernel.org>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---

Depends on the patch in mmc tree.
---
 drivers/net/wireless/marvell/mwifiex/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index f41048b5cd3c..bda9b2b8a1f3 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -979,7 +979,6 @@ static struct sdio_driver mwifiex_sdio = {
 	.probe = mwifiex_sdio_probe,
 	.remove = mwifiex_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.coredump = mwifiex_sdio_coredump,
 		.pm = &mwifiex_sdio_pm_ops,
 	}

-- 
2.34.1


