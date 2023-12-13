Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F037C4167B
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqkTY1D+Z0smSuBPziSXpfoIkBBzL9zSOCOQ3/VwzV8=; b=LbnoyLcmZaQeiYp6qCdqF8Bp73
	5/mY6RfhtOXp7SWSglopQsOTSTiOfEVA4TRZvOp+HqqaAWsNxkstoZ4U6hbIy6o7KmRsQn2j0fX3Q
	+oENOtmJcnkmxlRAw/XYzZd7h/u1BnMpP+XYmN8sKlXgzxsWB8WMeXESOtuJNMfffeL2idZgXrC90
	EcPgUJy4cJnNsCASS9QYd/W9mDkAp33acyc+H3vPJgdUHKABtaah0JvahsPIdVFjh+ZkmSzasHkKm
	f6DW2hWzIj91+jq18iArKmTxTSbC83pZPP+NFWtTegsKZmQz2kUnzYm5PVJT+/HM0gUgqo8KU2vO6
	T7+YqStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUcp-00FnQY-0r;
	Wed, 13 Dec 2023 19:10:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUcm-00FnQ0-1R
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:10:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d3448937ddso12639595ad.2
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702494623; x=1703099423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqkTY1D+Z0smSuBPziSXpfoIkBBzL9zSOCOQ3/VwzV8=;
        b=Jqt9J5upoIGluevpfjJ63VqJgUiB55BSN7xVHsr5zIUuNEZuRty9d56+uJf28dvVL8
         FwMhrHO6oy+LWy5qND+CArfx8Si0wIzYaxNtR/AbCCgx8uhng2/qRdK1DDqkd7TgVGok
         bTm0Hf9kbPzmeBy8CetT5MABqxXNHsZtzPx4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494623; x=1703099423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqkTY1D+Z0smSuBPziSXpfoIkBBzL9zSOCOQ3/VwzV8=;
        b=mv4I/2QOCBf8HLcF/EAcMbwX8wXU9wXyBqnFbYQIK+LAYRxvCDaCBVpGKTbUk4oe2k
         yxX5F0I+L7tNOauZkTww2KSFkVm6C/TcQ9QbXqvuXhpLylxpZ0SNOQMSm6QUNkYK//ee
         HXMIdqxGEL3//Y6bizhLrGMk/3Hfs/Oy7RmkhfoVMhD4C4IFfwME0VcHiCngZhE3AKQD
         2BqNGAhEGPhRpPH8v8EKYzwa5v6m3gIG1tlmhp2NW9veYsvFMZBBvvuUhhgdDAup+GE/
         vYqsP6b6/DcgV4DoJBo807ZGZvW4XwoMH7V0uDVEb1SH8YFYZowUXlZHcZHiCA7egQzA
         1V8w==
X-Gm-Message-State: AOJu0YxsAsy7R3QW1LdAm3GL9GDPMJHIem716aVsVbS+5PtpRZHqfMO1
	b4Fh58WBHqULtsZTNafrTYkeIw==
X-Google-Smtp-Source: AGHT+IGgfljpT76KBPui5MmTR6g8xbaYQw4KFDi5WWuN30o04xnbXoheBZ2WDSfB+ilvt/xURB8IDw==
X-Received: by 2002:a17:903:98c:b0:1d3:4316:68d3 with SMTP id mb12-20020a170903098c00b001d3431668d3mr2259140plb.76.1702494623547;
        Wed, 13 Dec 2023 11:10:23 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001cc307bcdbdsm10950629plg.211.2023.12.13.11.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:10:23 -0800 (PST)
Date: Wed, 13 Dec 2023 11:10:22 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] wifi: ath10k: use flexible array in struct
 wmi_host_mem_chunks
Message-ID: <202312131110.F94BC3427@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_111028_913725_127A11F7 
X-CRM114-Status: GOOD (  10.50  )
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

On Wed, Dec 13, 2023 at 09:06:39AM -0800, Jeff Johnson wrote:
> Currently struct wmi_host_mem_chunks defines:
> 	struct host_memory_chunk items[1];
> 
> Per the guidance in [1] this should be a flexible array. However there
> is a documented requirement:
> 	some fw revisions require at least 1 chunk regardless of count
> 
> To satisfy this requirement, follow the guidance from [2] and wrap the
> array in a union which contains both the flexible array and a single
> instance of the underlying struct. Since the footprint of the struct
> is unchanged, no additional driver changes are required.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> [2] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

This looks like the right approach here.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

