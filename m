Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5F8C433F5
	for <ath10k@archiver.kernel.org>; Fri, 29 Apr 2022 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SablbepVy803ORIfSrAabK/tUc6StBxErIVvoauJFTM=; b=wcdO/Es26PGRwB
	Epjc0IBj5HDm/qoU4rn88TDrBw2dOEglJqEPpsg0P/IxrfTnYtICh7kkVwuNux6Tm9qlzS22yo1Fj
	MFgjZw24s/woKgFGO6Wa6oULYqMgkKgiC7+kjJgm57PoBdU6xZVDaFAQsC88bJT6k6HtL+9iRquxG
	Xppzp9dCUwABo6zEV8sGSLuPEDFh7ydIMRhX/N3P19VVEYms4+dTo3zlZhFJeiJu9+5bhJ/1YJ1Zj
	NZ56qQM1ZBekpC0zUADmjkjBSYipcwOR2c/qSc0roHhxFj56BUoZ3ryQ8qgNluu8XaDCyRH2fdLuC
	DHjOCM3po1SHAsRhvG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkW6G-00CJJk-37; Fri, 29 Apr 2022 19:16:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkW6C-00CJIt-C5
 for ath10k@lists.infradead.org; Fri, 29 Apr 2022 19:16:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BA4B8CE34A4
 for <ath10k@lists.infradead.org>; Fri, 29 Apr 2022 19:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE567C385A4;
 Fri, 29 Apr 2022 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651259768;
 bh=h8VQdzNDE7pccDYr4RYfg/BMn4apvx4uNZn+gypHhSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iOO3sl2SVeReAhubw8VvA5D0/4fH3h/dmULB7F6HVSyYdsZPWRomgPlRRDm4s/oSS
 KqUUBQvMCV3REMfwzPHoXUgM6ZSTRtY/99Cbh5Wjc9ODCIuc0gHHdbecFgSCXCncdC
 qVAQ2ayncOWLwMYeDXYUJkioKMq3r9sfpM2CdkrjlhGs/aE6vVWjzZChtfpwjPaeBG
 oUmb6v04xvk5cvMHYj/prGpp1BjB5ZBHwpd6yhmpKlK3KeNQyzrJIDTa1LwLetXlsP
 dGj6WTD9jRPhHjTC4NdYfKxOB9Rq+IYq/nsAdWAtDsenfDdrYK96bQZOqlWhspxsMY
 ukvmsoUbgmnhQ==
Date: Fri, 29 Apr 2022 12:16:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH wireless-next 2/3] wifi: ath10k: remove a copy of the
 NAPI_POLL_WEIGHT define
Message-ID: <20220429121606.74a22f91@kernel.org>
In-Reply-To: <87v8urd80j.fsf@kernel.org>
References: <20220429174643.196994-1-kuba@kernel.org>
 <20220429174643.196994-3-kuba@kernel.org>
 <87v8urd80j.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_121616_649656_161E6A07 
X-CRM114-Status: UNSURE (   7.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, 29 Apr 2022 22:06:20 +0300 Kalle Valo wrote:
> This failed to build as recently usb.c got napi poll as well, I fixed it
> in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=89fc2e14d3e50cad605104572228d3740df7ca77

Sorry & thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
