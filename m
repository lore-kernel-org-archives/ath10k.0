Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E07DC4320A
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98D960295
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D98D960295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNSmrjjnUK0VS82upz7U0Ko4m/njvIKhJDVnDavzQOY=; b=xvmJPppFfDhAeZ
	v8CjlpEAby0g91V/3ovAuzyF5GmCFzIREM1ndj2U61OHTz/cKazLGhye1qiRdPd3YGSOJrMTdt3ck
	FGrGBfQGXt3xEpCXD5mt0TEgUaW6F8XpFHFxHgNgf7cL0mdsg62QDLlgmeFAjI77e9n8KW846PTm5
	eqou7GlaYAJYnkpAOW1aevLLgQpT2BJq7Sw5DI+9LHPOVIAV4x8kjs3GSXdLgcVl54wi/4qnq9vcs
	PQASLwttUGv2pmTs9NvZ5h06Cwls44zZw6dl0ZCc2jAihzaDNayfQcqVVAr1/Qe1vcKyrmtQKQoWr
	CzQUj3jYZKRCOkgRhQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnOM-000cPJ-78; Tue, 17 Aug 2021 00:55:46 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnNw-000cAx-Up
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id z2so38112534lft.1
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8xXh4uAYLmC7B9Fj6XTx3aEzPEiY8DHDrOWM6RLdAY=;
 b=XT63hjpTOqal34rG4WIVTZFSl+hNwylMZJ6S2NC8YTo9uxqLGQKO6SvPZQBQbcNhjB
 u8LEZMD4oFHnetVUjrHH0NqAeNbv1CgPOo4zlrPobiGRBJX0qAQ11Oy2FqrT720M9934
 C+Vy4UecnQKRS6gyDDrnXlxbicjJxVLKtQyNqEGfxxcgcg9cr+UWCDGUrWFZq2bWUkuW
 x9bYMO+fSsZhwvzSDGTtzGG979snI6EXtQHYLXsiyQZgelrJQUvmGxST9h5uszdIilKj
 uKaaFsBEe/djtWOHnWt5p17myYUs0gmn6eOMOKlJaVb1XV0Ko6nxYbe3qpxrY/T3FgC5
 tYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/8xXh4uAYLmC7B9Fj6XTx3aEzPEiY8DHDrOWM6RLdAY=;
 b=Dyi8gP15qXq3sxK+d8X2p9BFa+yRo5mKym7JmVKnaUR67lWQfcqP8EQhwtztoVc8VJ
 xYaxadhWWK2i8FmUKnXq9MjpX7ucAOc5SY/oa9JofiHc8FtfHpuh4gdpg09wPFB7Oh2+
 l14cb0nJzjVtjeGFFVi/dgRDqNm8kh04Nft1XJ+c8o/4abHPzaA76exlQmJqShvWiwMe
 ikTtbAuGKQdiR+4G9MJHALxvPWf5AGFUZaia6R2Bk2PuQ0qWkn2MHyGP05fhLy6dn++j
 jzs3RkVJUIecrG+3i33ew+8BKbd1KNHoprFTRbfp3C8ZekM9AIRdFTvBDbFS8bthchb+
 8J+g==
X-Gm-Message-State: AOAM53044N74xvBpbB7Tw7iSHH6+AUsf+omcbAor8s0rS6vYAcg6IoDi
 2cH7iYtBNtME9jh8SWiUBqE3eg==
X-Google-Smtp-Source: ABdhPJyZ0zGdRSpfLJNcqsKT1e5xL6W6PntlPXhz2BykpLrQMBmSIjUKGP66GrGiWhrsFuR+5YQ2RA==
X-Received: by 2002:a05:6512:3041:: with SMTP id
 b1mr414095lfb.122.1629161719017; 
 Mon, 16 Aug 2021 17:55:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:18 -0700 (PDT)
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
Subject: [RFC PATCH 07/15] Bluetooth: hci_qca: merge qca_power_on with
 qca_regulators_init
