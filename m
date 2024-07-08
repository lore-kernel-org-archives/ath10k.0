Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA5CC3271E
	for <ath10k@archiver.kernel.org>; Mon,  8 Jul 2024 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFoxv2StTkAy81FUVFoM8zRGh/jhofwCwoDeHKUmFcQ=; b=c70dVfHZua1ecZFnYbyVYyt6T8
	D8FnpmIUbhGonvgSHn96mrKlEJJnV3SnlEydiomPHRpngOQ4C06Z/dhdeBpCMJo9mcf9Typzc/icI
	Myiqcxw5ii8vwNUnj982RCtHWMOPuzHh9quPo5z12flfCWwPwMXiPjZVaQ/Mzq2JuJqAJIL42aVIY
	QlCnRwJS+hU7R+i6LkK2Poye+6fqa80c71/cRdxfJyX7QDG6f8sZqar9mcGkHjEalQXxyO3q3XDvc
	Uu3PMW5tq2M1nLxWKmLgxaCFd2lW6xBbxYaPdYKpQRmsdF9ODCa3GA0YHlua7T+SZ3T3X8DxuLVDk
	HEcBqdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQrJd-00000004S3j-3trP;
	Mon, 08 Jul 2024 16:34:13 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQrJa-00000004S2J-15NU
	for ath10k@lists.infradead.org;
	Mon, 08 Jul 2024 16:34:11 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-703631c4930so1121979a34.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jul 2024 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1720456449; x=1721061249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFoxv2StTkAy81FUVFoM8zRGh/jhofwCwoDeHKUmFcQ=;
        b=c8f9EWfokgFC2WlvZPFWp3Qgb8fFhycfOui/Q++eodqfyVaZ0PTod/tRI6p6sW1GoK
         deqPLXFH6jQwz4RCcfsMM2V7LnwNA+Z90PDXTvp1VsaHcE0D2YMprCyS7dgwvk9aAmQX
         n9YxMc+toDtD38zeG6iJqGbvKzXpTNPa3xrOb8vre0Vkr3Gkv6aBxo8EyEtX8deDi5YC
         Y3Ss023STA9V63ZIZcSd43V4EtUroJLhFezlzFW6K1WM9DT89cwpmInxLZFjTlYsBQs7
         PwPuZr7agQ4sQ80c8/OPFn6w4UPIGF7wELqcsx8MOSQXBtw/WJlIIV+C95/gvLjuvJZL
         Ov2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720456449; x=1721061249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFoxv2StTkAy81FUVFoM8zRGh/jhofwCwoDeHKUmFcQ=;
        b=RhJcZOiDMqLXNBnnAuJzMHb02+tBMuCp6oRDRaCEhSf5UmVOYGbVxnuVcwokqY/6M4
         dv1n9rpeKrCSaYJvzLxOGj2NiEKKSa1aZy2J0YLglbkzFV3GE3qswxgFE82IqeC04+6A
         OsAbTdupxNn2AZqtdyk1Zs35KEUp3uRuP+bhjOkAeucw3A1fRRcdrOoLnCE/mZ8nwvS3
         LkOAQ2DLmlR1mxOKrsInK6v0WFGOqBMmc6MQCQEj1rrpuwi1vxvceqoAuLItBH3p2QEE
         3Rrn6FYckWClUWpwcKPkj3qHIyHEsACNdgG739oXBRq7lfxsMNE0rX/Xx+JZAvXLOH/R
         M+/w==
X-Forwarded-Encrypted: i=1; AJvYcCW1Pt3AuvBMLiaaASGB9tTdE4Gyc3P2KWpBvxNysn0PLQHTAuwP1HuOeFz2Y0lHKKwJ6KKm3iUspPBRUqYpKWiA4NADsrTFcOgYZA==
X-Gm-Message-State: AOJu0YyXZlX5E11UwQT6Mf2XZmJEa6HHn2BmHDE65hcUKdO7C/ip1Yag
	YrbVWipvQbMHlwxlEiOGeb+RMw/fVAXevAWTmGZ2AS45f4WyGIC+snFeNPCbaU4=
X-Google-Smtp-Source: AGHT+IH+SY7z9YUcEZHvm3NIhA2HWB3anmidOCwHHCYQdqIO1Nns+4jOSBLNnwnl/BLk4XULUJpMlg==
X-Received: by 2002:a9d:7996:0:b0:703:60b7:5de6 with SMTP id 46e09a7af769-70360b761b0mr6939936a34.27.1720456448709;
        Mon, 08 Jul 2024 09:34:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f1900f2bcsm7175785a.32.2024.07.08.09.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:34:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sQrJX-000TAF-N5;
	Mon, 08 Jul 2024 13:34:07 -0300
Date: Mon, 8 Jul 2024 13:34:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, catalin.marinas@arm.com,
	kernel-team@android.com, Yi Liu <yi.l.liu@intel.com>,
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
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Message-ID: <20240708163407.GC14050@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_093410_324765_0806268B 
X-CRM114-Status: GOOD (  14.07  )
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

On Thu, Jul 04, 2024 at 03:18:56PM +0100, Will Deacon wrote:
> On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
> > The IOMMU subsystem has undergone some changes, including the removal
> > of iommu_ops from the bus structure. Consequently, the existing domain
> > allocation interface, which relies on a bus type argument, is no longer
> > relevant:
> >
> >     struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
> >
> > [...]
> 
> Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!
> 
> [01/21] iommu: Add iommu_paging_domain_alloc() interface
>         https://git.kernel.org/iommu/c/a27bf2743cb8
> [02/21] iommufd: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/26a581606fab
> [03/21] vfio/type1: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/60ffc4501722
> [04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/9c159f6de1ae
> [05/21] drm/msm: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/45acf35af200
> 
> [10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/d5b7485588df
> [11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/ef50d41fbf1c
> 
> [14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
>         https://git.kernel.org/iommu/c/3b10f25704be
> [15/21] iommu/vt-d: Add helper to allocate paging domain
>         https://git.kernel.org/iommu/c/9e9ba576c259

Great, Lu can you please split the remaining by subsystem and try to
get them to go through subsystem trees? Joerg can take the leftovers
at rc6/7 or something like that so we can finish this.

I think this is enough that Intel and AMD could now assert that dev is
non-null?

Jason

