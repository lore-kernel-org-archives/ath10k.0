Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC31C4338F
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFDF60E76
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AFDF60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daukDVHBhM4ymves6UCw0EoLgeXyH9WQxDzIarvMnDc=; b=f1DfSyYuqu5oME
	lmw/2qEQLVKrqfwAf3cXrTBqNEzIH6UGalCYgoidq5JjPtW18lsg+wGyDKOlktEM1pcGM2E1OorWy
	UKdRAiumfadz9oZEN0Yee5Z/nHz7K8XzsYAA0udd7cz+WJcIT89JZRcyo3WZ/xKKBQwXVdLFfxO5J
	mCwQfdwjgztID25nGW7Dav5QTWtL8YJDPxqVqJR8VydG3GcOuhocHrV8qwyfFnKF7BvaVWJ3U+j/A
	/Yu6XhXfcYqHl6vpFkz1Q8i4gkqv4AJ2BLW4NntG3T0+19urhEgkXrJ6WohcsnJyPFJqDJHIeF8BL
	FpjFeGWXap1/AxAeAf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnPh-000dNW-TY; Tue, 17 Aug 2021 00:57:10 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnO3-000cDr-3g
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:31 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g13so37976216lfj.12
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pgxc5wTtAPJJ0DGyppg9xAOqF0AZtpwhIIHZ/fU+CFw=;
 b=HwDbiofct0TMB65omGXGchoWcB9pqFmXgylYFqrV+IPCkhhIk+Lc+xUFVyK+iwexVh
 BaN/elu+aEntGCLUZUMK9LwbqVepb8vBqq3+KkGl5eq8ph6kQo8uBRg3iNbL9p8MQDRk
 AGUcbP/cOzbyQR0fSHRxKQKuYlF8U3Tqb0kDQ0693qSsC1JRhX7XsgaFSljyZZND0yDD
 daJBvqi3qdAEnp9q9MoUaMSI4eshxddlIFStgVVccRzTIoWvtzhSNPzZkYDrQNyIV1sk
 5uteB81rUcjsgWOQpQlN8qjpaUmFXIbrjX4RVsaLWEcCoZJ7LnZpbhjwzWkAm3w2ipSa
 fPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pgxc5wTtAPJJ0DGyppg9xAOqF0AZtpwhIIHZ/fU+CFw=;
 b=PcGWgWD9Y8mk9F7xjpXa9w/R3GEfGVasIZ2kL03yFu64kOznTO3dcIPOU9HLwmBPWM
 b88MKBRlEzRwkaVibUQx84MM0spT/WHbv786Oa3WKVJwcD/QbA5UiH0CgEd18WPWxtDj
 lG9MFl8DDHxN52+H3EEPJDvmEifPeE7f2gaMWQ5wzd2hMfm6TE5NPfPyUwsF7C7gTmnF
 +Nb6G9YXmTCYzhWJYzwVFTX+F87zUg4jOiSil89gCm6Adm3MrH7FqyrmHfo0qlPbVieC
 /ggLxEXtrXjRRiBXihMDJHfT3SM9NFS/eyVcINSIhD3ByD27nmbZSLun/exhmGLkJSpi
 YJuA==
X-Gm-Message-State: AOAM530q7DvNm9V3G8uWF3V4MR8tswyKKPm1rDB5FPx2g50R/0+ttKX8
 1TsmhA7Oq62DuqVrQveRp2MQaA==
X-Google-Smtp-Source: ABdhPJxyuF7Jousa0ekVBo+HPfYk8A5Rq4PfYVTtE7a4QI12mfqo2ijMQkjYqeBcThS28ycqDu/ONA==
X-Received: by 2002:a05:6512:3a83:: with SMTP id
 q3mr420518lfu.28.1629161725069; 
 Mon, 16 Aug 2021 17:55:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
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
Subject: [RFC PATCH 15/15] WIP: arm64: dts: qcom: qrb5165-rb5: add bus-pwrseq
 property to pcie0
Date: Tue, 17 Aug 2021 03:55:07 +0300
Message-Id: <20210817005507.1507580-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175527_224529_9A7BB762 
X-CRM114-Status: UNSURE (   8.85  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 326330f528fc..0c347cb6f8e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -689,6 +689,7 @@ wifi-therm@1 {
 
 &pcie0 {
 	status = "okay";
+	bus-pwrseq = <&qca_pwrseq 0>;
 };
 
 &pcie0_phy {
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
