Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B0CC27C79
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eSifi9kzw937hBs9m+vGjWLDbN4rIVu8qbt3p8ubO8=; b=ObMOqlhpGSh38fMHK0q1DQFdRx
	seuYCQBXDcIdwH//m8wb2eDhvVJcXQOxbwfu6vStlr0C3R6sqn7VXDbKrrmtI4DkR5Fn+zy5SBRLZ
	I7zyDoQ9/GstM/nj7Mz7bJL81ytMVl3Oca/eZagp3Li7x5TLFzGIRJjLR65GZcLztYZR23yG4aGdX
	V86HFNxc1osG59YSaGmYhVHVO6NrFFLdI1w3dtxicEVLBgp/7g0y3BHLRksbJC5mXjbQDXeZhYt1n
	8RbS3QGYmWnqpMh12DI/WXNMFNtGlPKZ26pFvWCB3ZeZcSxZ9cFjQkt+lbwgDuuiCZlr6huUV8aoV
	LpXX+cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwSI-00000001bLo-1Mpy;
	Wed, 19 Jun 2024 14:38:34 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwSD-00000001bHe-3UCa
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:38:32 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4415e623653so7086631cf.1
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807908; x=1719412708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eSifi9kzw937hBs9m+vGjWLDbN4rIVu8qbt3p8ubO8=;
        b=n9V7AkHYFC5Ph/k3p/MFE4BbXbT77Wju/6QrrDl8wmBJq4EvuccRX6zbIw229qRn0P
         L7fWTzVtGp2bawpq5SXJIlgnyibjdvxvOV3rhqh+mmp+bz3YcYOSY0e424Co7QOU0woi
         SyWC8H/WxRvtK2t8U7qALNle1nTKdmAALWY7D41zQoKPS/ck2dOsukZkytU2Rf+ia7Gu
         XAQt1M/TAOvWg8EjpDbaU2d1McCiWxtDIUNI71iWAk8XMt6SVlSnb9kgVqfA68i8ZYRa
         leW8LFVsV7TiNReXwKaKg/m/WiUq+MXKthsbEzALBq8znjGC9M67NEJNa7ItrQ1b8Y3V
         J4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807908; x=1719412708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eSifi9kzw937hBs9m+vGjWLDbN4rIVu8qbt3p8ubO8=;
        b=QsFqtaJX1b8GPiJP4kMT/JrFkt/yYZvhjCE+4rJS3li3urX1KM/3cPfbG/Nf6ukNAX
         06ZRMjpqAfXAToMam7Ud9yLZAmpk5dYDHRyWksgAJQgm8oPj59pRg+DZszab08JdDpLA
         GxmkhqjzqMFJdKdkvmghKQiLMYR3YhRSSPdfrq0dN5KFtOza6cA4ZtoDzk0SQFn6WnBw
         0r6ZYgDCzyhibmbPxhK79TJQ2Vc/GgVMNB+sqXNNNZeIFQu4aZLhOqR2RWRHN/2jd6LL
         l0uLLXqI04hxvf/4hIhacAdUOY+FajXzH2Ry7hjP169uFBs27fMxe3xvBN92nyGb6Sog
         lK/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbJi5lOOasclntuxVBq4tJBO+IbTh1vdLXwqMba7Pf3I0yF4dpHM1hLQXXARUmX0kfr+x85D/8L7itfuFGFkQ+y7krgU5G5SM+NQ==
X-Gm-Message-State: AOJu0YyNN7TdGoEKSjDU6LKE7wlP1Z5/UENlbiSkkHGCBIvHsMdaG5Jv
	ciXsRhPiy7nzVik4aarRjLbW9U2ybdJ5uXSF8VMbRxN9M9h0zHiHnWV1Yh95958=
X-Google-Smtp-Source: AGHT+IGZSB/Brli4dklvGSX8RN5hj5Xa3TKJWnONX5AltWqs8DK5Wub0LYx6UoNFdFIIjbi83LBDQw==
X-Received: by 2002:a05:6214:124c:b0:6b0:8991:a2f7 with SMTP id 6a1803df08f44-6b2e230ec57mr96370946d6.12.1718807908248;
        Wed, 19 Jun 2024 07:38:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb4f4asm77884476d6.98.2024.06.19.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:38:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwSB-004dXU-Dy;
	Wed, 19 Jun 2024 11:38:27 -0300
Date: Wed, 19 Jun 2024 11:38:27 -0300
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
Subject: Re: [PATCH v3 12/21] remoteproc: Use iommu_paging_domain_alloc()
Message-ID: <20240619143827.GG1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-13-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-13-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073830_077188_DCCEB777 
X-CRM114-Status: GOOD (  11.11  )
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

On Mon, Jun 10, 2024 at 04:55:46PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in rproc_enable_iommu() and is attached to
> rproc->dev.parent in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

