Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5670ECD1283
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhPv9uNzNlnN3t5bm/Vtd9WoPCFFzK8p2hzOyPKe7ys=; b=kkoLNMnlAv3TM71I/lEHgbhHOD
	AxzgFVKpAibCSAdZ3oy1UsVvC16iCzSSw9XVNszWm4OMxdH2+hxQ3o2sUvNPSNkiIs3Fj1kMu/u0O
	HLIkZE8rsI9PaEtrP/FB6aKjnknkVKdf9SU4ZO9LJQ+MIgGiW0f+XVjZ2UVRs+E5nAIbr7UoB92rK
	JTS76M2sM1wA7PtLEfU0gZoPAI/VaWBPbQNnsgf27UKHotGwzULkSpzlKNbaq/KGdJUV5542u9K6f
	hMY9ow1bObA7/FDGSh4BM9Pedt9djbNJn/7ln6f2z80KigI2KQpHlXRodHWhth0CyqSVUNZoa4rrI
	vBLmaJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyK-00000001Sb0-22Sk;
	Fri, 29 Mar 2024 17:24:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyG-00000001SXd-3sVV
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:24:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4148d1b4a26so14803105e9.1
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733091; x=1712337891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhPv9uNzNlnN3t5bm/Vtd9WoPCFFzK8p2hzOyPKe7ys=;
        b=SPsfEazgoRdUlQaX9nSWbRGEaxAMgZzZAG9qgqd+ZH2un4eO5ADxeaOtvz3YtlfAWq
         26m0sGkKyUR/9qTQEBWt/4o7RsmyAMM1o46oL/nHSzNtwLh2Zyysst/XuMLP6voaZMcG
         p2rTr0mWMy04+RhfWdz1OHAVxy6P+NshNy0/idBB/gW6Xm7HYTQ+sTSJN1NVk1BA4ozo
         gxtMIMTjlhugQ3SqPvawj1fJXFnf3n3CpuuqD40ciFlJbaa0uF/AP5HOjZIxFJTB7NVp
         8+KwTNgxqh82gbjQczsffJVAWBAp6fQoLgL7tczRRK7WouSDRZyOB2dCi5boYozo3O7p
         16mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733091; x=1712337891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhPv9uNzNlnN3t5bm/Vtd9WoPCFFzK8p2hzOyPKe7ys=;
        b=HtJTwSzH2R056Njj6CSCpWulBrR3PtZOpY1k0uJb1/xv//snd7iuyyDlFxMwKCdESC
         LbJhiOCQR0u9T9xK83HhhrfYXnPtaCrqgUGzZRZJ6H0/kzc77NEmI97qo70qvCrKTneL
         tEVFayG7XpUXPNYaVif6ZsDRL1nYYjWA9L15VJauCXRrb6W7qOZBbExnr6vVMNuSpAl/
         cIKPnjSuqxiMjtth3HfcqBYdZ6nRGQz9szHc4MrL+QT/V8KR/u6WtpE5yeNZ14aW9vq7
         tQkXH2/ENlJZO4V3rb2oGVHozenlipE6/645RF56szIuOWeYOd41EXrkxLT5BikQ10VM
         eThg==
X-Forwarded-Encrypted: i=1; AJvYcCXSPxsXikABmwN+5qIYx5M3s0EiIAWlon1r2Ip+1NcfOl/DbHOy2P3mazbzBFoLE504xBBKaxEOYqWU7qzUHbUwvA9oJa/CwkMebQ==
X-Gm-Message-State: AOJu0YwXwFSaM2hzGyRx5JYLfb72WB3mHRIfaX3iXUJyWQadgm40GdOZ
	tfwER4PkK93xFmDjmf+OD5lD81I3pVxmGMrh3KjoQro4gewBt39s+MSlD8P2JXU=
X-Google-Smtp-Source: AGHT+IHtYKNLRf0lt/+X8+eWcJn/VGUD97lyqseZN1lBqy+We9hdEYMyYTdeRsMpokaPE1hUiL48AQ==
X-Received: by 2002:a05:600c:548c:b0:414:860:bdc5 with SMTP id iv12-20020a05600c548c00b004140860bdc5mr1971848wmb.17.1711733090950;
        Fri, 29 Mar 2024 10:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:32 +0100
Subject: [PATCH 2/7] bluetooth: btmrvl_sdio: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-2-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pEH88/Mvde7IOqLLQxygmayTZOYyn7iF1rcGpX9W2Dk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlY9jlnYndvqf4ycZsSLg8vHI3GcQCFdx8JA
 nKG7a+rQTOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WAAKCRDBN2bmhouD
 100+D/45p3tm81nQpqO6l6fT5LIfUPqYUD+5qLGAv/aTKvxeR1Yoiwfz7NpAwUBnyXCBk4XhFcP
 Ua4kpdZv5BN8cum+6JCjXVf9Ocd+zqHQMcA+E8ydJLFDnrze7mebC3CV4E0hXseHWx9BnrNMW/S
 ORtSDUSspE6eK7ZldHdULSpWDlil715pyv2mreTgfId7O/qp23/Uf6sGU2ggjBmG/7XShm2m2ls
 A5bbVqHvAeWn+LlnLq2kVcfTVA6RiqfISLgnjkP4CSLkMX8ei3mRaliwKRcp4NRdzCzZqUF59Bo
 tBJFmLTBeOjbIGtuT/Y2nQCmELTX42Vy1XCoge50qKd7hFCalX5HS5IF7qFCTEt9Ny0oxGIzmD6
 LNdGn94V8xmkCxuVZ54z2+chM0jF4rHQ3Vc+3ydZtoMPpd4h1zbDi6WzRniqsmV+36WgKeiQI5l
 9+XGDH365JVRpeKJvyCejPc+dSYivtHvch1qXIfl7oIczK2k8ywUCki7anHKIQy7AD0RQqhE51x
 ud6O7CvXO/c90RWS1v8TRMpt5Xb/X//3fK2naX9rxz8C1ytLivxTgDLPmRTy88SmEUP9NCgMVV3
 nElrYtsRKiQ4liVrALFnVJualZhP/pvvh6NcPC324SgjSwfwhHd+onfWNDrwHsw9bQn+qEF5uVH
 0/iiDkzzaO2uI4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102453_027957_DA239959 
X-CRM114-Status: GOOD (  10.25  )
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

Depends on the first patch.
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


