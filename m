Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06353CD128D
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmTGzTEc4RD6Zxwx1L0++p3dHui3Vg8IltbV355Uuu0=; b=R75HhafjkVpIdNDOZk+SxlpfOI
	MBjPmLCX0grv0mW7nfBWwW3DZ2yDtEpihEJjvdRuczK4umkx0XkJ8Qvp/1BhYTNe39+l7YWSlz1Cn
	dKZvQs7HlgzyGlwGhkJKbk5mtC0otjd6R6Ahgkrhi6Md0a/WIybQkAUXHtr7Ua7RRqXfKLTdDCufi
	doSfGOwPMGQzQTatZN9a3vQOwbK701bwh88K6xWU3Av24aLenlDcS3jCBZ2XxDqpobdFqnu99kWy+
	pDZf7qlL8fs47eBoSOuuHQY8CsQhnnmci8IhHOEw6CMykOZzOpD+s0zoqg1pwGYEm+1kZCoYsAepQ
	ei+9pkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFz2-00000001T3p-1vRd;
	Fri, 29 Mar 2024 17:25:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyM-00000001Sa4-3Eu5
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:25:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4155271cb59so3844925e9.2
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733094; x=1712337894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmTGzTEc4RD6Zxwx1L0++p3dHui3Vg8IltbV355Uuu0=;
        b=YdpDoGscpaYysSVyJhzc85dSvmpUmkC5OObupDq6T/OrlzWZkfPsgofp3eIT4hcs5v
         AXHsJtcf5VTqcl0UIMnOreCVA7gQeBX8kRZ/cDO1TvsbFRAW1VqMCZoAAyklEhwP5ZD7
         zA2nGdfGJfMOWIZQSJ7CZ6XEG5+HuzKSheBsikNopsaOicrXs3CnHjRQ75aDc48IrW3o
         WrdIFGQlIafoJSXQFLdo4g3oAD8bsnIgmRlI4TBJe0Z6pA3/4hbPj5A5WE0df/bodikV
         lMBfzMwGThMeRM7mRFVyh8ckF6MX+QZowUezdgdHQGaMEsjJWvEzEaHmpC0RvI3yd34d
         p4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733094; x=1712337894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmTGzTEc4RD6Zxwx1L0++p3dHui3Vg8IltbV355Uuu0=;
        b=mSLX7SQWO6s+OWkKd/dCvGgEVUaULBXOB8JXYrMfxk3jFlGuvs5Tnr2k9uB2wXMpWX
         7SOWW8qGb0MdTh7A6GSSai/Xnr5eIBk9tI+Qf86omDecqNE7pR6XusN23QQfwsSUNuZN
         qMQYS+DFwNNdr7X8Ds3vh2YfFCfOpmVEvMr7gfR1B4s3fjk4bVkOEeZiAVSc2SMM378I
         2HpukDeQUaKhVxp9DIOBTTS4NeHRYF9KkxZooQGAETV3h1RLRuGtl8S0d14AG1bNwcTC
         tqORDjePwabryx1pHxekbn+IrztqCxagP6kDrcAoY3PiezdeXb4X/z1sxP/8WnVKZnzL
         Qkgw==
X-Forwarded-Encrypted: i=1; AJvYcCWW2o81RxI8oZD8cRGYME7xwcYCRkANooYGOUReq4TGAdH4WPycdgcIecbc6g2TekL4vabFdxJ4lXu/Jj06H/aOmq8NPZwUFDGejw==
X-Gm-Message-State: AOJu0Yy2sZr7Ml/kPl7Wzbq4WYnSoOpf40phaWGS1T+fzRCVVZY9+0m4
	Ox0n9vS0aaHBCMHb7jGSmebaeGL9gKl1XuAlvcFrHYlft5Bxt1K5jMdZuUU3dAw=
X-Google-Smtp-Source: AGHT+IFKK8ZeHTH9ZbUBZLceILsm4M2liDcUbBqYMiyRy1FT3yEJ7TWMDJlzYPnYqROltzOu2fo1TQ==
X-Received: by 2002:a05:600c:558c:b0:415:55a8:e1a6 with SMTP id jp12-20020a05600c558c00b0041555a8e1a6mr168011wmb.4.1711733094429;
        Fri, 29 Mar 2024 10:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:34 +0100
Subject: [PATCH 4/7] wifi: ath10k: sdio: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-4-e4010b11ccaa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r//ZqddB0cZEwt61oNE494z55PwC93sH8F/mKwPOy34=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlaeTXWKNpgBui4m7Ij+L4ew0r+t6wYjZAdR
 BVOx+DRMMmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WgAKCRDBN2bmhouD
 1zNTD/9CEupDb49ITSPMOkC5RRoFX4Hxx04rWRsvxy7+D2Zzx1UQsGwz8tEr1QQIcS05RUsYRi7
 CTe7t0E7tUIJ0868rvcjYWISK9r1Wb3GsXOzE+vi4+8IdUDZawBJYmWVJWncC5EQ6X6aipNgMoV
 A3A1aeweQ2SRW/j4tSrw+AJfoHPVXBzDmCtGvSJAcut5TS82DDlyqYQ41yCvxP2Eq7e/0TLUOZe
 0DW7xlHa+k3LjO/PFHfqtU5AG7yhxUA0QvrLxnnHlfLKyEXKKfVaeWjRE403Ecm34IRNUDA/GIw
 L9tt9166WoHjxHr+P89YUcg7YUlIxmKqluZSuzl1cz/xvV9bYRGcA3PlqgoXnoe/q17Vs0cgmP/
 KvJv27nVcY9eAq+5WNeqyNwCQSSxboZmrpTkiVSvg1LhBAFqaE+Qn6PL1mbF3HNsUF0kB64Iyac
 rBLJZTLfe2qknwXfWl+xv/04Oyu1xMWWo0W2pyPIStmyNyTNyNtCCJYXVg+Nw2vQezrdv/adQax
 rKT45h+gEFfmekPRqx3rfWwqMXB9qqTOf6z9jIoG4TNYXnZn/HxufuJ7qiThb+JNRtbODqQASOg
 XyXbyNFhXbjlMGgvbFRsqfqdvxqiWFYYWRGVDVVi41ly8n+uw5VFCDvfsd4eh+Fk7g7mpO/K2k4
 nqGuoZDWh7MoGcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102458_882955_4A03217E 
X-CRM114-Status: GOOD (  10.21  )
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


