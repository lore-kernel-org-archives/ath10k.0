Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E866C76188
	for <ath10k@archiver.kernel.org>; Wed,  5 Apr 2023 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnDOfyuJm2UX1jr49RR3M8o8zo7yB7Ys81TvW3SQBDg=; b=YZppRwktZE9hZw
	xXEpEQkPwHmufiIkycggTzSuYV15f078uFBJuTHYWtUpWtedkBxsu01V+QKmPpDY9wsA+1i97N5sS
	XbP3k3NJwFntNc6YCBaeEUekiGyI6+EAKBj+EQL1k4GVUPhPoG8JeL7WTjjTW2MlLASDVgakZPjnM
	buRAHxFGqZg4mc1PjN23zsO91Vs7QaxCe9BwYYm/2aTfLALtg+Pl2olMCt0/yCJLpsVgAc5GMXbOQ
	TxDSIf9Tj3aipiUNUcJ0IdLqiHxyaU+BufsHuaMPk/M56+fntV9Pe1vCiO5j5yjkfCNQyFd86PHpM
	OMVzQOeF4brgaHxXyoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3K1-004Xzl-1F;
	Wed, 05 Apr 2023 13:37:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3Jy-004XzD-2q
	for ath10k@lists.infradead.org;
	Wed, 05 Apr 2023 13:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70D7962695;
	Wed,  5 Apr 2023 13:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A407C433D2;
	Wed,  5 Apr 2023 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680701825;
	bh=lt9lhEF8GpWDp+D7TLnVxEmY0u4wZOkJ8TxAFbzUtAk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hbmiUvqHPZ0itAZW/ysplrpvUwcah8gWP2oIcE9y4RkIa1v1tskcaeVjUTJSG1+Jm
	 /J9ZuDR0W4Z2hSqOtK7hK/qln2B5pCHiMcNXEPJQx/CrPgKLE773EMpwGzADlAQjcr
	 f7cEU0lJWMxD0QAf6DNhLrrBGkMlgAk8fZ7w52aAcf/E70hwPQKB6qBThEh4xCeu8S
	 1q7CBQugCoUnAtg+wSBdhRgMyfsl5nCQjmCUPdGLKjH/FoYlJciyEBCrwoJtxx/RFe
	 KOYTSXBa2QqkMt/tTznZwdJBs6PhUDYite0u0yBybXwygnV6Semmw6bitwIE6iFD9h
	 8yPsTNe3nokeQ==
From: Kalle Valo <kvalo@kernel.org>
To: Brett Mastbergen <brett.mastbergen@protectli.com>
Cc: Wonsup Yoon <pusnow@kaist.ac.kr>,  ath10k@lists.infradead.org
Subject: Re: Questions about QCA6174 firmwares
References: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
	<20220815195952.GA7798@lycia.zebraskunk.int>
Date: Wed, 05 Apr 2023 16:37:01 +0300
In-Reply-To: <20220815195952.GA7798@lycia.zebraskunk.int> (Brett Mastbergen's
	message of "Mon, 15 Aug 2022 15:59:52 -0400")
Message-ID: <878rf6a1s2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_063706_956239_F8CD3AF9 
X-CRM114-Status: GOOD (  18.11  )
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

(sorry for the delay, this got piled up with other email and I missed it)

Brett Mastbergen <brett.mastbergen@protectli.com> writes:

> On Wed, Aug 10, 2022 at 10:56:38AM +0900, Wonsup Yoon wrote:
>> Hi,
>> 
>> If you don't mind, I'd like ask a few questions regarding QCA6174 firmwares.
>> 
>> 1. I've notice that QCA6174 hw3.0 4.4.1 firmwares have 4 versions
>> (none, c1, c2, c3). Are there any differences? Which one is newest
>> or correct?

IIRC c1, c2 and c3 have different features but I can't recall what they
are. The recommendation is to use the mainline branch 4.4.1 from [1] and
that's the branch which I update to linux-firmware as well.

>> 2. My QCA6174 seems to have a compatibility issue with a recent
>> firmware. I've tested theses firmware versions, but only the oldest
>> one works.
>> 
>
> I have observed the same firmware crashes with those versions with my
> QCA6174 module (JWW6051). Would love to know if
> RM.4.4.1.c2-00057-QCARMSWP-1 is the correct version to use, or if
> there is another newer version that I should be using.

It looks like these crashes only certain devices, can you provide more
info on what devices exactly they happen? The more information the
better.

And apparently older firmware works but newer crashes? It would help to
solve the problem if finding out from [1] what's the latest release
which still works and the earliest release which is broken.

Kalle

[1] https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
