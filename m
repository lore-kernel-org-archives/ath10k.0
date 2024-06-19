Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F0AC2BA15
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=; b=uQfqzqf8wXQ6GeLF9uhOmwjr2f
	hZMnpAJ0nE4CDMEzKwYhDqExez0oTe0p1/labWmEPVTjZfCHVvp5INsslgEEl0aJ2571UCvlBDqzZ
	5EOrLJNifZu1VS1955L/6V/tfNY4TdSJ1OCMiyA1tRlvLYrzFCmE4pKVffmuiqJKzug1odWuf40/+
	9IwXX56POFHZsWOC0C+++9fzhEgefGxNSZ5sKt51TOCF2pE3QAuCrP5XV9kHnqc1rJ9/cZtHz6Uyj
	vOD4VqgjWQrM78Ws3dm+8EPdHuQw90wVbVMQ0TsE4VCKGYWv7CnIKe8SFG1SLdyfEdx5J1CvZu0Xv
	ZvY8BmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRt-00000001b5A-0W2q;
	Wed, 19 Jun 2024 14:38:09 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRn-00000001azY-17Cw
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:38:05 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4421cbba106so36660671cf.2
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807882; x=1719412682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=;
        b=gEDGJ9mN7xtXaXIzIYMU72Zw6tfJUEfXCMrlnwGIQgMWgQ/i9g7SO7Yn2l0eMn+8Pf
         pgdjQ/so+vNUFcAwvHowzkpAMCGhRraFv5jxAxayKSfJIBWwXxdRSgm1xqQtyucCUsF6
         /wM/DVyj6EwyqFGMmN7a5bSQbxaBgdoSB9JxO/il9Lugdq7NbLgVtssZvenQnEFEy0Xk
         oAvlIQw3RLuqk4IKfbQw2UBUlnrzHrJXsFuOvVUOxMHo09FubdBWcKoyR5Qoa1goPphw
         6l+am/QRRrbrXBz8FLIO/FInP6/scz0242IlKZM5yIhVhRKMzi+izJzfyS1iADslswxa
         ddmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807882; x=1719412682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=;
        b=HsUGOFixhiSDNpJ8uN2PG76MhQUUKikANETpEbI+stmc8/mD9SUhONO5qZL/Tj2kFu
         CF60MId27q3kPQXfYq5naNk1qnuEgmckG0NzzE+1ge5GDzFa+BSvA9LcFGMCv4Slzwnh
         1EsD+tmZ2DPFKc6EEPRxa7r9Ppr1Wd3EALScO8CvfTFdDaZzrZ/CunIDNphaGm72IGTR
         4xHecyN6XUE8q7a2myZAvOeT2SsoOdreEIxMPYgNEuEzO2FxjyETTUp8+6XmjgO6SI4h
         ZYptOBcYBwzDoYqg4ciAERASD26FKi2TgKPZY0EaRlLaHvy2Jq/oHE421V6BtGcwreuj
         WCLA==
X-Forwarded-Encrypted: i=1; AJvYcCXwHMLbIhbfGXhrtbOEX3thtoaYAQuLj4CzwF3MOWJ+giWnBHbfdIazXQGHguFUs6EhWfe+7PiqMoZ5bROYowcMirtA90waahLRRA==
X-Gm-Message-State: AOJu0YzJ40VMVkp7iEvYb9sQmZF883cpnOvvpbZbt3dmUHcReIOAuDOM
	+/x/DrV/ckPdd2lJ8/x5FYau7M0IVG4LcmBwtVi76GDcGNNtTqrTo4xllsfvr8Q=
X-Google-Smtp-Source: AGHT+IHTB/lZ0M/byP4dE3kOpURatwyTsEaDzd7ugkc+m0b4VPnnl9e+XLcLWm6PxgGLzUpaixUT/Q==
X-Received: by 2002:ac8:5896:0:b0:440:645a:a209 with SMTP id d75a77b69052e-444a7a49c90mr31210081cf.49.1718807881767;
        Wed, 19 Jun 2024 07:38:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d89c7sm65749961cf.20.2024.06.19.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:38:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwRk-004dPo-Se;
	Wed, 19 Jun 2024 11:38:00 -0300
Date: Wed, 19 Jun 2024 11:38:00 -0300
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
Subject: Re: [PATCH v3 11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
Message-ID: <20240619143800.GF1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-12-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-12-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073803_510381_5F800B4B 
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

On Mon, Jun 10, 2024 at 04:55:45PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in ath11k_ahb_fw_resources_init() and is
> attached to ab_ahb->fw.dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

