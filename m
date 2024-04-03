Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FAFCD1292
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVQ0U9D/KVAqjXU1brwZZN7jtSQawCJDB5Go47IF4+I=; b=adOS02IpzkcypR2q6Kvp2yTlLG
	J9lxkpYs7PfIooJKn4sWsIZ+yTO/ZW0Py4wznFvHYLhJPsUWRS3CrY0XrpzydL8L9rEHyjRbTWinw
	6pxGNRulUo1/6vdRxcxH/BXQFJLb7zcyfKo4zv1WnqH/kvICrqTWts9cz3WuASYJBz7cvtgFgQ/hM
	NsX0ahlrVkkDk0fM96hyLRi+VR9eIp9Xe7oNc3EcJ3do01rtfBYJx9j+XlGSaAXR8SSaRW7UR+j9o
	1+YzpsdWch2PX6ntiomh6qq93d6u2+HDjzfkvvQb8C4yJfnq+hu09u4SV1FiG/JVmBxmiFwJqOVBR
	zSdeodkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1R1-0000000GQ4h-00FB;
	Wed, 03 Apr 2024 14:17:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QS-0000000GPcP-1fqP
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-56e0c00e7fcso665254a12.2
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153830; x=1712758630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVQ0U9D/KVAqjXU1brwZZN7jtSQawCJDB5Go47IF4+I=;
        b=kSJDgoTePBN0fDJ7TCaH7fnhJ6BEN/UEncHw8Xwbu2Y19+tyRrEbjMdGwqY6+bJER5
         tji47JubMOmpEBR/FyNlR+RpkFYdn7k4p2n68DqlEpG7U3xI9SFi2Ylx7XfHfgbR+wbI
         g5vgqFVkd4HiDSrWmci6kq+3Ie13a75ObSgrH8vkEB7R7+xis+D403zF+CIrZo+kxGda
         pQJovzTDR7EkGLKQp0YpawCNBotGhPoT/MAMt9x6nhBHOx9ZVSKJ/6XoZ6NDCYUyBPUv
         sDyNbd+jvmHq7hJUUcHaRTUs3YEdMnASgAuMliemNCo3p7q9zvTDvUAf69GWvO00wF/s
         99dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153830; x=1712758630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVQ0U9D/KVAqjXU1brwZZN7jtSQawCJDB5Go47IF4+I=;
        b=tXq0v4rkI8MKl71DxI6JipSsolMt9ydxrMQ1s4ZPKdOxcLbAFdAvyDuiMxft76zGYi
         ksBL1JNMS+9F1B+TkTpZs01wGN8ds6VGpU3rYP95o5CXVNfGvXnnEEnZ3Iaa9+oOA8Hp
         C2ESZG/36Htj8kpqTSEdFpmQ/Se+nEePzypEF1R7lBe+YmCX7EvvI1eANPpEL1Qajv/t
         aEBDRmC3xRLzP1VBe6U7WNqBQEysMlOW9guLFqZj0luKK7mW5aezyJTIouC0H0TJ4uZB
         8je16OJTaUbZUGpgISbGpCSyV/UH5Xfrh3ID2IE/uOkx66gK80s5Jc4L6SXS4VN+Sv7r
         kWqA==
X-Forwarded-Encrypted: i=1; AJvYcCXsTsc9bE6KZUQXLukb3snABfWsr4hCBdMrARg1jPXN0skjyZ020tnJ5XTmLw107mcwEui2QRg3noJi7I+PjCrMzUoHSSz0FNHEyg==
X-Gm-Message-State: AOJu0Yx2zUV2To2XS/SVkUrGtAL2tfDdMj8MIplwDQ0yN9fjUYPGePki
	tpaJSf8Q3Ekm8JvXrc3p25/m6oaJXy7LQuYZoQQcajh1onksIcpEU2YZFnQVZ/0=
X-Google-Smtp-Source: AGHT+IEq+cedMg/HdXeWUJ46ccGlTECKF+cYAqgFSpQRqCCTL8vGS1xn+Q24HJJd08R2KNhYaMPkLg==
X-Received: by 2002:a17:907:97c9:b0:a4e:5088:a959 with SMTP id js9-20020a17090797c900b00a4e5088a959mr11602611ejc.17.1712153829813;
        Wed, 03 Apr 2024 07:17:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:51 +0200
Subject: [PATCH v2 2/7] Bluetooth: btmtksdio: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-2-ae46d6b955eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=694;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wmPmmXdT8FMwSksDvwRdXeWX/na11P5Z6Ye1jHKblRU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTaZN41kIdbagqJ8fbnOuBWNq6NcKpm+jnmw
 SokJxjA9ZeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k2gAKCRDBN2bmhouD
 18TqD/4xMdeO7N8l/RfcqlLT8jwGJJpLGtyHMHJVuEX5WDCMPUL0LKwWqGI48sSlBaPNDp5uZ7b
 bpD9xkZtpsFLxeTOAUVR428mbr1ejpNQ8Q/B0ilOg4L002xiikkzLaPKrypNOZVk1Y5sePzi1iu
 VsPrAXo1vFpQ3URnX3Ph9o8esjfPfJqguU835edg0Cf+IgTZFV5ODNGBbDI/tG9YMnwU+4s9FZ5
 FNwTrT7xfi9yInPMbu7qB5/ZVEctiydQWu+0VLjjQ28nokYCbGH/8a67X/gN9G7DkGK0ha6osSB
 G68+oLRWdpykxGXgj9+lggR//ZlHdTJE2ekdyWaVt85iAKmW7n4ixZOPl8LBJrtD1eqQwLAaMni
 ZlxNpG9q+LCoSx7JaB881EeKwS/0zDyX0FWC8n5qYiDpZ28rYjQ5AbPKmaRGGrS0UnqdaY+Hf30
 Tj34ZUSYc+RPw3DS2VGPQ81b/Sz83YgKING3NORDXWg8LBqFaENZ7oMI2zIg0tZnLOTj5hNNNSa
 HmY0qMwWOie2pjXpnyq9yctaaIe0lrpx4MjiUFWnjSKE1JbKfpfGWXMsp7TckdmnNk9zaXcC3at
 +qanW5E0+QlG0Phx+ZW8Brc4TV+mr8Rwe1bYb/o0X01nQ27LdryWzFmxacAc78gKZPIqwQiKU+l
 dXRLBJZzLsoAzjw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_071716_572512_1215462F 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/bluetooth/btmtksdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..8ded9ef8089a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1519,7 +1519,6 @@ static struct sdio_driver btmtksdio_driver = {
 	.remove		= btmtksdio_remove,
 	.id_table	= btmtksdio_table,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = BTMTKSDIO_PM_OPS,
 	}
 };

-- 
2.34.1


