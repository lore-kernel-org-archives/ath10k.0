Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25CECD1288
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BETDSA3lUOn0sAQ76GOdjltAIl8rL8ja5xGlP+sx/I8=; b=QZ5UvAlYlqwc1MDQxJB/ulFTtU
	cYSVwIxnNKaqrruzt7Et4eHMivlR92LKYjjNwGPseZaOd+6BJNfeqxyisMfwNZtmScEDG8lpycR2x
	QU12rnODDSV/MdRp5jXtUJfBbJGPis3M+NjjgYnODKSBvSkNleg59Xy7DVMfzqZ6fRfE3A26yNTxc
	43NqOvwek/gdLtNc8tXS98aJUUoBeXaHcWSWpv+NA7rWXy42MmKeXzgU3V+rjSY6A+mkXY/h0yIwQ
	d7Slxkam0fsBhjoOun3YrMkl/fqJOXYMqXVA5nrAP8aEGCtsaVc6VAjVpJmDclnlQQGKKoNXNYKcm
	rTETE3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Qa-0000000GPku-40Yh;
	Wed, 03 Apr 2024 14:17:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QT-0000000GPgM-45MF
	for ath10k@bombadil.infradead.org;
	Wed, 03 Apr 2024 14:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BETDSA3lUOn0sAQ76GOdjltAIl8rL8ja5xGlP+sx/I8=; b=GtsXtex1FevaD4BgN9ZOOIQ1ug
	yUpRei8GK9wyZE40ymdrTD260jj+EGKXQGiqyhfnBRvrLRrls1QLou1Y7ymydBSF5Bd/hluSW7RtI
	SCaw7AlcG3BFS7Nl8kadfXok9OnRm+t3iTnpiAuzIDEgW3oOS5nB36n/1GWNDjtkiv/TGXUyig3kc
	BwZ5/lh6nC5PpjBEBLhCm1UBD1bVkzH8fcisf1MYJNX7jWYc/hNyNh1zw1no/QWLt8dasc/rlp50R
	6Uei/rncfJ7jTwEN5iwGABl9TVrvdO0TYnMcku+9zBr8omUlzn+MeqxfOPkT30NQHp3LCXJ5A+/Xg
	bUxtpVQw==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QP-00000004GU8-3plb
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a4e39f5030dso673265866b.0
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153831; x=1712758631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BETDSA3lUOn0sAQ76GOdjltAIl8rL8ja5xGlP+sx/I8=;
        b=szy05FvRpftuff0tRtYa0v/b2e8s13tDPdo/PWPxrP8iyKF8fQtCpr3gEL6jBFdInY
         wfJRB/QkACYZM2MUaeogBYHKoSr/MVT7ukWf821FUKHmrWW+Pb687T6etidVeymqcL9m
         TCKRwuipdgvhfiVdADwKqXwYhfaN1WtikTXAJ/k+9kOnA5aUrKn9ga+kKnB9gKAvlNJ7
         OzSdly2nPPxZ1oEJpRisFBNE8DzAF8GRVNX/n6AkBj8pePAZN6UPih38gf24KP4rTW1R
         c65v2dPHJFfupGr0Jrx3yA5O3m2Q2WtL6U/zf7/0KYP2tkjm9IQ8aPNrFwnoZ+NrxCEz
         UNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153831; x=1712758631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BETDSA3lUOn0sAQ76GOdjltAIl8rL8ja5xGlP+sx/I8=;
        b=VRBhKL+gyh+Z1J2LulQgBzmoVRiB7iKHjOMlwAMF1CN7Fk8DTFZJPVgoDAo60oUHM9
         U32/rcW3xyxm3HPoBWn8auC7qXCu4wSRZaw+GT3alwmC4PbbwJJzzdAAxwXt4d4OEuTC
         tQnfvW397NjrpFPTzgRSaa34UN5PHtmM5zU6yRBva98ma0/cHT3nDwro2bN6srO9D/kC
         UXvyBrvaAf9pnDMt1JNuUAXfFk/jdWU/hXJzldU63DFbjsGVp/tHfsyuymeGHWV1Wo7C
         hy7on+dZp6Pd0+JB91ZSEdspdeB1aQx9r0ArTksF6E2fEbq/aY6EPj0M04K36rkqvi4k
         w+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU6LDiZnQFvWvYeLttbOF18+XQ3eoGPuNw7bCuVGiLAvX3He3PpuyFQlY9Aed8mcAhf0cryOLxr0kwQn5B44VK7Orh3iLBS0QKY3Q==
