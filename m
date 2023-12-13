Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF9DC4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCfe0ZWGgKzRVbzzblrUJytzWn+QlPVSI/o4NKBNpNY=; b=kxc2hARKiLfi7OFTlF//0yJ2UK
	wYTi8qicwsHyh0F84lsBpz6FJXXg0qi2zstQptDIDYRa9cVYrTb7gvooXOiQ2//FNZbskwdZb4kMR
	eV7OtCIe8he9zukEEp9NZuhHjtQmI8VZgZiP1h6BJG+xpqoVA8F067H4fRCxowVlq2pb+XfYA3F3M
	yScdGeAPASPauekI9MenNC/kbBbWEAyih8wo3cx2l/5tXlx7WK8JvqizXkU6XWL8DTlSqy65onz30
	hBeSn7FY3Q2Fh8o5/utmuUnxmQu/tV8/nC3JWjJHFbuzsRITwDlzFafiDg+LbEDTGgXnHGB165kGG
	liOP9sZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUeR-00FnaO-2u;
	Wed, 13 Dec 2023 19:12:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUeO-00FnZb-2D
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 19:12:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2887c3b6581so5460706a91.1
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 11:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702494726; x=1703099526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCfe0ZWGgKzRVbzzblrUJytzWn+QlPVSI/o4NKBNpNY=;
        b=ZG2uKSI7VJsmQ8o6zeGS1eAklxDxJzyuRKYAdkDhiZLc3FHGwey09lQp0aixzwqtDZ
         9kldTirjHR/MJBABZOwXeC2VIAZf9NNpTcE8mRH6dBo27i+uFWdW4n5ZUK2hHQge7K+z
         TeQCsaZ94i+U9OuD0uiXqOf2dRYqN5Q8ijKJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494726; x=1703099526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCfe0ZWGgKzRVbzzblrUJytzWn+QlPVSI/o4NKBNpNY=;
        b=GZsBx4UztIUWPJaYH4IUYDY9F5KfE3H3uKexGed3bIM+y/c8AlZzKJrOeXv3ik7O8t
         BNP6cJbxB3ujw7oyAbUVcvYzt8s6gM3w9BLy4cqL8bMu4sybqatR+2MUnP7GCOxM6Nlf
         P2wqJpEMf2aQPKdKTFmz0UYxmUPBWBI7oYfSXKOWFqdGAnLdbfpZqPsh4QcNF/liL7Ug
         5yVFfTShMvh+5b29PJDEcm2WQ/sIZyY8IvyaumbP80oa/3bSeiaMy5YE0trs7BB2es/5
         VdEOpTfBag2INDjyVDtwg3D4GZ5XH8aPJhlgJ/PSJkd9MshUvVi9saI1cFY5Kb0fEM8I
         WHPg==
X-Gm-Message-State: AOJu0YwSGpTMUYl6ZSf+vNw3ASjkz5KcSvlaQwtJx6+ghjs9axR3QCih
	chvxERh4W3PwEKHsbK9Ark/I7w==
X-Google-Smtp-Source: AGHT+IFcFdO4Yi25NiYYgSY1pHflwWXW48z97I9Nc7iqIJzPnx+Qyma6RencgmBrM/Eo3+BnjT73qg==
X-Received: by 2002:a17:90a:72ca:b0:28b:131:ced8 with SMTP id l10-20020a17090a72ca00b0028b0131ced8mr276703pjk.32.1702494726005;
        Wed, 13 Dec 2023 11:12:06 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id pm17-20020a17090b3c5100b002866c96fc71sm11629572pjb.38.2023.12.13.11.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:12:05 -0800 (PST)
Date: Wed, 13 Dec 2023 11:12:04 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] wifi: ath10k: remove struct
 wmi_pdev_chanlist_update_event
Message-ID: <202312131111.53F3E2EF51@keescook>
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-3-92922d92fa2c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-3-92922d92fa2c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_111208_722468_184DCACD 
X-CRM114-Status: UNSURE (   8.17  )
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

On Wed, Dec 13, 2023 at 09:06:41AM -0800, Jeff Johnson wrote:
> Currently struct wmi_pdev_chanlist_update_event defines:
> 	  struct wmi_channel channel_list[1];
> 
> Per the guidance in [1] this should be a flexible array. However
> during conversion it was discovered that this struct is not used, so
> just remove the entire struct.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Removal of unused structs is good. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

