Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C95C07545
	for <ath10k@archiver.kernel.org>; Tue, 24 Oct 2023 23:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KkPkY7S3z1a8mRlZLbOeZDPCTKERxGt/m7pFWAIGWA=; b=jb5ozGgW4fzkoR
	0euVpbXpkkRKqznJdaZ2zdI0j2sKF37Mldo+MnP7CfgaAYaTlQBm8ErPV7UbcyxAQjDzbkg3ohYFu
	KgWx9scW52m//2wTAygFkrksOo8fdQaQ2MDO4H5Jxofjg2B7Y6M4XrKyvIfKBVN+9EBrZIKAl4NVR
	MfjAxO0+wSi4oOd/ODP7ygxKTkurQjqHV03/wQdy1Dd8CqOOAStdKKF7ea5iWw9nvt2xdS4dilfJh
	EVhN+qHZukEFb40XL/STd+PqlpvYvnkg2GzHehRjjnHcmtRQIpMVa9hHfPp2v28JEQxZbot0HZZSZ
	C4atzuadsqVbfvZrvJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvR1F-00B2LP-2n;
	Tue, 24 Oct 2023 23:41:05 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvR1B-00B2Ki-31
	for ath10k@lists.infradead.org;
	Tue, 24 Oct 2023 23:41:03 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so4891645b3a.2
        for <ath10k@lists.infradead.org>; Tue, 24 Oct 2023 16:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698190857; x=1698795657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4erjW6behH7h7La2Y92I2S1W1eX12+hjajkrQ+7hOI=;
        b=FShFjPmGqiH5sefG4VZU4xaFjnRoQxZsCzTdBjOyXULhXiz0FnpDxLzusS26i3Cgpp
         Oq8fxS3X7YdFgPh/H/TGAfO6MfcTYLrBcrlcAkMHtxMb8vs8D5MGMMmNrUshMgShYCco
         8w4YO9jBIZLds/mjmaeFwO6Uzi//LUsGVJJdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698190857; x=1698795657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4erjW6behH7h7La2Y92I2S1W1eX12+hjajkrQ+7hOI=;
        b=MrD1bDUF78KBnitMkqhUcqh/1LZ6qOMJDzN7uXvUQSvJ2zY3GQssF0hyKYeFxN85ns
         PHgS0EnqPIARXAxVTCTbvGRjEybHvXUUlotu2iGuUy418NovXKa5Y1mG6GX8dnc2vgm8
         uGNa31PDkfFep2BSzUJ5XRrgJ2T/6tlFucb8ah/mW23iL4mkRcOy+wHM/YqFy+De/Vm3
         ChOm7/gXRsO/j2oDMHknFsWFhDsMKyHsm+O19aJyaApKewfgOOHkhzAwhCbL9L5AiaXA
         ANSkvFljhTPhzryUXZg6DfZUHx+YJ3SkDabcV3snn3xAQYp8889sASbYZToByUOOLjNK
         MVIQ==
X-Gm-Message-State: AOJu0Ywchm6PwoD/+8LyQMb8cs0+DDeAe2W6GTqDFXOFv/4NEhlqdUDR
	xA5FqhPxh1NvYU0rb6z/Oo9lKw==
X-Google-Smtp-Source: AGHT+IEEUtIUI+x2mA+3BHVdxrrR1kPGjokc41iSpcSrSrEDxMWFps3gXRmnUlJkquK5ZR3l/iLyyw==
X-Received: by 2002:a05:6a20:938e:b0:17a:eddb:ac6a with SMTP id x14-20020a056a20938e00b0017aeddbac6amr4590988pzh.6.1698190856752;
        Tue, 24 Oct 2023 16:40:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x1-20020a654141000000b0055c178a8df1sm6470995pgp.94.2023.10.24.16.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 16:40:56 -0700 (PDT)
Date: Tue, 24 Oct 2023 16:40:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Justin Stitt <justinstitt@google.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ath10k: replace deprecated strncpy with strtomem_pad
Message-ID: <202310241640.F454441BDF@keescook>
References: <20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com>
 <87wmvcxjdy.fsf@kernel.org>
 <90328e09-5e48-4bd0-ac67-62a104b6eb76@quicinc.com>
 <202310241442.0E90AB9@keescook>
 <57a56da6-a86f-4bc3-beb6-8ef6dbbbb3bd@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57a56da6-a86f-4bc3-beb6-8ef6dbbbb3bd@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_164101_991315_5595EC0A 
X-CRM114-Status: GOOD (  14.56  )
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

On Tue, Oct 24, 2023 at 04:25:35PM -0700, Jeff Johnson wrote:
> On 10/24/2023 2:43 PM, Kees Cook wrote:
> > On Tue, Oct 24, 2023 at 07:11:51AM -0700, Jeff Johnson wrote:
> > > On 10/24/2023 6:03 AM, Kalle Valo wrote:
> > > > What about using just memcpy() to make it clear it's not really a proper
> > > > string:
> > > > 
> > > > arvif->u.ap.ssid_len = 4;
> > > > memcpy(arvif->u.ap.ssid, "mesh", arvif->u.ap.ssid_len);
> > > > 
> > > 
> > > In the "changed & BSS_CHANGED_SSID" case that comes soon after this we just
> > > set the length and use memcpy without clearing the rest of the buffer, so
> > > doing the same here, as you suggest, would be consistent.
> > 
> > Ah, please ignore my other email asking about memcpy safety -- I'm
> > reading threads backwards.  :)
> > 
> And I'm replying without first reading through my mail queue

*high five* :)

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
