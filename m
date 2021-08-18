Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FBCC4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 16:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE5D610CB
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 16:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBE5D610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wSF9MB0wwlitJNcuB6lQJ7S0QAzxv/HT42vBng1bbU=; b=DKfxU5vz3EW2aQ
	p+leW2Q22Z3tL09TCfYrjBL/zSnmzStGHiY8Hqew6EQJxObLUPPE50FoZUsTpSye2cTt7c5+a7BPG
	1N9aG9Etdb34UeJ+cKLmm9PCYHcAR/czvWMRbgwzs+uh6zr4a24Tl3kXKM23b+W97/SVpWYIt/XU8
	hDVbcsCFAXxJTtD4OM5rXRrnSg6gAC3qwKTOhN1cKW7EyvpSgaP/w8k+wIB9I0wNhdf4NLrJbQHNM
	+MeB3qJ8UYcTvQ18rJAQXL4srOXSE5m8h/lZhDHloawgUqGyn2f/3hI6+ST4ay5PNk1GZ7mJXmX3l
	Jrcni9oyJHkBeC6vm5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGORq-006BTk-64; Wed, 18 Aug 2021 16:29:50 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGORn-006BSz-Jw
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 16:29:48 +0000
Received: by mail-lj1-x232.google.com with SMTP id y7so6192249ljp.3
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgqSa92OM+F5OADrmwBCMMd9VmhpaXpJwL3HpzM4S6E=;
 b=MOed0Y72enm2pahFEHaeZQdzaAwi9bPKNlbd08GQmNE/Jcl2NRGCQAJJCpfnUE9WZF
 82j2Vlb/q6cPSh64eZeQQG+/y+TDwA65trtwadRcs+cl2ezo6gKP+DcyV+77M4pyEACm
 66r+7YNnoNqia3CWnfS0tHFhbZYlYq+k3S+6QBMnbxo/5QctqyK3Ha+ka3hufIC2ZWc2
 Y/EnpAqcRZh7Hve5DRU58dS+uQmEwnoU/nI99XD85w8pZ98mOf3E66+/l3HbRDpH3ig1
 zbgN6T6tJ/FIQCLawvZ2aVU2HNT8BCoIKcBMVK28V4xNspqdqX5dhx8e61O1oWMjZ80S
 kcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgqSa92OM+F5OADrmwBCMMd9VmhpaXpJwL3HpzM4S6E=;
 b=W7YhgbKg2FiXcCjaVukqH7w/V1GCMB9IKq9nqKJUoSt0WLW9vPa6k5QycxYJsTOVO9
 r+eb8CAQ+aXp8waDUg6WIkFoWvJSZJe0/oRNNJIuqOGu8fE17iP8i3qODNUnmkpwwcpL
 ZQ3NhRqbj6O7pvSh6nsDAEXEyojI/kSrWZKs2DejDeZnshGgWcBRS2FnUiniIGHYMKBM
 6v2/aaJUksX5+3YDxHI5fNFgqZwYQOz1E9NQsCDR8qXDVsHwG2snjmIcD5pBMDgMLfWP
 QwTgXH0YnRz9MmAlIpG7/yf3ZOjeW9W6qa9BLuC2zCMWCVHi7JlPYgR9SLDK9xsFI0NK
 ywxQ==
X-Gm-Message-State: AOAM5319GGGmCpnF/sUuzYQB+maF/gKFXuEcTkLeSA6UOVWQT/oleF2/
 U5zPSA27dq97GG+n5mhFSJfmfGbc8vXUWHwUi1I=
X-Google-Smtp-Source: ABdhPJx1g+saCOWCOfM5NYU4DJ7Dt4ExVh7bSSUiW4HstWXEbNYWkZEW0t+h6D338zqAa32vUsyF9EmlRmqauZ478pQ=
X-Received: by 2002:a2e:a370:: with SMTP id i16mr8765849ljn.444.1629304185737; 
 Wed, 18 Aug 2021 09:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Aug 2021 13:29:34 -0300
Message-ID: <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Vasut <marex@denx.de>, qais.yousef@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_092947_695105_507C9828 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Paul,

On Wed, Aug 18, 2021 at 12:43 PM Paul E. McKenney <paulmck@kernel.org> wrote:

> I believe that you need this commit (and possibly some prerequsites):
>
> 47c218dcae65 ("tick/sched: Prevent false positive softirq pending warnings on RT")
>
> Adding Qais on CC for his thoughts.

Thanks for the suggestion, but I am running 5.13.11, which already
contains this commit.

Any extra logs I should capture to help us understand the problem?

Thanks

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
