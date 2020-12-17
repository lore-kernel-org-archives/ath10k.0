Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77B4C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 23:19:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EAF22D37
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 23:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EAF22D37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mRy6kgq1Pxe8b9USIEqErPwEoFpPA+Aelp2iNEJLMiA=; b=oknmLTbjYPhu9WZ1PzaJxVXk9
	uQBg18WCC2Ncgro/22ZS+crbh/Hlcmqve1D0g5+eepn+5WTurMHu1ZCnWTt0McMpR9VzB8IcaWK3p
	Y5Wrs4n0JWcfaDnKlpBlU8m/dOreTKyal9LXbYaCaowY2icp/Ha2w0m8LdMSR2Oj4LPqkOmjXnBvE
	vy2U/0GtRKLWy4g38bmQuYqLD+aKDiH3FYRs1OW7wjCqLqhJzMv/wCYFeL4sKHat6jSiPSBT5MBaO
	dgpFct4MHZT17LCHQMfLUaHk6wrzVap/26Tg4M5oitVQIk01DnqR/3tIiF8PLM2+XVFJ3jZ+MuSgY
	e/jbHPwGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq2XR-0006NV-TU; Thu, 17 Dec 2020 23:18:25 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq2XO-0006N8-QS
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 23:18:23 +0000
Received: by mail-oo1-xc34.google.com with SMTP id p72so140524oop.4
 for <ath10k@lists.infradead.org>; Thu, 17 Dec 2020 15:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bz2IW955KN1kBMML3+o9Rok8vGvt7BDvNsrsFguY/2k=;
 b=V3ch4Q5Jvb7jrGD/wLFLLaLNoGCKNaFt2CkOj1sJE/RvSa66LeG7kudveh8uXYqPO4
 koJwcyXMIN1V+HzOaR9TmhmRfURoeVxrvugXQRsvAOZ9zqZSf92LL/XU+pRn0Hx/bvPD
 idx6f4fUnIGiqbf7HkUhucvt6RjxggQFDgLxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bz2IW955KN1kBMML3+o9Rok8vGvt7BDvNsrsFguY/2k=;
 b=XAVnHg6wi1RIKL+X1TnIQ6zzhmy8TvdC5DOh6M2JiMsxsFw5kYaWO5PwF5hreyDi48
 A6t9ws2BjFW312BtpA5sKGkXwRXLAwhzUU4PkYybNqrzA1uj9wRmIASAZkzUyaWTjhjW
 7s8DxCbMjbOyH6v6gTL9lAD7PwA/tue2TQ60M5hUWxue7uvChUmuTGELfV2cTR0/njRM
 eTowui9OWK8Nld45qXvHHXzi2d8mUqe2KU9s/jxJyjuF+Eb4HObJASRkxVX5MbnB03Mk
 hgiTWXf9FRHflVHBYtEj2APsMFcESc5tGCM2zJyRGw0DEsYjVTWh9jcYYOhZ1EP28IHw
 BvzQ==
X-Gm-Message-State: AOAM530SGIogleUr34ZjpDdMMk0qXKiMoGElEvR2OTVv6yu5tQ6nTpM6
 gMJiY5+FIMuRVxRlP/9ad0kt+FLwK49fVA==
X-Google-Smtp-Source: ABdhPJw94Dj5m+WszD3NJ0Hw67NCylUgypxe/F5NB5Hhq7mbdkYDN/mrbh743jTd5JIdQecCRvTiaA==
X-Received: by 2002:a4a:97a3:: with SMTP id w32mr986366ooi.81.1608247098621;
 Thu, 17 Dec 2020 15:18:18 -0800 (PST)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180])
 by smtp.gmail.com with ESMTPSA id m3sm1559091ots.72.2020.12.17.15.18.17
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 15:18:17 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id l207so887301oib.4
 for <ath10k@lists.infradead.org>; Thu, 17 Dec 2020 15:18:17 -0800 (PST)
X-Received: by 2002:aca:af4d:: with SMTP id y74mr1029540oie.105.1608247096801; 
 Thu, 17 Dec 2020 15:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20201215172113.5038-1-youghand@codeaurora.org>
 <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
 <X9vaqxub2F/8YPT8@google.com>
 <6cec8a4c-620f-093d-2739-7eafe89cd79a@candelatech.com>
In-Reply-To: <6cec8a4c-620f-093d-2739-7eafe89cd79a@candelatech.com>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 17 Dec 2020 15:18:04 -0800
X-Gmail-Original-Message-ID: <CA+ASDXP+b8bik767LxcN9jV+ETpJ+_4HKH7rvsGgXbAHidFAng@mail.gmail.com>
Message-ID: <CA+ASDXP+b8bik767LxcN9jV+ETpJ+_4HKH7rvsGgXbAHidFAng@mail.gmail.com>
Subject: Re: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
To: Ben Greear <greearb@candelatech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_181822_911722_88512D67 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>,
 "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Doug Anderson <dianders@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 2:57 PM Ben Greear <greearb@candelatech.com> wrote:
> On 12/17/20 2:24 PM, Brian Norris wrote:
> > I'd also note that we don't operate in AP mode -- only STA -- and IIRC
> > Ben, you've complained about AP mode in the past.
>
> I complain about all sorts of things, but I'm usually running
> station mode :)

Hehe, fair :) Maybe I'm mixed up.

But I do get the feeling that specifically within the ath10k family,
there are wildly different use cases (mobile, PC, AP) and chips (and
firmware) that tend to go along with them, and that those use cases
get a fairly different population of {developers, testers, reporters}.
So claiming "feature X works" pretty much always has to be couched in
which chips, firmware, and use case. And there's certainly some wisdom
in these sections:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#hardware_families
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag

> Do you actually see iwlwifi stations stay associated through
> firmware crashes?

Yes.

> Anyway, happy to hear some have seamless recovery, and in that case,
> I have no objections to the patch.

OK! I hope I'm not the only one with such results, because then I
still might question my sanity (and test coverage), but that's still
my understanding.

BTW, I haven't yet closely reviewed the patch series myself, but I ACK
the concept.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
