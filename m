Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77758C433F5
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zuvlIAg5PHh8XGtiOdb/CSwZFH1IIDlOsJLKrc/aE8=; b=QduQliFiwHitwW
	s2/ezRUHFgqGlgx36it8kHv+IExRzmPYIPY0uBTRpCZrGhOus1AsHAtzfPN8SJde7FGcamHJLg9R7
	xMp4Fj2sr3Heg0DqHBDeJidyDSt6+6aUF7HL6fTMTDBxTdSEAbzsD+w0gvutCQkkbRB2vXF0SYg4B
	9okUAss1p83/o95ySiaIbWkbSfGmTph+Vp0fo5C+QTp07SiArbB8ljkT94d4DzBBQmZ1QhKRhUADe
	BU4CDYRSQdihLHcLUenH5lK01uojdjLeSthe8zT9CBTUSCkuXG5DyKy8KRrRAkrDCO8r04ArN2TSv
	n/0pwMx9V0/ecPmAWapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNHGv-001cBS-Um; Thu, 24 Feb 2022 16:47:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNHGt-001cAm-6g
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 16:47:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42104B826B0;
 Thu, 24 Feb 2022 16:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9109DC340EC;
 Thu, 24 Feb 2022 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645721231;
 bh=Ab1OqpFWZ22F+Co/hGidh+bqVRWoY4xR7TvjsBDMQ+8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=raD1Vy218Z6fD2byNsIqkjWt4cJ3Agnqna1o8X20KScSmCGAN2Kh//QhSjdKEarhN
 mFJmja3mABLVJCcwLukkGoN3jD8BhZqAeRSu+RP+4cEb0WFhd6+Sjtdkq+TQ7rWmav
 tfZi6ZW1Q9diAGp49N/tl2NO7HN5hmTC1WPtP0jrr4STg0cwycDA2SABJO08A6kB6o
 fNFt0QkANFra051U8qBiKmn0RtN2dx3fi0v3LV1BaJrUEdEkgXhpzH0IRRi857Ujdw
 zGYhxeaL5NRHqrAL5n/9eCiVF7GbDkMA8VRqDJX3b4Sqy9JCksCCrLOAqiQjo3bsaS
 Wr227dQfbt8Yg==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nuno Oliveira <nuno@eq.uc.pt>, Sebastian Bachmann <hello@reox.at>,
 wgong@codeaurora.org, ath10k@lists.infradead.org,
 "regressions\@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
 <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
 <87v8zja7em.fsf@codeaurora.org> <YcDMGdpvINCX9VlX@eq.uc.pt>
 <625a51ed-8185-6fdb-bd7d-cfb0a913c7a4@leemhuis.info>
 <87v8x4tet6.fsf@kernel.org>
 <cf56111a-e6f6-249b-4953-25159420e99d@leemhuis.info>
Date: Thu, 24 Feb 2022 18:47:08 +0200
In-Reply-To: <cf56111a-e6f6-249b-4953-25159420e99d@leemhuis.info> (Thorsten
 Leemhuis's message of "Thu, 24 Feb 2022 17:38:10 +0100")
Message-ID: <87k0dktdo3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_084715_595366_2A99F1A2 
X-CRM114-Status: GOOD (  17.49  )
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

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> On 24.02.22 17:22, Kalle Valo wrote:
>> Thorsten Leemhuis <regressions@leemhuis.info> writes:
>> 
>>> Hi, this is your Linux kernel regression tracker speaking. Top-posting
>>> for once, to make this easy accessible to everyone.
>>>
>>> Kalle, thx for looking into this, I'm well aware this is kinda tricky.
>>> This is a gently reminder about the issue to ensure it doesn't fall
>>> through the cracks. At the same time I know that it's not urgent, that
>>> why I'm not putting it on backburner in regzbot now:
>>>
>>> #regzbot backburner: tricky situation and around for a while, hence not
>>> that urgent
>>> #regzbot poke
>>>
>>> I'll likely sent another gentle reminder after the next merge-window.
>> 
>> I now queued the revert to my pending branch:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=dfc438d224e4ad756b276d79e5771c45b523156d
>
> Ohh, great, many thx!
>
>> Thorsten, can you please check that the Link tag is correct so that
>> regzbot can automatically detect the fix?
>
> Yeah, it will, thx to the "Link:
> https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/".

Great, thanks for checking.

> The kernel's docs say the redirector should be used in such cases (so
> "/r/" instead of "/all/"), but regzbot doesn't care about it -- and I
> wonder if that detail is actually important anyway now that we have
> lore.kernel.org/all/.

Funny that you ask, I was just few minutes ago updating my emacs
function which creates the lore link and was wondering the same. It
looks like '/r/' redirects to '/all/', so I guess we should use the
latter now:

$ curl --head https://lore.kernel.org/r/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/
HTTP/1.1 302 Found
Server: nginx
Date: Thu, 24 Feb 2022 16:43:32 GMT
Content-Type: text/plain
Connection: keep-alive
Location: https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/

But yeah, it shouldn't matter as hopefully all sane tools can handle
both.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
