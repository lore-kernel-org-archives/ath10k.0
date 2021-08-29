Return-Path: <SRS0=gUy0=NU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F35EC4320E
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B916023E
	for <ath10k@archiver.kernel.org>; Sun, 29 Aug 2021 13:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57B916023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV5sy41gg06RluN9oEaqUUmqaaAlD3JL291k5zdJ8Qc=; b=4s4I4ENxqpKvda
	PpJQbP/U0pxRexkyMeZMER83q3VQmhlu2GLEJLLbFRFmaOC2/u3xVtDAlvTSNelclumrYPWR4B7kw
	5Xwo7Q+M746SXEMyW6jdwMpXCc6gZWf7RWIik08kaRku5kGS97ou6h1kFeIhoBsGT948Qs08woX5/
	OYw7OUvxEDY91N+ZJnjf6e/FLZfTaYGLTCaNOkaXQJUabsBrquM+ObdvepQ1gduqTjKcZFUEISn1K
	wUZG7YdlfaAxTp4IWuXCdGELJO/XRv034RiwsZsbcYOi7OOC/KiyFaYeS0MXzRFlboudpjFvEV/Km
	151XPldkC5YHsi3Mg24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKKdp-00FXjg-IS; Sun, 29 Aug 2021 13:14:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKKcj-00FWvL-Pe
 for ath10k@lists.infradead.org; Sun, 29 Aug 2021 13:13:29 +0000
Received: by mail-lj1-x235.google.com with SMTP id w4so20667386ljh.13
 for <ath10k@lists.infradead.org>; Sun, 29 Aug 2021 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZOpdA3eYjpudg4OpQFFkH8jLHw3BxsNdxzTMff7kgw=;
 b=JYgvhRh/XMbWSmh2hHQ6low2HT/EK5Db15j4xEn196MVYAmhicQUPTkqK33Ygf5yJV
 rIzHsKI+Z3ckWJRnIUe8dzDewGj8MNiCcN3JIyjVk8xGm0jTD/fexByf4nfLDCRojILy
 /oSMgUZwtgSQTDfCyHKl3j2WvWHGMsledNkCtgxqqMzm9IvPQvg4CFrG2Jlfglgj36iX
 PooxcxfGHTuPO6c6gyEHfNmzBVsimJZLJTGHu6co+MuRlWDTVLxi4vVmD0a2oxg5N+8h
 2NOSABtA1NVG0Xv+u7omjq/8kK4obaak3LZh0U+Pdzi6pCOqwezV15LMpV08KYXIqDFE
 T49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZOpdA3eYjpudg4OpQFFkH8jLHw3BxsNdxzTMff7kgw=;
 b=gv9CQV9S5jO99/5ftiKSMZQBuZ3BDLV7bKTHr3qRvMzZFJtOKWMFkm916kLhB9hPRS
 u5myf2okNAziA2byBuCDeILuJ5eQZl5FInFkegHBp1iqgN30ORBnCJFfSipRUOL/z+IC
 ICvlmRgrs3vxm5gjmqE+wEtnuw0vC3K1j8z+FD0n+zGjK0aC6cItwxr7U0HKK3c4Fbik
 dgEu3lqTiDfDxhiJrJ5QMMzVfMmcCh/thunlWvImnzSBAXRTQVBlez6MI3TOqXeXJTmG
 QONBbfQqYOyXNRCzt+QkOObyRBmC3vNr/Dc3weLYG7L1+f/CipaNlpDeBMpDs4iL1p5w
 2OzQ==
X-Gm-Message-State: AOAM530tfsznrcc4ARbL988UX6pFzvpKBwiEY1GdjZ8czxX/n+DnjPqs
 HRMxJM6Pi6i4Dab9Bc7cXOdvWTHqAqFNiA==
X-Google-Smtp-Source: ABdhPJwN0RnHneAiBvwIuepF2POuNFYC+7soqzPBkiEXgB5t1sLpCiFezga+nEjbYoWJ71ExIPe4Iw==
X-Received: by 2002:a2e:b605:: with SMTP id r5mr16548450ljn.283.1630242800140; 
 Sun, 29 Aug 2021 06:13:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x13sm712503lfq.262.2021.08.29.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 06:13:19 -0700 (PDT)
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
Subject: [RFC v2 13/13] WIP: arm64: dts: qcom: qrb5165-rb5: add bus-pwrseq
 property to pcie0
Date: Sun, 29 Aug 2021 16:13:05 +0300
Message-Id: <20210829131305.534417-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_061321_897138_38276490 
X-CRM114-Status: UNSURE (   8.63  )
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
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
