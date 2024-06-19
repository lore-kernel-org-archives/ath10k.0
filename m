Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A642FC27C79
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=; b=V+oDnop+2oLctuvltMRCnvlJhB
	M1aqV2n+Jq0ViKDuM5sT2xdNCKs0ssex5WRgydYEhIfkgCwwVP83CoRkKBDPbOjpvEQL0ShEJg3sj
	CHtC5siPy1KxU8ghU9lNV6+ZEooTZ1va35DrptjR0BZycczYPHslyuDKvPZUzVO4iqL6tfahQC+7S
	x9N76YClw5vpF5/+V/BAU3xcGDEUad0c4qrj+91cm/ScQJnvV2bGcvjVRn9O2OMV3VrWBBscZnpkM
	NPN16NXi6DlmXROtp75PfCBJ0eZ9loPzuyQEUUru/duQdYTP6sBL06EczIsKEMW3lH08OYBJGWPOh
	Kc+Uv+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRe-00000001auO-0vPR;
	Wed, 19 Jun 2024 14:37:54 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRX-00000001aqp-3YeU
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:37:50 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-797dcb558ebso426138385a.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807866; x=1719412666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=;
        b=WodYc+oDCgY7D9A5QeYmiMCjcdCcJwGZMkq7zXfvw4h0Ph7KxzioVe85ugdaNu3eB/
         tQwxDaIkFX1Yy4u6mF+ufav9Ypcy4Sb+vpGFm9CdurGKNBVMaybjUv+qSsIzu8B/zlue
         WojN09r85K3+YY/KeNhbup/9aIWjwk4nhYZR0O/gEhcH3x6usL33Tswcew3jKEzg4i86
         rsM3HZKa5jldjBPrtnEtxGneCx/1Ekfr80hqL1Qr0Kyjmc6AguNoSoFisn4iFvQsTACh
         H1iG2OO4/RzuyA/b34khxcXjenM8VlLLiQAbi0EilOJFl2JUSpzqMXTD9whKpai2VGas
         RUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807866; x=1719412666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=;
        b=vePxUViWI3GNGvndS6jBQ2H+fnyVJ/JYHQo5UJjezvqiETMrKfJITEi+MHuks9dux4
         wBr2+Zd3oYEqPkj3u3THM1eCwpfCGNP3Nhdya5YmIyZu9urB933SWxcp88PY+5BZi+W+
         SXY2FuJ/W8JvNahY2OUuXpHe2+v01DHg/7QEKI1Y8uzRwIBIVi9Y0HVPKW3HQV+iI5Hs
         JTTQXTRPfaMteInR93E6E7WmeHATVSt3t91woPGulEQ7XlnT5cJ59D/SHPzZWwScRn02
         5OYVS/5PRvOghWndsb7/2088Pb005Qk5X2w1aJFbjfKfmrZ7o7neOaCT+4B5UBVay/hq
         vmsA==
X-Forwarded-Encrypted: i=1; AJvYcCVwiz4LYsDnUUEeJg7fNH3EGWY2k9MiRTRoWFgQ4hu7mYYilBoo3x0S5aOZz5azi6L990HRtCur0yNkI5I7ar9KrYBmCa03uUV1Og==
X-Gm-Message-State: AOJu0YxSDoqwekmGmPJGVshY6L0bPzd1fkpPtFvV/cILfXHhkY7y66Yi
	vOkxl6Fp5AJ8mR0ROGdgVxNGysEf3AvQqXV60Ef55yPmRbh4WMOF4LOxl66SKNY=
X-Google-Smtp-Source: AGHT+IEcJxNrliYdvuzlpiDb78QsThSHkvJcrlo7MFvwHxPiUc2KNP4DZqSrOqcyX1HTz8934IoI+w==
X-Received: by 2002:a05:620a:4044:b0:79b:b8ef:160d with SMTP id af79cd13be357-79bb8ef1b2fmr197306985a.32.1718807866220;
        Wed, 19 Jun 2024 07:37:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc0719fsm611398185a.83.2024.06.19.07.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:37:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwRV-004dKe-BM;
	Wed, 19 Jun 2024 11:37:45 -0300
Date: Wed, 19 Jun 2024 11:37:45 -0300
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
Subject: Re: [PATCH v3 10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
Message-ID: <20240619143745.GE1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-11-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-11-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073747_989520_8BB362F3 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Jun 10, 2024 at 04:55:44PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in ath10k_fw_init() and is attached to
> ar_snoc->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

