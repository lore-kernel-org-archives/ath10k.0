Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC85C27C79
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=; b=K3SJR/z+rkifuTopybFE1frxcx
	/Aw46v5MSW+q1s9/hS3BYIymjCN6FaBnAURxAQ6CW0OjqOMKe4C+feG9VEE0ZkmpX0ZvlmBFS/YA+
	iIxZmYYoiXkmAUljHs82zG/eSwSyiOEaAPH1bHK6vU3mQxsnhzQabav3vdfiup6tomZp4UNvvxLHb
	OLwradbrw5UDJZPh1H2N6Dvu8AQTuj1xeVFfJkpBJ7K2gjAGSSbY9nN8toq50aypN/3zpqJ2Qj+p3
	zdmhIUax5LCksK+Tw/QSjp/hWUROknADB5A/k0uW9TUy0xBWroGykQoksYR0yycX6u4M1XiQPCLvm
	knUJpMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1F-00000001lFN-27S7;
	Wed, 19 Jun 2024 15:14:41 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1B-00000001l9y-0pKt
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 15:14:39 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5bfa5f9bbe6so1976721eaf.3
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810073; x=1719414873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=;
        b=Z+4v9S8HRvo+aDyN2N9oZD+/VolQGHMW1Cc3ppOev2Wr39zemKo4UB9S1lZEOFDV2T
         3y5DevpxW0vkJ6YoN8t+98PeH7unL5569lxplx4Ki2XNkBCcejpwWBK2BYJNHpblAgbw
         0a5QWhD+zCHBX1nKwKM/68raMaqIEnx30lRo/uskBVPhqWEtynTdIjIHVfxR4CItIJbE
         0bpSUF8UvF+eAMQOpTMfvbs6KRdfIut007/MVEPDK1TAPdsxisWo6IVvc/X8ZO9dzJQC
         yIC5TYy8U1GHLwzaTSx7dyc9aJ1hg3VkXIEThXL6nG2KBRcj72ceLoXVs2HCH7HzIQ4d
         ivOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810073; x=1719414873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=;
        b=W/pz+yNMQyT1Nhbg0b6LL3vTVkcD4/B0zyWrQHKpYBy2HMnfpuhU5nKhIHJywcJ+Hf
         JhY1pFR5pyWs9e5dPPZNT85nYPto8zqV9ksGely6RdYNAF9p9UgwezaFBpPdjZUJEf1g
         6J5ifvfbsK1QAMc9k/zzv3S9gyq+4ogjeXGkAhvf5K/UONtdWMDCyf7adBIqEsApX4Ym
         mwSdo5Ny1KqlHpRU0zpvlbQUYkRUHLu08u0Nx878ALF8vIC3UAbbi59PgrbhJ1mC8cHD
         nnTls0PnxPxRI+eLPAhOjCN0c/7Ff4qYi9+AOCbkMH/LUwpnk+FvnVoRrHnImK4vnQ30
         8dJA==
X-Forwarded-Encrypted: i=1; AJvYcCWovhjUX+PY1PwdP/hX2AzEQtn4JnqjItJVIlc7ObfJwFnMiUaq+otic/yYolrlMEu3/cNaBUSeuuha7QT3oJaledZWSwRbKnG68w==
X-Gm-Message-State: AOJu0Yzz8j7rlzeXAVinaIqZvr5/gBj0VHtZuiha+6FQGrkHdRT9H5g9
	d2KDxoV4WZMbUozkWXNbs+Xc+/o/LaaOxe0gS1JqnP2jRuvzgbd10gbriyPrJyQ=
X-Google-Smtp-Source: AGHT+IEfWtO517AiTmrP1W6dPNlAON8bn6xv/7Wv+S6voiPx4xyrmyITXKPZjbJGoypZCOWemcF1Kw==
X-Received: by 2002:a05:6358:6f11:b0:1a1:cb05:243c with SMTP id e5c5f4694b2df-1a1fd5cdffcmr360413155d.25.1718810073496;
        Wed, 19 Jun 2024 08:14:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc068sm613342485a.34.2024.06.19.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:14:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx15-004nig-UU;
	Wed, 19 Jun 2024 12:14:31 -0300
Date: Wed, 19 Jun 2024 12:14:31 -0300
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
Subject: Re: [PATCH v3 20/21] iommu: Remove iommu_present()
Message-ID: <20240619151431.GL1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-21-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-21-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081437_297632_81CBA04A 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, Jun 10, 2024 at 04:55:54PM +0800, Lu Baolu wrote:
> The iommu_present() interface is no longer used in the tree anymore.
> Remove it to avoid dead code.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ------
>  drivers/iommu/iommu.c | 25 -------------------------
>  2 files changed, 31 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

