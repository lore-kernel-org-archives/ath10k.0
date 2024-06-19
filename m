Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D92C27C79
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxs6Ot1v7OOmYh1fi+h7d0RjfC3rXsdWHEMpoOwqcEg=; b=QWgaMCPCr3+S/l3hn4BfQ0+17U
	RLQ+/6uw9wsOD1NtwACCl2T9RhenhjV7GC0+vXlQcl8u0f3EGHKI2QViXH1RS/tL5Xb+eTVsfXdJx
	E+csUTIRMqVd2a/NjqB650nMfQe/dJ6+JOAv3iwQASXB0DnepaAZ56aNDnhvBGMOFC/M08JSs1cam
	jpbOtebjyiDDh8xhTImNvGK44nT+U6Q8Znojn8XtO4aBkbC0/Vyr1hcn9l0lKiQ04bIUSd1tTFfRE
	3UQSk66QixtwaqbO1YgyiWUXj1dV00GclMBX8K3KwCcRRL5UyA76fZKyrGBSZ0IDunRha7Ofum/EO
	f+tbjMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRc-00000001atP-2Dam;
	Wed, 19 Jun 2024 14:37:52 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRX-00000001aqf-3Yrd
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:37:49 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-440609dd118so30659601cf.1
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807865; x=1719412665; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxs6Ot1v7OOmYh1fi+h7d0RjfC3rXsdWHEMpoOwqcEg=;
        b=SdbsDvU4hxbDkU+kuWXQuXn3tixYFGnIpzqN/uyhLdHh02TtnNKplCAR1cEbuyWxvx
         XZ8PsmjLWSGnmj7fZvwOKKh3w9C3W1JLnvnmowHx8yblt6y0yizbYD6x3yTVkSuaitqn
         GgBVnCz8nBbvLzMukDazpyQGDa0uYotUwtw9pknQxiRBsv1FhgajSxJX4coU4yncu4aH
         UqrzNBfwo99mlUVelWa2hhgpnu8j/oeMaqzc6C7i9qzS/rsY6jW/chjR02AGJK8uTvxw
         F61Cd9lk3kzzVk9wp21Iawf1HpP4Ai7FE6H4hgk822rSeb5zfV4nSfFSKUd+RRv8+KYO
         xPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807865; x=1719412665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxs6Ot1v7OOmYh1fi+h7d0RjfC3rXsdWHEMpoOwqcEg=;
        b=koIU66OULkq41sq9BKNEEA5JnzrSodA3AxRlDjheIc44dxX7MuxmnYXwTkxGP/9V0a
         eKEe5Dc0buQEV8RLXydxO+AIAc11ISxM/Cu2YAjY3lUFVebk/CPtP55ChpQuMQ61nxr/
         CcMCrcawl6JV8+UAidP4eP+/3lg1a+QaDAwRVEveJPBOGsFoOcuobcyffk6VTZZZKqsL
         sENR3pM16moi/Sf+0hAs+ABLJgOExw9JhHzdqwPk8MFEHC6TP7Q8h7Q7B+mNAFs790/F
         QGGrAAFQES9rB24xQldvBx141ZJnGEh4d9RnRfaRAb4ok9fHi4vNo0Emw75+pCQHoxCA
         HW8w==
X-Forwarded-Encrypted: i=1; AJvYcCWQ63/djJHl0xrw5jws8rNx08NrQpZscDw7/QiisYejjDdEL4OimbXVfyA/NKDnUQGmyhq0XaOoYKU7Ej7bgiYviJeaGp9llm2fNA==
X-Gm-Message-State: AOJu0Ywa8/87IDZuXqJwSnGQOUyObaMYw08OI/GRn/RiTbANoHCuEte/
	c2Xtb5NlvO0lvnwcWa4JoIJCyfjWiQ8QI7QM+58kLxRHQZChfetiX/D+HqdEVMg=
X-Google-Smtp-Source: AGHT+IE1Mf08qWZZKoMXC3XLTPx+dWna8s01o0jSerjkNHzkfpY1WyFHeXhpxUdgnTBTf9fhG5DGtQ==
X-Received: by 2002:a05:622a:1985:b0:441:57b3:2d76 with SMTP id d75a77b69052e-444a79c1e37mr30313091cf.23.1718807864728;
        Wed, 19 Jun 2024 07:37:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2fcc297sm65510081cf.63.2024.06.19.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:37:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwRT-004dJu-Li;
	Wed, 19 Jun 2024 11:37:43 -0300
Date: Wed, 19 Jun 2024 11:37:43 -0300
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
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Message-ID: <20240619143743.GJ791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073747_975669_BD3D9BF9 
X-CRM114-Status: UNSURE (   8.33  )
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

On Mon, Jun 10, 2024 at 04:55:34PM +0800, Lu Baolu wrote:
> Lu Baolu (20):
>   iommu: Add iommu_paging_domain_alloc() interface
>   iommufd: Use iommu_paging_domain_alloc()
>   vfio/type1: Use iommu_paging_domain_alloc()
>   drm/msm: Use iommu_paging_domain_alloc()
>   wifi: ath10k: Use iommu_paging_domain_alloc()
>   wifi: ath11k: Use iommu_paging_domain_alloc()
>   RDMA/usnic: Use iommu_paging_domain_alloc()

Joerg, can you pick at least the above patches for this cycle?
Hopefully more will get tags and can go as well.

If you want to try for more tags on the rest I suggest Lu can send
patches to the subsystem trees and hope the maintainers merge them. At
v6.11-rc5 we declare the remainder unmaintained and you take anything
that hasn't been merged so we can finish the iommu core work.

Thanks,
Jason