X-Gm-Message-State: AOJu0YzGbzGvkC3ZjUXu0fMphIS5HJyaX8GOn7VbaLLhKndmAXSIWl5n
	vaiMakMbm+sm5pd3Cw3s66MBw9R2NbtvPwySlPgwpcrGCnaGNMow6VKLOJSIWus=
X-Google-Smtp-Source: AGHT+IE1w6g2ucl/6IDzZmSNYwasQaFWqR1hQjGTPf/zJiNt+ECvgZll7C7tOYfQKox7jLfE/t4qNA==
X-Received: by 2002:a17:907:72c8:b0:a4e:8024:87f6 with SMTP id du8-20020a17090772c800b00a4e802487f6mr5679542ejc.66.1712153831564;
        Wed, 03 Apr 2024 07:17:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:52 +0200
Subject: [PATCH v2 3/7] wifi: ath10k: sdio: simplify module initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-3-ae46d6b955eb@linaro.org>
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
 Jeff Johnson <quic_jjohnson@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=84zMF8c7ejIeEw/PrFg37PetkFt6D4yoyHa2Q638+x4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTbyM65zcvlEfiPazS0kbhT4junWR/REE800
 uUG+OWmZwSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k2wAKCRDBN2bmhouD
 180pD/47q0AiV5Hxqsie9qNBuzm6JBeut4X6plfgi0CLEaa18s6SlSIYmjyQJrEaIIjiwYkHl9R
 mNz6kX5GPEbh4BOI/LcKeOxZadJaAlD9TefFcic5Ysxzx5v+3dbYdVHdk+VfEGOd7VfE9/rOAO0
 BQTjfDderHaoJePQC4UGkW+gWTgv06CccSq1b0cc3lL1vQFTjPEYPpkXyLErRlj3A1mf+B9tJqU
 QSG8JFugLbprDi4NOHbNyq5e321sRMMpEfs9rSVsbQ6Dfn3BeXn015N/NfoXYVcfPh0z/su1G67
 AoFkVFLW/KLuKCA20mWiAuob85XpRTaefVGaNsYSWOzfN/PBbEzWxuyK6UoCieqUsD+IxQXCNaq
 9kfvpAIrEtJsGcMCbIFZ1wY+s+BQpNX0S07dSG4Cjiuel3qY1TwiAx9uwoky9uJ8Qwmb9lNjm61
 zXbrVvNFnnE6WPOG/aAF69LkYOdYZ4WCA3n9B/F+GhplQZ4EGvQwWysETP8LwPuz5gDHhiME3Ny
 M/2ndx82o/bHeg8MbwmGjbxANR+iLNhDqdy06BYjNlYWLn6dctZeAV6hk5IOG2XpY0mpIPXdPXA
 q6MWuaAs7gMQsmksWyFardD2jh268J9qqV2DrLrlPxACunW82BMYT/aQ8WfxbiFEMl4ZjJJ3uBj
 mFCcm2iroS8Auzg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_151714_053705_35237483 
X-CRM114-Status: GOOD (  11.02  )
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

This driver's initialization functions do not perform any custom code,
except printing messages.  Printing messages on modules
loading/unloading is discouraged because it pollutes the dmesg
regardless whether user actually has this device.  Core kernel code
already gives tools to investigate whether module was loaded or not.

Drop the printing messages which allows to replace open-coded
module_sdio_driver().

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Kalle Valo <kvalo@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2 moved from other patchset to avoid conflicts.
---
 drivers/net/wireless/ath/ath10k/sdio.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 0ab5433f6cf6..1acb9fba9a8e 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2671,25 +2671,7 @@ static struct sdio_driver ath10k_sdio_driver = {
 		.pm = ATH10K_SDIO_PM_OPS,
 	},
 };
-
-static int __init ath10k_sdio_init(void)
-{
-	int ret;
-
-	ret = sdio_register_driver(&ath10k_sdio_driver);
-	if (ret)
-		pr_err("sdio driver registration failed: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit ath10k_sdio_exit(void)
-{
-	sdio_unregister_driver(&ath10k_sdio_driver);
-}
-
-module_init(ath10k_sdio_init);
-module_exit(ath10k_sdio_exit);
+module_sdio_driver(ath10k_sdio_driver);
 
 MODULE_AUTHOR("Qualcomm Atheros");
 MODULE_DESCRIPTION("Driver support for Qualcomm Atheros 802.11ac WLAN SDIO devices");

-- 
2.34.1


