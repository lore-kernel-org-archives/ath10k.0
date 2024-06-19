Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF70EC27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=; b=OaNUj46/UibbFxNA+YE97hTFLX
	PBRCSAwDFjzbMznuQc7cJ7M2Sntff8sDtWpvYYeTaO3/sChlGScn1pdxmAMqyOmNy66wYRhvf06Dc
	eFEI/dB5bBmAyKQGp3E8a2uPzw7ID04koumZ6dmGaXr8gGL73dL+NOpIikQbwf8XDwQQ4/8Xf8cN0
	TTlb4PwtZ4u068t/pusvJrPy+T2x2iTFSC0XFZK7IptJGA6dlSHpinZ/WSPHXeVdgkgZBk5uS9Ype
	V4HzG8UdtKAsOc0HITiBoeW/bzwOf3+pFyQdIZAT7vAVxdZHTTJGWFR4sTsnLDwr1WRiGKchobIfo
	q1Bm3M4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwLM-00000001Xnc-08oS;
	Wed, 19 Jun 2024 14:31:24 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwLI-00000001Xl8-3lHI
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:31:22 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d21e00d9cfso3863326b6e.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807476; x=1719412276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=;
        b=XbKRwxBSkXf3e5bb84Z0oKh6bQ7mZVUyxxxfpzVG1L6ukKsczwF+VpjKkCR+NrKNuy
         k41N26VyzejK+yQX6++0yhdSuzsBaToaXvmfcHnP68tXhzyw+iL/ndUw13HDrRCbkVUJ
         NWZTJuFwGmN02cVQDiOXt+mguBby2XG6ivDKQ18pPWGGAnMPZhLBr5bq7QaXyeEO5YZz
         rFTSNiB01+OWJjCkJrnZl4AKPfoFX05iOH0fECXa8yiGXME9hr0mzHyKWhIMG6Sw581H
         I9sN7QLuyFVdRldJMfIw7/lOxjV+fWyUB6pqdtDw86EIiZZa55yi4NuZBi1EZOfx4Jgt
         k1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807476; x=1719412276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=;
        b=buScc8Kb3C9eZCxasLE0fnNKZsLTB8FZW5Ai/OuPPYfvIkmkkHb1SOu6NEcIHllm7q
         td9tNsF6r0y2tt3JXpncUDK1QshPyuushzok3Tgj60c4ym3+tFgfPVx8rCOml04YAzkc
         nX/9BG+P22RDA6zUjOdyv6F7BKjY9hTQxPuiuCD3TMLDwttJs3OraiSOITM+oyzAG+XU
         A2J3tn8ZlZv//5HJwMN8lMugqyY8M9INHoHJJyALzCe/pLDXtf9ux942UmXTQ+uCMjPT
         Z59N0IPdFzbOaoCU38nZpU2BtFXm+pGcEDlQeul5ykiwWNC5sxuR9U0g0rN0zuGEzP8S
         dJsw==
X-Forwarded-Encrypted: i=1; AJvYcCWvmtl8XUdK/cNGxiCZRmeWCtfxYw3JO8Un2kDhVxAZ98pUOXdh/8gtRI/7ZNCrhFrjBr/vxJVc/cq6vR8vUtJQs0chAKHqwR0BCg==
X-Gm-Message-State: AOJu0YyI8ClVRvwY7qkNqcYU7u82UcRG7/MAIfxrbDc5lJ1tWGfVEkZv
	LXL2KWPuzEZMAwAc590haVJBCydjyYNVLwz332bwjzy4J1IvnepZ2rWJbyCbqgo=
X-Google-Smtp-Source: AGHT+IHZayxzfwc1KZvF4t1SmwGVNV6P/gZQ5Mo6uiPN1/R0ej17zeeigaD/qQOHMYxQZ4opihlAhw==
X-Received: by 2002:a05:6871:592:b0:24f:ef6b:353e with SMTP id 586e51a60fabf-25c94d106f7mr3066372fac.36.1718807476505;
        Wed, 19 Jun 2024 07:31:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5bf23f6sm78142956d6.8.2024.06.19.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:31:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwLD-004bUT-Gm;
	Wed, 19 Jun 2024 11:31:15 -0300
Date: Wed, 19 Jun 2024 11:31:15 -0300
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
Subject: Re: [PATCH v3 08/21] media: nvidia: tegra: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619143115.GC1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-9-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-9-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073121_239360_D6B774F2 
X-CRM114-Status: UNSURE (   9.81  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2024 at 04:55:42PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
> vde->dev. Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

