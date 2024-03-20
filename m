Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139F1C6FD1F
	for <ath10k@archiver.kernel.org>; Wed, 20 Mar 2024 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEfzL/x+HvKfKexpvwPECfkK5QWCbVSUpN9Cn9FEYTo=; b=CbCLIs55y1viu7v21tqUR+jr0p
	UmDyCKJBKpkpVmLhnDkcwcJXK8oq9YDdPEMQVqSaWP/53XbtfckYd/hAmBU/IeN30+lk4ISHABYTO
	4OXmgs+ZpfFJIvpNcHCJ5c5SIQfVREIYfOQzqELcjPR9iprG0NBy6EhcXABdcUBxycQqxcprsuDLy
	uTwwf9cbmSDFjjh10TnT/9C4IEjHL8g/XA6bDQX9OPPPW6KYyRHbx9QPnmU+19wLFLkI1N0qScHQE
	7zubawln1DWuSAugBFK/WsHKXMnVjX0FmnykCjEmAUjfAfgXgvQx/MHjb7/QCGgkPPewelIp1hT3a
	4IaQGTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzKF-00000000PqL-1EJR;
	Wed, 20 Mar 2024 17:02:03 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzKB-00000000Ppj-1mHn
	for ath10k@lists.infradead.org;
	Wed, 20 Mar 2024 17:02:01 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512b3b04995so56984e87.3
        for <ath10k@lists.infradead.org>; Wed, 20 Mar 2024 10:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710954116; x=1711558916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEfzL/x+HvKfKexpvwPECfkK5QWCbVSUpN9Cn9FEYTo=;
        b=DXq0Irnocp7OeLKGWS3sUwqFJTs9UswFdKhQ4xwJ2R2Qb1lrhQw1r6OIuMLf7llmiG
         A7jm+fhyU8t0H6Pa1OJlMFHELi2FSt7KOuW4dF+kPoIzGbsE+4K1yxbB/ls2KEGCFs5V
         aDQx0eFtRQWunMAVjWBWmxt68GGVEYZUPfa3xNTzNnU21Srp+QAGXytiltc5loWPiARy
         XUid7eSi/1rspb/+ZiT2xsmVjdrWSHu0IKFdXBNhSL+XWJ9Ngg6Q0TT5K07TqCyBGYnC
         o5aLtRiiDyJi2KUOZSzbG5EtGND0/LhloGjpFvkVXAvtrgHVPwpQQoCRoS4s92bTmFpK
         a34Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGOGeVPFtHDjlbG7c5mCs5rxkQbVMNnlcSbacVMOhIZLFZbXHAxrAqhDTjCs4+1R89Rt6lGIxlynWFPiOEOrL1H5oaj0xoMw3Q1w==
X-Gm-Message-State: AOJu0YzkNjyKsj728oVdH2xLlnFlJho/27PiALtQzXnMG+EUMAf288UK
	liOrjostipzks7PFgJ/a47mb15kPAlNbkjgmeo6/UmNz2I3oQyiN1k955U/G
X-Google-Smtp-Source: AGHT+IFshgPj3UMN4cJiNIVIXvG/10g68W2pa6RLfXGSEY8o7CaDgP1x0o/YnloMRnopMl5TdGmZIQ==
X-Received: by 2002:a05:6512:3fa:b0:513:cf4e:941b with SMTP id n26-20020a05651203fa00b00513cf4e941bmr1681905lfq.19.1710954115798;
        Wed, 20 Mar 2024 10:01:55 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640205d200b00568b6d731e1sm5798016edx.4.2024.03.20.10.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 10:01:55 -0700 (PDT)
Date: Wed, 20 Mar 2024 10:01:53 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>, kuba@kernel.org,
	keescook@chromium.org,
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
	"open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
Message-ID: <ZfsWgVeHJXMdh5bp@gmail.com>
References: <20240319104754.2535294-1-leitao@debian.org>
 <9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
 <87wmpwaprz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmpwaprz.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_100159_489736_B202F55C 
X-CRM114-Status: GOOD (  16.39  )
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

On Wed, Mar 20, 2024 at 05:25:52PM +0200, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
> > On 3/19/2024 3:47 AM, Breno Leitao wrote:
> >> Embedding net_device into structures prohibits the usage of flexible
> >> arrays in the net_device structure. For more details, see the discussion
> >> at [1].
> >> 
> >> Un-embed the net_device from struct ath10k by converting it
> >> into a pointer. Then use the leverage alloc_netdev() to allocate the
> >> net_device object at ath10k_core_create(). The free of the device occurs
> >> at ath10k_core_destroy().
> >> 
> >> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> >> 
> >> Signed-off-by: Breno Leitao <leitao@debian.org>
> >
> > NAK this based upon the ath11k patch results.
> >
> > As suggested there we should just use kmalloc/kfree to match the existing logic.
> 
> BTW if the patch is not tested on a real device then it's good to
> document that in the commit message with "Compile tested only" or
> similar.

Good to know. Thanks. I will add it to the next patches.

