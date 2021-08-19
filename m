Return-Path: <SRS0=eXlr=NK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB8BC4338F
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0EB60E78
	for <ath10k@archiver.kernel.org>; Thu, 19 Aug 2021 23:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A0EB60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t9U5t5hT5xNNBvqU1yuxpjxEs5bbxPsIyHBx+frlsc=; b=2MVz+ZaATDLGOV
	G7uM+UDisFPKuFY3KRYJTFVBPiTZ4rvFf7PtiAIgJv3OE7Dx1/R0V1K62WzMGrGmF5VdXuJHnhwlb
	P1iyX/CMr3rvwYV6iXRq1Zx/um8hHi1K4EmTC5GGZw5vOQW/d0fGIDRzsXFItDgLL6qykMcQoEVSS
	YMMb8IZcCq1yJHa2BLhIhJSuYhdMAgmWc2SOUaXMnxAeijjuo12s1m7Zavk3hB63WYQ9vATy2uAzC
	7B25GxlxhMhmbuLibBYScr0/Ept7yvtNTG0RDG0Nn9Z4FGxTn+zB2bQO9fKT2nuIFFaj03HTxx1V4
	/PzlYOfq6KCvQ4u7qIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGrcX-009l9f-OC; Thu, 19 Aug 2021 23:38:49 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGrcS-009l8o-Br
 for ath10k@lists.infradead.org; Thu, 19 Aug 2021 23:38:48 +0000
Received: by mail-oi1-x22e.google.com with SMTP id n27so10853896oij.0
 for <ath10k@lists.infradead.org>; Thu, 19 Aug 2021 16:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xct87dPQUKJVUu3N8FqHnD1YvrlqEBt4s0ORd5SdpdM=;
 b=eudFGYTfZ16z1QhF2vBkVkOEGuyji6cJHYfDN+vaWhHK9+rd5vH14VbxAFS+2eC/Oa
 4Ba8R/88FJ/OPWCZCtBMsieEh/pm7qtYFwo0TirY0lTm7yCkB4ikLG4icFgNZa27zUvD
 BJBWXenoc7pm9fKQWpviuAKcgL8Df47rbgz6yQURrhmHOtRSecJ10uQ/D9jJoKjchcaT
 N88vkjjFz7L88TbHiR07A5xpRDrDWzx7jyyWYQNuz4UGLkZj+Y+eCNAqTYc3PrKVQ9mE
 uxtGqO5cni67yc6BYcRmxcxcBMWHGdqV0DZH4RZws/7uEVXHrYjTkJDfXhbO+YTxMWd0
 nkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xct87dPQUKJVUu3N8FqHnD1YvrlqEBt4s0ORd5SdpdM=;
 b=qj+UDIC8KKQTwTnESX0miQrsbmmy+xdxaemvS8pIfaX6CkEZBE7dolKxXToTiwTgFE
 3+7zfmcb54VeZahckbkX1QPlubSTpXbJFb1bGySoVkEY4ehlpeEOFB9n5Gkhk5lvWsvn
 q9aA1h4+gEu6kfGu8lVsU7fJ1Bwmw0KoylTSErNEkXR0tSbWLBv1VRxrxo1J9dlYnt5a
 c78Wp+VoWmiB1m5fzbP50r71CBGRmd15Rzi7iuGTxHw8E/oFyc64DNtQT4PnbWpLX8in
 dyCo+8Rv8UvBTVrVJoRccOn2MWNCW7Jzne2LaQhJhyTv6n9oHPivb12AYoThXTRMMu4h
 nbbQ==
X-Gm-Message-State: AOAM531tKQSAFJuQKRqAAPUUNFiyJhpm9/Mp57tRBIxh7q7LwpunupgE
 ZzkPLOAJx4XqK4H2vnyzuw0C3g==
X-Google-Smtp-Source: ABdhPJwkOK+fwhCjDa07/ZAhRRmQGSXN+VsHKhGQP49+rc5kMdF59S4PHF0J6u327Ln2bdc4Y0LlgA==
X-Received: by 2002:a05:6808:1494:: with SMTP id
 e20mr861952oiw.111.1629416323497; 
 Thu, 19 Aug 2021 16:38:43 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id j2sm999557oia.21.2021.08.19.16.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:38:43 -0700 (PDT)
Date: Thu, 19 Aug 2021 16:40:06 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [RFC PATCH 11/15] arm64: dts: qcom: sdm845-db845c: switch
 bt+wifi to qca power sequencer
Message-ID: <YR7r1sWrLR18vGzr@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817005507.1507580-12-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_163844_450975_AB0098AA 
X-CRM114-Status: GOOD (  15.29  )
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

On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:

> Switch sdm845-db845c device tree to use new power sequencer driver
> rather than separate regulators.
> 

LGTM!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 21 ++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       |  6 ++++++
>  2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 2d5533dd4ec2..c9b694e934d4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -629,6 +629,16 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&qca_pwrseq {
> +	status = "okay";
> +
> +	vddio-supply = <&vreg_s4a_1p8>;
> +
> +	vddxo-supply = <&vreg_l7a_1p8>;
> +	vddrfa-supply = <&vreg_l17a_1p3>;
> +	vddch0-supply = <&vreg_l25a_3p3>;
> +};
> +
>  &sdhc_2 {
>  	status = "okay";
>  
> @@ -916,10 +926,8 @@ &uart6 {
>  	bluetooth {
>  		compatible = "qcom,wcn3990-bt";
>  
> -		vddio-supply = <&vreg_s4a_1p8>;
> -		vddxo-supply = <&vreg_l7a_1p8>;
> -		vddrf-supply = <&vreg_l17a_1p3>;
> -		vddch0-supply = <&vreg_l25a_3p3>;
> +		bt-pwrseq = <&qca_pwrseq 1>;

I suppose there will be a DT binding and some defines for the WiFi/BT
argument to &qca_pwrseq?

Regards,
Bjorn

> +
>  		max-speed = <3200000>;
>  	};
>  };
> @@ -1036,9 +1044,8 @@ &wifi {
>  	status = "okay";
>  
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> -	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> -	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> -	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +
> +	wifi-pwrseq = <&qca_pwrseq 0>;
>  
>  	qcom,snoc-host-cap-8bit-quirk;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0a86fe71a66d..78e889b2c8dd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1051,6 +1051,12 @@ psci {
>  		method = "smc";
>  	};
>  
> +	qca_pwrseq: qca-pwrseq {
> +		compatible = "qcom,wcn3990-pwrseq";
> +		#pwrseq-cells = <1>;
> +		status = "disabled";
> +	};
> +
>  	soc: soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -- 
> 2.30.2
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
