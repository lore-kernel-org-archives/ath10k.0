Return-Path: <SRS0=YXm1=OL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A00C433F5
	for <ath10k@archiver.kernel.org>; Tue, 21 Sep 2021 07:30:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A6D61100
	for <ath10k@archiver.kernel.org>; Tue, 21 Sep 2021 07:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27A6D61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cWd+EcGNjDAyP4252cBsmthBPI0DPp6jAxHY7XFRsI=; b=zSWPT0wfPpoleC
	i28O9/+Fa9r7h34HihhSd9s6RyWW3TZpwzUlrzH46n49965N5TzvbsRKuZpXYlxjBsgCTnTEqMbga
	XsmWdFZqa9ZSrRAaYAOvS2LWwLDiuQiooir4TUwI5dvGLRdMysrl5VUCFU6fL2an9t+DZkJBp97MZ
	5nwiPxbXEfJKJq5DsUbLlZ7XnBqhI+m3BCxes/mFBk41PaeXz2SmAUiAYRxnQNVyc4gRCvPj+6Pmx
	KP5U4cccJXeO+gx86LGGoyL9TpF2wAHxufms6U0hy8ZIr/5J+KWYVTlKin78CcgRpjovWzmBztmoq
	j6RQ2LcTkqejMA8LsV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSaDt-003oxD-NT; Tue, 21 Sep 2021 07:29:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSaDq-003ous-1o
 for ath10k@lists.infradead.org; Tue, 21 Sep 2021 07:29:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632209386; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=kKdhD4lzVyFP69pBm3weZQlw0bDreWRpvFnA2JACO6A=;
 b=subogEuWfpHzDLDES2QMUTvpXGBzWVicJDJIFwlFZngucMHhcwOmyIvwOpVbtf+g0tE5t81+
 tq3Rfw2vB/BFrOGNiI9lu41r+YmGWyNnW34wRoizCjTB8av9qoMAYYGZZ6yfo4bsFnKYgNQd
 Gwb6W71UWYMTU1IkEChZmptKD8E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614989e4e0f78151d63ad698 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 07:29:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 85883C43617; Tue, 21 Sep 2021 07:29:40 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E18BC4338F;
 Tue, 21 Sep 2021 07:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0E18BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: "sparks71\@gmx.de" <sparks71@gmx.de>
Cc: ojab // <ojab@ojab.ru>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] ath10k: don't fail if IRAM write fails
References: <20210722193459.7474-1-ojab@ojab.ru>
 <CAKzrAgRt0jRFyFNjF-uq=feG-9nhCx=tTztCgCEitj1cpMk_Xg@mail.gmail.com>
 <CAKzrAgQgsN6=Cu4SvjSSFoJOqAkU2t8cjt7sgEsJdNhvM8f7jg@mail.gmail.com>
 <CAKzrAgSEiq-qOgetzryaE3JyBUe3URYjr=Fn0kz9sF7ZryQ5pA@mail.gmail.com>
 <538825a2-82f0-6102-01da-6e0385e53cf5@gmx.de>
Date: Tue, 21 Sep 2021 10:29:34 +0300
In-Reply-To: <538825a2-82f0-6102-01da-6e0385e53cf5@gmx.de> (sparks's message
 of "Sat, 18 Sep 2021 12:12:23 +0200")
Message-ID: <87wnnav129.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002946_508393_7CEB0297 
X-CRM114-Status: GOOD (  11.31  )
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

"sparks71@gmx.de" <sparks71@gmx.de> writes:

> Have you seen the new patch?
>
> https://www.mail-archive.com/ath10k@lists.infradead.org/msg13784.html
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=973de582639a1e45276e4e3e2f3c2d82a04ad0a6
>
>
> could probably have been communicated better

Yeah, apparently there are two different fixes now. I'll review both of
them and try to choose which one to take.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
