Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF867C47DD9
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjayELEBRpKyDC00t4UYX7vYTmJ6xN+vTtkQ0ppenww=; b=zRKN3jswtZtvMrylX9wA9JvgOl
	pDZaFf9LQ3pmM+EcMz1xu/XVHb4OYA+CJPUJmp9OasJzAdiKnAH8LDiCnrLuhY+mNhsyBDR4/6Ftl
	A3h7zK3/5enw30hfgh3Gz7pMb26IPxUmwmOOmuEk0YHbkxCCQJCtIRu0nxdOJ799DnhXOeLye2IfY
	IT80YgcZOEp3rvde1p1LCwhuy7ZgQeEmFz+iHie6wNnYOCFVojbcU+AFwv9PXm14TYpAyEj/R9tiz
	jerE9XGmU3LfycwScMiPlAL8THWfo/s/4F2FPO4m77Nlgc9SIu55rSfKq45QUNnN4WSfSxciTrW65
	x9czOi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKX2-00000009cEU-1vtL;
	Wed, 28 Feb 2024 14:03:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKWw-00000009cB6-3KBr
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 14:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2917CE2195;
	Wed, 28 Feb 2024 14:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CDBC433C7;
	Wed, 28 Feb 2024 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709129008;
	bh=+29q9XzaWHOI+KXDSu5A9D/Iw9UMYbaTgyR8nbq20I4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DVtQg5dqjYxmDNhXd1PlqiQowWozLs8nLHUUZ9Kcg/3L+meJar1UQ2Yneuhe6h25N
	 OygDcReVGMLOzpc/p5LMSubHHZHNxdyLsLggaEoQgPdemlYoXgjV84xUmI8PDgifeI
	 EhlBr89wLuQQSP3/zZ9Zmj3QN+ZAsCoVHX7+nUl5MIvCtpzSmpLmAMG/frDFWkCOdk
	 CmkQNZf6D6NLQElejh1YTYZE12uvavAnVfX+ci+UEKVm2aBD13sT79oDK26D/H+qJK
	 vxtj3vR6L81P3xwRku6/NNOtONDVbsuJeRSggwNMkwv7ppei0RrKf8E3f7XF/hdgrw
	 3D5ayFU5ru/2w==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k
 <ath10k@lists.infradead.org>,  wireless <linux-wireless@vger.kernel.org>,
  DT <devicetree@vger.kernel.org>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
	<b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
Date: Wed, 28 Feb 2024 16:03:24 +0200
In-Reply-To: <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> (Marc
	Gonzalez's message of "Wed, 28 Feb 2024 14:24:12 +0100")
Message-ID: <871q8wk7o3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_060331_252213_AC38214A 
X-CRM114-Status: GOOD (  15.39  )
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

Marc Gonzalez <mgonzalez@freebox.fr> writes:

> The driver waits for this indicator before proceeding,
> yet some WCNSS firmwares apparently do not send it.
> On those devices, it seems safe to ignore the indicator,
> and continue loading the firmware.
>
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index 7758a55dd3286..145fa1a3c1c6a 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -121,6 +121,14 @@ properties:
>        Whether to skip executing an SCM call that reassigns the memory
>        region ownership.
>  
> +  qcom,no-msa-ready-indicator:
> +    type: boolean
> +    description:
> +      The driver waits for this indicator before proceeding,
> +      yet some WCNSS firmwares apparently do not send it.
> +      On those devices, it seems safe to ignore the indicator,
> +      and continue loading the firmware.

This sounds more like a firmware feature, not a hardware feature. What
about having a flag in enum ath10k_fw_features in firmware-2.bin?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

