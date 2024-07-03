Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B52C2BD09
	for <ath10k@archiver.kernel.org>; Wed,  3 Jul 2024 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=; b=RuSnyUtvJnn6/StbuntJn1MtvT
	oZl+b9SdLv2UXMdSI0HeUdh+VS+GNy9Kb3ErSQKxV7zDP51Fe95g71ii8Sdlu3dhMM5sSF/rZCbNP
	/2n69WsBV3svL1+UlXD3QOammiWxWQ4StQ/WJ4IVU5LmIrkqv1JrQvh9p4ohQFRIh/nOxiwmZH9xJ
	gq4SF0Sx0eL4SKP4D3cIKHy9CMYt/NGCaI0HIz2pwbRBg6ik7Zti3e36S08GrGtDQW8DmcjBXiPME
	UjFB1YpcHsto6DiuOfgmf+JjX7oH+toM9Kkq9Bv9yTEr/wEC4mrgnUW8e/xAxs+RXCjIvOd6IMfzK
	b3XGZtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2u7-0000000Armq-3CWs;
	Wed, 03 Jul 2024 16:32:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2u4-0000000Arku-0IKT
	for ath10k@lists.infradead.org;
	Wed, 03 Jul 2024 16:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720024338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=;
	b=PpffOb8viEhI6gZd+WTEXRT4ulosUJ0foJGj70+JkbiuiVFY1Jo++kluw/Z4r/vC1TS54/
	ZlSWUyLRF2L8/3gOmJF4yYQoqpcOf4xGq8DXBupTWZ2R1S9r83NGGfzA/MD9XC1vrTJAQr
	BTkEEfZE8KSTHwGJKAPZDqhnZ92eP/g=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-ko2ODDdOPfeN8qEYgNbvkA-1; Wed, 03 Jul 2024 12:32:16 -0400
X-MC-Unique: ko2ODDdOPfeN8qEYgNbvkA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ee7d0010abso11403831fa.0
        for <ath10k@lists.infradead.org>; Wed, 03 Jul 2024 09:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024335; x=1720629135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=;
        b=nJdjC/FuNplC7HxCyFFpP4dsWgFYmWhlFvuxxSPhJqAjqp+jVxXuRMx/5siXNlo31j
         EXllM9c94VKkoUNhHfu1bGLd4MWT1leYYhkemWfVg69ViYstPrAxhz9tljQLJD4C0K8+
         1yO2jZbiM8stdxF0OmpRnY1Zg9GEJAPJ1v3EP3RkGOem2cmYYw/cb9pzTgSxVW/p7Ktk
         ci1pBAEfN9OFC6B2GoMsuqRIN+rpeQCmV4HDeU/6EaoNbt8VOWBElg8mX9GlDIE+hMrp
         UUHqn9+tFY1qVN2r7ONBIyLXUQ7os37X5ya64DDMrXG0kxMB18eAOM3RFpfCTNj65RzE
         oWgw==
X-Forwarded-Encrypted: i=1; AJvYcCX93wrpek1pjLswoN9Q2QOm41QbZ1gEpv2GsdYx0XDYU6AC97gytlIUcMbDFjWjV2xJ6+nBfIoMaWs5x5aXcf2N/tpp+1EpJuKeyA==
X-Gm-Message-State: AOJu0YyX4RUCeqY7uwwAi7WONPgiGBsgHf1+AOriDMovZdy5JK/QW64q
	CwjcONoNR1HgeNf5lnrkhuXDpjWEneuTsexTgR/Iyw+PV0jfxVnwsEU5M1yHT0f3XJpD2twux93
	zxdbWnkHqIOb08hcDal2oqMlkfwu3NpEcXnJOrqochPdooKc6njbYxfRe4PU=
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ee5e6bc6f7mr90933081fa.41.1720024335100;
        Wed, 03 Jul 2024 09:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3V7vYkVhH8OJphhsnsxAVWOG21asngpKcdckbhi0zQYrX/jZvvDTcTN6is+OmAjmZQvtD0g==
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ee5e6bc6f7mr90932111fa.41.1720024332354;
        Wed, 03 Jul 2024 09:32:12 -0700 (PDT)
Received: from redhat.com ([31.187.78.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3cff9sm242324535e9.3.2024.07.03.09.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:32:11 -0700 (PDT)
Date: Wed, 3 Jul 2024 12:32:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <20240703123146-mutt-send-email-mst@kernel.org>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240610085555.88197-5-baolu.lu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_093220_203250_7553A995 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


I assume it's merged with the rest of the stuff, right?

> ---
>  drivers/vhost/vdpa.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 63a53680a85c..e31ec9ebc4ce 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1312,26 +1312,24 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct device *dma_dev = vdpa_get_dma_dev(vdpa);
> -	const struct bus_type *bus;
>  	int ret;
>  
>  	/* Device want to do DMA by itself */
>  	if (ops->set_map || ops->dma_map)
>  		return 0;
>  
> -	bus = dma_dev->bus;
> -	if (!bus)
> -		return -EFAULT;
> -
>  	if (!device_iommu_capable(dma_dev, IOMMU_CAP_CACHE_COHERENCY)) {
>  		dev_warn_once(&v->dev,
>  			      "Failed to allocate domain, device is not IOMMU cache coherent capable\n");
>  		return -ENOTSUPP;
>  	}
>  
> -	v->domain = iommu_domain_alloc(bus);
> -	if (!v->domain)
> -		return -EIO;
> +	v->domain = iommu_paging_domain_alloc(dma_dev);
> +	if (IS_ERR(v->domain)) {
> +		ret = PTR_ERR(v->domain);
> +		v->domain = NULL;
> +		return ret;
> +	}
>  
>  	ret = iommu_attach_device(v->domain, dma_dev);
>  	if (ret)
> -- 
> 2.34.1


