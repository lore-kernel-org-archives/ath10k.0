Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9E8C433DB
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:14:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3869164E42
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 02:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3869164E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Lgejzb7Qc329Tyy7M5SD7lZaHS4mV6Tj/iLl7tzErU=; b=aJTgjN+TI7Rm6O2ZQFcUiNfic
	/8nmvTCfItSDPMKHz+xvNuAFX2GZh4WdKfPL1FdnYjzEAWyD7/8dQopbKZSBvMKkAFjKVEsTBRBv4
	fvYktEkSBqllgXuYSrSflWS5RzJ7SGM2POcTKrKl010Wy1Decahkp33v6NWwXJRC7VWrXo0a4SFFT
	nPkRjaHwbMtBgWEJwRp0BUxd0QhC6fpXp91eoXYHrt6ykED90+NbA7A0VAGPk/RHZIbV02ptKRsi/
	nF9yXrbzfpvjHMnKF1ScoMLqJm/OOIBtlUQtJUOgErnD8HhCAOkzPeh9BEVtKP8Ii4HlOtJUN/VWs
	V3H6/f0Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9f1Z-0001Xz-4x; Wed, 10 Feb 2021 02:14:37 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9f1W-0001XC-DX
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 02:14:35 +0000
Received: by mail-ot1-x32b.google.com with SMTP id o12so411599ote.12
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 18:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V90/hBn9j2Q6OSCWu59vY+j+BWO0HaCqBFyxV7f5dII=;
 b=Tbf0oBeJwlih3iqNECCosxvzK25+TpYEKq8jIhO3AsSoqlMdGRxAiX7VUDoWQ/F3ad
 oiUS959tMexEbBeVhisEZbZT1ELFlbjX4vwqHIFmhgH77fVBsxNiEGnyPN8vbn6sCwNF
 yWJXS394xwDsVolwIqM3yZeLMbOBwrtDpJXZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V90/hBn9j2Q6OSCWu59vY+j+BWO0HaCqBFyxV7f5dII=;
 b=hCHtQb4cTQS07oZwgLTizQOcXEFKYgHtts+bocCO4SzmRylsmuAb+TIxG0HpFRPl15
 rmQJb2s9kbXxU8HmC4i35Ek/LliGkUZM4uTkZvUvAj1K+yWRR6CgrsavoGc7HxRy0Cp8
 YXdkFRxVwcMbfcduqJs13rM20qR8WEqxD4b1H6jZr6aNWN40caWy9KjgA/rixpamttPX
 Y9r/M3zFDPBM/3BgEadwUHvoHWCsY8GdqZ5d9X8NWKzFWkCtmHkqoaLWu2g0ZzgKRYzH
 An7exBWkpjUwjra5W3O9mlSfz3nKdGZ2iRGAkVkrbMroORuJitWrSn/nD39r0A/3tBRp
 mP3Q==
X-Gm-Message-State: AOAM5328vpc7oLKtC9XSt7wSiSLgEvUfrZ6sNLMds83ihA9qUk5sZJnq
 EPXlPYa0WvtVE3otQgA7/ztYPi/+tHOkuA==
X-Google-Smtp-Source: ABdhPJyBbC+OuhqWefJ6jVwxFZ7xGkhOBCkUQo8TU3eJMEj4w2C933Q+0qqfMiJsrIqwRpNDviUB0g==
X-Received: by 2002:a05:6830:1c61:: with SMTP id
 s1mr503964otg.149.1612923271484; 
 Tue, 09 Feb 2021 18:14:31 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
 [209.85.167.179])
 by smtp.gmail.com with ESMTPSA id c17sm98780otp.58.2021.02.09.18.14.30
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 18:14:30 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id i3so416071oif.1
 for <ath10k@lists.infradead.org>; Tue, 09 Feb 2021 18:14:30 -0800 (PST)
X-Received: by 2002:aca:43c3:: with SMTP id q186mr532173oia.77.1612923270018; 
 Tue, 09 Feb 2021 18:14:30 -0800 (PST)
MIME-Version: 1.0
References: <1612839593-2308-1-git-send-email-wgong@codeaurora.org>
 <CA+ASDXN1V2HYA7C6s-q5bQNSxE7L5GCJiqfiJ_67R_hpUn4b_g@mail.gmail.com>
 <19b6ad684a01718c3823f882581fca36@codeaurora.org>
In-Reply-To: <19b6ad684a01718c3823f882581fca36@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 9 Feb 2021 18:14:18 -0800
X-Gmail-Original-Message-ID: <CA+ASDXNYO+w254D2Uh3OSfTGjJEkbOCX=hq+XaWe9DtjbuOy3g@mail.gmail.com>
Message-ID: <CA+ASDXNYO+w254D2Uh3OSfTGjJEkbOCX=hq+XaWe9DtjbuOy3g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: change len of trace_ath10k_log_dbg_dump for large
 buffer size
To: Wen Gong <wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_211434_821938_07A28593 
X-CRM114-Status: GOOD (  11.32  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, ath10k <ath10k@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Feb 9, 2021 at 6:12 PM Wen Gong <wgong@codeaurora.org> wrote:
> On 2021-02-10 03:35, Brian Norris wrote:
> so this patch is to dump the top 1024 bytes only,
> its 1st goal is make log smaller.

Agreed. I wasn't objecting to this patch. I just wanted to highlight
the second part should probably also be considered as not exclusively
an ath10k bug:

> its 2nd effect is fix the crash issue,

but I guess if you're not testing the latest upstream, it's a little
hard to tell for sure whether the crash still exist at all anyway...

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
