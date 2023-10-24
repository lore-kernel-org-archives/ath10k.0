Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE5EC07545
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBoXPg8N3iq73Ieg/tdpgdcLJDROt4FEtg6rPECKbzU=; b=eOtoaEY6ksIA9Z
	MBcxUbRqkn/fTULQ6JB04RQ03hG+/ubHgcOHnPEpKQpvYQHxUyNe9KxGngC7ECqRUmBj3XtIy6BIy
	YZ+oit6VvRI0clAtjivi1KBbQRMcEhywSL/luIvMhF4pmo0G/UlTFuiXShol/eM9zIpD2H3tkF/aB
	RWC6NMswjesykpjDhU53FIQ37jaLqYj22ALWXmusZaSxT2r4uI/hXoaw9aG14658pXZxn+MP+7B8i
	hqJq7EUhiNWYVHGif4PLSjVGwF2dBF3E2pv+11HHStraDqtKKNMVbDxK0wLbQaVYu+qaZ2Xr55rb8
	DYGlfKjQDR/jRzpW+e7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvPBC-00AuLC-0S;
	Tue, 24 Oct 2023 21:43:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvPBA-00AuKc-0A
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 21:43:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf55a81eeaso35046535ad.0
        for <ath10k@lists.infradead.org>; Tue, 24 Oct 2023 14:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698183791; x=1698788591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frJVLA8q7CpIZN6bJ4cxEnaKNLHB5xpXe8qh07vj8Ko=;
        b=YPReAVD0iwnJxep+JJhXBYfR191+e/vjZ2h+w5au3iiNFshuUcGxKBfb+vXKN29b6l
         7gDoRiY5roBLZk9gBgnf0bK1JvPzqka0/wL14SNRVeitU4ly8JxtkD5V74jpQB3QYnzl
         QpolrJ38bHO7KPGe+XFkXarDH2cUT5oU2yXj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698183791; x=1698788591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frJVLA8q7CpIZN6bJ4cxEnaKNLHB5xpXe8qh07vj8Ko=;
        b=nMUaWQiil2Wt9+p0XTouWKa9tYLSjt1hp0+gORSSibm3XlPzOIIxc7zNtcghdDcd1N
         Zpa53RFOGVUK2iznbnxUp9QXNYFWJbOoCjYxbpeplyFvx36pJTJz/So1xtKSjIKROZku
         8cqmAdXJl6OoebiDVPr3W/h8zb6EQxrbQEsRM23CHoJ+RhEqnYpgsfpKzxwh4/RoM9Tg
         nIaA9o6LWxzweFX4Xi05xsLq5jiuy1FajTuyPqz2HhfpqAqqNUTi/e5h/vJwQaU98+LA
         JQShT+FeQNoQTCo+PN84uh7NTOzPYxEACR7KFB7Zik9cExEehMiHfiy7ysU3WqVLo6aK
         HCQA==
X-Gm-Message-State: AOJu0Yx5YRGphKbGP0ulK2/8BKIl6sEfmPptUqvGc0SVT0W5DWSZODCN
	CEryLsrHGt/B6+pMtGgAa9y+dQ==
X-Google-Smtp-Source: AGHT+IG8jAZqjr17l2IkN2BhET8ny2FkIIjuMkCIzCSC/KN1r/G1kIQNXfVGVkoHBTaZGXVDBbwJfw==
X-Received: by 2002:a17:902:f687:b0:1c9:cc88:5008 with SMTP id l7-20020a170902f68700b001c9cc885008mr13338416plg.43.1698183791215;
        Tue, 24 Oct 2023 14:43:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001bc18e579aesm7844217plg.101.2023.10.24.14.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:43:10 -0700 (PDT)
Date: Tue, 24 Oct 2023 14:43:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Justin Stitt <justinstitt@google.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ath10k: replace deprecated strncpy with strtomem_pad
Message-ID: <202310241442.0E90AB9@keescook>
References: <20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com>
 <87wmvcxjdy.fsf@kernel.org>
 <90328e09-5e48-4bd0-ac67-62a104b6eb76@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90328e09-5e48-4bd0-ac67-62a104b6eb76@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_144312_090084_8BE0392E 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Oct 24, 2023 at 07:11:51AM -0700, Jeff Johnson wrote:
> On 10/24/2023 6:03 AM, Kalle Valo wrote:
> > What about using just memcpy() to make it clear it's not really a proper
> > string:
> > 
> > arvif->u.ap.ssid_len = 4;
> > memcpy(arvif->u.ap.ssid, "mesh", arvif->u.ap.ssid_len);
> > 
> 
> In the "changed & BSS_CHANGED_SSID" case that comes soon after this we just
> set the length and use memcpy without clearing the rest of the buffer, so
> doing the same here, as you suggest, would be consistent.

Ah, please ignore my other email asking about memcpy safety -- I'm
reading threads backwards.  :)

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
