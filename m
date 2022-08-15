Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E54C00140
	for <ath10k@archiver.kernel.org>; Mon, 15 Aug 2022 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7PBPajrJJ4v5rhDDhDVR1RNfAmMyhEODKONStdsYEQ=; b=WjjhqTEVqfuZov
	dwUt5bEo1tKuTUyikWaUXs0tR++iwy/qzptCDKtS3tVO3QXJu+2zeiCLxornmDaSOLwqM6/jeTLvY
	1qSMxG2huBXeFniciWwSAfOFzipr/D2o5L3tcQfYJvBZj6qlrhf8AaEaP9lQdWknzoiyNw7u6+1Qd
	FI13bJzmUCHGTa7Y2efgNQXe5fYaokg2DisrdzTZPhGJOjeoK5bMxvfAoBQmM7G8Oke1Z8f+QLjFA
	nUN5W61a2TAuxpzaUWQa7lg95ucpePwUzYKgPUv+0BdzDKLj16TgPn0rOYL/BXtjmyNoUXL4YLy4r
	gDqSsEUhJAiqw3EONbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgFn-004RJ8-FP; Mon, 15 Aug 2022 20:00:04 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgFi-004RCQ-Nf
	for ath10k@lists.infradead.org; Mon, 15 Aug 2022 20:00:01 +0000
Received: by mail-qk1-x72e.google.com with SMTP id w18so1355445qki.8
        for <ath10k@lists.infradead.org>; Mon, 15 Aug 2022 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protectli.com; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=0ldcUDWK9C7thj76YfZwaPOMpOuuTv51lpUqGuh2flA=;
        b=ak1H2wzXRHlo3XidnTWZLjY7pkg01LqecAWnfI6ZV0O4y+AAsDhP62/QGt2S2+nBOR
         B4tVTbgqYY1pCx+kOVRUufsdhy7Psov9E+VlnRrPM4sbqok6BooNmx/DHZEVsuJFnmPj
         CB1OaDqPFHdd0VqsHw5DL2SddQGzwFNOjERS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=0ldcUDWK9C7thj76YfZwaPOMpOuuTv51lpUqGuh2flA=;
        b=FRLugXzbSsjEwpas2IM1SopwYgUPMJzBJIjX3VYWSwWcrLJrYdpbR0+3E67Jg81xGb
         XUhddGogj/yNfAr+JEqHkwhtHSx2jTy4BpDkdumj9Px670XkBmJfkazbHPFTXmMJ3IZ9
         QX+9jZiHj9qUWve/0HQh1Xv+NhLQ1hh4CMMtLBDvbw0dtrX7AzsvwDVUw72KGmcxoaKi
         YKpHv5fFWLDFii0BuBLj9tTlQgfEmf5NtDrkwdnrStL2BAklfXM8n0vrteGiHrKQ49wW
         7LfmSY9+XvrNzCCjV+IBdjcdFlOOr9XqC4eY++BaqLrNcrsEfg74JeAAfgLleLwgLzU4
         0t1A==
X-Gm-Message-State: ACgBeo3PhqrDmOaNLemgVJTjQgE5K775g8L81Q6A3/uIXRMu16j+u+Px
	6ZuvOXMqeR7J8n7KJsui6B/yOql0FPkQObgz
X-Google-Smtp-Source: AA6agR4Wot7OeFu7xMBbfsJtnAAZvkJHtCz6JJfAcmqNSTSvqyLr9ZU5KaErnw5nYHsgYnQCN1pCbg==
X-Received: by 2002:a05:620a:74e:b0:6b5:f0ec:edbe with SMTP id i14-20020a05620a074e00b006b5f0ecedbemr13015089qki.436.1660593594629;
        Mon, 15 Aug 2022 12:59:54 -0700 (PDT)
Received: from lycia.zebraskunk.int ([199.168.73.145])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a290200b006b46a78bc0fsm10513370qkp.118.2022.08.15.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:59:54 -0700 (PDT)
Date: Mon, 15 Aug 2022 15:59:52 -0400
From: Brett Mastbergen <brett.mastbergen@protectli.com>
To: Wonsup Yoon <pusnow@kaist.ac.kr>
Cc: ath10k@lists.infradead.org
Subject: Re: Questions about QCA6174 firmwares
Message-ID: <20220815195952.GA7798@lycia.zebraskunk.int>
References: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_125958_809846_98DD8C92 
X-CRM114-Status: GOOD (  13.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, Aug 10, 2022 at 10:56:38AM +0900, Wonsup Yoon wrote:
> Hi,
> 
> If you don't mind, I'd like ask a few questions regarding QCA6174 firmwares.
> 
> 1. I've notice that QCA6174 hw3.0 4.4.1 firmwares have 4 versions (none, c1, c2, c3). Are there any differences? Which one is newest or correct?
> 
> 2. My QCA6174 seems to have a compatibility issue with a recent firmware. I've tested theses firmware versions, but only the oldest one works.
> 

I have observed the same firmware crashes with those versions with my QCA6174 module (JWW6051).  Would love to know if RM.4.4.1.c2-00057-QCARMSWP-1 is the correct version to use, or if there is another newer version that I should be using.

Thanks,
brett

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
