Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D70AC27C53
	for <ath10k@archiver.kernel.org>; Wed, 19 Jun 2024 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=; b=LM9eJUQBCNp2nUK5XLgklEs58t
	XfQp+Kjg4PrcQo+NNafKZQP/f5RNQvcGbeI9/NZBPYD8XpYz/3xn21qV6073NG2E0RlXhXZb/g4zl
	jczBcFuhiEfRfnyB1+xWPM7PL+LIQcE5w2ScstiGQwPil2x3+QfVGl053zWEhUrsX6Zf+gAY59C65
	UvARym6T03DNMfAewOUqFYL79fnlFACtZgvu0K/zprvY6/MkM3d5voTKQHUjMruHb7S2rgoRtv/fo
	25Z6Vn/YbEdq/tKNGcgyBffV/4pg0v/caZ8kiBQPoUKaE4dLddwzVsrvCZP6gq6dVgXRdf3qrk7zd
	9fbLt6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwM5-00000001Y8q-3IPA;
	Wed, 19 Jun 2024 14:32:09 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwM2-00000001Y6D-2vwI
	for ath10k@lists.infradead.org;
	Wed, 19 Jun 2024 14:32:08 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6b50a68b0b3so3543226d6.0
        for <ath10k@lists.infradead.org>; Wed, 19 Jun 2024 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807525; x=1719412325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=;
        b=AfjPusuWn4sIzY4YFQBfsW7+eJZwdG4r8lCD7cDxAigHeGfnCGGSb/w4hiMFLVYkm7
         PSUGggJi3oa1UMlIrKr7pZmZ3buteHZcq36gGOiygIXtn7gPT+h5eYq76KRZN1tmTFFX
         HbpadvPSobXOuZK5yoHTh0Ys538sXMQG2XQWHirDlnr1ZGPzr2Vy/IVgw39zOh49atW1
         3j7+d23fIlEykBFEnmpVjmA0eVgz/I6jUrAFagL0SX/us1x4XwpGqH2et2kT7cfiKCK8
         bk1lUPLgx3nT/YzOfO+biYgWnG4H84Jp+m81JPdTqylpmlaz+L9YAg2q46CK/ytGYHoe
         Sqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807525; x=1719412325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=;
        b=a9JUesq+kX+fT0RCz4LuqycKfpukJCJdBBRc/mSbF7KZhyLb0tazlZHxhjZ0cW2toG
         LWs2RxqEOHCxBjSO+0139qBa+HPjRRrK4ne5MaokbqQayznmWtDgndBaGab55yV9e09u
         pg2ZTqAz6noG+1OtUGzCoXsp+wjbNxkBhtFRv9VfoDCJBIDdZGaJDHBuV3UOJz4kjGop
         H3cUSdMLngdtPyxXup1BqiQJHtN/wPQh68j3OlncjzlSbJrBjh3ixoP0uS4mvYmDxwRK
         eddw8tBOJugWmvN6Z4BbG22OdXYmnmfUIK2ccHXZOyuP+J5N/M5cSl0fxXvwyDXcuR3P
         5bDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/iEcSIYglg8FWfCdaFw3fDaVAx4Zm9/iLZl5eBanNHSRrYEuUXnoyNemCeOp8haMCbe8TgaNQ31VSkoZhJ+kB8tPlhLfLKD00tA==
X-Gm-Message-State: AOJu0Yz+gUP0aSNJdAXNtHEp56rw6DsLYJAaB19tADsvtEKXilQrVFcU
	fhEGHzX/P30bfGTsSSpEaVdUnIYCX+x022pXMluT2ArySD8qaDMRB2KsHhj/3KgcbF9AwoA7hmB
	X
X-Google-Smtp-Source: AGHT+IGuQBogl5nnCa0xO+oPgBraH+EqrP6Ubhg3FSeuAcnXv1sZiKKYgQ7jm2DbFVYX9xP9hURczQ==
X-Received: by 2002:ad4:5f8b:0:b0:6b0:72ac:b306 with SMTP id 6a1803df08f44-6b2e22d60bdmr86925786d6.1.1718807525299;
        Wed, 19 Jun 2024 07:32:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb498bsm77913746d6.76.2024.06.19.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:32:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwM0-004bip-ET;
	Wed, 19 Jun 2024 11:32:04 -0300
Date: Wed, 19 Jun 2024 11:32:04 -0300
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
Subject: Re: [PATCH v3 09/21] media: venus: firmware: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619143204.GD1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-10-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-10-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073206_795572_333B864E 
X-CRM114-Status: GOOD (  10.47  )
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

On Mon, Jun 10, 2024 at 04:55:43PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in venus_firmware_init() and is attached to
> core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

