Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF5ACD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnRU4IuiiR+L4DbUNFcvoGVCrcztEel/ynJcAah208g=; b=GOLn7RkS1U8VoDZJq9A4r3+CDd
	WQnSsRK/rFVV/iJD9zGd/Q/Rj1f9Vk3vzqKSE79gtIjtS8tKQpRicNqYbGuzQZIXDrbXO8v0cDx7e
	WI6XCPNjkv3d2+XI0ehqNFzITy91iA8Iw6U3jpG3LkT4QxyKTnQRI0iPnlLZbUgD0r77kQfqYw3PB
	W/4r5lemSCqf78pOAqYcb8gkTlZzmzuwTy1/7Z9G1VtzGJ+06udJDw9U5GFubGZ/+mnOQ0Vy/z0ci
	04BbcJi6mlJRJHh1r/X8sBXHB289E0GgrhuRTdNkiSZj5pdG5r4+zEB7wO8wVCWXNbqjuGxuznuTW
	Zj3OpdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1RR-0000000GQS4-0r85;
	Wed, 03 Apr 2024 14:18:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Qa-0000000GPju-26Vc
	for ath10k@bombadil.infradead.org;
	Wed, 03 Apr 2024 14:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cnRU4IuiiR+L4DbUNFcvoGVCrcztEel/ynJcAah208g=; b=GSPDAm3UwigxuaWdK3XsemAq1S
	8X/3Qx5e+bJ/M2skcS7FYjWWzzQTUsGbNTrdlIAesvQYq200gPjJZaUl6nCjHaCiBVMytKbmy6rcg
	tDK97j5s9wTDNIEvabodbFAb2Otfm65iXRM5sQ9mvBt1J1kq+sthLUNfbX/a4PtwLlnFlN/RnAuKy
	5NzdnmiqPSe6ltN/i8bfDR5CvBG4XXkdW/JkdLqKmwwaQSI2RHnIShIiSNLnCQDQrtFSGrxtWF6Tq
	HGQ8qJhT/Aopl/F1/d1waOU6JAZSSUieFLibQ3RyJ/7hP6UB+fVx2z8lEOpwvPvjGDiejIlgFmlC/
	kyFDHTrA==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QW-00000004GXI-2SIE
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso7404894a12.2
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153838; x=1712758638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnRU4IuiiR+L4DbUNFcvoGVCrcztEel/ynJcAah208g=;
        b=CpCNzrtBRfW5IFuSFkU4wSXBOMuNkmDpwX83T2gNcpUhnwy5gt3+VXIVDWWGDeU1FS
         LxFloKkGnoa/ofVEnUhwW9tX1xf26LFgUt2BxQWbyHT8uWYWVyQRVPvPDFPlcBhv84pX
         b2aLgzoqxSnWwopQsX7Mi/Kldh/fgkr1C3MsRuKcZviA8Xcnt1axfK6sCMTSBNGbQRXa
         HkxX1PoIkOspJelwkVICaZOsFR39RdBKYo1BKOhrADl02QVOKhwKuWDDR+IYiHEK4ei7
         udpEehjp8nxlCpZemSiTvTRW6kCkxLFTJF5szpZUI9grKqaC8ExjL6Du/aKudVV0Tlqt
         p3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153838; x=1712758638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnRU4IuiiR+L4DbUNFcvoGVCrcztEel/ynJcAah208g=;
        b=IFIjnAlo9NijdPHUgOj4tfteJJ2lwiDjOE9kGu0XMKmjq/lIPuYgQSnuXk8MMXjtgQ
         uNucgITihqnC659REZKDWbAUfUpa56gtpwjHvX9E//YEnWjJ3Awi2DRHeMdXrCoZiPgM
         OFtVpJOncIMUmm4SJZbTpAeWsgfU0KyIn8y1v0JhflQRAVxYwFJoVKWAmXoJ4Spe1wMS
         jHYtvmvKR41w3UeaHPJ2enL0pP9HmNFOnE2nVkY8EabNGQ0d6hu96WLFkq1MYR3ch89t
         Mwegz9pm27Sw2AT0XSVS6ef3OFDRk/FNuxR0R2FbVvrRH/ZifUBzThNE/weKyfK1ZLKQ
         6u9g==
