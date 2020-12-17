Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D8BC4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 22:26:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53D2233FE
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 22:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53D2233FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p+dv0NbRWEUjWxZTAsxajs2nvbPFCkXMkzkr7UhPfOY=; b=iZ8VDPKMLgXCayBFwZdBBgf7V
	/VDVSMhaitDUdWFv69DC3/cZW8uYzCaCX1mnJq3adfjujEWehrneRjbE/nQ43Oj38E7zL26CUNPyh
	nMdMfCfEBUzNXuq+kFTXkCfM1ouYXf/VcJ688Z07DQROCD1GTalaRv+N+6KA//wx2KbdTBeihmEKB
	XIboTNc9S8JxRFUW418xcXvhS7C2Aw660zL82OrvySYPpxSdtYQZ0LghkkY9J2GZmV9ZoLY7LvW38
	3f908LLhvf7eh9Ra7FLR7Xh60eCsoK3B6bXkZnFL4OXdahdqanv5r5d9Z59xUdHdh5HTMnSTuEJgo
	WcePNMRjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq1he-0000eS-MA; Thu, 17 Dec 2020 22:24:54 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq1hc-0000e7-1Y
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 22:24:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id n10so47984pgl.10
 for <ath10k@lists.infradead.org>; Thu, 17 Dec 2020 14:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FddPVaFthL4eYBtEYJxiDk/v9Sz7IGRrAfmIr7YH5kU=;
 b=mBanfuG2gNqY8/e6kX428ecgXtrq1Hhgtgh3Kgr06MX0JL5rZgZBp7qDnL/JS3Kvf3
 mMb1p+oDu23YKrXqkAeKOHYtsmj9SsXdlFR+70RbdS8rsCNJ4qdl5nulZLil4lO0NHTd
 f51qpQQffWSH8R965jLY+KDQBWr2xWYRybSrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FddPVaFthL4eYBtEYJxiDk/v9Sz7IGRrAfmIr7YH5kU=;
 b=e5cQzPqQT472IeiYtg79VUGGeuBy3CHoTL3wqfTr6LYPsRL802LZG9oHcx2mXORP30
 GlamWyCjugEoQ+FYDNX4EoebJsacoBgDy6KtofQ8ffrdymRRmtU8tu38+bHs/G+yed2u
 QZxLB2IEy7J24WCtP33if9azJHVr5BIxGt5jnWCq1E4gn7rfHjuluGeC67T1dCkZA1VQ
 gJDXq06GUZ1+SIEZXc6qpmwiR/EcH24gSzScwRlpHB+2jp2FfaoewueyZLVyhFkgiOt3
 5O4jTgO5ckGsgIUBDE77ryJWCZA3E0piIXpp8OF1jupcwMI0K2NtbPlLzRccBIn76K8y
 peDA==
X-Gm-Message-State: AOAM533i+HNoPvxw/tgom6MgwKTnhtV7rWOLafIOaobA2hupT0DAUK2b
 IU94fdoDlzt03Gn2oOIrYiEerLEZGDToYA==
X-Google-Smtp-Source: ABdhPJwK9wTmnZIHuMjcdHRA37ZdgUOZIdb4Rh734ONEykhvdRCref4kS//ATnPrZU3O1wxVvvqodA==
X-Received: by 2002:aa7:8486:0:b029:19e:307f:2941 with SMTP id
 u6-20020aa784860000b029019e307f2941mr1008725pfn.26.1608243887595; 
 Thu, 17 Dec 2020 14:24:47 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8edc:d4ff:fe53:350d])
 by smtp.gmail.com with ESMTPSA id c205sm6775165pfc.160.2020.12.17.14.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 14:24:46 -0800 (PST)
Date: Thu, 17 Dec 2020 14:24:43 -0800
From: Brian Norris <briannorris@chromium.org>
To: Ben Greear <greearb@candelatech.com>
Subject: Re: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
Message-ID: <X9vaqxub2F/8YPT8@google.com>
References: <20201215172113.5038-1-youghand@codeaurora.org>
 <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_172452_173913_44E5796A 
X-CRM114-Status: GOOD (  14.32  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 dianders@chromium.org, pillair@codeaurora.org, kuba@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Dec 15, 2020 at 10:23:33AM -0800, Ben Greear wrote:
> On 12/15/20 9:21 AM, Youghandhar Chintala wrote:
> > From: Rakesh Pillai <pillair@codeaurora.org>
> > 
> > Currently in case of target hardware restart ,we just reconfig and
> > re-enable the security keys and enable the network queues to start
> > data traffic back from where it was interrupted.
> 
> Are there any known mac80211 radios/drivers that *can* support seamless restarts?
> 
> If not, then just could always enable this feature in mac80211?

I'm quite sure that iwlwifi intentionally supports a seamless restart.
From my experience with dealing with user reports, I don't recall any
issues where restart didn't function as expected, unless there was some
deeper underlying failure (e.g., hardware/power failure; driver bugs /
lockups).

I don't have very good stats for ath10k/QCA6174, but it survives
our testing OK and I again don't recall any user-reported complaints in
this area. I'd say this is a weaker example though, as I don't have as
clear of data. (By contrast, ath10k/WCN399x, which Rakesh, et al, are
patching here, does not pass our tests at all, and clearly fails to
recover from "seamless" restarts, as noted in patch 3.)

I'd also note that we don't operate in AP mode -- only STA -- and IIRC
Ben, you've complained about AP mode in the past.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
