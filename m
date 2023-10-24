Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65287C25B47
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 21:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcCbpqOR+gy6btEnFttEnWgfMkgshUuKlNo3V6RAZ2k=; b=DEk/WzWwj8RmY8
	lS7o8mbTbC2LhXkkc/qdv9t/jEzIhqfX+U6S0Okl9JNhoc6a/iSR/lxNUc7TQ7KB9LNczwAQZDPf2
	rNBnKErBx/zhF4Z1+GpwwpNisc9pMq2VPsFQ7N4xWSOKrA706Z6jcpW2hSqfPJ9sMNkPqpMksdsvr
	SC10TF3Z3O5Mk7xWgov6rYY+/c8425FxUbQByjV9hxzoHKd1JGeFnW1TYI9yBfU7wASQYQWc4VZ03
	Q3jORIn3JhTOtboxsJXMJWfqlCu+p0G9BnlRPdAXOuZIgSokw6gf3eptW/vk4jnjWWm5k9VFHOTw3
	Td+WrQrRRBuhRZxF5VOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP2M-00AtNf-2w;
	Tue, 24 Oct 2023 21:34:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP2J-00AtN8-1X
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 21:34:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c5cd27b1acso41496945ad.2
        for <ath10k@lists.infradead.org>; Tue, 24 Oct 2023 14:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698183242; x=1698788042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzgFevCEBoy3uNYPrdTwG0cJ6YSSUpVWwwpPOjVEOXo=;
        b=U/aIpYW/CYQfBmuKPALqoTP8aRczdbMueeihZ48DQYrEPnSlgrz3AnWRh/bEcqQivy
         csoU4ltpv5BzGiuQQ5ZuYCq8MIG5MZfmMBDbXvSj4Y0v79TjYu5NdQOYgQa8PXIRcxnW
         SjWLp3Fnu4v15INOArgUke8tZ0VrmytZTg790=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698183242; x=1698788042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzgFevCEBoy3uNYPrdTwG0cJ6YSSUpVWwwpPOjVEOXo=;
        b=CGF7FXUKx0UkHIlnkQ+T8YW35KRBiPdCN2STq73QWyyPirCOb8So1RRC9jep9oJYnr
         ckUNAps6b9/C0mmqvM6EzinqTppKoyzw0/EbWQg+viReO0mjk3SF81KXqFIWadj0jZQ1
         XzxwdaWBNhBqP7LyYaMeILcOYs3/2c9JmV/1z5EAD1l8SPzbyzX5d3+BEk377LXTmuEl
         sSzmdwzDPE5CLbj8L45FY/qyaSfvK7dJPcTfSPb4pU+htvKXEQvWYfIjA3Ttj0Fn4Yre
         7uLZ9rb6SU5cGrFaV2m8GQbTXOrWrcGubSmVdsGyRCuJ7cK5kgGjlCxgKrDXEzU6pQ1D
         Y9Sg==
X-Gm-Message-State: AOJu0YySO77Ymp4XY1k3RdT9VXrA2aKkJ73T76iY9+brrR8PqxrnM2os
	HSY+0imioGgsywQYZ20xxsI+Nw==
X-Google-Smtp-Source: AGHT+IG3/Sv64oN0pEa3F6T3eh9NZodgI82qw+e4xbTTKbOvoIpbPuuv5YdPvBGTxmOD/WWxRQbn/g==
X-Received: by 2002:a17:902:e5c3:b0:1c9:aac5:df1a with SMTP id u3-20020a170902e5c300b001c9aac5df1amr16061797plf.51.1698183242169;
        Tue, 24 Oct 2023 14:34:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id je22-20020a170903265600b001c625acfed0sm7857910plb.44.2023.10.24.14.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:34:01 -0700 (PDT)
Date: Tue, 24 Oct 2023 14:34:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath10k: replace deprecated strncpy with memcpy
Message-ID: <202310241428.0AA7B80@keescook>
References: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v2-1-4c1f4cd4b4df@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_143403_555434_1A4F463C 
X-CRM114-Status: GOOD (  21.00  )
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

On Tue, Oct 24, 2023 at 05:42:16PM +0000, Justin Stitt wrote:
> strncpy() is deprecated [1] and we should prefer less ambiguous
> interfaces.
> 
> In this case, arvif->u.ap.ssid has its length maintained by
> arvif->u.ap.ssid_len which indicates it may not need to be
> NUL-terminated. Make this explicit with __nonstring and use a plain old
> memcpy.
> 
> This is also consistent with future copies into arvif->u.ap.ssid:
> 
> 	if (changed & BSS_CHANGED_SSID &&
> 	    vif->type == NL80211_IFTYPE_AP) {
> 		arvif->u.ap.ssid_len = vif->cfg.ssid_len;
> 		if (vif->cfg.ssid_len)
> 			memcpy(arvif->u.ap.ssid, vif->cfg.ssid,
> 			       vif->cfg.ssid_len);
> 		arvif->u.ap.hidden_ssid = info->hidden_ssid;
> 	}
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - update subject to include wifi
> - prefer memcpy() over strtomem() (thanks Kalle, Jeff)
> - rebase onto 6.6-rc7 @d88520ad73b79e71
> - Link to v1: https://lore.kernel.org/r/20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com
> ---
> Note: build-tested only.
> 
> Found with: $ rg "strncpy\("
> ---
>  drivers/net/wireless/ath/ath10k/core.h | 2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 4b5239de4018..ba9795a8378a 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -607,7 +607,7 @@ struct ath10k_vif {
>  			u8 tim_bitmap[64];
>  			u8 tim_len;
>  			u32 ssid_len;
> -			u8 ssid[IEEE80211_MAX_SSID_LEN];
> +			u8 ssid[IEEE80211_MAX_SSID_LEN] __nonstring;
>  			bool hidden_ssid;
>  			/* P2P_IE with NoA attribute for P2P_GO case */
>  			u32 noa_len;
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 03e7bc5b6c0b..f3f6deb354c6 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6125,9 +6125,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
>  
>  		if (ieee80211_vif_is_mesh(vif)) {
>  			/* mesh doesn't use SSID but firmware needs it */
> -			strncpy(arvif->u.ap.ssid, "mesh",
> -				sizeof(arvif->u.ap.ssid));
>  			arvif->u.ap.ssid_len = 4;
> +			memcpy(arvif->u.ap.ssid, "mesh", arvif->u.ap.ssid_len);

This is a behavior change, isn't it? i.e. arvif->u.ap.ssid is no longer
zero-padded. Is this actually ok for the driver?

-Kees

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
