Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF4CD1292
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppr78xyfds4y/gs/HuD/HQU1sIXqrSXm2ElFf1uWhWk=; b=kgIyoojbO2guqSoGRjRvOq+ifS
	nH0fi6jWF5pvoKyi9vc/vzfjR+jnPz++/PITUMEJKg2/NwgCZLFCy1YvIn+1BzrX3+TIuPy2Vb7/Z
	oADZFe0j0eCxktzPKv/vU7NrN6vHhmhF1fWu1qWQqs5k+5rjMVgYebN+H2RPmYe292L6wLWclNEv4
	fnMND5mKpzzuAjj4HikK8N6r5u39TOW3IXxuuCO5+BlkJZo+Qs9WZhEvSuIsSe6hAQGyFT7tT+wyF
	gIdnKfMTPLD46pQT8WEo/sNWoeciPnsnI+O0oheSxqf5xVyutI21q6/sraQrwN95ddXJ9+KzwGZhJ
	JcFR9INA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Qm-0000000GPsT-060Z;
	Wed, 03 Apr 2024 14:17:36 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QS-0000000GPbP-30fU
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:23 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d718efedb2so99597601fa.0
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153828; x=1712758628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ppr78xyfds4y/gs/HuD/HQU1sIXqrSXm2ElFf1uWhWk=;
        b=YT80dS5IrRmQ9+20dgzqVzHzIoZRyiKADea3+DB/+s8KvWwp4NbTZW3Qjk1bSWdZ6D
         0bBij7AciuicZ+KWe0rCdVsvHyI2ps0Ma2UVwQowbwBFR/IEyuAtkoThIUwTWopb1xee
         wOFKxR8Kuy9yDj2OIUs59pYDVhlXeOnpja/cGp/9XECy4vk+mL9sjVlEHd3oY1vfp+9J
         cXYmJG+2Hvob5OINajEifAxA1y2PUGL4BQYcToj+kwIaKDFMMOry2zRIEXRHounOLfBE
         nPOXPKMG0SjzkmXweGOXWr839Zgj4XypraYl6thvSwfZnTRyuYjIsnP8oEblg4MgXRWh
         XOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153828; x=1712758628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ppr78xyfds4y/gs/HuD/HQU1sIXqrSXm2ElFf1uWhWk=;
        b=poJHqi7Zps5BwePskqGxYOsnvQp8CQ1U/zX8AGm120+f5oUYsbjV1we6sqbEnySZ6a
         dXWsNy0Fx61dC1Hl4iV5facLfVI2DnSDPRNHGMUl5ONpXmuxVdzfC1eBza4PBkLvZgVC
         sqr9APVDsJnpu9hAtg2rnzHCpWlGlECn0ffgdYOOnJVsg1HqXe20vdi/3j4dAQLLp/jV
         RrMcIhKODfh+rxEb/BI6LI3WLNvM/gbCapVQSVweSzBDMXWMtwef+lEJbGQAxLhfU8Vh
         qEhwX7WfZl9pQtp7Wsvazh3MEkFn3R97fNkHRQLoA1lknljNNXFHGV2bemeY4Ssk1/At
         6e8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk/TydnW/9V2wwwzQUGlt8qdP/BjeSYC2dx7PL/qgn9OKfDDzZoRoJtAkZ4cR3U8/0B9HS1ttMH3lem0QJstmseEQQ1YPMMHLuJg==
X-Gm-Message-State: AOJu0Yz5B4G9VNm8B8leYMzRwj0jPKA/5aVIfuND04A3KElcd+93A4di
	WYWsfadqSsSCyiOpq5enB4Os598Lrpm89WEjpCJbWbthz6YLbjKP8eg4cPfx1fc=
X-Google-Smtp-Source: AGHT+IHITyspHTuJLJiCm3uD5L9whotmJI6PL52WRKyXjtd6x/6wj7dT0DrrdPKaed6/6QZtx4wChQ==
X-Received: by 2002:a2e:a783:0:b0:2d4:132b:9f21 with SMTP id c3-20020a2ea783000000b002d4132b9f21mr5823286ljf.6.1712153827878;
        Wed, 03 Apr 2024 07:17:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:50 +0200
Subject: [PATCH v2 1/7] Bluetooth: btmrvl_sdio: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-1-ae46d6b955eb@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lVZTs4L//r8zQlK3x3Oc75ANgngPjdrDJm5Fps37rmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTZ7I4ClqbblsU/YDwuN+xIc/3Y1gTjSNaZy
 JhDcyaZJcaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k2QAKCRDBN2bmhouD
 15VlD/44soyCyJj5Aluw9HL3+8omGcrBNFacDN0qbC729QPsGy00VDC7y9+1wNu1vEvG1h3r74i
 VrDi1MGtgLEjHG7XuZcay3wAJesHb+XtOZUtqPs988gXdBZZyzkxhDxzH1/BXCm21RWfAEiOiWO
 Uj9Q/Uy13NwxKP/ru8D95XdP+XWojOYoiQ/9oIogUTwkQLg/F05hBzYDnMmVWp6QIlQ1dSFDJTJ
 hGBLDYYoIm2fssEtsNou8pSg8sH1YlcP5pSbjhEXhptzQZqrB8XhSvY1dKjctGHh83b1CG2r6ED
 OjO7APPuodk6E+Zj2Qlig+VfPEyEykkXzsa/U8VeK23TJdcwJVkN+IPuWHFZaTaizN0DKWHsZ9u
 4pDuWAtLzKgOiJlGOOWhZUZTJnvMQa74Z0nAAGV2uOt9js0JqMZwBO+hl31UigQsrTd7QF2kYJB
 FTdap1mLHfHU9YHjEbLFgtN1cgZI2n62ggnstDFswV+DLF8QjlpVBU0L3z1td1njJ4M49bJ4eC4
 H/09oNwtL5iUz+2zGmJ3lhLHcZNh8zz3nXk4ax/DZ2Fm4yoxOICenz1/Ls1p6T2uQYm2sKHaxgZ
 n3qDO8FP7KxC7NUJii6Orbej2ORa2mUgnMzw4MisSdX9mg/n8qsRuLY3e7jj6/xJD4h7nNbIjj0
 RgLP9zBk3Q9ByvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_071717_057729_18276846 
X-CRM114-Status: GOOD (  11.18  )
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

---

Depends on the patch in mmc tree.
---
 drivers/bluetooth/btmrvl_sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btmrvl_sdio.c b/drivers/bluetooth/btmrvl_sdio.c
index d76c799553aa..85b7f2bb4259 100644
--- a/drivers/bluetooth/btmrvl_sdio.c
+++ b/drivers/bluetooth/btmrvl_sdio.c
@@ -1736,7 +1736,6 @@ static struct sdio_driver bt_mrvl_sdio = {
 	.probe		= btmrvl_sdio_probe,
 	.remove		= btmrvl_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.coredump = btmrvl_sdio_coredump,
 		.pm = &btmrvl_sdio_pm_ops,
 	}

-- 
2.34.1


