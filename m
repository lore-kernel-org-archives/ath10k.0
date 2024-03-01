Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FDC5478C
	for <ath10k@archiver.kernel.org>; Fri,  1 Mar 2024 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eCFlHdIvNvfrRhZX8RsRh0OFIGsCFWMFdLP70FLjRs=; b=V9Bc+VnnV1gCvYKvf3Gzi+eM4x
	9UNcK99ddUBDLk3YKXG3ZHH1hDPPZvnDqFt0lnFGT6HCN/ejgg2Whl+82sMeJsm4QwJ7VVzEK5IkE
	+/Sjbd1EfkOjhlHeNALWs7uXWto4Uh/2VGKTzz/oSva55UhoZfTtwlQNyNYmhJEYCotPRiKkf8wtQ
	I9DKdxGF8sgbmTDkMBEnq4cUq5f6u01EFhKxDDmY2ItrpDyxMKGcs/Z2wxoFm7orRmxsFF08q1aES
	0TeRcyEPwvrLijLAJbB0mJkdYp9KQxjYhNB12RkOWuaCZau/mZTSRGK1iRm2qzTsbaL5uaWn5IwfS
	qDX7yBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfxpe-0000000Gp3M-3umD;
	Fri, 01 Mar 2024 08:01:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfxpb-0000000Gp1Y-3ohC
	for ath10k@lists.infradead.org;
	Fri, 01 Mar 2024 08:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DA6261647;
	Fri,  1 Mar 2024 08:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06746C433C7;
	Fri,  1 Mar 2024 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709280082;
	bh=jMRWjjBb3WoG96heiGE+SbBHlPWqedM9ZSLpfueiMU8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NYXOROiiPwwVhYxx1fbNDxcpy1ncuwsxP3IJmfH3QY4e9lqXC5mcmHEFwLekftNje
	 HdPvpXFl6MuYkRR+Dfj6GtbgTEKlYB9UH3l/RbRuSX/0okn+jTeVDtHyODc8LX/3Gd
	 AMQelHir1f7Nh0yNghqmyI1UhM6pXRNUEqQPlumhjtthx8wh8D2LDcu0etWNaUhNnc
	 h/PYPpr43thxVRBRjuPZ0DgbPuDlNfDGqOdclU4s6Ikxm3oOULyAMLohqdtohzALz/
	 Yjb8O3lflw7vPwKeej6m09O5t2iFHNoHj8yLsi6swrrIwx6xZXLk/NUgtli0Yob3zp
	 GbGLT+UfGyS7A==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] wifi: ath10k: support board-specific firmware
 overrides
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
	<20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org>
Date: Fri, 01 Mar 2024 10:01:17 +0200
In-Reply-To: <20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org>
	(Dmitry Baryshkov's message of "Tue, 30 Jan 2024 18:38:38 +0200")
Message-ID: <87h6hq8joy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_000124_060048_558B1C17 
X-CRM114-Status: GOOD (  18.89  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Different Qualcomm platforms using WCN3990 WiFI chip use SoC-specific
> firmware versions with different features. For example firmware for
> SDM845 doesn't use single-chan-info-per-channel feature, while firmware
> for QRB2210 / QRB4210 requires that feature. Allow board DT files to
> override the subdir of the fw dir used to lookup the firmware-N.bin file
> decribing corresponding WiFi firmware.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Sorry for the delay, too many drivers... But this looks good to me, few
small comments.

In the commit message it would it would be good to have an example of
the new firmware path. And also mention that board file (board-2.bin)
handling is not affected, at least that's how understood from reading
the code.

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -942,11 +942,20 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
>  	if (dir == NULL)
>  		dir = ".";
>  
> +	if (ar->board_name) {
> +		snprintf(filename, sizeof(filename), "%s/%s/%s",
> +			 dir, ar->board_name, file);
> +		ret = firmware_request_nowarn(&fw, filename, ar->dev);
> +		ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
> +			   filename, ret);
> +		if (!ret)
> +			return fw;
> +	}

So here you test if ar->board_name is NULL.

> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1337,6 +1337,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
>  	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>  	struct device *dev = &ar_snoc->dev->dev;
>  
> +	/* ignore errors, default to empty string */
> +	of_property_read_string(dev->of_node, "firmware-name", &ar->board_name);

What do you mean with empty string in this case, "\n" (with length of 1)
or NULL? Should we also test for strlen(0) in ath10k_fetch_fw_file()?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