X-Forwarded-Encrypted: i=1; AJvYcCWOln11BZIUClgo1ucbJ1/Flv8GuwsI0Iq7meCuZ9TUF6b8yp/91RGdDCisAEck+cpA3UFfs7PGj4d4WG4SyAMN0iAnoJAx4CA22g==
X-Gm-Message-State: AOJu0Yw3aBMI2tsnf4txNwiuG8/cqTO656ABSKHsnL+aurwX9E8tB/eK
	gKLTSDSm4aVcj07ja1grHdGZkSKzVSFCtVYUiW1IR27jLOSgwxebKsTYxD0w6U4=
X-Google-Smtp-Source: AGHT+IFTX0zGPUE9Ns6+NdhULu8lAEjCjxyg2b/cKN8bqqMv3ElMG+Gylzpf3w9rj3hUtOEzVIzlxQ==
X-Received: by 2002:a17:906:da81:b0:a4e:a114:1afe with SMTP id xh1-20020a170906da8100b00a4ea1141afemr1688370ejb.2.1712153838464;
        Wed, 03 Apr 2024 07:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:56 +0200
Subject: [PATCH v2 7/7] wifi: wfx: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-7-ae46d6b955eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uGEZExd5go3TxQ++ox1VKkM6W5qVi0yKE/c7ScITjdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTeqS7abKdxjbX/ezfyCtRmlw7qW/HCPv7mT
 6zlnQ7KYKeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k3gAKCRDBN2bmhouD
 13ktD/9YFZuqZloQPg2ULSo6Tu1Ci1ahN/R5OjRUhoWDGVX8+2s91o6KVG79Tj8eEzmgBAY7y6m
 CSnfgaDDoklC/CohY+LXdWsdFugKHpTRCrUo/hHOWOMWn+IZqbt+KAuI4BKWIZVDLkRvUJtAtJP
 scnKqM6sovge8LFoZ+Gcr+OlBPWOH0gr47r9Um12eXr7Api+Hi8Wk5mW875paXmjwXNu/UNGO8g
 WcMCyioIhn11Mmj25rSCrra/W/K7tddspeBv3x02+CWFAVxsmmvtCG1A0Tfz+2mWyYKWtJMicb8
 QI2diPO/Ivim8J/8yfaNkGhY6VrR9VfpfCoiRasYy61aKO7ZQoyAgMMLtvTSdxZ5KrEy5Za7Gy1
 3nnUzpDzvs9IWT/BRvgo5CKHAlEta+bT3rSXez2TQkSpfzyfMxk54h8GOsZdYY4oYqC5wPTyxWn
 4W2xkTLU597C1pauM1MwC1WRcWyXcdb1Ui8WsX7zsQd11xzKm4k1d2NgQh+9xeMaK84oqkZLZ+k
 Z5/HzM3ZS81FPFCjTkG1YbwCbmlZuYBvMSmqA1tSrVXeLOGv9kfTilKwKvYx9rc0hiEjpeZdiiP
 GSaQrf+giEjdwugOrcuItP/4hDJxVB/zOqpAczlXm6+JfSrMUA0J1rvXxNedEN5j2Vg2yhdHFcG
 Iuh94f8K9gmgdxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_151721_029344_DC041611 
X-CRM114-Status: GOOD (  10.90  )
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
---

Depends on the patch in mmc tree.
---
 drivers/net/wireless/silabs/wfx/bus_sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/silabs/wfx/bus_sdio.c b/drivers/net/wireless/silabs/wfx/bus_sdio.c
index 909d5f346a01..f290eecde773 100644
--- a/drivers/net/wireless/silabs/wfx/bus_sdio.c
+++ b/drivers/net/wireless/silabs/wfx/bus_sdio.c
@@ -267,7 +267,6 @@ struct sdio_driver wfx_sdio_driver = {
 	.probe = wfx_sdio_probe,
 	.remove = wfx_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.of_match_table = wfx_sdio_of_match,
 	}
 };

-- 
2.34.1


