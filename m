Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C971EC27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkVwYQV/6jkEu0gAJvlVuepnjhHRXhEpVh+YOuYu3ZA=; b=PqMqC34Z1kKNFd4agm0rLMRmFN
	voxlspF7lFlBFjdC7UYoOnBzX4z+MNBJrxJHYujLOE0JVuuwGJnqMoz0xkx0/rvnna6rm+Uy74/kn
	vDHFxci1wvtwABzfyIYXCrdU2Nk3qR+OI/uGOJXwtMRpWqaZt5X1ND2Nd85PW8uGsULZHqxiQuzC7
	E5cyvVnyZDLMh8DuCv6JmZGquvxMs1ZVIfcv82DsYEjCzr4km7SrLodqI8MBeI7QHUN5fq0cMmNEm
	MYYUQqj+LK2I5Lb7qFu+pF3XJkuVNRU8gws8dkPE2jS8v+6P797vNg/g7ZnLnUrQs3cCJqxhwnIpP
	hRocqbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwKN-00000001XSn-1AlH;
	Wed, 19 Jun 2024 14:30:23 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwKJ-00000001XQr-0CnB
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:30:20 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-795a4fde8bfso402372185a.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807417; x=1719412217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KkVwYQV/6jkEu0gAJvlVuepnjhHRXhEpVh+YOuYu3ZA=;
        b=eDSL7H38nrOKzkE/ZNioeaRL9iLjjhcVRAP7aGqpJEWRyBzKHHwyfCiIQ+vZPOEKy6
         +y1keEI0kQQxEh3TyEGikzznYYaJlK4JgKijwwzjJyy4RyHknM/Mbmp9h9rx+PiDZXdb
         z8Yl61I4tj/To0YtTZ9FBOIaICeE38FCKYZ6fnyho63EvXBjrkD1Og9jKb3zw308AdIT
         V16tEisN9jjIxnm0rVEcCRXLxS4cBCB4nHUBnNlQuxyJxPYtA/ukFTRtsb0QqyywTosv
         mo9QdcAELZQC+we/7VWZqY3j2vuNbluK/k17nqjs5rwduuYaIZ5v87eu4UXdrcwnDhXE
         SmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807417; x=1719412217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkVwYQV/6jkEu0gAJvlVuepnjhHRXhEpVh+YOuYu3ZA=;
        b=h9m0Yf78MogVzqYWu9UqhdM2o26bwb2v/ykh/qpFrXvdWTsib8SVCJnLgrKW01MF7w
         hVnFfv/kDatDE4G1VmRrTqUD7t+ezj2mlLwyT0vi+lMiR0NUaqWZZ8+KVtmOJ3DCslP+
         Uj7RL3EhbnfL4Z7MgyqtvGvMrhbe5BfHI/63vqNXoyaSPtxuHUpuOq5dyNMYyLAng9PL
         QDadxNwy4AjlGINW23isF0y8bsivmA5RlCvKpj0rNoAYFQQbxybIkhvkgfwvit2hgTcF
         Rofk1+MAh+0VEkjUXjCBjYq4nhYYHDkJYRn7XLH/REyhxjj+4vu/ShnRatPBaB/63uSu
         Lp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWifqXToA7+Y+C8JkrY82b9MmI7B8N3QDHacD9MmBbjNmk5o15X3ZUyDMhdm4gKcMAUPhbu4W10S6bzpJyrtYh6kfzSc7iLHcvmzQ==
X-Gm-Message-State: AOJu0YzwupjHv9Dl9h3EwGYZi9u/f14wgV71MvRP5I3apb6oyTuDcmAT
	tdtAyc1UKcNo4VvRTvHMF3/GZx6XWqSpl+qa2eLgANxZPdEW288bmLRi4OZy+Pc=
X-Google-Smtp-Source: AGHT+IEtPhZvg8s2LGCIdwsd0X9DzLfBviQVD0T9AfPrmuxMxUw2V/bv52uCre/jcfSESaPOk4IESg==
X-Received: by 2002:a05:620a:4721:b0:795:4fee:81aa with SMTP id af79cd13be357-79bb3e55a93mr284092385a.33.1718807416680;
        Wed, 19 Jun 2024 07:30:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bc1352ab4sm16883085a.70.2024.06.19.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:30:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwKF-004bBv-Kr;
	Wed, 19 Jun 2024 11:30:15 -0300
Date: Wed, 19 Jun 2024 11:30:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/21] gpu: host1x: Use iommu_paging_domain_alloc()
Message-ID: <20240619143015.GB1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-8-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-8-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073019_102810_D5B49676 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Jun 10, 2024 at 04:55:41PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in host1x_iommu_attach() and is attached to
> host->dev. Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/host1x/dev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

