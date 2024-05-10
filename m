Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE78C25B10
	for <ath10k@archiver.kernel.org>; Fri, 10 May 2024 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4Chi7FQsImO6C08GNf9uEOdcEOp5eUHyPr9M94jyZk=; b=f7W0VyFNoSqjlONJ3LOB80GBbM
	95kLRbjXL7SNOOqSvw/rdH8FrT6TR0tt+xLtPuaOJTkvxg2PZj4K38T6adKBEGN0Y6G+TWPUNe23I
	ErIblTXRSvjr32Z80hWizqFJZiieoLjx9Woh9iVK8iAyhPEanQjtX9P3KST9bTwII5Zmhofgd9OAj
	L3NZPxP2JRq4iBBgpylZcaibQdLY3VC/uZXzZw3/I7htG9FbGsw8+PCyA1QkzrW/8pB+WsHfkPjV1
	6grc82NV6k8Xlrn2MKkCbadT38Iht8W95dJyKsvttwArplElYwuAaUVbq7Qm0knfPcu4dN0fpntjs
	fHPirn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5R1U-00000005WBB-3RNL;
	Fri, 10 May 2024 14:14:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5R1R-00000005WAX-1NEA
	for ath10k@lists.infradead.org;
	Fri, 10 May 2024 14:14:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e8so13408615e9.1
        for <ath10k@lists.infradead.org>; Fri, 10 May 2024 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715350490; x=1715955290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V4Chi7FQsImO6C08GNf9uEOdcEOp5eUHyPr9M94jyZk=;
        b=Y49d3uhDrsyedzxs/OzXZm6iOrc37HCVC55bdYjC5pnlIYs7slOiXFBlt/z8xQ6jVE
         VTRaaRUw1tdYOSK5HaZeTCNuaI2RnoEX6Q4plndb1ADtdvIwvHmmKsN0q4nasJFF/mOZ
         y9puofSuE7SgZXD1T9VFiujOLIMLFuADnfU0H+Ky8vDUgmkOAZjLTco6SptInMNLUMt8
         XS/tPooTnMAV6+74UBo7+K0iw37j3Gu7tf/2CQFE9yXSNZyArNLkEWxD2eMYGntg/8gs
         FBuS0lYf9KdqasdfdJl+4Pqfc3WxT1zguRpa1HXmjUEGcW/w/XZqm238bA8pLSprE03v
         UU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715350490; x=1715955290;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4Chi7FQsImO6C08GNf9uEOdcEOp5eUHyPr9M94jyZk=;
        b=UiATvlaEvXkCTPT1bwhzH0tl60fiCQkmya4cDOmz56Jps8iT64W+ebB6Qf2inYYaGO
         9BE59R6nsDaiHywq2JhCIwF4Rk5QJnDHIpssGdxIUNZXm+ouoBPY8tNi8J+MwXJjZCfA
         kL/GsJbgsbIfGJ2GTFwCOBUb6eLNp/6HZSKk0987mz6rmFN4Yo8KbRJOFqZoeY/EW06v
         UX/gKjMWoRYklAu2m7U36HXNfQtIJKVnuDDgSpuecnG++ZV0UFUutarQsEDmK0qq0UzH
         3HrAgtDDDxMjUgdf67tTenQHsUW0/O8l1iq5Qdh9W+KwMmVBZeptIiF7RSOkSzCjh73W
         PfEw==
X-Forwarded-Encrypted: i=1; AJvYcCU3n/ffOBJXM6lMsmhgkaC5oqS61R4xnEh4Tq5rMzS9A0TnoXxa3bUxrS2EMs5EN4tndZI5KKaQH1LLiuRF8h/FYaaWjItdaKrmQw==
X-Gm-Message-State: AOJu0YwGjy81C0Wvk1l/W4m3GP3o/aqFD5b5yHJgoN7Jx+N2a1Ii3xFF
	ukNhNEfrwWv/jTpulGkmJWgBeOGsrC4vG8ab3e5YPAfRbeuBkztq
X-Google-Smtp-Source: AGHT+IGOLYUOycFRbQJ2nHehCiWT7J3HpYvUMXtGyYTQmtsn+zy5jklYhoqjlwyylQUwP3VCoztrQg==
X-Received: by 2002:a05:600c:5685:b0:418:f991:713f with SMTP id 5b1f17b1804b1-41feab42b13mr20922365e9.23.1715350489598;
        Fri, 10 May 2024 07:14:49 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf9esm4675703f8f.91.2024.05.10.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 07:14:49 -0700 (PDT)
Message-ID: <663e2bd9.5d0a0220.d970d.cbf8@mx.google.com>
X-Google-Original-Message-ID: <Zj4r1RDdVleh9Y92@Ansuel-XPS.>
Date: Fri, 10 May 2024 16:14:45 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	Sebastian Gottschall <s.gottschall@dd-wrt.com>,
	Steve deRosier <derosier@cal-sierra.com>,
	Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
 <878rcjbaqs.fsf@kernel.org>
 <648cdebb.5d0a0220.be7f8.a096@mx.google.com>
 <648ded2a.df0a0220.b78de.4603@mx.google.com>
 <CA+_ehUzzVq_sVTgVCM+r=oLp=GNn-6nJRBG=bndJjrRDhCodaw@mail.gmail.com>
 <87v83nlhb3.fsf@kernel.org>
 <7585e7c3-8be6-45a6-96b3-ecb4b98b12d8@quicinc.com>
 <cce2700c-e54f-4a50-b3f0-0b8a82b961a4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce2700c-e54f-4a50-b3f0-0b8a82b961a4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_071453_417583_62AD451D 
X-CRM114-Status: GOOD (  23.17  )
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

On Thu, May 09, 2024 at 09:48:08AM -0700, Jeff Johnson wrote:
> On 5/9/2024 9:37 AM, Jeff Johnson wrote:
> > On 5/8/2024 9:50 PM, Kalle Valo wrote:
> >> Sorry for the delay but finally I looked at this again. I decided to
> >> just remove the fixme and otherwise it looks good for me. Please check
> >> my changes:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=688130a66ed49f20ca0ce02c3987f6a474f7c93a
> >>
> > 
> > I have a question about the copyrights in the two new files:
> > + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
> > 
> > My understanding is that Qualcomm's affiliation with Linux Foundation via Code
> > Aurora ended in December 2021, and hence any contributions in 2022-2023 should
> > be the copyright of Qualcomm Innovation Center, Inc.
> > 
> > 
> 
> ok it seems like Kalle's v13 had:
>  + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> 
> and Ansuel's v14 has:
>  + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
> 
> So Ansuel, is your work on behalf of The Linux Foundation?
>

When I resubmitted this at times, I just updated the copyright to the
current year so I guess it was wrong doing that?

As you can see from the copyright header this patch went all around and
I think at the end (around 2018) the Linux copyright was added as it was
submitted upstream. (can't remember if maintainers were asking that)

So me watching the old year and resubmitting it, just updated the date.

Soo I think we should revert to 2018?

-- 
	Ansuel

