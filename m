Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAA0C4338F
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92E960184
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D92E960184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwfCoziPPcKs/fGdE11WVS7WHFSmkBjSfbnqgvz/vwg=; b=dYSVCnDPGd8d/D
	eyJhEid5OVwsVvLbHFWG/Msz/Jpb2FOF8ELGMMlOKhQCjQv2GpxKTuO454qSmssLFZ3AcwADsBQ4L
	y76Y+7g7pXfQQVZm98IzyrZaWaeUk7/ng0H+kCF44FvuMjY5zrp3oHCyTFEso/PuT0p7onchJOHai
	Gpq86WbJCTsxljJHS2uIuy14HhZmst8dP6R/BbMrOfeUlwSovwDkas0UBmtKnXjZQ84uNiYucOg87
	/1kbsGJ1aRLjYyvnpTbW+x+XjQY8DD2Zd8cjBqlAiSkTCNK4uBfQOfqIhjjt0z81zBTD7cVmtOV/P
	Q0Y6fCkhyxElT9T9HuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnOQ-000cSp-Ka; Tue, 17 Aug 2021 00:55:50 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnNx-000cBJ-OQ
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:26 +0000
Received: by mail-lj1-x22c.google.com with SMTP id c12so17068295ljr.5
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qagkQtaTlZmPxAEgYPi9rpyWnwBJTQJebKsAKhdvfc=;
 b=bPom6hkXdRt2fzsZMrGQmnn9MtSyxylCOyNHRvgpVhawiJNrQh6QUqc9ih5gcp1PF6
 x7+c0V9DfcVHe25Z00kgH9T2ng5nSvCBz+o704oipZiwi9g3Q79aomTtYCVE5rKr2XID
 isIpULaSopsDHVzvsUaGca7+jYh21REPOXKcvjZZGkmiuKDdDMalE24Btv637HBybtde
 t/oUVFkzkQdO3xkPAa1rKVrvYHSiS5YVlrimA71K0GOp0sLQSWff7XvQCNLH8ZIoI4OM
 Vibzz8QCOKSRXuoZjssW8pbA1Sg2PRC097Zq5t0AlYgDWr4OE5w7ViGN5v013nB2yfv5
 yl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qagkQtaTlZmPxAEgYPi9rpyWnwBJTQJebKsAKhdvfc=;
 b=SFwKayLAsS1mWoDyw19B1d6b7eMbBRcOaHOHr0I0H2+x+bH/kzjyqKaNbBATVpTSn7
 O4W6TuAaM5AvlKo4BOIX1BZEJ1fzF7/cNbU1HxL3aK/pMqsYRfd+sm3VNJHiB5VJpVtU
 GODLmJ52yTaaapjXn4YfNCw2a1Y1gjeAEsjire9mkMikoDzbzQ4qjqYj9ip1TxTPXWSt
 S5zfKjqmqfGW+7u8p2GOiU+NQQ6i4Sgaw9wRCQPPvOeDmOcizyVXb3rXqDDBGBJ9Aa6k
 CD0KpxkrUd1H66eWwJntJCSylDm7mJKYBW4Iw+bWudUG0bHYpn8W9oerDkuZ1y4VUJJC
 OvQQ==
X-Gm-Message-State: AOAM531xnJDMr8mdjnxlQiCZSEWkT5MhOF0MAkvvkp/bPIA0Z0rkAmFT
 PFx4236ZZpuvYdGLIUUP44mQoA==
X-Google-Smtp-Source: ABdhPJy0Vxzbay2lg9uLfmPVEif7TuCf//2e8I2PdIm8X8c7CC97prs3p0qNiSFLC6TRElLB99wqvQ==
X-Received: by 2002:a2e:9751:: with SMTP id f17mr777675ljj.422.1629161719792; 
 Mon, 16 Aug 2021 17:55:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:19 -0700 (PDT)
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
Subject: [RFC PATCH 08/15] Bluetooth: hci_qca: futher rework of power on/off
 handling
Date: Tue, 17 Aug 2021 03:55:00 +0300
Message-Id: <20210817005507.1507580-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175521_862129_4CB558C5 
X-CRM114-Status: GOOD (  15.76  )
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

Further rework of power on/off handling. Move bt_en and sw_ctl handling
close to regulator enable/disable, so that this code can be easily
extended with pwrseq support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 126 +++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 60 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ad7e8cdc94f3..2d23e8a3ca14 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1590,7 +1590,6 @@ static int qca_power_on(struct hci_dev *hdev)
 	struct qca_serdev *qcadev;
 	struct qca_data *qca = hu->priv;
 	int ret;
