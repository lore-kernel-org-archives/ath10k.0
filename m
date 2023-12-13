Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C95C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKFrk1J/zY5B8/hw5jHalDc7wotPr7TIY0wnvEd3yKU=; b=eGhVIywyUBDdaX2MVU85efK0mF
	Gaad+G+4d5h2D50tnm7SYYWD25bm8P2nF12ZE+I9gbhpfWJjay71FLp/v1jU/JV8n1bTTVegeEvYL
	zza7FCRFM/cER2D2VxJtX9tdc57wowxdsCmwo6QCr65JwdcgqGHCC4LnMnU5JfPAtOdYuP6ufN328
	USTso33oy2plBXoEOPY7059w/koVayiLmbo5Dav13HHMAIXRrUhfDj4Oo6e5JptqxdD4MM9OssHrb
	6+GkboAZniG2mMR/7dH2w0Yj+mc3p4pdt/46wBG0+LwAabQo6RDzdy+pFlU9X7nQztW7En1z8RLku
	P3cSVoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDV2h-00Fqdi-0O;
	Wed, 13 Dec 2023 19:37:15 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDV2e-00FqdC-1g
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:37:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ce26a03d9eso4807575b3a.0
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702496232; x=1703101032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKFrk1J/zY5B8/hw5jHalDc7wotPr7TIY0wnvEd3yKU=;
        b=esgj5vCFvarFBCYmCi5L+yB7JlHL5uw85fFjQARGVEclBnFGtX9Z1G+xjGxgqK8UgU
         KZ4jFBa8z2F1rnw4zT7IlFV9osV2WmX5iqPKT4fRzAKTMCY8Ja8CsDAllOLYnijLrw5m
         qXt9psHrjOCytbF7fzsiZdKlXgwFrfSwg1A+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702496232; x=1703101032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKFrk1J/zY5B8/hw5jHalDc7wotPr7TIY0wnvEd3yKU=;
        b=CITJ2Me6OMDuhZXN8uqf1JiEqT20onbGI3yjEJU8U56oxHtUq0JQKsFkdwCFwAxVP4
         Isd3Fnfq0MGexteZwQFD4cvTIKQ+noPmnE363I4fSCGbspwbn7TQD71psFGj05IdsSHa
         1az09rc6eQYSvGWVd7IhKhri9kAcniKwQDHsB22sDgnBXzdKcIqPnc2dqzPfe84TNohD
         QftRarc7w2MZxcaOzQpq7EHw3+ZukSeTgwEyGhesouOLMr1LhT0dxwvxYA9J+KOQIZDu
         Jh0GT3+gIAadWF+dkyBJj5gUVUj3nMNQLs8aMcTFPptcHkA/htG5GPz08VLNRRPKH/GZ
         CoeQ==
X-Gm-Message-State: AOJu0Yxkn6ghq0c0Pmmx1c9pFwwmZv60Sq72IRrcQCkTmINLwuGVnClt
	2PiX87zDdGKHsg2yqgyfPAxsRA==
X-Google-Smtp-Source: AGHT+IEWAmv4wu9vPJK2ICJzCkDWUMORDZXKYB0gKPC3a7NsXvr4GtEaXeBkWd0hXxXYBffoLLIBHw==
X-Received: by 2002:a05:6a00:1151:b0:6ce:2e16:3771 with SMTP id b17-20020a056a00115100b006ce2e163771mr4969573pfm.22.1702496231709;
        Wed, 13 Dec 2023 11:37:11 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y31-20020a056a00181f00b006ceba4953f0sm10685026pfa.176.2023.12.13.11.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:37:11 -0800 (PST)
Date: Wed, 13 Dec 2023 11:37:10 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] wifi: ath10k: remove duplicate memset() in 10.4 TDLS
 peer update
Message-ID: <202312131136.5C46279@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-6-92922d92fa2c@quicinc.com>
 <202312131113.4C01D1DD5A@keescook>
 <bdabfb74-ea4f-4455-bb4c-1d93977393ea@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdabfb74-ea4f-4455-bb4c-1d93977393ea@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_113712_559021_6D063439 
X-CRM114-Status: GOOD (  15.81  )
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

On Wed, Dec 13, 2023 at 11:36:08AM -0800, Jeff Johnson wrote:
> On 12/13/2023 11:16 AM, Kees Cook wrote:
> > On Wed, Dec 13, 2023 at 09:06:44AM -0800, Jeff Johnson wrote:
> >> In [1] it was identified that in ath10k_wmi_10_4_gen_tdls_peer_update()
> >> the memset(skb->data, 0, sizeof(*cmd)) is unnecessary since function
> >> ath10k_wmi_alloc_skb() already zeroes skb->data, so remove it.
> > 
> > Is .gen_tdls_peer_update only ever called after a fresh allocation? It
> > wasn't obvious to me as I tried to follow the call paths. Is there harm
> > in leaving this?
> 
> The only harm is a slight increase in code size and cpu cycles.
> 
> However note the skb allocation is done within
> ath10k_wmi_10_4_gen_tdls_peer_update() itself, just before the code
> being removed:
> 	skb = ath10k_wmi_alloc_skb(ar, len);
> 	if (!skb)
> 		return ERR_PTR(-ENOMEM);
> 
> And in ath10k_wmi_alloc_skb() we have:
> 	memset(skb->data, 0, round_len);
> 
> So the memset() being removed is always redundant.

LOL. I see now. I missed that was was looking outside the function! :P

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

