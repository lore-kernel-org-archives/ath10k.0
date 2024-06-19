Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0140C27C79
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 15:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=; b=wKZLvrbCY3l14i7oDYO1Y9wwVN
	oiTDH95c01ZGbKajBP1lpjbi1EzEGMSUZT/uy7mNI5wuudiTU+y61kYgN/+kZhCFqZzV/5EApaLzY
	L1ldZ8UVCpaFme3N3yTiTrx11vj2/L0DWxYdW8klfUHqISMiCc/5eqo5OY1DKUfQoN1owD1zgbNyR
	15U6fo2dj7xZaaQ1mcQPJWZCsi32/0mxEdBNwszbRaBbYlL22ofPYb/nCLiqzpOzhyCQQ5rS/uEH0
	uO64YNgJqDbQnQIs4skIuzmP5kmspRAe5hBIG1mJvU/zaKR3Bg+7i0UFURjIqpffuq9Njv+JNsixG
	FWE5GILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1T-00000001lOa-1LXv;
	Wed, 19 Jun 2024 15:14:55 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1M-00000001lJ4-0uVy
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 15:14:49 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5b97539a4a5so3666469eaf.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810087; x=1719414887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=;
        b=o2kCjgD9SOQbnZgOqVhMWYu6EcnVhkwss+6pqKdXHTRt+7ehVvHFsMYumfKP2DJ9Wz
         kg+Px6giFdNo+KlKEM0N3RSzP/tgdf/LqpxAJiRmjTMCvvwfZdxm1pmS0cOeWzUWbtVv
         PMGtlVnzdjvdlgCPBWA9Bh8ffJuLiqP2HEiAoRF/gn4EGhPa8dyK9BHgm09SdbNHxyfK
         guzRxzHAYzEBPMc/VRK/u1GHtMlPcbIKaAe7XXDx8IwpsECRaPwwb5jkVZs57AKe1Rs0
         /bKbIwlH+3ptxDfYe35rFFkvyyMp2CQMH8+jah8Xeppre1lBzxGZLjhAtrkQvNd+HGUX
         Wv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810087; x=1719414887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=;
        b=pJikR/s1ucdaWvwUUSDy2ar0y0kZQjM0E1FfYErZxG0Eh6+FAN0Q2NFNy++dlkLafW
         DsXFJOerZHu/Mr3v62gseuSYDPFLfNBN5YdT1djSqG29jXlT6+JwXcM1I/p+h6oEr+Y0
         cuadtbLHsnEO1El/y1c2zvZalPnE+ZFLQIJiDXreRCMpdD0VxGJuDYnEodRdu3OLz+02
         gD0gj5oAobzQ5IHn+zqKM7CiP1ohXbboJQBZfG2q1alaXIs+K6/oW4vd73hQMXVC3czC
         JP/KOZd+4s14D2KA4wzzI8Nb1K+a0d5kqVZGxM9xFeYx0vsqpTDLOah28oKpujrdKav1
         6jFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlDq+lt0RE+mnWublrgsIn8knEZd+VLuOxHC1aUTMN6c2r0GbC4U6UsGWvBdjSFG54figRRgeqZ28d4o5pTCylrmD5taFiLsux8w==
X-Gm-Message-State: AOJu0YyTtLeino25d5A1hL3laeNf9tOWqeg7oxjJVI7A5RBq3ZbvBS8x
	6i2qRxV6iSTzFZW8HImP6T6WuWp14bH/fEvhK4nWEw7ENNBFSCUR5YgtOrDN6Vk=
X-Google-Smtp-Source: AGHT+IFVFHsVlQMiH0Fbhd4tc40tCEx10K+gMkRqXAjqGDO2L2x5wkknywHxXN6ff9bLZXfNrK0Jmg==
X-Received: by 2002:a05:6358:9886:b0:19f:1644:d45e with SMTP id e5c5f4694b2df-1a1fd470d73mr300419055d.8.1718810086999;
        Wed, 19 Jun 2024 08:14:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe47ce5sm614900285a.103.2024.06.19.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:14:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx1I-004nmY-NX;
	Wed, 19 Jun 2024 12:14:44 -0300
Date: Wed, 19 Jun 2024 12:14:44 -0300
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
Subject: Re: [PATCH v3 21/21] iommu: Remove iommu_domain_alloc()
Message-ID: <20240619151444.GM1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-22-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-22-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081448_329742_810798AC 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, Jun 10, 2024 at 04:55:55PM +0800, Lu Baolu wrote:
> The iommu_domain_alloc() interface is no longer used in the tree anymore.
> Remove it to avoid dead code.
> 
> There is increasing demand for supporting multiple IOMMU drivers, and this
> is the last bus-based thing standing in the way of that.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ------
>  drivers/iommu/iommu.c | 36 ------------------------------------
>  2 files changed, 42 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