-	bool sw_ctrl_state;
 
 	/* Non-serdev device usually is powered by external power
 	 * and don't need additional action in driver for power on
@@ -1602,29 +1601,15 @@ static int qca_power_on(struct hci_dev *hdev)
 	 * off the voltage regulator.
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	if (!qcadev->vregs_on) {
-		serdev_device_close(hu->serdev);
-		ret = qca_regulator_enable(qcadev);
-		if (ret)
-			return ret;
-
-		ret = serdev_device_open(hu->serdev);
-		if (ret) {
-			bt_dev_err(hu->hdev, "failed to open port");
-			return ret;
-		}
-	}
+	serdev_device_close(hu->serdev);
+	ret = qca_regulator_enable(qcadev);
+	if (ret)
+		return ret;
 
-	/* For wcn6750 need to enable gpio bt_en */
-	if (qcadev->bt_en) {
-		gpiod_set_value_cansleep(qcadev->bt_en, 0);
-		msleep(50);
-		gpiod_set_value_cansleep(qcadev->bt_en, 1);
-		msleep(150);
-		if (qcadev->sw_ctrl) {
-			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
-			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
-		}
+	ret = serdev_device_open(hu->serdev);
+	if (ret) {
+		bt_dev_err(hu->hdev, "failed to open port");
+		return ret;
 	}
 
 	if (qca_is_wcn399x(soc_type)) {
@@ -1856,7 +1841,6 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	struct qca_data *qca = hu->priv;
 	unsigned long flags;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
-	bool sw_ctrl_state;
 
 	/* From this point we go into power off state. But serial port is
 	 * still open, stop queueing the IBS data and flush all the buffered
@@ -1878,18 +1862,8 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	if (qca_is_wcn399x(soc_type)) {
 		host_set_baudrate(hu, 2400);
 		qca_send_power_pulse(hu, false);
-		qca_regulator_disable(qcadev);
-	} else if (soc_type == QCA_WCN6750) {
-		gpiod_set_value_cansleep(qcadev->bt_en, 0);
-		msleep(100);
-		qca_regulator_disable(qcadev);
-		if (qcadev->sw_ctrl) {
-			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
-			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
-		}
-	} else if (qcadev->bt_en) {
-		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
+	qca_regulator_disable(qcadev);
 
 	set_bit(QCA_BT_OFF, &qca->flags);
 }
@@ -1919,20 +1893,39 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 	int ret;
 
 	/* Already enabled */
-	if (qcadev->vregs_on)
-		return 0;
+	if (!qcadev->vregs_on) {
+		BT_DBG("enabling %d regulators)", qcadev->num_vregs);
 
-	BT_DBG("enabling %d regulators)", qcadev->num_vregs);
+		ret = regulator_bulk_enable(qcadev->num_vregs, qcadev->vreg_bulk);
+		if (ret)
+			return ret;
 
-	ret = regulator_bulk_enable(qcadev->num_vregs, qcadev->vreg_bulk);
-	if (ret)
-		return ret;
+		qcadev->vregs_on = true;
 
-	qcadev->vregs_on = true;
+		if (qca_is_wcn399x(qcadev->btsoc_type) ||
+		    qca_is_wcn6750(qcadev->btsoc_type)) {
+			ret = clk_prepare_enable(qcadev->susclk);
+			if (ret) {
+				regulator_bulk_disable(qcadev->num_vregs, qcadev->vreg_bulk);
+				return ret;
+			}
+		}
+	}
 
-	ret = clk_prepare_enable(qcadev->susclk);
-	if (ret)
-		qca_regulator_disable(qcadev);
+	/* For wcn6750 need to enable gpio bt_en */
+	if (qcadev->bt_en) {
+		gpiod_set_value_cansleep(qcadev->bt_en, 0);
+		msleep(50);
+		gpiod_set_value_cansleep(qcadev->bt_en, 1);
+		msleep(150);
+	}
+
+	if (qcadev->sw_ctrl) {
+		bool sw_ctrl_state;
+
+		sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
+		bt_dev_dbg(qcadev->serdev_hu.hdev, "SW_CTRL is %d", sw_ctrl_state);
+	}
 
 	return ret;
 }
@@ -1942,14 +1935,27 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	if (!qcadev)
 		return;
 
+	if (qcadev->bt_en) {
+		gpiod_set_value_cansleep(qcadev->bt_en, 0);
+		msleep(100);
+	}
+
 	/* Already disabled? */
-	if (!qcadev->vregs_on)
-		return;
+	if (qcadev->vregs_on) {
+		regulator_bulk_disable(qcadev->num_vregs, qcadev->vreg_bulk);
+		qcadev->vregs_on = false;
 
-	regulator_bulk_disable(qcadev->num_vregs, qcadev->vreg_bulk);
-	qcadev->vregs_on = false;
+		if (qca_is_wcn399x(qcadev->btsoc_type) ||
+		    qca_is_wcn6750(qcadev->btsoc_type))
+			clk_disable_unprepare(qcadev->susclk);
+	}
+
+	if (qcadev->sw_ctrl) {
+		bool sw_ctrl_state;
 
-	clk_disable_unprepare(qcadev->susclk);
+		sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
+		bt_dev_dbg(qcadev->serdev_hu.hdev, "SW_CTRL is %d", sw_ctrl_state);
+	}
 }
 
 static int qca_init_regulators(struct qca_serdev *qcadev, struct device *dev,
@@ -2018,17 +2024,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		qcadev->vregs_on = false;
-	}
 
-	qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
-			GPIOD_OUT_LOW);
-	if (!qcadev->bt_en) {
-		if (qca_is_wcn6750(data->soc_type)) {
-			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
-			power_ctrl_enabled = false;
-		} else if (!qca_is_wcn399x(data->soc_type)) {
-			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
-			power_ctrl_enabled = false;
+		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
+				GPIOD_OUT_LOW);
+		if (!qcadev->bt_en) {
+			if (qca_is_wcn6750(data->soc_type)) {
+				dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
+				power_ctrl_enabled = false;
+			} else if (!qca_is_wcn399x(data->soc_type)) {
+				dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
+				power_ctrl_enabled = false;
+			}
 		}
 	}
 
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
