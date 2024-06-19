Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC18EC27C79
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=; b=qeiZcUQWxMRmj08APSx5FvQP+H
	loHhtXK7r6DnDLTHmRejdMTdl45okcHamarX7jSOXFJIQZ9j68eFsRhRXZoCivs9poMNNvHKGhEvX
	Dv5+9iAMVekj6KHBIgV5PT05T1w83fXbnLSZHF0WB5pp8ceCB56GeFSJyMrgEMDX9d/uU/yqvfAeu
	wopDLkBEvAY9nxA/MPTRUWfvWmtLpnzqL/X1ty2tkUwDMkxvAMfGyuLzsd3++wsyH7KKhLz0pgZUh
	L3uN9qNkOMLeGW6/u+UDwLV7i931j+S8FIcNR8ccydiMeWwWrlEpaqFvNVWyjhZORcc6nsR6y8tss
	8Rnd7FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwHr-00000001Wfn-0KIs;
	Wed, 19 Jun 2024 14:27:47 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwHn-00000001WeU-1xVN
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:27:44 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-795ca45c54cso357851385a.0
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807262; x=1719412062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=;
        b=NFu3nMsxEaRYxmkuH9Otep3dAqpk3S3yYGXd3AMzUQZRN94XSePiCgMEIdZX5wNK9r
         JAgCwI9aBnshXcH061h9NN3IGJEIVdCnjZ8CyJXYXnnjawz9+JdKLp1TUB6RV5WtOODu
         j35co0RqGNLfLigSw3eJypioJvRKn4THKJp33ecU+ZhSjIE3OTuytXOEqaD3kkzuJy4l
         SLMOoKJ50sjqVT9Q6GCnVjNYUe3DP8UKrtX7XKa+ygqj4Z7qIXsqvnqPiljzYf7YwpTX
         fCNo3CFBXzD6S3qPsrczI1UA+ey6KZdrCBQM0hUEK0ujHQOuUmGVuAWCKGrAvEqmeams
         TDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807262; x=1719412062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=;
        b=iaeBFCTBIoMXamIV2GsAVdl+LyCfS/hOoIE3Tq91+XqDhd0X2hPoX42y+AXMbj+aoL
         oB6HRVub4TcsQJXw6Ipx6RduDZBXw6qafgd+Yhfjz0Fr5Ce0tKRrptgNLoV3k0gQKI00
         3hhEE3sQX0zV0oc9IMVnbRLeOcoTc9eKH3rBwQqp7yXKi7/2UaqkEPOYwkS4GhF8kRUu
         I3r+M+o5ddJ92AuieQe7TBsLSP4eSHlYbQ8HbfDeSnXf1va/+Cn9T944qV/8lV5oYLbL
         YenbFqXmDja7CDvrtyvxyeNsbL96xyJOXhaLgISdsG6LmrFYWkcLj2WT8/ONdpYT7GkP
         Eh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCViEVkOdenoy95LyYUJsZn2l1U5OL6arTlgQPgSWH107kWAKu2YRDhTxuVgk8uJU8SxWLJDcKR4IbsArbE8WfL5uQZiZdwxeYmIBA==
X-Gm-Message-State: AOJu0YwB7l+nio9CMsRIa28YOXTx9HNe9+0Caet2eysaO1TDd/ueSpNN
	iOg4JR6g2PkgIGwh10WlS8cJlrUAlpwQu/n4OSn/Zkdteseqw5nkShLqd/vrJ80=
X-Google-Smtp-Source: AGHT+IEeEBRvNzwpSD8Fs1Imp5pVXlsQQfg/ZiA1zsRiN4FF/aYn4Gxlj7EWTGzB/0ufExiA5d7ZKQ==
X-Received: by 2002:a05:620a:4450:b0:795:507b:6dac with SMTP id af79cd13be357-79bb3ee2f81mr279621685a.75.1718807262304;
        Wed, 19 Jun 2024 07:27:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe279a8sm609903885a.106.2024.06.19.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:27:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwHk-004aSD-L0;
	Wed, 19 Jun 2024 11:27:40 -0300
Date: Wed, 19 Jun 2024 11:27:40 -0300
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
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240619142740.GA1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-5-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072743_510651_C4BBB7BE 
X-CRM114-Status: UNSURE (   9.19  )
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

On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/vhost/vdpa.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

