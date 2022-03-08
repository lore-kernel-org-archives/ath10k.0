Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722E3C433EF
	for <ath10k@archiver.kernel.org>; Tue,  8 Mar 2022 00:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40G+G19BRzL1IKwFN+fw1kvr0be6djbomnTyCDjSEFk=; b=Up3VV3S1GFyZdM
	WlMON1Mq2NFZglfUgFx1egQeNZJPdAVSivpzGlVFmRUUVnHeZmMW3AHjvqCnR0Mior92L21qOYNqI
	bPRnW8fJKCtIICHJOfPj2ymOWG73ZzcCemZJzLpzH2mV6ZQC36rqgZbQ4+boPKTxtjuCL1LnLknAD
	soOTx/YdI+YE5XQAgOW17R9Cf4OQZdQZOX2XHxiGHmjY5KJRkcNTlM2MPYtYXYejBRXGqVhGhtHGU
	L4Tsq95EpcdHIcl20CW59DyYzPyl20Wrs75we1jNThCqBhmaDgNi/6AsQZ4kKls1/RIMU9MLTrqcs
	uteJVhLjP98PG56Rxiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRO3V-002Dql-BP; Tue, 08 Mar 2022 00:50:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRO3S-002Dot-HV
 for ath10k@lists.infradead.org; Tue, 08 Mar 2022 00:50:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id c20so3909789edr.8
 for <ath10k@lists.infradead.org>; Mon, 07 Mar 2022 16:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbJpaOu/7xZ/bf4UCikgzAXZOJfFrMxYSG2Z5vNrDBI=;
 b=nQOEm1XQrASHzLPWYSNKp5uxS7raV2Xrr/QL60mtFRq0HPSH2fwlhXHItduWmhqhRg
 gUC031MpBStyvBQ2jZR+bEUfDR2p9p37sv4oJUX86m3P+8Iq+4RhT3+BTyyp4DGshE9D
 KDVfXeHGjIt9j8FdMfsI7Gf0IqudwdFPWuyJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbJpaOu/7xZ/bf4UCikgzAXZOJfFrMxYSG2Z5vNrDBI=;
 b=mGcev5NcQqPgTHJ33N26QWzfUGolO3lzMESB8RHMKin8s/0tI5UGzdVf3Wb+PefYeA
 DYi2gwslD9BLcE4nYlZZj7m7RCl45DegrUDTwlA9wRFrRNfKOz0cpCv3Bq77jOxxu8S6
 whdgHi/E3+UY2AjfPzZMr6FRtkaUL+3I77RE+Dta6OVuqBFTNOOlpqNrwlFxoZB0beHF
 IBamemakDRdNfOB7UcPre5Mu6fJc+VkrjSRNWQAs8KOHxe5dUUyqefH6/ITStw7yxHPz
 mjS/0IKYwMXtLC10gP9r8MEOhErWVo0sErvfOZcbylULBWftqBsu+GZ83COlulE65wPn
 09qg==
X-Gm-Message-State: AOAM533wwdmJmk07qSTgIdcmWblln2ENlAfy8PRPW5dygJKgS0Q6ADxB
 uLx1IVkXFyLXp51hTOLRa9UBCf3Cv9bG+z5a
X-Google-Smtp-Source: ABdhPJyIfWS3odVTOMzDyabIQEf12N3ZWIvTwzJJnisiD/OVngih4sm6a4hdaENBirWcaa0NtMMOIA==
X-Received: by 2002:a50:da4b:0:b0:40f:28f0:c2c0 with SMTP id
 a11-20020a50da4b000000b0040f28f0c2c0mr13622040edk.374.1646700620067; 
 Mon, 07 Mar 2022 16:50:20 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 ce12-20020a170906b24c00b006da824011eesm5233206ejb.166.2022.03.07.16.50.19
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 16:50:19 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id r65so10237676wma.2
 for <ath10k@lists.infradead.org>; Mon, 07 Mar 2022 16:50:19 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr1277359wmh.73.1646700618519; Mon, 07 Mar
 2022 16:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <202201110851.5qAxfQJj-lkp@intel.com>
 <CACTWRwtCjXbpxkixAyRrmK5gRjWW7fMv5==9j=YcsdN-mnYhJw@mail.gmail.com>
 <87y23is7cp.fsf@kernel.org>
In-Reply-To: <87y23is7cp.fsf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Mar 2022 16:50:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W-kJQwBPStsGpNu09dN+QHTEZOgb5sZwZYzWnn_Zhv4A@mail.gmail.com>
Message-ID: <CAD=FV=W-kJQwBPStsGpNu09dN+QHTEZOgb5sZwZYzWnn_Zhv4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
To: Kalle Valo <kvalo@kernel.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, kernel test robot <lkp@intel.com>, 
 ath10k <ath10k@lists.infradead.org>, kbuild-all@lists.01.org, 
 Rakesh Pillai <pillair@codeaurora.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_165022_624472_90164F1D 
X-CRM114-Status: GOOD (  12.36  )
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

Kalle,

On Fri, Jan 14, 2022 at 6:46 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Abhishek Kumar <kuabhs@chromium.org> writes:
>
> > On this patch I have a kernel bot warning, which I intend to fix along
> > with all the comments and discussion and push out V3. So, any
> > comments/next steps are appreciated.
>
> Please wait my comments before sending v3, I think this is something
> which is also needed in ath11k and I need to look at it in detail.

I'm wondering if you have a timeframe for when you might post your
comments. We've landed this patch locally in the Chrome OS kernel
tree, but we are always also interested in it landing upstream. If you
have ideas for a path forward that'd be keen!

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
