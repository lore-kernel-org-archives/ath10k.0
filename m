Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E68C433EF
	for <ath10k@archiver.kernel.org>; Mon,  6 Dec 2021 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:References:To:From:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPXLVQgFoUx8JVcGKfFq0YuALu02xVzvrHEwZ1xDAN8=; b=zNbmFKjsrV76RlfFIC3wFUSb58
	S0V95MyLtvi7AOu8VImHyRDO0VG2LjUJ7+ytQr1tuPzdlaGIK8hP8QS8IOwWNvUh1O3JtXK1B/YLh
	ssTHiudnsPZO9r3BXZJSe41LMpf/uYOazI0i9GomAlfcaOYL7VePbqWQZZvjSiicVhkkTzalcuDkM
	ppasflqlPMe5qq0VrzOrgqC7OkI1Cx0EK1xSt+fi3RduKhprRjGJNMlqBAMsrHt67wRqRyQiLIusL
	M6zTwetesnaL2hG+LzIFOscyFkC3dIAN1suy9M5QJu0g05tLmvQG868tPCL6rCTWsv4Scy8jWjIXV
	Y4OH/tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu8GP-002kg0-Iy; Mon, 06 Dec 2021 07:18:17 +0000
Received: from midgard.reox.at ([2a01:4f8:151:1288::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu8GM-002kfK-4m
 for ath10k@lists.infradead.org; Mon, 06 Dec 2021 07:18:16 +0000
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by midgard.reox.at (Postfix) with ESMTPSA id 867041200E9
 for <ath10k@lists.infradead.org>; Mon,  6 Dec 2021 08:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=reox.at; s=mail;
 t=1638775087; bh=XLdh+sdb5zs7bhRZBOQ9awip9YTRXvMl0vKYFb4UzGo=;
 h=Date:From:To:References:Subject:In-Reply-To:From;
 b=iYDasCe+OxwsInPMRik4TfANqhmqlWI3PwP9CGAhbO9EicAwTWZUtcWlpqhmLNpLB
 Njy818lzK7TBFVJoKlQ1ReWi+utu/KjpG6078a9EfNQZizyRQKI3C8A2UywaJkN2Sv
 U7vpvu3bO8a5zVot1epFRE1vDSKmumD8uhK8zTUE8W6OGH8/rAnU357FyJsUrtOwmO
 JqoKKO0NNfujTz+gFFmrXd9ZmKS9nbczu+IZPeHdvPIFzTRmxrTiPuBS39LkW143VU
 qX4vVYbrOwlGxJxH7A1c1Y+SREEutHaog7wBI5mqN2FnCGnMNx8VCvV5FuA9vw5QjX
 13MozX/jdQEng==
Message-ID: <dc8b39ab-cf9b-728e-19e9-258155cb37b2@reox.at>
Date: Mon, 6 Dec 2021 08:18:07 +0100
MIME-Version: 1.0
From: Sebastian Bachmann <hello@reox.at>
Content-Language: en-GB
To: ath10k@lists.infradead.org
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
 <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
In-Reply-To: <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_231814_545380_078052A5 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

thanks everyone for the suggestions and hints to DKMS and patches!

On 01.12.2021 10:06, Thorsten Leemhuis wrote:
> This is a regression due to 2dc016599cfa ("ath: add support for special
> 0x0 regulatory domain") that seems to affect quite a few users, but
> afaics was never properly addressed. I fully understand that this might
> be a special case where Linus' "no regressions" rule can't be simply
> applied.

I asked the retailer where I bought the Compex card if they have heard 
of this issue and if the cards they are currently selling have the same 
problem.
They said, that all their cards they are selling have a region ID of 
0x00, which they assume to be "set your own region ID using crda".
Obviously this one anecdote cannot speak for all retailers, but it seems 
like this misconception affects manufacturer, retailers and users likewise.
I think blaming the manufacturer and having users suffer isn't the best 
idea, however I do not have a good solution either.

What I still haven't found out is what region ID would be "set your own 
region ID using crda", i.e., what region ID would give the old behaviour 
with a new kernel? Do I understood it correctly, that such cards must 
not exist?

I "solved" my issue now by buying an off-the-shelf access point...
Regardless, I would still love to get my hostapd based access point back 
online using a current mainline kernel.

Best,
Sebastian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
