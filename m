Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90871C27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 15:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=; b=RNsR5O+AeQRggXsEMwTYD4Qrz3
	WnKTBJJ1Dn4lhe0/U/IzIZWcqhUH1q36IRtESOjIy7BOJVod6BNB5Ik0sbyZw80hCeKMCeGrsrvWR
	4QTUrclTAo9buRF2i0NjHbXqnbl8H/xOlDTiWP1YaUboxTjaZOn+R2LoewWuSXqbVkr71eFM20B/Y
	yNlVtzEQENkgycHP18LEUTivXgR9p4WAJSr8iChUC4WkOoRkbpu0OyhNZ/xwAAzC5eK8VpPdNoA50
	r3TsHo9ZMczUp6UNN/139FxuXH79eydtpMGZBz7s4H13ek2SYFWWAhOnurSx8zx+buVvQWUy4K23L
	1s8nsjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0T-00000001kpX-2H8a;
	Wed, 19 Jun 2024 15:13:53 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0N-00000001klQ-3BSS
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 15:13:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6b05c9db85fso32880956d6.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810025; x=1719414825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=;
        b=oBzTWITxL94BwgCSPoi2FPMnIKKDybryAe058JPc9bugormqvGdNx68eEwDGieAquH
         LPAAEYV8TlXLAtRHhVnQndinb9QJIwVP3ocT+2fQHvTWAIe5ZxplNJ41THlE78WGcm6U
         dEBiyeGmHd6As31zipeli7BGPTI2UrAkoFwtwL4fGHntCgf5HxJYfdjFhaglTwDBKDHg
         +vYpb1mBJamWHs7AghEYki5lzuZkyNs6mfXODd92t+tHd8OYJF1QswL9XoQ3XxUNDo2p
         aPaZ7EPa464o5zfzwFD26YC0NPp/de3yDedCXpce8Uqqb+Rkh+vQh7OcEcIBT82e2zZp
         KhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810025; x=1719414825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=;
        b=s3gxhyZQPl4bAr8C4u9JUEGUsyoSd3yr0aEdrTNLsRFklSCIKyfAiNxB7isYAFBPuq
         zYnA5qXHSLPFsIbARPi4scsCSI7W7w9Ba/Oz5jSsIOcv7So5pSHPzC9wthSNesgRW5Wd
         pTlnBDYUHvoSUXCg0zsgoB40s6+FN5zS9mIPmylSq5le7uw21QJTru+d8CQiZduYCF4r
         rqlciIxXQ1KkGWHxyhLk88aFlIL4CG9Xv1+nDvdWxctUAtgion//FYL0tAlZw6yQYqdl
         UI7omu8DrzCZE0Gr+Km1QCYMTIZDF37e2HmTLDketErdvcrNErvzcUbOj14/4ehzT8aN
         O5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWUB58/42B3Rt+yexOciuq+Xh62e6ukovtTpajIuOs6mvRfcSUn+L5ONUeFZ9xmizezneTvzx064XGgGc0WCuFuQnokHmtl0e900Q==
X-Gm-Message-State: AOJu0YwUmOi2vwitmNapv6dxVA9NTCR44Rh7+8p2/WC8Zht/D+aWRbpM
	bujG0p2duhNNT8X7ftM3WW44XW4yUkiz08B5vKpxX/T/JhhYzjGHIC4UswMgzoU=
X-Google-Smtp-Source: AGHT+IEJkRZBkgVagiNpl/OtqoGC4d9ZaTPjOU1+2kFAPWdp2oRDjZmssY8YvGAEYa4O75oAH2+OSQ==
X-Received: by 2002:ad4:5849:0:b0:6b2:b3cd:c323 with SMTP id 6a1803df08f44-6b501d22234mr29977206d6.0.1718810025609;
        Wed, 19 Jun 2024 08:13:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2dea97206sm26986726d6.84.2024.06.19.08.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:13:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx0K-004nTt-3N;
	Wed, 19 Jun 2024 12:13:44 -0300
Date: Wed, 19 Jun 2024 12:13:44 -0300
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
Subject: Re: [PATCH v3 17/21] ARM: dma-mapping: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619151344.GJ1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-18-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-18-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081347_829569_BCD0A0B7 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, Jun 10, 2024 at 04:55:51PM +0800, Lu Baolu wrote:
> Since arm_iommu_create_mapping() now accepts the device, let's replace
> iommu_domain_alloc() with iommu_paging_domain_alloc() to retire the former.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  arch/arm/mm/dma-mapping.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

