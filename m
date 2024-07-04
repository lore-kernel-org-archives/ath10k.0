Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D1BC30653
	for <ath10k@archiver.kernel.org>; Thu,  4 Jul 2024 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOxecy19cMpn5wN9KUrtMuNRs7cNbwxBGdtd5xLrGcQ=; b=MgZO7NKC98De+3kQUYcHx2iLg2
	euZiamtxMxk5y+Q32MyNFhp1mIOz8gdJn33xHsWExBaFh99v8/rPpBLfmg8F34ML8qjNizbrRn0NG
	Q0HXA4u3QZxhMK3/9JYBKSDJI3ukzzNE4zZtKXMUD6BzKSQM3HXGoAWaMz5y3a31/U6eIUuJ2gxej
	Al/bxr4qOARNvmdFJpiDnbL9+iHAlfjI37pM970dT+uaSzxXnKzEH2gvE1CPR0iFSDn2H7ULaJ4VC
	LUv2wr0DWH8tNwHJKgu7p9P0z34msLyclLgRqzj4sSCM4v+zUvzaGsecN2nQDLmNgDapiPH8lplsM
	y9+tOl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMte-0000000DLf7-0qME;
	Thu, 04 Jul 2024 13:53:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMtc-0000000DLed-0psF;
	Thu, 04 Jul 2024 13:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D91AFCE2082;
	Thu,  4 Jul 2024 13:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF1AC3277B;
	Thu,  4 Jul 2024 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720101189;
	bh=eQz2IBKd/Q7hCL1YjwIbirGf/hcd4Pso5HkourWlFN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxI1lfv80rJr1/7yGA95ZgA6CrbvweUqIvqiuT+zxsy9TX1ELTFYRkh+Om5FfvySF
	 5tnVPH8EUJhdjVlF72YJiBiCmvE4rjE+vYF+VyoZoWWr10m/Z54aZX3SmdRHUqFlqe
	 Q3VX52GRIRKUrAc+18kBK18UjNQfqAQdvSiWavQjFgz95e7tLq7Sl06OTz6YxpthPK
	 aqYUSEWs4dOfQPE5wpWbqxuhBB0RW8TrF5/TyXZKbd00ypWocDnYibNw+WGF7sj+Il
	 WO49vWsPz9I4WJIa6FgAqLc9l9+XQLye7cjdkS23vbjuczwn7WJj5DZEh2hbyD15c3
	 gSFfx8okA3upA==
Date: Thu, 4 Jul 2024 14:53:01 +0100
From: Will Deacon <will@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240704135300.GA7854@willie-the-truck>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
 <20240703123146-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703123146-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_065312_432968_AEB18482 
X-CRM114-Status: UNSURE (   9.43  )
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

On Wed, Jul 03, 2024 at 12:32:06PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> > Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> > 
> > Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> 
> I assume it's merged with the rest of the stuff, right?

Sure, I can grab this one in the iommu tree. It has to go along with
the patch adding iommu_paging_domain_alloc() anyway.

Will

