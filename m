Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A317C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Br5McNKdDym1wVpBK6ZxqsWLJASJUX98L4YfXiPz+I4=; b=pNAYjOpqHMySXLfYPeKD81c38d
	OONFfEP25s/ldDpbV8T9E8Fwvj/DhGG+NNvUtavquZ2ZEZcN8/DXhmqDXL8O1S4HKkziOY9AHwx0q
	02TEq0AwxawSF2EDzZTg4mjmlcCqTjyEDM19LJgaTH2t34nHdkVa2MhbYn4RJ8MT5t/LB0rCZykoH
	6ehM1XC8HoCxTkDmY7geYgEOyla2IdVg5tb+K+CaCx5m1X0Itq7+dQzFl6UXnEA8lQX76efgTDPIY
	Awe8AmMPl60LUcY1kQ1Eu9CjtZS1idXupOYKMPV5rtmAPxNMsfcer5bg+jy/cFdT2Rpfhsz4qTJDO
	cqhV8oBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUiH-00FoEC-1V;
	Wed, 13 Dec 2023 19:16:09 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUiD-00FoDL-2a
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:16:07 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c69ecda229so4032756a12.2
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702494962; x=1703099762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Br5McNKdDym1wVpBK6ZxqsWLJASJUX98L4YfXiPz+I4=;
        b=E8Hg6OxHb9RITAiuLaPtWjGgUp+YdCHK4QXHUqIkRqg2VZU9wPR9InuqMc8NEMa3F6
         DIbyN7dhOeRe21hLwCAEfgPFxa7kDMjXM38cnylOpNx0zBf5PVmaBP6yLrLWsfqBZ0E8
         ttbwxc4H+EYxnLLkdsKwyWJROzYaGn9mcuMIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494962; x=1703099762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br5McNKdDym1wVpBK6ZxqsWLJASJUX98L4YfXiPz+I4=;
        b=CSOlbxuxw9EILFqxTobIwIVEBCvp3hcohOehSO0sCroJl+qn6JZftNXZelsQQgBs8A
         zwLNC0pcBBeQg4riUmGG4KnymP1mnAkhgigA8Y1GvxD3dDaJcg2HjiL0LLYl8eIDGJc5
         zxUDxG4DBg7KSYuS+BmbNKu//p4astw9fRu6ZRc8asIi0jbqxnmPRkNtEYUcko8kO7+B
         TLopSQL58qKUmEuXw1rWy7kJobT7ZnomJtpEbRhjviEU2s55+e7qOsHzyYn+a0qIyjGz
         ipiqC9rqgLcnngaMDKhw2Jq2muPsQn4LRFr2tgBmA6aN01okPrFTxigJq7qC3wGbPsJ1
         0fmQ==
X-Gm-Message-State: AOJu0Yy3PdLaOYv1TviaXiPwLcS01C3AJFxRibko+SYkaYsbmoQK0UCk
	Vh8tZBIuMpfkwJj1nAGEQ8NKohexEUjiGYXsk3A=
X-Google-Smtp-Source: AGHT+IFoskKiE/aMuNO9zn8FAfarVwTklXpACZeypIRM0uei3Al3NZmvnOp5zIAhin3jtPPkFxdKzA==
X-Received: by 2002:a17:902:e804:b0:1cf:7c3d:df68 with SMTP id u4-20020a170902e80400b001cf7c3ddf68mr5893869plg.39.1702494961970;
        Wed, 13 Dec 2023 11:16:01 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902b58a00b001d331bd4d4csm4097248pls.95.2023.12.13.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:01 -0800 (PST)
Date: Wed, 13 Dec 2023 11:16:00 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] wifi: ath10k: remove duplicate memset() in 10.4 TDLS
 peer update
Message-ID: <202312131113.4C01D1DD5A@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-6-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-6-92922d92fa2c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_111605_844212_3432CD99 
X-CRM114-Status: GOOD (  13.85  )
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

On Wed, Dec 13, 2023 at 09:06:44AM -0800, Jeff Johnson wrote:
> In [1] it was identified that in ath10k_wmi_10_4_gen_tdls_peer_update()
> the memset(skb->data, 0, sizeof(*cmd)) is unnecessary since function
> ath10k_wmi_alloc_skb() already zeroes skb->data, so remove it.

Is .gen_tdls_peer_update only ever called after a fresh allocation? It
wasn't obvious to me as I tried to follow the call paths. Is there harm
in leaving this?

-Kees

> 
> No functional changes, compile tested only.
> 
> [1] https://lore.kernel.org/linux-wireless/626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com/
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 4d5aadbc7159..0cfd9484c45e 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -8918,8 +8918,6 @@ ath10k_wmi_10_4_gen_tdls_peer_update(struct ath10k *ar,
>  	if (!skb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	memset(skb->data, 0, sizeof(*cmd));
> -
>  	cmd = (struct wmi_10_4_tdls_peer_update_cmd *)skb->data;
>  	cmd->vdev_id = __cpu_to_le32(arg->vdev_id);
>  	ether_addr_copy(cmd->peer_macaddr.addr, arg->addr);
> 
> -- 
> 2.42.0
> 

-- 
Kees Cook

