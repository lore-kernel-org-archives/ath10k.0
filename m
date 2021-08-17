Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D6FC4320A
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9212603E7
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9212603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCPndGxMNu9xkgXrpfrVtkxWgY6IEtyx3c7QR8lhPGY=; b=yPkTzXFlRk4UP7
	epcVcTI3LcvQb3H9SPc99T+UcHIm00qWN3/wu9Gpo5WbX8Om9spAKAIcswOjhHbKKtNRIpTtMS0E5
	Z5gtcD2+t7NVaFyr7CjuTiLaD4kUMZjiJKk7hGqLZxJK7FO8PYoG7jUphpXwgwSxoCrDxWrneL77J
	YQ/tf9TGVl3+COYMfxJJcsYi1E5sQ3sjcsfPlXVuSo0oi9/dMy7YvPXw+A+a+zTUIrmZD4SYBFR2N
	35j/xE/EAWlrQPTG9aeV+XHPaO552qJwvCkOE7fG9caAhHbpN0YqtSxG2qObdjh0+3hpCiMOHwg2L
	eILyzAvpRwbCnugqEHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnOF-000cKV-1h; Tue, 17 Aug 2021 00:55:39 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnNv-000cAi-Hl
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:24 +0000
Received: by mail-lj1-x22f.google.com with SMTP id x7so30109882ljn.10
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cz2cdyq9bfTQbWydu62Y30PBEuomfVq7X4iE+OcyqAc=;
 b=DXOv9zywG0v5J0JH95Tt8TXDFmxZ6qUNwRVvFf1Uj2RpuzZM0XTVLTllvnNUBCs5H3
 3DzQPj2wZI5FFR1EGWl7Ywp1K4Yg0kiYXVj3OOYLfrAsJ+/BX5wxCKKwzBu6wDNYhPOB
 b1jW+JPrFTFUd+2q/QG4OfBeFr8WCXCuuiLfHKmwqvokiQH1V9qfUHnygHfFJDQu2Aif
 Klla4JwL9uV1qHozO8/8WweWpBiTBoF/QuXen8Miu0ssquD2cNiI5GJEkPjqLw6gFoNi
 XWPm1vyRP01A1mAfNnH9mQuLaimALgKU+u9BRppYw2UuwHDQ6Vu5l8Li9/pSxjsuWWu1
 Zgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cz2cdyq9bfTQbWydu62Y30PBEuomfVq7X4iE+OcyqAc=;
 b=D3KQxaYlkWCHYJ5ZXlvdvtEpkc3lKaVCc1nbk3IsHXaiB24PtKS1kaBiG2b17MhUiR
 Xk8NiMXR8IkEiAmXIT4DJfgkDL4NqhalM73DVYET22CGKeSNCRdi5SvHBMWH3lvKxKmV
 DIXZh7xk88iTCnIXhKGkoCVxl83wn2Iwm+hmzmw7f2Dt9t3TT05/b2xUgGgnSms10CMY
 t0ZZLRNlHKhowSLLKWu762mma4z8K24nToZHJvJbTd4T2CrG2ViYMMgkKraFUIYPPAnz
 bIWpWSjwwZUT70yymLVflpS5Y/6RpJ6QNkoYrBJGQsFROUita4B8lMSqWyPXrBydAOp5
 MUMg==
X-Gm-Message-State: AOAM533sgVFlImH0lhen/UAwAvYRg4X+w8Wx5G4gmnbTyczPSYs79nEp
 rXAuGn8HX7Kc15omWncGTY9v5w==
X-Google-Smtp-Source: ABdhPJxjM9khOl2mTz77h1I67+yFB2G6eXp+QyBPa0lv71WVFHCclb5KEzUp1athAqLgve0EIpTp+w==
X-Received: by 2002:a2e:b8c5:: with SMTP id s5mr796868ljp.36.1629161718233;
 Mon, 16 Aug 2021 17:55:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [RFC PATCH 06/15] Bluetooth: hci_qca: merge init paths
Date: Tue, 17 Aug 2021 03:54:58 +0300
Message-Id: <20210817005507.1507580-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175519_629174_B06A3E14 
X-CRM114-Status: GOOD (  13.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The hci_qca driver has almost identical init paths. Merge them together
to remove duplication in preparation to adding power sequencer support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 76 ++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index a21cec44720a..279b802f0952 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2020,11 +2020,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	if (!qcadev->oper_speed)
 		BT_DBG("UART will pick default operating speed");
 
-	if (data &&
-	    (qca_is_wcn399x(data->soc_type) ||
-	    qca_is_wcn6750(data->soc_type))) {
+	if (data)
 		qcadev->btsoc_type = data->soc_type;
+	else
+		qcadev->btsoc_type = QCA_ROME;
 
+	if (data && data->num_vregs) {
 		err = qca_init_regulators(qcadev, &serdev->dev, data->vregs,
 					  data->num_vregs);
 		if (err) {
@@ -2033,48 +2034,33 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		qcadev->vregs_on = false;
+	}
 
-		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
-					       GPIOD_OUT_LOW);
-		if (!qcadev->bt_en && data->soc_type == QCA_WCN6750) {
+	qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
+			GPIOD_OUT_LOW);
+	if (!qcadev->bt_en) {
+		if (qca_is_wcn6750(data->soc_type)) {
 			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
 			power_ctrl_enabled = false;
-		}
-
-		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
-					       GPIOD_IN);
-		if (!qcadev->sw_ctrl && data->soc_type == QCA_WCN6750)
-			dev_warn(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
-
-		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
-		if (IS_ERR(qcadev->susclk)) {
-			dev_err(&serdev->dev, "failed to acquire clk\n");
-			return PTR_ERR(qcadev->susclk);
-		}
-
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("wcn3990 serdev registration failed");
-			return err;
-		}
-	} else {
-		if (data)
-			qcadev->btsoc_type = data->soc_type;
-		else
-			qcadev->btsoc_type = QCA_ROME;
-
-		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
-					       GPIOD_OUT_LOW);
-		if (!qcadev->bt_en) {
+		} else if (!qca_is_wcn399x(data->soc_type)) {
 			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
 			power_ctrl_enabled = false;
 		}
+	}
 
-		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
-		if (IS_ERR(qcadev->susclk)) {
-			dev_warn(&serdev->dev, "failed to acquire clk\n");
-			return PTR_ERR(qcadev->susclk);
-		}
+	qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
+			GPIOD_IN);
+	if (!qcadev->sw_ctrl && qca_is_wcn6750(data->soc_type))
+		dev_warn(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
+
+	qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+	if (IS_ERR(qcadev->susclk)) {
+		dev_err(&serdev->dev, "failed to acquire clk\n");
+		return PTR_ERR(qcadev->susclk);
+	}
+
+	if (!qca_is_wcn399x(data->soc_type) &&
+	    !qca_is_wcn6750(data->soc_type)) {
 		err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
 		if (err)
 			return err;
@@ -2082,13 +2068,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		err = clk_prepare_enable(qcadev->susclk);
 		if (err)
 			return err;
+	}
 
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("Rome serdev registration failed");
+	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
+	if (err) {
+		BT_ERR("QCA serdev registration failed");
+
+		if (!qca_is_wcn399x(data->soc_type) &&
+		    !qca_is_wcn6750(data->soc_type))
 			clk_disable_unprepare(qcadev->susclk);
-			return err;
-		}
+
+		return err;
 	}
 
 	hdev = qcadev->serdev_hu.hdev;
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
