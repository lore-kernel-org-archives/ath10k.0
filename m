Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EACDC88E75
	for <ath10k@archiver.kernel.org>; Tue, 15 Sep 2026 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqiqAKtP9jwo6b7c6fPqWn0LoPHF2A3cHgQdurIrJGg=; b=DNyCm0jREDY2JgPyNB4hBDp14V
	aFmkZo2Uo6Tb2iIGRgA6uwfyZVKAQW7Bhl9Gc4XUdrnxNe9GXXCb8upGa4JD87Uq5ApI8ZWEAiSN7
	mH9Q249Cw6OQxmR2fi6q3GgNoYyUXFmRH6XZ2DBMB9cl5gltLv7PbVvIYsVA3A8pvEtJQ5LRVAjmd
	rbnMm/wQ5VrdULQ4+CMauVzVgm05hWYw4CzcP93TZTvcnWDSWellpYjnDSZqFT1IEwArA6zMqezRa
	RR7stMBmuiYTuQDH1oHPJKK5tVs8tJ06JjcGfQtZBplzy1CVkIxOnp2mAERoLUD5oA0QmPrMdDCqe
	u7K37uxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WvW-00000007aH8-2PC7;
	Tue, 15 Sep 2026 17:26:38 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WvT-00000007aGS-3XsF
	for ath10k@lists.infradead.org;
	Tue, 15 Sep 2026 17:26:36 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398cb5615deso564116a91.3
        for <ath10k@lists.infradead.org>; Tue, 15 Sep 2026 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789493193; x=1790097993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqiqAKtP9jwo6b7c6fPqWn0LoPHF2A3cHgQdurIrJGg=;
        b=bGbFjg98bHVHtXpuQmSRl7iafu7zhAUHr5TqwMK0WnkfkhgaJhkSH6OmQIqpAM640p
         0ipnXuV3ZPlR/CXzmZymMiog1yNnT8W1+5d3JsLn5KdvQFkCwLn+aX81TGdBoYTEZyOg
         0uxVrghbgUZsuYkPXxeUqQPAPluhxGvCwvkjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493193; x=1790097993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqiqAKtP9jwo6b7c6fPqWn0LoPHF2A3cHgQdurIrJGg=;
        b=IoRxRuvN2suXPjRhS/0DiNuMMZPM5xgdLne2/8EcGV3Km7ICXFpBEtWWKC8I5SBLIw
         B+vcpa7XeGkcxJlJ2QZTXbbP9PIBW3qLuOS2GesYAyjAbDe1mD/WDlW+61LbJTIoFVWx
         GPVKWdng8uHpzJgUTjZEy9AqdahbpkSZOwMZJulBc51XrcPWfU343vKcFDMs+Zj9uV3n
         Il5kct2/Z5l75ILdF+c5RfkDpYb/VAWjx3MUGIMhBnDzb6MdrJjO0jms2fFlycC1jw9f
         kC50T3dRvOKpkKorwYgjAYkEabjKG+K4gXITH1YoNSflU0/1UZhOVhL8CtnV8TCKC+7Y
         Kwxg==
X-Forwarded-Encrypted: i=1; AKwUvBxR75wdBaq36veFvKUul7yXgiKMGyOmc4yNBBYRQeQby8eNNO4yqcz7To3JK/810l7xzsowslk=@lists.infradead.org
X-Gm-Message-State: AFuF++lohX1GKXBX+7w3FlNZ4IjzrlxNLmdOBW3lHYAR4AQVZ7M8XIUW
	B/VCQgtBb9rR0yljfXbzU2np8T665xHOg5/GGrOBUrVM5iU4xtKYJWsWzs7U33XTbA==
X-Gm-Gg: AYBFou1VDFUE0Kn2nxTvfkKJZOcgdzHBFeeOkjFmNyvPi3pWPja96Tw0Vbku43fc7T2
	GMM7+e8McxdevmobvXqWVLbr7kXogW4ypeowBRZOJzC/SWASm0JIh0hDQzVoamcQgUNzXG93k3w
	P0Il2RuQf+rEUJAagTfhtickT4M5P26IIohy83DxYp9PbzgsLG5d9TVe5gKaRnAUADjEW6sSlV4
	jHVKOagTg1lcqZIyeOMmwbQ/gSf7goUqBaF/cse/WB4CIfe69dmyqT/WFv5NtzDhrhKLbVUAVNY
	0xQj1gU36wkhDgZI4h4grS9RoOgV4/zZZpFx7u7zAKI4JF0j1OFR5R9iKoTGn+vE/cnSVd9gU47
	r49iqFzuOnXXoUHotQs1gMQXgwpXCTjpvhKO/vSWodauGe6+Fm3CLTTrsIYY3WNEOhP6JhJcuQh
	QB5e4NoKy3avVVGcnHlLRgEVX/x08DGHCxfrUJIS5iKIi+x96BKwwNXreOyAgdzkPeTN1CDmPkv
	4sKtHlyjgFGpUIV73sPzm9fXIMHgO17o3ktvA==
X-Received: by 2002:a17:90b:17cd:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e110961c1mr3185168a91.19.1789493193520;
        Tue, 15 Sep 2026 10:26:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:60c4:eed3:a48a:b9f4])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-39dfdd0ba9bsm6560457a91.7.2026.09.15.10.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:26:32 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:26:31 -0700
From: Brian Norris <briannorris@chromium.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Govind Singh <govinds@codeaurora.org>,
	Niklas Cassel <niklas.cassel@linaro.org>,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
Message-ID: <aql_xwEy5POcVmyU@google.com>
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_102635_915406_0057E63E 
X-CRM114-Status: GOOD (  20.06  )
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

On Mon, Sep 14, 2026 at 03:05:19PM +0200, Albert Esteve wrote:
> A failed ath10k_qmi_init() left a dangling
> pointer (ar_snoc->qmi) in the cleanup path.
> Clear the pointer on the way out for hygiene
> and consistency with deinit().
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")

It's all going away (probe failure / removal) if we get here anyway, so
this hardly qualifies as a "fix". In fact, in a cursory check of the
driver, it seems the NULL-ability of the ar_snoc->qmi field is totally
irrelevant to this driver -- it never is actually checked.

I suppose you can still call it "hygiene" though, and it's probably
reasonable to do the same here as we do in deinit().

> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>

> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 0d74548a5f34..08a64f737fb4 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1128,6 +1128,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
>  
>  err:
>  	kfree(qmi);
> +	ar_snoc->qmi = NULL;
>  	return ret;
>  }
>  
> 
> ---
> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> change-id: 20260914-fix-ath10k-dangling-15676d427cbb
> 
> Best regards,
> -- 
> Albert Esteve <aesteve@redhat.com>
> 

