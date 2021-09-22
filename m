Return-Path: <SRS0=cvhI=OM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D9BC433F5
	for <ath10k@archiver.kernel.org>; Wed, 22 Sep 2021 22:20:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A296109E
	for <ath10k@archiver.kernel.org>; Wed, 22 Sep 2021 22:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4A296109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4cixOXwrTMbkXs0u7reqsAyunC9yq6hAPUFY1D/b8Y=; b=3cTgSUcJ5bcLQf
	IAVcaQRhRve1cR+mpkeGjKGM3aHn8S/amAfr5lJfKhra+ZWz3+F+uC7rJJRz/9B/26KqMDJ1M5RdN
	zlGqRFUL/QiCDc6Qn+t5KGzZXT2qz6a1++36VlwgwjsjDqofCY5cxgS76mOljRB4Gsn95YYZHSr6N
	hTkAsxv14pRg0KFTZetszDQZFrC84Qxg74rBT2eUXYHKI9v9/RZbLoPfLTIO2ytJB4dq9in1aV48W
	OkEhxT1El3A/Kiojk4q/9sJgM/8kkhXkWfeC9TdrTrc4b9YGkQzFo9aztmBcHVptqtfSn5iV/fRcK
	4sBuQIN7O/eOOEy9hNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTAb6-009pUA-SQ; Wed, 22 Sep 2021 22:20:12 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTAb4-009pTN-8v
 for ath10k@lists.infradead.org; Wed, 22 Sep 2021 22:20:11 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 h9-20020a9d2f09000000b005453f95356cso5709115otb.11
 for <ath10k@lists.infradead.org>; Wed, 22 Sep 2021 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=W1rGCIVVi5108Q/9A0D4D81PogphtnHZcZGcFwI/n8c=;
 b=lZ4jjQH4J53Sq0uWmOts31WHzdVOUeHYBNZoeXCSt/k2qPrrnZTnHDbYNMBlz8l4Qq
 Unjn4X6mERv1brEkuIx2MTq8Jcgf4Snag6St/qVIUgqGuOWTxjZ0amqF3P1smySdlYGV
 kH72kD8YBInkfTk5jrxD/6aKPnltlPHQyj2hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=W1rGCIVVi5108Q/9A0D4D81PogphtnHZcZGcFwI/n8c=;
 b=DKvdrhV+YS1oB8kku0ps/y6hPKfMDUpYr8uojevsrmmbeb5XcV+skO/w4MBbUXCHVj
 7+KOyJrSuG4FwIOrRIoqaBRe2usPzuqpAbalvv+ZpIsQIAx7qHvb/xLe/xbl0K1yJEp3
 Agi7zq7/YhnlUe3f822kz1WtqDYmeHLIKQ5WO7FUy3onEZkozHYWMNV5hPCHeTh0e7je
 4L1fIdfPNbmmCLXAmPnSiBB+sBYaplJz9upt7qaaaM1/jNJeii/4w2vcTUr08HLfohSF
 0WrBGMOFjuImMZhbihPfXObfzYbK1sBT0exCgGQJ/PV4A6MlO4HvKFKisMyW87/NQESz
 EMJw==
X-Gm-Message-State: AOAM531oVh11oO50COa7WCrqoHqokDqhv1osx4dydriTBDGay+/2wXjY
 cReNM5nj9eakRFejg6q/Y5Smr/7fC11y92GaiVrB2A==
X-Google-Smtp-Source: ABdhPJxDmhv2Wk4xS4LtcVnjVmDgD0uv50Ee3G6tTvQATi7KZyc3eV2KcY6vd/PwCbVrxO/pvQ+fcQrosyCBMLqNaLA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr1388223otn.126.1632349208588; 
 Wed, 22 Sep 2021 15:20:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Sep 2021 15:20:07 -0700
MIME-Version: 1.0
In-Reply-To: <002501d7af73$ae0a7620$0a1f6260$@codeaurora.org>
References: <002501d7af73$ae0a7620$0a1f6260$@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 22 Sep 2021 15:20:07 -0700
Message-ID: <CAE-0n52DcCwcdR07fvMLrj=RJFtNthy0FdWmt1gBWiD9eLrOvQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
To: pillair@codeaurora.org
Cc: ath10k@lists.infradead.org, govinds@codeaurora.org, kuabhs@chromium.org, 
 kvalo@codeaurora.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, youghand@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_152010_375755_AA51060F 
X-CRM114-Status: UNSURE (   9.04  )
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

Quoting pillair@codeaurora.org (2021-09-21 22:35:34)
>
>
> On 9/5/21 4:04 PM, Stephen Boyd wrote:
>
> > +static int ath10k_snoc_modem_notify(struct notifier_block *nb, unsigned long
[...]
>
> > +
>
> > +          return NOTIFY_OK;
>
> > +}
>
>
>
> Thanks for posting the patch. It would be preferable to use a different flag
> instead of ATH10K_SNOC_FLAG_UNREGISTERING,
>
> since we are not unloading the ath10k driver.
>
>

Ok. I'll make a new flag ATH10K_SNOC_FLAG_MODEM_STOPPED and test that as
well.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
