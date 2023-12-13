Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4265C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V74jI7dOUcDVvYykBcDKtAteY2dp8oIdyGSlYSnP1uU=; b=qOmUzbBLIFJ88Y+hVKDx9ZYiwo
	bdrF80tE3v9h+qkmB4/uMjbh9TvTb1O0v7w4MDHpIyGd+5p0A0VrJGZUOEud8Hj4XSfZ1t8prirmu
	UYJc6IwX8Zq4UT6s2ROdacuUPeO1GBmTuQW1UzaVUDJxOJ1XU4gEPFaOWf97gQJIG0jZymtsUAZIy
	LoL5ZfwKhyZh6a0N00hYD74/9iH5L+nyTNwUcm3IsW8TKjB/A1axKq+QQJJz68iRenkR3wmN7ooW4
	nxgnKzhLGyCkwBCt+Wk/tBN2MfcrjA7UrelMaUGUnQEDo0pior0umtMHTQmY2bpMlTZdAM3bjr9uI
	66Iuv42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUeu-00FnfM-16;
	Wed, 13 Dec 2023 19:12:40 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUer-00Fne0-2R
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:12:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28b012f93eeso242424a91.0
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702494755; x=1703099555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V74jI7dOUcDVvYykBcDKtAteY2dp8oIdyGSlYSnP1uU=;
        b=LDu2fR8mZRHO4axHZfh/hJD6GjPZesie1Rx1ZFMrY32IYWo3Nlwwq8GIMPT4Hc+Pgq
         kd+z8YS1DMoGdS6kt/kTj9bcOknuP0OhjSvteF0FY8DEBusv545i9FQ3/kLbcddCBeqA
         XyAEM1kCTpIrg/ctK8Hb4d+EhHntQiV87o/0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494755; x=1703099555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V74jI7dOUcDVvYykBcDKtAteY2dp8oIdyGSlYSnP1uU=;
        b=QFTFMo8/ihf5n0ljFRyNCmn2ujgOm8ZpeSBffdqes0//I0bL2p/ggHEuGepR4qm7on
         RrxvOCqcANUcD4ay/vx6wuV9M5Ajtpw6kMzg1NKWpFcfEWyVJUXIKixdps3GqBKh/dhY
         gHVfdknSXDzfRXZi4loz1kBi6gTDYFmei0EOma7Xp2qAcE50kqsxtIbpTdbCveSCDHqf
         x5SP4E4LrCoLPJJJwwvKRJNS/HyUICIWrfupDcCizwTXb1zGV2hfX0f9H5NjSD6qqPr7
         ga/PsKaGix5WX3HdQFhXW1A7jHEIIhJ44FAYH4iPbAfse4FAR1PPDVHFx/79EijJb9bI
         82bg==
X-Gm-Message-State: AOJu0Yy6StH607lMirDd7CIAgcgvZlXbBbGn5j0t0mOn84qEeQwmx46e
	nSftrqUyqGO4tlNcDSuB5KD7Rg==
X-Google-Smtp-Source: AGHT+IFpUDQBDy51uN88O/QlSvlZf2zSMRpN7Czjjq82c+ckbqm3K2i2HUnGehJ1UEqg9grnoEyN+w==
X-Received: by 2002:a17:90a:6fc5:b0:28a:f2cc:e008 with SMTP id e63-20020a17090a6fc500b0028af2cce008mr635500pjk.54.1702494754801;
        Wed, 13 Dec 2023 11:12:34 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ik2-20020a170902ab0200b001c74df14e6fsm11170761plb.284.2023.12.13.11.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:12:34 -0800 (PST)
Date: Wed, 13 Dec 2023 11:12:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] wifi: ath10k: remove unused template structs
Message-ID: <202312131112.F29944F613@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-4-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-4-92922d92fa2c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_111237_792889_07A94A9F 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 13, 2023 at 09:06:42AM -0800, Jeff Johnson wrote:
> Currently both the wmi_bcn_tmpl_cmd and wmi_prb_tmpl_cmd structs
> define:
> 	  u8 data[1];
> 
> Per the guidance in [1] both instances of this should be flexible
> arrays. However during conversion it was discovered that neither of
> these structs are actually used, so just remove them.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Unused! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

