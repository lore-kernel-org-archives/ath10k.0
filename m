Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BCCC3DA7D
	for <ath10k@archiver.kernel.org>; Sat, 31 Dec 2022 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M776Sm7WyRcQ2Y5YalVFU+TDWrMkii3a6UoQlUXD3mc=; b=lUJV3yr9bN/JWe
	rmlg4R4GvXffAHGcdcV+TVEqLLKxgeAx99AC4eN/Y5zvHhNuYh6kyTFgrAfLPGZOF1Sn/4icw7kPE
	ChnTU8nn17Eg700G1CuPFywfR4SQlcEx1U/hM+7CY+AeKQxRMSpzsVLn6eLGWzjTHFsOOhLSIB0W3
	jNSUYTMu+SACn43MIIiC6t4zfO+sXqyRMPyQQQ+VL4qK8WzsnP8sF95yjKmNzZNo6JE+M4UjUxcHI
	+v6SP8rix7zTroKqJvZifxCCSwO5q6YD729DEFQ5CbisUe6he4EZgT7xQ+Ng6ttcvOZzHUxw8cFkr
	xtSxn9SHgut84OmUK3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBceM-006JMS-HB; Sat, 31 Dec 2022 14:15:50 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBceI-006JL2-My
	for ath10k@lists.infradead.org; Sat, 31 Dec 2022 14:15:48 +0000
Received: by mail-qt1-x834.google.com with SMTP id s9so19077448qtx.6
        for <ath10k@lists.infradead.org>; Sat, 31 Dec 2022 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vtremblay.dev; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvI68Ain073cJBqV5XK8iLgG6FsTI4XXZou2TyNnIbs=;
        b=pQZ3yIe9PzdS8qkdO+tMkoLzpiaBl+lLQT2ceyJsG/A9tVISMdG/XEtK+l6Qq4UKsF
         tp350r7hiBzyqpXlrrtajb22we61GCyASZGgpIKN7BcaAmg03T/FuSqJkeL1rMJPHtoo
         zMyZx0DJegw5PnXp7eBk69AUphaU4UZ9CqQA5ik7xUIUWtZc2EjH1hNx8g/HtgkZBZNg
         0X5gCGAnhE1Y8LoeC84bIARgMU/DRuWqCMhZYfPG497RIbLjhUNN48pG/OB+y9E4Q9zt
         wl+gtWo1ETHzCDh2ddsGfdvWr0KN/A5ek14uSnBMOAFKoP8QAw1t8GP7CWKOQD5E6naW
         +qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvI68Ain073cJBqV5XK8iLgG6FsTI4XXZou2TyNnIbs=;
        b=Um7DK82OxhoffC5+Eyfr7U5fxKOeol7GzY95btj2hHSyfC6aa8KjYVr2jutU0mTC76
         N2GaP3CWUWWz3mKV/sKl21Qh+cnkJnny8/LTHugPmh3Nf/iCE9Qc3WoiFEh4MsEWYODT
         yuE2ECnaUgjm5gjmHwpf3tc7ENm7Y/nQyLQyr7iCfys98PVrvL/XImN7uz7oe5CbtG9z
         B0QRC77zgdv4gI8xAqSfc+zQprLrV5iwbBGJju5+lIDItGxC9foGOac9wE4jD+bjgZZO
         sQz96ioT4EJfMqffZ2fPlx8Bdu/9TUVx83jg8lSN29+PIBqw+FaIGPumyMlnir5+MWYs
         aZvg==
X-Gm-Message-State: AFqh2kpZjNX4mfGzyZ+gzRfzV8B69u//aSdELv++ICUzxD65r8PzC8F9
	0wyvTYBNsd+K6o5Sk3FcZZOnoCytA4aC3VW7jeE=
X-Google-Smtp-Source: AMrXdXsTzmQuBJ3Sl7shAKCmeV6CsIThxGBjt+7oHa7KBXrWZMu5fwoxQdngpKA8vCH/8h2iDj7wVA==
X-Received: by 2002:ac8:4793:0:b0:3a8:1c63:7603 with SMTP id k19-20020ac84793000000b003a81c637603mr50505029qtq.57.1672496144577;
        Sat, 31 Dec 2022 06:15:44 -0800 (PST)
Received: from vtremblay (modemcable190.194-177-173.mc.videotron.ca. [173.177.194.190])
        by smtp.gmail.com with ESMTPSA id o6-20020ac872c6000000b003a57a317c17sm14744633qtp.74.2022.12.31.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 06:15:44 -0800 (PST)
Date: Sat, 31 Dec 2022 09:15:41 -0500
From: Vincent Tremblay <vincent@vtremblay.dev>
To: ath10k@lists.infradead.org
Cc: vincent@vtremblay.dev
Subject: Re: [PATCH] dt-bindings: ath10k: fix qcom,coexist-support
 documentation
Message-ID: <Y7BEDRxhGlM+bUJO@vtremblay>
References: <20221231044752.3379895-1-vincent@vtremblay.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231044752.3379895-1-vincent@vtremblay.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_061546_880432_26529619 
X-CRM114-Status: GOOD (  23.91  )
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

On Fri, Dec 30, 2022 at 11:47:52PM -0500, Vincent Tremblay wrote:
> The driver is reading the value using the function
> "of_property_read_u8", which is expecting the data to be
> represented on 8 bits.
> 
> By default, the value specified in the DT is saved using a 32 bits
> format, which cause the driver to read "0" instead of "1".
> 
> To make the driver work properly, the DT should specify the right
> data representation to use.
> 
> Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 +++---
>  drivers/net/wireless/ath/ath10k/core.c                      | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index b61c2d5a0ff7..b71e97cb6c24 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -92,8 +92,8 @@ Optional properties:
>  - qcom,msa-fixed-perm: Boolean context flag to disable SCM call for statically
>  		       mapped msa region.
>  
> -- qcom,coexist-support : should contain eithr "0" or "1" to indicate coex
> -			 support by the hardware.
> +- qcom,coexist-support : should contain a 8 bits value representing either 
> +			 "0" or "1" to indicate coex support by the hardware.
>  - qcom,coexist-gpio-pin : gpio pin number  information to support coex
>  			  which will be used by wifi firmware.
>  
> @@ -176,7 +176,7 @@ wifi0: wifi@a000000 {
>  	qcom,msi_addr = <0x0b006040>;
>  	qcom,msi_base = <0x40>;
>  	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
> -	qcom,coexist-support = <1>;
> +	qcom,coexist-support = /bits/ 8 <1>;
>  	qcom,coexist-gpio-pin = <0x33>;
>  };
> -- 
> 2.37.2
>
The more I think about this, the more I think it is probably better to
change the code to read the "qcom,coexist-support" property as a u32
instead of a u8. This would simplify the DT syntax and make it easier to
write.

Please ignore this patch, I will create a new one to modify the driver.

Regards,
Vincent Tremblay

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
