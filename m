Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA753C27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cokph3+KYsFeNsm+0akdDgXIRf+sbN6W33vmdBN3BV8=; b=CJiDvYK5S0RakGAF9xCoSfNzCw
	swbaRMLURCsSYEuoCxPvQ2OcN+sAOBlHsOlgtSuly0UwCKGkZ6++dRpTLRZHmWWrzFEu5Du947aFW
	qvmPm9XxaK5y6WULvKT/N91A9Tgs9fy4tTiN7BxHCUOqVskBLvH+KVkFKonsAbWc+eVAzN4Eyo2BN
	jt1vZKhimXM8mjycp+lvUv0TByRElOH3XcY7LUHpbQkf2HPJcrpq7i+ympKPJbgS1Loa64XakzPd3
	6DM1oS5pqHamCCJ9esU75k7hkiEhKoXvm0GFLzn6kiabZPIK//A6FYLNesHHGOQ5NI75/jE4k+DSl
	ADtdlo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwTM-00000001bjM-2CW3;
	Wed, 19 Jun 2024 14:39:42 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwTG-00000001bhZ-3eT9
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:39:36 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4449beccc7fso6317481cf.0
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807973; x=1719412773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cokph3+KYsFeNsm+0akdDgXIRf+sbN6W33vmdBN3BV8=;
        b=nzlU7fQNNOM1Z2Pf3nRH/IJRQ6JQpsOBve66VHG3M/4W4LeFUnCpE75zcpCiRukSiJ
         0uTmFBix5uXQegzDd14NMUI9AXElb4KJwD75oVQmEYm2JFe4Ap22Stoe1IqDymTUBjNf
         4RtVKHHBlXP6aUNmjP+J0ewlJWuhYLomA2kB6uUEDyLAxl4GutaCJqnj+fxdrT2tml8C
         KEuaVqPhh5XTh3HeemRswbkvnRh7A/MPSHCSX+mYALj3SKaNZxVZz9SXsZUqBfZyAfKT
         wCaM5wDtpAXhmi3FNMtkIVp9HhdyfYCn8RMeQIF27/RRkA8X9aqEZOntdcWRWz675/oF
         Dp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807973; x=1719412773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cokph3+KYsFeNsm+0akdDgXIRf+sbN6W33vmdBN3BV8=;
        b=P9cfH9XtIWDBz19p0TjMXn5c05HC/86uiQBqux0z6pxVmvKwiqAdQZhOAxVDIfUsVE
         SYHz2d48kfdOzvd4OnilFJ3LCm+LqjMnYf8+UD0IgxOFKuJg1/jK0dJW3b4GEFeuftxF
         pqUitR9HBQkUautYBBKgFTHX5W3UKld+I5Kpdj/2pTH9zNJs0dvJ+tPz0kmJmOPOnufv
         UkYmuiGT484teE4VvtKOq3fwSF+RIr7GG5KOCgVvxRnu34EsogfKv9Y2jOcMrOovCLFF
         3+xmOQWfqto0EU0f7ZQC1OOZGR49X2Ct68Rz17m0G4ZS/uOGUTzEWk2pUO9ueq7OzQ3u
         800Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7IaH2qBgJKnsTPVa9h6kuucRK/IAw0Z+VgO4O4iIH6+6diUF5UGmJsuBFkcWDjORpU0Vp4ifLdO9x/gBhK7lLy8AFqcFXD/skIw==
X-Gm-Message-State: AOJu0Yw9sow9Fi0wkrsIPuN9NiQNM8+0FDrfp3xv88pfia0Cjq8blsyi
	ljfhrsmIwW6gZOQvLegzM4yWWuly8BC+gpUOepgj3Dayh3nW3tHLkNWeOBP12Pc=
X-Google-Smtp-Source: AGHT+IG1XaOP45+fSUMkTGWH4nocXjjMBFeSWjsksr0Y1tefBQYZu2xLsBBhuOT4sOfHsJbLjtz4+A==
X-Received: by 2002:ac8:5ac4:0:b0:440:5b49:2d63 with SMTP id d75a77b69052e-444a7a76f5amr34714511cf.66.1718807973466;
        Wed, 19 Jun 2024 07:39:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2ffb37bsm65405151cf.90.2024.06.19.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:39:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwTE-004dqv-Em;
	Wed, 19 Jun 2024 11:39:32 -0300
Date: Wed, 19 Jun 2024 11:39:32 -0300
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
Subject: Re: [PATCH v3 13/21] soc/fsl/qbman: Use iommu_paging_domain_alloc()
Message-ID: <20240619143932.GH1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-14-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-14-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073934_933098_9810EF6C 
X-CRM114-Status: GOOD (  11.18  )
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

On Mon, Jun 10, 2024 at 04:55:47PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in portal_set_cpu() and is attached to
> pcfg->dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/soc/fsl/qbman/qman_portal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

