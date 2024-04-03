Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78774CD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8CF3YqTJpyZfex95royntlXjuqDXfKm+2I23/q10a8=; b=zXZI5U7a6FUqnAK9wGleb4V0TJ
	Jppd5JQOD5NpcSIa7FuP6KKT7nCiV+v00axxcAeXHeEwf7rNImUzm8MOLIAmu5inf9SGDPAY3GI5k
	EAQEYWdprnN3vMDuR+37EcsNX265GDalmN36Mx6BzqZ4gnYPeK+QVLKcnlKKiXzOVUhCBSx4FK/i3
	ViWIYc49fGbXK4LAt1R90e8ngI5JKOGzNpWy1kwvx3mYi4PhDf5fP1JlD6lf49NNfDD/lm6RALk6x
	zXFPY0v4npBir7/nvWV4zsuLCYYZMoSXRfcDC3lUnvTDqGIhM5eSwS25z/ndy+SDw6Fb3vUDzAmeg
	xjQGZSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1RG-0000000GQIu-0kep;
	Wed, 03 Apr 2024 14:18:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QS-0000000GPe6-30Dl
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:24 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a46a7208eedso839833566b.0
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153833; x=1712758633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8CF3YqTJpyZfex95royntlXjuqDXfKm+2I23/q10a8=;
        b=Yn93OD8LKAPveHerY4TrMlDYJcx1fGP3JsTryXothtkqt1iHD+nykv2CdCDD+a+UJi
         QIqzYS5Ga6+4vA1CuNKmV8iVvNDQ5C3O4DnvoMkIbK/Zt2bO14JV05TfuiE9dKiSKBW/
         VRs26JGl8hoqL6H3IzZ3Cnzye+v8IF2EwZcBFnsPo2ioIDjKzIpwR2o1//DrlPsguFQd
         lmy0CuhQj0sg0x4Y7rHiBsJmnQsXBvG1ntB/h7jey/6z3wQ+X+YfIhHqGkMeg10qy/iA
         vjL9WvIMb5H0rOPdbaKsdSrGdvRLI6DaS+ylAvRVTLYS308bGehBi0fQ8tO7mtFhup+m
         TnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153833; x=1712758633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8CF3YqTJpyZfex95royntlXjuqDXfKm+2I23/q10a8=;
        b=cZBJDJLlhuFGiybk33CQjXNkWxkmwStw3RBbqycPzisJ0SyOD4wpLhVCT3oSTjqSw/
         MO34DOi/jwtbJemkULFFE4u+OnsaA4+Dde+Tevb7F9XQ6qcD63+Y8QvOUsqTD3A5Ls5b
         Gjtaar1ZFyVhOrwhvDk+wyU1e4APoNFulEY15+iNvNbHUKmDVFeiS5Zf5+qdsPiKYHde
         H97+zI6By0P2ZDdiTlv3aymomQziKREq8qjN7x0o0nepzxOvz7hjKf8ve/qkJs0Eofb0
         litJ2e5rkg6Qi+opx0I7/a8fxunEDD0S7YoAO4x3wW7Lro0/dmvSEfepkOetzASOfhob
         TiQg==
X-Forwarded-Encrypted: i=1; AJvYcCVAvynC5tm0helpkg7Lu5BjGnVuo/etk8k0y0OBRjMgGRigJnInk0GcYlg3hO/taBRPg51dC8Q5FRxSURQxA4VimMOr3WrwtGHrvA==
X-Gm-Message-State: AOJu0Yz745mVuM8ig8J7sVMxnpxT56cawnNeTvyon+5yz/p6kaM4Yg2Y
	4UQYNyFbygpeXM3c61FB6z5+q8ZYLGO9CaCAeg9//bjTjYA3Aiw0ggQzt0qf4b4=
X-Google-Smtp-Source: AGHT+IEUtfdmZfKGWRWu0raSk8TGFpN5pIwAwL9y5tPz9aK/wk4bFhzOX2A0Eo890n5dIjGnOyOkVw==
X-Received: by 2002:a17:907:9483:b0:a4e:a204:e646 with SMTP id dm3-20020a170907948300b00a4ea204e646mr1613986ejc.64.1712153833354;
        Wed, 03 Apr 2024 07:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:53 +0200
Subject: [PATCH v2 4/7] wifi: ath10k: sdio: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-4-ae46d6b955eb@linaro.org>
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
 Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QdpKnfzTFfl7629ghdBbT/xMhayZvm2B+bXXRAfXC/g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTcaSwzCg41URpHmCIIgbHloJ5RwRX5cfD8H
 j07G7iVMXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k3AAKCRDBN2bmhouD
 10i9D/99gR/B7ovrPXnyfbAPO/7GCElxPvvHn2XRdqAxM1ZKmgJ+gxlTXYBZvMuLM8KI9dwWCWl
 tSCaUaMHajsac3WbHxh1dsgEvWLQM0XPHZFyXu63SUpfrhIWkFJBqj2yJ5sBOMWoCLvlEY7iFiJ
 XIuwGpvYxcVW3xbdY9u8IRKe2d/QQClR+Pu7YwyaR3OPRRPjrlzxEIazSDl8UCUzoIBEEgXXcui
 D9Nl/I6MXKHrGyeQ75ObjBsC8f/55RhXUb0iwrFKNZ6fG+YHUkxsbjCiBqbDm8+8nvYE+d2WV7W
 /A1XSVK/KOjTZ/94nDBXPK/iIztegRewNOWl1TaG5lMMiIyQqvFHvRi5tqYyHeZiAf1y5FJqEHA
 eYIJqm66pLjbYfM0t8o4wvGIUMigBEVp4b6fZUb8J99Yp9zjodHujpfYihjqQWnhaxtHuHjDr5n
 ZasOnpB46kBTK8c+UVKJuMH/Pf0KQ5Quqv8VhOPdJHnKlfMwKfxGf/kGUBHs1uL6Cisxsytw7fX
 LW+wVCXaVhb38bZ+pjlVneUG11da1AYcl4gJgTHkDAAtTvny3D1hiLUWFQF4b5WqH5f3dIh4RVs
 mi/sXs9DKXNon/qkHvKUJr/49OHoZMqKQQ6S/QgwFY9OTVImKFTmbtSxDaoaGDw63BijvD0NYwr
 +bU9iK84wUPmpug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_071717_307171_2493AECC 
X-CRM114-Status: GOOD (  11.34  )
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---

Depends on the patch in mmc tree.
---
 drivers/net/wireless/ath/ath10k/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 1acb9fba9a8e..cddd9e3010ee 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2667,7 +2667,6 @@ static struct sdio_driver ath10k_sdio_driver = {
 	.probe = ath10k_sdio_probe,
 	.remove = ath10k_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = ATH10K_SDIO_PM_OPS,
 	},
 };

-- 
2.34.1


