Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBDCC27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=; b=sLDjKxxc4QIhnxbnkVvrX+hDx7
	SQpe9BmqissXehruB9vLura87F0MHUgIWbuaecpg+nJsdk9b2kFKSAJe/J3EZ80C/uF49hNPMIQho
	9yWxXIuKT+igsvBJ7j6mpDJJFxohBzMLWO48RZyk16lJ1+uJCBuyQHWwD0t8bJmhGwrdJJOtcnH13
	ktZisEAcbwQ+BnIN+1gPH7D+THi0WWl1orHLdSCOoOUjC6NzbVzH+dP/oouizZnBOoEQrrUexES7B
	F73T0T/sLRBKZ9PoPVl14/RloGkRLYPHILx9TKTl8rhg/OmtdXrCWAFx6Mq+4aRi6fFKXfG4+dCUL
	cAPNn4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBY-00000001UbA-0Q7q;
	Wed, 19 Jun 2024 14:21:16 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBS-00000001UZ8-3DvY
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:21:13 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-440581d6a50so34572281cf.0
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718806869; x=1719411669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=;
        b=PYOoSo3CEfdIHiI59WDbX7IqVYrbrg6cHgk41Qb+4bnOfSW/prZDI1j1kghY8XoBlU
         baWbCciCm5DYgSF2tloLRFf+w9qa6oDfCi/trnWSPJ/Y/FMwcCaDwYHw8oC6Qb6lXXas
         lpJ3X38li4BoAzRzyurf1bdEf+nj2MHJ7yIPH+WtI3KPae4WnvWzkPFKoISLm90GVaW/
         hq2TEIuyFjyHX2gy8s9QvNeJfbb3LPu7izYZWMGV6pTuO16slW00kQl9Ei5BzyaOpM/0
         qzoHUCOHqknLQ2HoVjQJQZGuI+nDyFHIdA+pTh9zTaB31qq3Dy/jYC5PQRq8y/UhhSIK
         WKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806869; x=1719411669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=;
        b=exgRPSg8rjP3liutVcdmnl74PkMHxIIlGoaChmOD/2PugTG+qnm+7luhPfLHdTv0iE
         AL8949B0Ds4F2Y1BLtoCPj1+UHkafN9vu8FxA/q0GxTbjWTFC8Skd8+tB+Jvp2GpMe0u
         +R7LLI4cei9NxCPRHu9feoweQsTnbkH03Uv0yY6y6GSZSKgHKrgmblO+NkXqVyQGglMa
         Gj5WVp/eqWiyKz3gxu60X+uoyO3Bj7N5I11y7VjXSaD4BUEprsY8Wc80u3CAfr0H+7Nt
         2cjVkDGMJo0r1y+ZXtXcp5PRnG1mGD5aVWEhuVoo6EgjvX59DKfhXdQmA3iUUxEEvBZF
         7LbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZNtrmhWna7Xxr43N7rdJkNWLEKO+rlLJDqOgZt1hVNUAb3F+q7aouDZUWHcZ2f5ZusAny0iMhGqu5mZOKKdEjLtDB72M+meq27A==
X-Gm-Message-State: AOJu0YyW37QdxLQnwZhltexx5HRB9QRQkpUYIWnwCjoLYXu0FXePZFuv
	w7ehS3HVYDzy9pZe1+A118Z2yhlsTbVycniyn+vTRPgYozE2/tBI5sUp4TItTfg=
X-Google-Smtp-Source: AGHT+IFditz4+ndDJELnqBk6Tg5RVcppmA3k0NZASSXMhXG6oxi/4ZiVAiLFkBd54vQUHLyqIQAFrg==
X-Received: by 2002:a05:622a:11c1:b0:43a:ac99:4bb5 with SMTP id d75a77b69052e-444a7a4a90amr26916401cf.51.1718806869361;
        Wed, 19 Jun 2024 07:21:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444b1e112a7sm2007311cf.97.2024.06.19.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:21:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwBQ-004YYo-D3;
	Wed, 19 Jun 2024 11:21:08 -0300
Date: Wed, 19 Jun 2024 11:21:08 -0300
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
Subject: Re: [PATCH v3 02/21] iommufd: Use iommu_paging_domain_alloc()
Message-ID: <20240619142108.GH791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-3-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072112_285460_5106F6B4 
X-CRM114-Status: GOOD (  11.50  )
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

On Mon, Jun 10, 2024 at 04:55:36PM +0800, Lu Baolu wrote:
> If the iommu driver doesn't implement its domain_alloc_user callback,
> iommufd_hwpt_paging_alloc() rolls back to allocate an iommu paging domain.
> Replace iommu_domain_alloc() with iommu_user_domain_alloc() to pass the
> device pointer along the path.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/iommufd/hw_pagetable.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

