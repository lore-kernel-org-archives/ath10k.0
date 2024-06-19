Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54CC27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=; b=cac9w8Js3uonZ60+KWYE5LPxYq
	kLcE+grid2Ce2C5NGhEWqh3hv1NYam8IL6vEMi0k0BTD+YaH2JHAtu9E4Ef1bvFq25koe2bohW/3C
	aXN2wrgTarhmUsdenboX2nx42T0RLzl+vshbTwv2PVAqXvn4jwL7EIw5YvwBAxTxobZUbJXw80OQr
	x1u4fVduE3gSnpmYNMWUF9mCyXtcSTNpdkCyKUIohIpuBSyxXSadrE9DBTyxLM9SUPjk6tynC0jCL
	4HHq5MC/IE2AyZJAai8SZgOaViXOr/mtDkbgP4zKg+gMp9a9eNiTDKvaK+mZZ1gOkl4MNoJvQVgL3
	IiI8l9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0z-00000001l6d-3w40;
	Wed, 19 Jun 2024 15:14:25 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0v-00000001l1o-0EaF
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 15:14:22 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6b4fced5999so8651816d6.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810059; x=1719414859; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=;
        b=o5hoUX60wQUzCNqwXsiDB6VsdQOlUe+eeCWy3WDjVQWMV1qLk2d5RegYpg0Lqwk1vU
         q7rewfislX2jGCsmH766ATPHBrbju6abrLjnaIWwFswSkKRNjcWpyKZpkKAE13lCcDCn
         BMPViob3En+167EvmwwnBjeqy7XkYuVkXJfPHH4Kh5pqoLhqWFh5ebOzEGyQDrdRa341
         U3EXr45puXw+E/Zly/39SldMGd2hFlb6LX3p//mCGt9DUUI6TwPcW8cOQqLhMEuGJ3L7
         gbPl5KRmYN76/15BMUiFLvb7KxEu8iOlH3ZXqnbCaTGPIa8XETwm4Pn8tMwNIgtI9dVZ
         ciDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810059; x=1719414859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=;
        b=DdmQd7bGpLn+QCZq2Wua1HqICENJ1CF6d+/9BDR6zJ/T/cLOLMx3fjz6oPE3vd3TjI
         pORZTtEMzGplq93oEnngwaA1k499jZTaSBJezHrCCC3wLqV6bncjXsNnA05ZGfMIRWv6
         hg9NbIPah2PsnW2vHZwx2xNnwLaN8zLZYNLOo2hVst3O/gI+GR5R1hnx225986XVLqr5
         dK2djsc9s7Op3IWaHpAz3GAY/vqxJ+pM1sMpcDgbrUvSn2AoFPQENrw52IUxhN8rWp9o
         eQonn/J8bQAUK3mp+1Q9TLiwWttI5QqpC2PiSG8mkQrIxvwUdLmWE264cTx82zbGUeTY
         HhNg==
X-Forwarded-Encrypted: i=1; AJvYcCVZNy1tfH+wB1lkEeQELnwE/OmKN7FhyToD9RTKPGY/v1D9R4mRyBJ74C/0s0dfKh7TsppJdGQnx2DkM/N35yNBkiuDvCZZP7/oKA==
X-Gm-Message-State: AOJu0YxKrofAitoivBe53ll1rBeB71u2Qp600i8vGXZokOMgnfbAXhPz
	tr3I1c4A1lYDxhzS6Swso32afFlvSLVPa0pM5qjlu+2rGNwzgH27s9AT0S2a2ZE=
X-Google-Smtp-Source: AGHT+IEOeuPwNQG30sVHkXguHikBPl0Zz6A9LkZtMX2PCT+BlXopyE8xiWNkdljzVxC2GPEBoe42EQ==
X-Received: by 2002:ad4:4bb0:0:b0:6b4:ee84:905e with SMTP id 6a1803df08f44-6b501ea4245mr25964686d6.43.1718810058700;
        Wed, 19 Jun 2024 08:14:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c113b3sm78372256d6.34.2024.06.19.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:14:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx0r-004ne0-3e;
	Wed, 19 Jun 2024 12:14:17 -0300
Date: Wed, 19 Jun 2024 12:14:17 -0300
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
Subject: Re: [PATCH v3 18/21] drm/rockchip: Use iommu_paging_domain_alloc()
Message-ID: <20240619151417.GK1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-19-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-19-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081421_130242_B0949584 
X-CRM114-Status: GOOD (  10.29  )
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

On Mon, Jun 10, 2024 at 04:55:52PM +0800, Lu Baolu wrote:
> Commit <421be3ee36a4> ("drm/rockchip: Refactor IOMMU initialisation") has
> refactored rockchip_drm_init_iommu() to pass a device that the domain is
> allocated for. Replace iommu_domain_alloc() with
> iommu_paging_domain_alloc() to retire the former.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

