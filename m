Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9543C52D70
	for <ath10k@archiver.kernel.org>; Mon,  5 Aug 2024 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSYGTPrpLH+BuhVL/Q/2E8uLKhl1KfRAsEdIshJ8Sjg=; b=eqaHmwo3rS0e471aSoZMGPSsre
	cdrY7vtTThUSSR4y1DT64hWT4e8E2V8km1UhP58uX1AY5BE6Hmo/y1CoyEixR73R64+Xv4w0pI8wA
	sd/vHowtqA5OQuE9/yRnBhGGwk4vLEPE3szpqLedy6UsBEgV4zk/Li0ZDwzkSdVORPIUsaB0VYzX8
	QxbN7sh0FrYX/YBxKnol2A3O/iW78m/ZB/szYqUqnzkblVMK2+YAqFTAtDloXFjlb3/ab9lVdGFWw
	m/Bgp9v/4cHuGVDjjzrYlRSiXi9vuX/6QtSa8lj0XSxw02Ou4OmCFK3E1K8z4bgs1kL6ii/FhViVQ
	WOzn6RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saua8-0000000FQdW-2vtp;
	Mon, 05 Aug 2024 10:04:48 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saua5-0000000FQco-3KI1
	for ath10k@lists.infradead.org;
	Mon, 05 Aug 2024 10:04:47 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e05e94a979eso4126351276.0
        for <ath10k@lists.infradead.org>; Mon, 05 Aug 2024 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722852284; x=1723457084; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hSYGTPrpLH+BuhVL/Q/2E8uLKhl1KfRAsEdIshJ8Sjg=;
        b=rzAJVzxEP/wzl6tl9s/EtOATF3TJuGPaWU2Hlshz8buTOQxk7nDLp+4nXIZF6/T6FI
         gYdtB3FTvKJ9NBboNHxLLZipDv6GXKKwI/WXk9jutGSRhM3i3FuHCnYm155rrebgLKrG
         cju0LBaMlYsFSWikvBBkWEY27uCPE/a2xbrOf9MNdiY/EmIubdOgpgGO3Oxb10is9qjn
         hlhq3a6lJ/JWxdmWNrmnRP1P8BrwhTiWGN1bzD0xyMDWVYTIXz1ErYcU/JiYd0co6Esj
         Fkym9BDLB6DMh6RPSoz6/rDR5zTnSidgrkUWeqnsbigp+wARx1Eqk5zmH3puvVlmONDI
         Z5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852284; x=1723457084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSYGTPrpLH+BuhVL/Q/2E8uLKhl1KfRAsEdIshJ8Sjg=;
        b=SAXMq/t9xTIUY2riBRGEOvdgew0MFfwPAweQhJc1Y87xBfOqjJ0JXyLm6v/SNZsZQr
         UM9welL8CWgSDgePpGZh37wkwacy2GQPxcETONd86cyypOA+lMQRq1XBmvueOU7JM5QW
         LpF3y9a3a6xb1nzo8uCOy2w5fJcvm/WyI61/1C17sFt895mQTFgKoRiwzBuMsTSUU9+y
         2GHNI1dtmt+nBVqiOoVLm3fz+ZCkzXGs/J3bybsazNIuw9qql51mGXNgWjQ1v1BM+Hlk
         qQ5oFFHK5hYeCD4Q6B+KnLbuXq0ILjpgizstS2C3lMIhYaV7LBdn5FpVa0fyO6a/Rn+2
         dfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4gv7dl/SLbty2kD+YWDsUg+QaT2a8touNva9gUGJm7PEunoiLNHP2v8pcKvqswBaLmQW9jeMHkPkfeIqq7P2AIPHhSTUjJ56J3w==
X-Gm-Message-State: AOJu0Yx8DPi51fNhjTuuEz2g/7fv50h8S/L7wbYI8HgfPjh+laPGSqI2
	ylTFqghDWdQR8QXR1XmCY7hgl+FxT8dS5SGaabQsrFQwTfsg/VcwrJAd6WxiYftvkGF374NRZuY
	vMbjLteAVYS7od47v5nL247hQIQpHRXYbrlfu6A==
X-Google-Smtp-Source: AGHT+IE28QvjYWO5xF3nlYl96xgvVqGoKpL4LpWlRu2pROebD4A3WQjuKfY14W5cvKLlfjChMzAEUCdDmxnejwKRHho=
X-Received: by 2002:a05:6902:2b0d:b0:e0b:bf20:4fdd with SMTP id
 3f1490d57ef6-e0bde8ee6f3mr10631170276.1.1722852284031; Mon, 05 Aug 2024
 03:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240805040131.450412-1-felix@kaechele.ca> <20240805040131.450412-2-felix@kaechele.ca>
In-Reply-To: <20240805040131.450412-2-felix@kaechele.ca>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Aug 2024 12:04:07 +0200
Message-ID: <CAPDyKFqyRevbmPy6h8BsiTLBi6=J+9uRmSib43bzzZHFEmDSVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] mmc: sdio: add Qualcomm QCA9379-3 SDIO id
To: Felix Kaechele <felix@kaechele.ca>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_030445_855834_1925C0A5 
X-CRM114-Status: GOOD (  12.75  )
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

On Mon, 5 Aug 2024 at 06:01, Felix Kaechele <felix@kaechele.ca> wrote:
>
> Adds the id for Qualcomm QCA9379-3 SDIO based cards such as
> the LITEON WCBN3510A and Silex SX-SDMAC2.
>
> Signed-off-by: Felix Kaechele <felix@kaechele.ca>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  include/linux/mmc/sdio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
> index 7cddfdac2f57..63000a8f4b13 100644
> --- a/include/linux/mmc/sdio_ids.h
> +++ b/include/linux/mmc/sdio_ids.h
> @@ -52,6 +52,7 @@
>  #define SDIO_DEVICE_ID_ATHEROS_AR6004_19       0x0419
>  #define SDIO_DEVICE_ID_ATHEROS_AR6005          0x050A
>  #define SDIO_DEVICE_ID_ATHEROS_QCA9377         0x0701
> +#define SDIO_DEVICE_ID_ATHEROS_QCA9379         0x0801
>
>  #define SDIO_VENDOR_ID_BROADCOM                        0x02d0
>  #define SDIO_DEVICE_ID_BROADCOM_NINTENDO_WII   0x044b
> --
> 2.45.2
>

