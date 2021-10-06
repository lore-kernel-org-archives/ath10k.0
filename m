Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E16C433FE
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4073D611C1
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4073D611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7XNgOZ0+5lTIbfUjtdp9wX+uh5w1A24kt4wV4qa+pFo=; b=VvWqOM9y0yenqn
	nuVmJUYyxJGO6S65PtJADj6l5DL8zcWAQymge06umonIqN/cbM/duJLTozA8vceNQI2f1pLcPpa/k
	gaLiUSzRfd+WIx3pwgeHwzQVgWBGEatOQEazjTUsq7NpU+4B+D4vQaZZUr6vfJ7VrkbWVBNXbC27Y
	U6hU8UGim06Rgng6TwQTD5wkYKy1PDVF9ONY3hBG8sku7+moEttzzjzBMuA9TG7x6pzFJHhEoUBS+
	lY9JAerN9+TP+fYBmnt/qnuIxFz0Te9JDKk6KG+sUO7Tco4psSbyFyD2lLWdscbrRR4z41htH3vLK
	oa1GqnmRhNe24YX0UlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy0W-00ChvX-0g; Wed, 06 Oct 2021 03:54:16 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0S-00ChuV-Qz
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:14 +0000
Received: by mail-lf1-x132.google.com with SMTP id t9so4631794lfd.1
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCCx9f0vU16fSdLBhKBfZ5+A5fVVaqTGyNcvLThJsng=;
 b=zX3kiQrgVD4tpCNxddaJIVuuZr83i4g79u+zwZciJ77tUFwMh3CYloNfFJQLdYRPNN
 9TyzfJxsklBDvCzSMoS7/jD6FZTPsXfgaQJEALQMGbwasZVOOApUh+YcFz/B3/tiqTL3
 eXF8DTyXAcLwVaCircGD2OYyT66dx6HqGlS9glAh8PR8QSu5T00/1N99gOgovQYU+HyQ
 OnQGFx4mKlyIptzEkXQ74qIX6k0Gs1XV5vgMKRDExo/OlTpWFMPDf8NNDUrPdTUqYzHw
 pb0VnYqIB/bHUt0QOdiyLMFzQjv6z98jVYbLnPO/Diris3Az5EsHfwsZ7pGSBMxKJgm8
 X+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCCx9f0vU16fSdLBhKBfZ5+A5fVVaqTGyNcvLThJsng=;
 b=fZ+LghLIPTCk8s5E2Meomiw8Ok5WZsGIjaFW2oR7KKtRpZK/wNJpsAMDV34oYpBnTv
 lSKP+lsGr9/FsABKYwLkOnV524/X/1GDmXm0azd5tZEgKwszCr3iyodIeKYqBzi4Fo4b
 C1oG5NLAXZFGXnSjKLIpy4zlfnXktGn+Eg3sVH3w8N3s9FPM9RBicDSR96wXlgcn2ysE
 Bkdl8eCdhwGSwMgm+GpRJfPrG5CVWBOiDZkTeynzA1nYoVJJSI2EemO3ZmGF1pzboYjs
 xgZEMmf8oJ5hP/qP/tXG1tpSLyLV7AwhkBC9m5W9SCftrWpYVHcMXQyzLqS3Bq1ePIJs
 W9eg==
X-Gm-Message-State: AOAM532WzD1njBVprLpUJqtNqWXt+tBlesx5LnVs3Y0rn07ty8sYN/oF
 GVC3Npm6x2tTwJ/mfuzuNb80dw==
X-Google-Smtp-Source: ABdhPJzPZd/pHGI4jIrZHD3KVL2DcSrVWuPmq+ruK4twP5QWTbb7x2llr5UqxIb5QV/vVHrqtwge4Q==
X-Received: by 2002:a05:6512:553:: with SMTP id
 h19mr7453728lfl.7.1633492451130; 
 Tue, 05 Oct 2021 20:54:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:10 -0700 (PDT)
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
Subject: [PATCH v1 00/15] create power sequencing subsystem
Date: Wed,  6 Oct 2021 06:53:52 +0300
Message-Id: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205412_930012_FB9540B3 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

This is a proposed power sequencer subsystem. This is a
generification of the MMC pwrseq code. The subsystem tries to abstract
the idea of complex power-up/power-down/reset of the devices.

The primary set of devices that promted me to create this patchset is
the Qualcomm BT+WiFi family of chips. They reside on serial+platform
or serial + SDIO interfaces (older generations) or on serial+PCIe (newer
generations).  They require a set of external voltage regulators to be
powered on and (some of them) have separate WiFi and Bluetooth enable
GPIOs.

The major drawback for now is the lack of proper PCIe integration
At this moment support for PCIe is hacked up to be able to test the
PCIe part of qca6390. Proper PCIe support would require automatically
powering up the devices before the scan basing on the proper device
structure in the device tree. This two last patches are noted as WIP and
are included into the patchset for the purpose of testing WiFi on newer
chips (like qca6390/qca6391).

Changes since RFC v2:
 - Add documentation for the pwrseq code. Document data structures,
   macros and exported functions.
 - Export of_pwrseq_xlate_onecell()
 - Add separate pwrseq_set_drvdata() function to follow the typical API
   design
 - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
 - Moved code to handle old mmc-pwrseq binding to the MMC patch
 - Split of_pwrseq_xlate_onecell() support to a separate patch

Changes since RFC v1:
 - Provider pwrseq fallback support
 - Implement fallback support in pwrseq_qca.
 - Mmove susclk handling to pwrseq_qca.
 - Significantly simplify hci_qca.c changes, by dropping all legacy
   code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
   parts of the chip.




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
