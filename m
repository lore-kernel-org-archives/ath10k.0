Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC545C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 17:31:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A54C0610FA
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 17:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A54C0610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bl9hOIZlXv8+jJ4S14xMB4j5RkKJmHa4+TULeCDtMrk=; b=McKEF/SZTOviAigPOhnCKeqe4B
	QIlFNjlNAHpj3jaQxs9WZS3IW1a1NZbXv6tJvuAF7JNkLetBSYJUiS8Mmv2HmBix+tYjOhXtzwuOw
	exlO8zVUXmHwo7noGivZ7n+KmuyT8A4Um+9hs2RpEUQEVPedz+NcinqqzTlutYIyqevSUJWfdhy4D
	bId51u+Jf781DesaUwFYod30PGOFqsrpy3R8GEjTUl6xDFP2wNEiQ7TNh1+OYgTNsYVgoLT6Hszqt
	qPuU0kTt6A+vmyCHFbS/FPFLt94gl3LUzdsmA80Cwuqd2RXbeBKJyc8s9B0EHhBpKB23QhLOLO6qT
	KUqkM7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGPOn-006JBk-CI; Wed, 18 Aug 2021 17:30:45 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGPOh-006J9T-Un
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 17:30:43 +0000
Received: by mail-oi1-x22f.google.com with SMTP id o185so4348815oih.13
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=X1JvNj6TPH+OCZuoL+69d7aXsqVTanSmq4nlChB91RM=;
 b=UfclXNE6fS2NX0zaGPyHaQ9Sf51yRwlF1tIwR0Nlt7IrrO8SDVjg6xc4bfNPGdnGJL
 rG2kvtG5zfJgWqRJGgUr7iIkkC/97HU/n2ou4jDX4Z4lzRDeylPLrCvmuUFF43PVzEUS
 JgU/6dhsSBUgN3Dzg4wAy6HOVxpzz0G1c/Kp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X1JvNj6TPH+OCZuoL+69d7aXsqVTanSmq4nlChB91RM=;
 b=B97nI10p+o0kPues/TeO3cbfgmDYjFY8PHlUYFv1J1Odo3EHfk81DSOPcFR1W528O9
 8714883Eb2FHS+nkunRLWzPaHLnPP+g+ok1wydDBO2EcfrbUpcXVpv1o2eMMjNDt9odN
 CtdlD//30i2QYF4SSJ88tQVc6m1Uo23AizYgzmNBYrWuMcI8+znQRJZ4o3nMpslR6QZE
 /xms22BKmzAK5vYtw1sw+R6qA7uNxzDLiPZVKuMnoKV2NZGpwzGcD8htP79WtYwxkuIQ
 Gw3ae382I77CNuW009xdExfqvGsk5OS8aWL34XrTJlBBeXcut+77JoLH5cfscs0FulZH
 sJ7Q==
X-Gm-Message-State: AOAM530TqyV7Ol3XOyUnQF/KJIzXD0We0QzndVpSR2nDLU/XlP0buQ8T
 DOSuZJu5FCWh+Oa69m4BrvzbQw==
X-Google-Smtp-Source: ABdhPJxcxzje4axs4isWBNvSoYF1FO1zc5wsEp46nT2W663U4WNanGxKa8wkDVSmcAAWpvRqcj6/Iw==
X-Received: by 2002:aca:b608:: with SMTP id g8mr7959112oif.66.1629307837970;
 Wed, 18 Aug 2021 10:30:37 -0700 (PDT)
Received: from ?IPv6:2600:1700:38c5:675f:4c90:f673:77ac:78b3?
 ([2600:1700:38c5:675f:4c90:f673:77ac:78b3])
 by smtp.gmail.com with ESMTPSA id c16sm124828otp.59.2021.08.18.10.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:30:37 -0700 (PDT)
Subject: Re: [PATCH] ath10k: Do not call dma_alloc_coherent() for SDIO and USB
To: Arend van Spriel <aspriel@gmail.com>, Fabio Estevam <festevam@denx.de>,
 kvalo@codeaurora.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, hch@lst.de,
 erik.stromdahl@gmail.com
References: <20210818150943.1630199-1-festevam@denx.de>
 <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <369c1f89-df33-455b-773e-a2e0dbf582ff@eero.com>
Date: Wed, 18 Aug 2021 10:30:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <17b5a29d098.279b.9696ff82abe5fb6502268bdc3b0467d4@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_103040_087147_42EB3D70 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


>> Fix the problem by not calling dma_alloc_coherent() when the device
>> is not DMA capable, such as SDIO and USB.
>>
ath10k calls dma_alloc_coherent multiple places including 
ath10k_htt_rx_alloc.

Do SDIO and USB not use such data path function at all?

Thanks,

Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
