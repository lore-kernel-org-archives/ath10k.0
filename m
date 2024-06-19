Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891D7C27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlJ0YGq/uQqUf811AzhVaKREy5VQopM9S0iNxCm0jic=; b=mhKqR0qvn1eaE1+Shwq3n85ay3
	VuxXqT02ykFFdi3kK7mxpj/9xdRxPfavei/6fAR2h3PW5Hs19KqqDI/gx+shJNHxquoGjkc5WCbsw
	zECwoCtlRApeDjnfnvbKvyiSSMexxHv3fQ+PI1lFxGbNkHl4EPQZ2lnDZUXDA0VXAdSRNpGhdK7qj
	3lzwSKuLbpstGIm8cMtPXEgk3Xv1KAjdDsIhObsZ/qr1dtCMc5bDlcUtrSya9pu3dusqu6xtdkD+m
	2hshLopCnZJ+MGnRC5P4epqpf6051F+7/VwXdtRzsj9ny+ho96CtB6Sbjr2MJRndhXtHSPMfAOBNT
	7NgdvLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwzi-00000001kXk-0TI7;
	Wed, 19 Jun 2024 15:13:07 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwzc-00000001kUp-2kBv
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 15:13:02 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5bfa5f9bbe6so1976022eaf.3
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718809978; x=1719414778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QlJ0YGq/uQqUf811AzhVaKREy5VQopM9S0iNxCm0jic=;
        b=Tnchv6Fe3+Zg5A3XVSWSWDetoclWa1Yb9ziHwObxnMPlU90uNprFIsp1FIZlhiAXg5
         cZ7EMUaDA4Ziv5Udveh2ahc/E+oVSBHcap1Q3J59W8LTeObMuiqHSEr6Fi+l3kro9gHO
         gDMlNQzebFNe/B3fi0717Y3iG+u1dP6UkDbZCYfUiTBITCRvy/lcX84SdJFg2ntCcXrr
         +0J67nHw4tEYiWnEpfeGKZpB2F3I+31XCc8b0GmkXoiaijFtjhbjCp/V9YsR5gKY61iq
         n02OiBRoFyL5APB/IsFSo36qZg2zG6b/QyPZwh80RrkC6lQkZNA+oMI/4qg0ygGMZ421
         vB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718809978; x=1719414778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlJ0YGq/uQqUf811AzhVaKREy5VQopM9S0iNxCm0jic=;
        b=nsKvI+DHe2gPkdMJDaxmzeToZlryxx+ATi3ya6ATlSDeINzzY+bTBNLal7E+PkxLjy
         RGqXXE7d4gtPBb2XPgJpwS7jniCjZkD+hkGj6kmrQjZLSevVxNl9EQLoZMb02+aj/fzN
         NJS84SWj7cyenI6XTwuR1U7ZS7cpRC8RBJXBG7jx9u/yeU3nGWhM4YJdsjM+3gfA3Yz7
         Fz6RRj9Nqdej1HDoNyj6QkodPjje00+4SK4ASWA3u7QmFb3xI3lihucUl62Ntguybspp
         D4yyDyG52gsH12NN+UCqrfNeg8TPLghPbjsvRsEH+eQ+kevDifkJV8yACuwPazskIBP8
         11qw==
X-Forwarded-Encrypted: i=1; AJvYcCXw5ryZsavYeQBhrSp7bZcH8AkZ6rV1iSjXdio7Ed2piizJfjYAQ/g+QHmI9ys16xiXJUK8dcuJkg/2TdakVGRrAxu6rbF2JABRmg==
X-Gm-Message-State: AOJu0YzCtizx7xsxDPV8I4eI+eZdECOTbmbJi0xYxwWwXpEemfATktiH
	cAKKPzfJr2xJWNBuwoCOJOZDos/L9nftAKD8pjoLWzHYzn52a1uI/vtE8EJ37PU=
X-Google-Smtp-Source: AGHT+IFeMMh1MCvYS1yX1hUJEbWMiIeodyR3LLOeXWWow0gzjafVlyBklU57KB2trj16/I1ogvctnA==
X-Received: by 2002:a05:6358:9886:b0:19f:4c1b:f0fe with SMTP id e5c5f4694b2df-1a1fd45a708mr299401955d.18.1718809976550;
        Wed, 19 Jun 2024 08:12:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc0719fsm613804685a.83.2024.06.19.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:12:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwzW-004nFq-WF;
	Wed, 19 Jun 2024 12:12:55 -0300
Date: Wed, 19 Jun 2024 12:12:54 -0300
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
Subject: Re: [PATCH v3 15/21] iommu/vt-d: Add helper to allocate paging domain
Message-ID: <20240619151254.GI1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-16-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-16-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081300_733761_87F44138 
X-CRM114-Status: GOOD (  21.03  )
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

On Mon, Jun 10, 2024 at 04:55:49PM +0800, Lu Baolu wrote:
> The domain_alloc_user operation is currently implemented by allocating a
> paging domain using iommu_domain_alloc(). This is because it needs to fully
> initialize the domain before return. Add a helper to do this to avoid using
> iommu_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 87 +++++++++++++++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 9 deletions(-)

It seems Ok, but I have some small thoughts

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 2e9811bf2a4e..ccde5f5972e4 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -3633,6 +3633,79 @@ static struct iommu_domain blocking_domain = {
>  	}
>  };
>  
> +static int iommu_superpage_capability(struct intel_iommu *iommu, bool first_stage)
> +{
> +	if (!intel_iommu_superpage)
> +		return 0;
> +
> +	if (first_stage)
> +		return cap_fl1gp_support(iommu->cap) ? 2 : 1;
> +
> +	return fls(cap_super_page_val(iommu->cap));
> +}
> +
> +static struct dmar_domain *paging_domain_alloc(struct device *dev, bool first_stage)
> +{
> +	struct device_domain_info *info = dev_iommu_priv_get(dev);
> +	struct intel_iommu *iommu = info->iommu;
> +	struct dmar_domain *domain;
> +	int addr_width;
> +
> +	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&domain->devices);
> +	INIT_LIST_HEAD(&domain->dev_pasids);
> +	INIT_LIST_HEAD(&domain->cache_tags);
> +	spin_lock_init(&domain->lock);
> +	spin_lock_init(&domain->cache_lock);
> +	xa_init(&domain->iommu_array);

You should probably split more, with an 'alloc struct dmar_domain'
function that can be used by SVA and others too.

> +	domain->nid = dev_to_node(dev);
> +	domain->has_iotlb_device = info->ats_enabled;
> +	domain->use_first_level = first_stage;
> +
> +	/* calculate the address width */
> +	addr_width = agaw_to_width(iommu->agaw);
> +	if (addr_width > cap_mgaw(iommu->cap))
> +		addr_width = cap_mgaw(iommu->cap);
> +	domain->gaw = addr_width;
> +	domain->agaw = iommu->agaw;
> +	domain->max_addr = __DOMAIN_MAX_ADDR(addr_width);
> +
> +	/* iommu memory access coherency */
> +	domain->iommu_coherency = iommu_paging_structure_coherency(iommu);
> +
> +	/* pagesize bitmap */
> +	domain->domain.pgsize_bitmap = SZ_4K;
> +	domain->iommu_superpage = iommu_superpage_capability(iommu, first_stage);
> +	domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);

Then some of this stuff is really just paging only. Like
SVA/identity/etc don't have pgszie and other things.

Jason