Date: Tue, 17 Aug 2021 03:54:59 +0300
Message-Id: <20210817005507.1507580-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175521_066436_FABFC305 
X-CRM114-Status: GOOD (  16.62  )
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

With wcn6750 support added, regulator-based code was extended with the
bt_en gpio support. Now there is no need to keep regulator and
non-regulator code paths separate. Merge both code paths.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 64 ++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 279b802f0952..ad7e8cdc94f3 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1583,13 +1583,21 @@ static bool qca_prevent_wake(struct hci_dev *hdev)
 	return !wakeup;
 }
 
-static int qca_regulator_init(struct hci_uart *hu)
+static int qca_power_on(struct hci_dev *hdev)
 {
+	struct hci_uart *hu = hci_get_drvdata(hdev);
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	struct qca_serdev *qcadev;
+	struct qca_data *qca = hu->priv;
 	int ret;
 	bool sw_ctrl_state;
 
+	/* Non-serdev device usually is powered by external power
+	 * and don't need additional action in driver for power on
+	 */
+	if (!hu->serdev)
+		return 0;
+
 	/* Check for vregs status, may be hci down has turned
 	 * off the voltage regulator.
 	 */
@@ -1607,27 +1615,29 @@ static int qca_regulator_init(struct hci_uart *hu)
 		}
 	}
 
-	if (qca_is_wcn399x(soc_type)) {
-		/* Forcefully enable wcn399x to enter in to boot mode. */
-		host_set_baudrate(hu, 2400);
-		ret = qca_send_power_pulse(hu, false);
-		if (ret)
-			return ret;
-	}
-
 	/* For wcn6750 need to enable gpio bt_en */
 	if (qcadev->bt_en) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(50);
 		gpiod_set_value_cansleep(qcadev->bt_en, 1);
-		msleep(50);
+		msleep(150);
 		if (qcadev->sw_ctrl) {
 			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
 			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
 		}
 	}
 
-	qca_set_speed(hu, QCA_INIT_SPEED);
+	if (qca_is_wcn399x(soc_type)) {
+		/* Forcefully enable wcn399x to enter in to boot mode. */
+		host_set_baudrate(hu, 2400);
+		ret = qca_send_power_pulse(hu, false);
+		if (ret)
+			return ret;
+	}
+
+	if (qca_is_wcn399x(soc_type) ||
+	    qca_is_wcn6750(soc_type))
+		qca_set_speed(hu, QCA_INIT_SPEED);
 
 	if (qca_is_wcn399x(soc_type)) {
 		ret = qca_send_power_pulse(hu, true);
@@ -1647,38 +1657,12 @@ static int qca_regulator_init(struct hci_uart *hu)
 		return ret;
 	}
 
-	hci_uart_set_flow_control(hu, false);
-
-	return 0;
-}
-
-static int qca_power_on(struct hci_dev *hdev)
-{
-	struct hci_uart *hu = hci_get_drvdata(hdev);
-	enum qca_btsoc_type soc_type = qca_soc_type(hu);
-	struct qca_serdev *qcadev;
-	struct qca_data *qca = hu->priv;
-	int ret = 0;
-
-	/* Non-serdev device usually is powered by external power
-	 * and don't need additional action in driver for power on
-	 */
-	if (!hu->serdev)
-		return 0;
-
 	if (qca_is_wcn399x(soc_type) ||
-	    qca_is_wcn6750(soc_type)) {
-		ret = qca_regulator_init(hu);
-	} else {
-		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (qcadev->bt_en) {
-			gpiod_set_value_cansleep(qcadev->bt_en, 1);
-			/* Controller needs time to bootup. */
-			msleep(150);
-		}
-	}
+	    qca_is_wcn6750(soc_type))
+		hci_uart_set_flow_control(hu, false);
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
+
 	return ret;
 }
 
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
