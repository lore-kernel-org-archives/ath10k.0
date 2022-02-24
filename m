Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66AC433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9WxJl+Qnpz0CWgc9RBZbbf7ixYVrmIYA+Py4Cp6Abg=; b=bQ7ldvy68Zdxq+
	hmKKgWMKUm+fmmU4VkAT1qtU2xRjcPbbE6DW0K6bEFHfsg4ATUaGSJI80XWz2q3a/EucgvtKS2UCB
	0n3zOtJ8JE+5NHXr9TCt8B7u1MdZsrKGCPD4sabQ7x80VeU6aPHUx+B7VFGOQy7eYjCJfr8BAk1zd
	4Zjv80BMvS7QynoQDl+9ftT/Iz9X0ceFQ0lFUtwdwFzbsWj8y2z5Q+MNrnchVPXMQx8H7kvumMlBr
	raAmNyLKZSS791sZi8L2UZ0yJqBypl0uI5uWJSWvAiBv72gdMdVwTQhpsMR6fN2N+KjDbJ2ygBGth
	9LQt9mLTUzDETpdQCfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNH8J-001avT-5M; Thu, 24 Feb 2022 16:38:23 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNH8G-001aun-Cw
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 16:38:22 +0000
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nNH87-0000rL-JG; Thu, 24 Feb 2022 17:38:11 +0100
Message-ID: <cf56111a-e6f6-249b-4953-25159420e99d@leemhuis.info>
Date: Thu, 24 Feb 2022 17:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Compex WLE200NX: regdomain sanitized regression
Content-Language: en-BS
To: Kalle Valo <kvalo@kernel.org>
Cc: Nuno Oliveira <nuno@eq.uc.pt>, Sebastian Bachmann <hello@reox.at>,
 wgong@codeaurora.org, ath10k@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
 <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
 <87v8zja7em.fsf@codeaurora.org> <YcDMGdpvINCX9VlX@eq.uc.pt>
 <625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info>
 <87v8x4tet6.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87v8x4tet6.fsf@kernel.org>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1645720700;
 619172b0; 
X-HE-SMSGID: 1nNH87-0000rL-JG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_083820_638617_73C91A01 
X-CRM114-Status: GOOD (  12.54  )
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

On 24.02.22 17:22, Kalle Valo wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
> 
>> Hi, this is your Linux kernel regression tracker speaking. Top-posting
>> for once, to make this easy accessible to everyone.
>>
>> Kalle, thx for looking into this, I'm well aware this is kinda tricky.
>> This is a gently reminder about the issue to ensure it doesn't fall
>> through the cracks. At the same time I know that it's not urgent, that
>> why I'm not putting it on backburner in regzbot now:
>>
>> #regzbot backburner: tricky situation and around for a while, hence not
>> that urgent
>> #regzbot poke
>>
>> I'll likely sent another gentle reminder after the next merge-window.
> 
> I now queued the revert to my pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=dfc438d224e4ad756b276d79e5771c45b523156d

Ohh, great, many thx!

> Thorsten, can you please check that the Link tag is correct so that
> regzbot can automatically detect the fix?

Yeah, it will, thx to the "Link:
https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/".

The kernel's docs say the redirector should be used in such cases (so
"/r/" instead of "/all/"), but regzbot doesn't care about it -- and I
wonder if that detail is actually important anyway now that we have
lore.kernel.org/all/.

Ciao, Thorsten

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
