Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70887CDB47E
	for <ath10k@archiver.kernel.org>; Wed, 18 Oct 2023 23:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yn2OwjxlAiihKj9AoATe5l2+5n83/mQy1vpJxCBgaww=; b=VjKiucN8R22v5v
	KbFFxxWYiagzh0bStTgx8FJODkaUL5TpaxHrY6Zqyy2gAOpmoKnOdgkYWA553HpAX/w2j9/6/QRQm
	d/nPmURkPQpXgC8dn+kN/pzRccbH8QgSoXOMmTW7L8r46wq4LYt4mdRXLaKZcEfDFx+F2JEZ4SwUm
	h8lnv3swIUdewzyK8416EL86YhAGXsU7I/IwmCirt+x1ZONTjjIpSxE34vajGUyM2aCjB2eqfMAX3
	K2iB4FFtEqEuU/RW+3CzXlS9bhzquTBOmGVgr7hFHU/JYzJqZnQL/ZeJl5ulEgK8m26cdJ3nDubip
	1lhKYaQloFQi6t4ZXqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtG4K-00Fw3h-1P;
	Wed, 18 Oct 2023 23:35:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtG4E-00Fw1g-1p
	for ath10k@lists.infradead.org;
	Wed, 18 Oct 2023 23:35:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso28391015ad.0
        for <ath10k@lists.infradead.org>; Wed, 18 Oct 2023 16:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697672109; x=1698276909; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxRMOhkHfqF2Yz4cAD/a2m3hMjCZwz0gsRF0WfVLtiE=;
        b=ZSngdcsiRFrUvAMLv8Sg7t2Qa+KriifFYgNRx/8Tf+mHypZ62IG8plm0gWqlWrHmd4
         MjcXHEJ5Qv+yY9FwINPtE1mB66qnholhWj+h6anOEIf3ZqwRa3uhiqbW0AnGE2ttOEJZ
         kJBXNs2XuPVLUbKWYkzq3LD/MEe1rk1J4h0Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697672109; x=1698276909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxRMOhkHfqF2Yz4cAD/a2m3hMjCZwz0gsRF0WfVLtiE=;
        b=gAiwMcyDwReQjVfn0V/jV2aD4ggzM3v83V7Tv6POnV6SIYMrnrYF+ZXtfdGzMrguBT
         sJzxQyd/UkABkfH9v/S8kYXIeGyVISmDL+dqOOGCUx4UN1bfGrZcbCqSgVI2nxu5sbwj
         A/KNmNFwvwlVN5ndTZn8epD1IVREXyi7vT72CK5qux7lrAHaBtSHBornnFlzVvUFGvcJ
         LXM9xuF/flyQHr+kpLxdPz5oDONK6WDTcOCVbZDhiK1bRxjP6KIJuCJL6scoUyYR6oU8
         Im3YEfnoeZjR7aMH2SyWGLGamiEAWEdkuGC2aECbJ4fUlD1DyTTLslokPiFvFeOv3ZLU
         y8Bw==
X-Gm-Message-State: AOJu0YwFEJOWMl7pTyNMHKJsoccN8a61zKeS1i6+bx9ASCLOTGtsHvih
	PGjjLOERecusLSBgbbm9AHlHOA==
X-Google-Smtp-Source: AGHT+IFLUHDsJM96lu+Gr9hzdtzNvixg1+XlD/7STZUI8C4D6K92Q/4/Tg+mC7mHeCFcak1NFFEC+Q==
X-Received: by 2002:a17:902:ec87:b0:1c5:d063:b70e with SMTP id x7-20020a170902ec8700b001c5d063b70emr1020318plg.53.1697672108702;
        Wed, 18 Oct 2023 16:35:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001bc18e579aesm480575plg.101.2023.10.18.16.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 16:35:08 -0700 (PDT)
Date: Wed, 18 Oct 2023 16:35:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Justin Stitt <justinstitt@google.com>, Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ath10k: replace deprecated strncpy with strtomem_pad
Message-ID: <202310181626.C5BE0C21F@keescook>
References: <20231013-strncpy-drivers-net-wireless-ath-ath10k-mac-c-v1-1-24e40201afa3@google.com>
 <1cfc7c64-439c-437e-af82-7fce1202242d@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cfc7c64-439c-437e-af82-7fce1202242d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_163510_965090_A0370C46 
X-CRM114-Status: GOOD (  21.43  )
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

On Fri, Oct 13, 2023 at 05:58:03PM -0700, Jeff Johnson wrote:
> On 10/13/2023 1:33 PM, Justin Stitt wrote:
> > strncpy() is deprecated [1] and we should prefer less ambiguous
> > interfaces.
> > 
> > In this case, arvif->u.ap.ssid has its length maintained by
> > arvif->u.ap.ssid_len which indicates it may not need to be
> > NUL-terminated, although by virtue of using strtomem_pad (with NUL-byte
> > pad character) and having a destination size larger than the source,
> > ssid will, incidentally, be NUL-terminated here.
> > 
> > As strtomem_pad() docs say:
> >   * @dest: Pointer of destination character array (marked as __nonstring)
> >   * @src: Pointer to NUL-terminated string
> >   * @pad: Padding character to fill any remaining bytes of @dest after copy
> >   *
> >   * This is a replacement for strncpy() uses where the destination is not
> >   * a NUL-terminated string, but with bounds checking on the source size, and
> >   * an explicit padding character. If padding is not required, use strtomem().
> > 
> > Let's also mark ath10k_vif.u.ap.ssid as __nonstring.
> 
> what criteria is used to determine whether or not to use __nonstring?
> doesn't the use of u8 vs char already communicate that distinction?
> just want to know what other u8 arrays might require this.
> FWIW the documentation referenced by the __nonstring macro explicitly refers
> to "type array of char, signed char, or unsigned char"

The use of __nonstring is for byte arrays that are _not_ expected to be
%NUL terminated. Unfortunately "char" vs "u8" isn't distinguished by the
compiler. All byte arrays are treated as C strings unless __nonstring is
used.

> > It is unclear to me whether padding is strictly necessary. Perhaps we
> > should opt for just strtomem() -- padding certainly doesn't hurt,
> > though.
> 
> concur that padding probably isn't necessary but doesn't hurt, and will
> prevent confusion if looking at this member in a crashdump
> 
> > 
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> 
> Either with or without the __nonstring...
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Yup, it looks like the ssid member is passed around with memcpy()
everywhere else.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
