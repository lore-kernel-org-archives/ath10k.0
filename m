Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A2AC4167D
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpG+EEGCB6qn4cMUhkO53jShDEsB2LuwXJ0kT5xqd8k=; b=hRJSFSJga/xjh/q0JcNjgJFtD7
	QRt9fnYFGeSZnOvK1u59AErBVlMwy7/fKgmZRYDmNZnhCea8rC9jxr+sfGQxzpK2zo/azFtpP35HJ
	r/DyiESNyGDzVxJF5Du190gMkSRdlQfoJjH3ynA9VuQbaC/Ma+sJJpdqrMM4LNZ/QQIl4MLCvHpL/
	ZCIGVjigRqBBM1ZzeJVqB0AQOnPi8Mb5pu/7tB2JXKoLAPOPEdFH1PT7+598iuWmSTzVqBXHsmern
	UJyV6evde+s3DU9Py7Kqnn2ym9Ex7guyfW6DNzXP6D+do16CZs1gY3AGNejCO9REtl13afA/ePXOd
	u2Fubhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUe0-00FnX7-2A;
	Wed, 13 Dec 2023 19:11:44 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUdx-00FnWU-0v
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:11:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6cec976b197so4219478b3a.0
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702494698; x=1703099498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpG+EEGCB6qn4cMUhkO53jShDEsB2LuwXJ0kT5xqd8k=;
        b=SgMmrIRl82orTisgJF/7KKhY31AqdvuScCF7V60DpFqoBOEIAeWRHBlGiyM06sKTU5
         UIF9/5Yg8iLHGXHJaL49679IHyukyt+484dAZoXsUCWPUX04fhW48GYGC14t+/8op3aw
         QUiL0IwBeIsSlzLwGIXlxCczlHt27EBK+tFno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494698; x=1703099498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpG+EEGCB6qn4cMUhkO53jShDEsB2LuwXJ0kT5xqd8k=;
        b=i4LcWb+cInlCWgERHhn4pyUbq2FUJl4nXuA+d3CGQYEBFQn1JBTDYBjvCaHXd9PKKP
         Phk+WBjSLEmGJyBE8f7beXddGBBkksrG5hYI0J9qWodgGyBsuP03z2nK+4/NhwqZf3VH
         mhQGIdq+JaqiQY7WTgglGD6xI61LR2mSYKC/zdRW8wpnkdzFCKP7qBLZKTle99xyOCiK
         fupyZilS6Bm+RFuDpTIRSuDoFW1mzchYcQ4jZoH/Q2TxMvWWZsL1j/55REucsrlub4H9
         6pDRgq/VbaIr+/v7tFfKb9S3b/H0a9D6eY+akdEkxMatM76UqOXItdTT6CZhqrpYVJ2B
         jXBw==
X-Gm-Message-State: AOJu0YyQnX5IOVZwv4/13iXNcCuOuNWU+rauZwNGEMBpU3DR9TD/OVGb
	YgzLXVnGVVHl59R0T27J23mNCw==
X-Google-Smtp-Source: AGHT+IE65DZud1cxhlQnjhKFYRVoxzWYts7ImiaFpC108iXuhbQIThqPXHzKV6YtNeM3dkGKKHJTsQ==
X-Received: by 2002:a05:6a00:460c:b0:6ce:2732:1df6 with SMTP id ko12-20020a056a00460c00b006ce27321df6mr5670114pfb.48.1702494698162;
        Wed, 13 Dec 2023 11:11:38 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q5-20020a056a0002a500b006ce19a67840sm10227618pfs.199.2023.12.13.11.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:11:37 -0800 (PST)
Date: Wed, 13 Dec 2023 11:11:37 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] wifi: ath10k: use flexible arrays for WMI start scan
 TLVs
Message-ID: <202312131111.256FE1A@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-2-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-2-92922d92fa2c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_111141_322470_17D650C3 
X-CRM114-Status: GOOD (  10.81  )
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

On Wed, Dec 13, 2023 at 09:06:40AM -0800, Jeff Johnson wrote:
> Currently ath10k defines the following struct:
> 	struct wmi_start_scan_tlvs {
> 		u8 tlvs[0];
> 	} __packed;
> 
> Per the guidance in [1] this should be a flexible array. However, a
> direct replace to u8 tlvs[] results in the compilation error:
>        flexible array member in a struct with no named members
> 
> This is because C99 6.7.2.1 (16) requires that a structure containing
> a flexible array member must have more than one named member.
> 
> So rather than defining a separate struct wmi_start_scan_tlvs which
> contains the flexible tlvs[] array, just define the tlvs[] array where
> struct wmi_start_scan_tlvs is being used.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Yeah, this too looks like the right approach: keeping the flex array
close instead of externalized into a no-op struct.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

