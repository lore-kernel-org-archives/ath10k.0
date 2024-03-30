Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F6BC6FD1F
	for <ath10k@archiver.kernel.org>; Sat, 30 Mar 2024 04:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqKtRTcCfUHDOcX0tKilt4xKnfEps6Hgq5SW6oavRVg=; b=kfifdeZEtoE3cbiRVMALiwgU1s
	dt+p8pFogMuG/GPGnF8eJ+u0qkXLLgumLs3mcEsf37vukx9rMSVyteL0XwBrrAvdOKuFXmiP9j+0t
	rmd4DuhnwExm+SqXdrAf+zfr12bQXFaTC7CVxBKvfoFpAWQt6eRnZ2h+/NHOwkwtAuxVU4QONslT4
	DsJ/8geMqnCb+uE9nfLZ6kYpCjuVXIsEXbq/z1UNUMjKYkRNlUMRkLs1EbR1LL3kADanucjJpRa6y
	DiYJNcyBJQKikyXraLujsHLHJzrjCsTvXDSjgnYihgLu6/Mo8MV0jt91Q/m3Pehx3Jc1GtOwNp1N3
	RbPKbNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqQe9-00000002n6g-2EQe;
	Sat, 30 Mar 2024 04:48:49 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqQe6-00000002n5u-3tP0
	for ath10k@lists.infradead.org;
	Sat, 30 Mar 2024 04:48:48 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dcc71031680so2500617276.2
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711774126; x=1712378926; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JqKtRTcCfUHDOcX0tKilt4xKnfEps6Hgq5SW6oavRVg=;
        b=wyxT7vBpUkGaijWXnQltO2usFSGtSTrwzjxLRsq0xyXWZD3gIQ96zf17lJJmka2rQB
         mg3EcWRtQf/KxCjdbdyDQH6e1k7ufCd9aPo0kLYcQSsSBsQfnIScZnW8mmA3j3DMMhGn
         q5RmGqMya3aheQ/n7hoqZWI4mbfrpzq+ouKsl5eI28sEnI2sbjfN1uwz1Kca6Y0Yz7od
         V7fn7ccGwWL8byPWMPwKVx/uTTZ7nPofgh1IAFu80mpoYN7DeHD9jbcaJg/7dUeD/lpZ
         hbCTy52r0xvs8ZfErzhcJ1zlBQzNdeA/pEhFWTbFM+0e51pWUFooWtXpV6EfxcotUXyF
         Uhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711774126; x=1712378926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqKtRTcCfUHDOcX0tKilt4xKnfEps6Hgq5SW6oavRVg=;
        b=OcJxpyhIKvuNx/+5Wl37v2WQKapE0rUEr5VrxsemWKzxF/rGcCh6jAjuRWIyZsaCcE
         KlZ98AIZ3jWrDITbmk5cGidTZT2E2h4ib6Pg4yDiGKC0qFanxD1lrKcY8NX7OEP2wDkG
         x5SxNe8bsgtkXJkZfl7GL0CULgTvXz5bVLRuegQ8GEziDax1/zfCfr8bVaRz/DkVNgQ0
         exsAQonDhKtO+T0BeYjOSgTOVE0BnPLprqlHtjfa9IaPEwnQsaS0tPFMOGLkA9QYpG+H
         uk+JtUH/GztIsUV6oeZTkI407tc0oruSzbE9tE7rL61mz4KYw4aml45YeVMf7/WdeyWe
         VGEQ==
X-Gm-Message-State: AOJu0YxZybR6ZYxqNpSGBSC6sWFhaUNzpCMx+ln0u1zKvsN0vCv4yG6l
	3Sll0PwWbWtiUeI1/qdyo2Nb0zmqC8sqi2VCVc1SciiirFRUZGLMpI0p0m6+Ar7ZaeeRnmkhchF
	IJU3E0lZ0iSj5p0bZGHL/GsxC1YA05Jf2im91ew==
X-Google-Smtp-Source: AGHT+IFWNUW2zHPnWC7CSZVJWYNfuXeyZlox9i9KNp7LapLl16BvX4i/tRfOuabu6Hn2towKb2gtcAyZRB8/FIQKbH4=
X-Received: by 2002:a25:bec1:0:b0:dcf:56c1:5a12 with SMTP id
 k1-20020a25bec1000000b00dcf56c15a12mr3656604ybm.38.1711774126160; Fri, 29 Mar
 2024 21:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 06:48:35 +0200
Message-ID: <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990 devices
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_214847_015967_1A12D936 
X-CRM114-Status: GOOD (  12.01  )
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

On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The ath10k driver fails to properly handle fallback from board-2.bin to
> board.bin for WCN3990 cards. This happens because the
> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> WCN3990 platform.
>
> Add board data configuration for WCN3990. While we are at it, merge
> common pieces of BDF support: drop .board and .eboard names from struct
> ath10k_hw_params_fw and use the common name instead.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (3):
>       wifi: ath10k: populate board data for WCN3990
>       wifi: ath10k: drop chip-specific board data file name
>       wifi: ath10k: drop fw.eboard file name
>
>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
>  4 files changed, 14 insertions(+), 45 deletions(-)
> ---
> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> change-id: 20240129-wcn3990-board-fw-a2d97507a712

Kalle, Jeff, is there anything pending on me on this series?

-- 
With best wishes
Dmitry

