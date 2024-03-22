Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC93C54E71
	for <ath10k@archiver.kernel.org>; Fri, 22 Mar 2024 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avF4Td+5sDoAM4wZ/tsgIe8phCBwKRX1SbsfID3iEnY=; b=jv5TqY+SQ29lADVMjVeP329sKv
	IoYTS6euXAR5Eb39/EiO1l32Hcfim1YHWe0ocYQgjI2OM5x7odHAUwLfjRne0LjOJt9xVmGMi2uIf
	6P7WL1O7Z4dZAcSDp7NTIEWHuYti5BZjKcRZzHRSc9i6DVHYi2wUtzmaC+ahWF0Q7qE+rdRNKFKKr
	cvx2NFPfPONVyT9Jct6TYPjjcZaNIUy30jh1Y9h0NhsY49u8QlZJZVyJZtD7vIUgn/jBs+KvBIhkp
	6dFg0LcGT447TYl0qh4tmd9vgCqizPE2gU9GAqfTy7BIc3vE+yfeQMdM0Wo+n3bIwjFLNhfxc1/+4
	ExduhL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngLV-00000007dyM-2Xj7;
	Fri, 22 Mar 2024 14:58:13 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngLS-00000007dvW-0FKB
	for ath10k@lists.infradead.org;
	Fri, 22 Mar 2024 14:58:11 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512ed314881so1715127e87.2
        for <ath10k@lists.infradead.org>; Fri, 22 Mar 2024 07:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119485; x=1711724285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avF4Td+5sDoAM4wZ/tsgIe8phCBwKRX1SbsfID3iEnY=;
        b=TfK2caaoNv2UXBk5JHsYV50V6qNeGFzJqpBajpOKWAvfxH3qmCZMfLirVNFYU1/Nf7
         RrbXLiOboXZE97MfLzhLzF7vbc/R/oKVQac+pVoH+FXdR9mjuUunJgUHbCCPTEuMQyLs
         vymAPrSJmv6A8utbS5FCXZJc3W1coEtdsQ8BULW8OkZSDvwQ3AZfvYE8Co7E7pSHuXAG
         aj4uvl4OA6eOf+U8UqeG8oTfdFLWa7DE52FFdsm6q/l2eODrYQqxuhy2SUrJbQVDIucC
         fFUWlcd88YSyuET1p7GqYtDKxjhPeenx/j3MeGeHesHpZ0ZEWW+3vyu4jWcE9U3uB7jc
         dnHg==
X-Forwarded-Encrypted: i=1; AJvYcCXxGA0G2u+1TKBKWUKJJZ1gdmB/ZMrci77fAWVYgndHLEw1v7Vgddur0wt6rXi9/az75BdeOIConpxUf7PwWZ2RepcIEi5NyKl1JA==
X-Gm-Message-State: AOJu0YzD/fJHcxHnjwS2Rd7sOwlM87Ri2AjAnPzJAGZeMVljtNedsCkk
	PvaTi8t/tx8TLVxQAcDSZWxFBwulccbgtQgr2YGkiZOEaNTaya7BUeusJvIO
X-Google-Smtp-Source: AGHT+IGMJBLo25QPNpSET5oDNLsq0cOYHxH7EFzxe+KeRHX7TPHuh19xx4qN1EKC/FYZuU9cxgRfaA==
X-Received: by 2002:ac2:546d:0:b0:513:cab1:354b with SMTP id e13-20020ac2546d000000b00513cab1354bmr1898523lfn.41.1711119485063;
        Fri, 22 Mar 2024 07:58:05 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906351000b00a46cddf1efbsm1092197eja.29.2024.03.22.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 07:58:04 -0700 (PDT)
Date: Fri, 22 Mar 2024 07:58:02 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, keescook@chromium.org,
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
	"open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <Zf2ceu2O47lLbKU3@gmail.com>
References: <20240319104754.2535294-1-leitao@debian.org>
 <9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
 <20240321072821.59f56757@kernel.org>
 <5039256c-03eb-4cda-8d11-49e4561cf1ef@quicinc.com>
 <20240321151744.246ce2d0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321151744.246ce2d0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_075810_122930_BA4ABA07 
X-CRM114-Status: GOOD (  14.96  )
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

Hello Jakub,

On Thu, Mar 21, 2024 at 03:17:44PM -0700, Jakub Kicinski wrote:
> On Thu, 21 Mar 2024 15:02:39 -0700 Jeff Johnson wrote:
> > >> As suggested there we should just use kmalloc/kfree to match the existing logic.  
> > > 
> > > Please no. There is no magic here. alloc + free must match whether
> > > you're using magic object alloc wrapper (alloc_netdev()) or straight
> > > up kzalloc().  
> > 
> > Based upon the ath11k patch there must be something going on with
> > alloc_netdev()/free_netdev() that doesn't occur when these aren't used.
> 
> Looks like init_dummy_netdev wipes the netdev structure clean, so I
> don't think we can use it directly as the setup function, Breno :(

Before my patch,  init_dummy_netdev was being also used. The patch was
basically replacing the init_dummy_netdev by alloc_netdev() with will
call "setup(dev);" later. 

-               init_dummy_netdev(&irq_grp->napi_ndev);
+               irq_grp->napi_ndev = alloc_netdev(0, "dummy", NET_NAME_UNKNOWN,
+                                                 init_dummy_netdev);

I am wondering if alloc_netdev() is messing with something instead of
init_dummy_netdev().

Also, Kalle's crash is during rmmod, and not during initialization.
getting NULL after free_netdev() is called.

> Maybe we should add a new helper to "alloc dummy netdev" which can
> call alloc_netdev() with right arguments and do necessary init?

What are the right arguments in this case?

Thanks!

