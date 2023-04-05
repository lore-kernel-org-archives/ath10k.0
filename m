Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439BC7619A
	for <ath10k@archiver.kernel.org>; Wed,  5 Apr 2023 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIovOwWf6md7hieoZz3zE04TAJKm74lyE9hhHRi4PGM=; b=u8EnSrVw+5nCv2
	Yi71JDJUwHLKzda1PYxOlKz/R2IKtsp+CcDd/jKzjHPHD+Mr6M7ePQR/uz7W00vtgCejshpIEpx3t
	f3t2LUL2/r/ATMe2o5fnjhR90wHIhoprK+CIbl54d7n361W1FtApKWA42WSML1p4vuezGecwKJjmw
	mT0WX32HDiTrGeZijmVM1sRbEqvCvkyEnY/GF85sUlwOxcGBKGC8ZHUyXGMghLP2EYHSQXqBo3mu2
	3Tl1p3VdirrwhhLCphn4ZIa7wWLuw8E1XHq5LcUo3nl0WtR+Pm2+Wfe8fjKejrkC4qG2tzFTsHb69
	FpXWXMoq7wEqCqFKBEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3ST-004Z98-12;
	Wed, 05 Apr 2023 13:45:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3SP-004Z8V-2J
	for ath10k@lists.infradead.org;
	Wed, 05 Apr 2023 13:45:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52394627FC;
	Wed,  5 Apr 2023 13:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1AAC433D2;
	Wed,  5 Apr 2023 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680702348;
	bh=z3uCUfXKbFr8SKWGx0UItamal63rzxCg4GmrcnmYogk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EPYzkIXqg1oVyTpadyfVdN1TRBWfhDAFFRDM85cJnsLONzBEnqn+oQY4BZJxL69Qc
	 64iek4/DoE+XuX2mS4V7GzhbpgcPcLJjxR38pALg3e1EuWg4U7kwntZlz+dYu+dkMI
	 gNdP2Zt3Fyf03XHvI9uKUMLh+VvvMMSoKhzxRkVIm28aRzrE3e2W0AIspCqDlTfm1Q
	 eISz2AxY8ZMG7sRHH3GzNpetZuko6hwQXTAWQFv4GZ4FmtMuWL9KK/eLBH0VqLMiKm
	 oaZrt5SY4hmjPtf7D86a1/bN2N6NtCAy1SldFo6x5YoGraoeZAcaCE3mCxtEVn4WpT
	 Lrtd6LNSG0hBw==
From: Kalle Valo <kvalo@kernel.org>
To: Brett Mastbergen <brett.mastbergen@protectli.com>
Cc: Wonsup Yoon <pusnow@kaist.ac.kr>,  ath10k@lists.infradead.org, Peter Dohm <peterdohm@blackmesa.com>
Subject: Re: Questions about QCA6174 firmwares
References: <pcoa2db959zn.pcoa2db781x3.g6@dooray.com>
	<20220815195952.GA7798@lycia.zebraskunk.int>
	<878rf6a1s2.fsf@kernel.org>
Date: Wed, 05 Apr 2023 16:45:45 +0300
In-Reply-To: <878rf6a1s2.fsf@kernel.org> (Kalle Valo's message of "Wed, 05 Apr
	2023 16:37:01 +0300")
Message-ID: <87zg7m8mt2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_064549_797764_DAEA8E34 
X-CRM114-Status: GOOD (  22.03  )
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

Kalle Valo <kvalo@kernel.org> writes:

> (sorry for the delay, this got piled up with other email and I missed it)
>
> Brett Mastbergen <brett.mastbergen@protectli.com> writes:
>
>> On Wed, Aug 10, 2022 at 10:56:38AM +0900, Wonsup Yoon wrote:
>>> Hi,
>>> 
>>> If you don't mind, I'd like ask a few questions regarding QCA6174 firmwares.
>>> 
>>> 1. I've notice that QCA6174 hw3.0 4.4.1 firmwares have 4 versions
>>> (none, c1, c2, c3). Are there any differences? Which one is newest
>>> or correct?
>
> IIRC c1, c2 and c3 have different features but I can't recall what they
> are. The recommendation is to use the mainline branch 4.4.1 from [1] and
> that's the branch which I update to linux-firmware as well.
>
>>> 2. My QCA6174 seems to have a compatibility issue with a recent
>>> firmware. I've tested theses firmware versions, but only the oldest
>>> one works.
>>> 
>>
>> I have observed the same firmware crashes with those versions with my
>> QCA6174 module (JWW6051). Would love to know if
>> RM.4.4.1.c2-00057-QCARMSWP-1 is the correct version to use, or if
>> there is another newer version that I should be using.
>
> It looks like these crashes only certain devices, can you provide more
> info on what devices exactly they happen? The more information the
> better.
>
> And apparently older firmware works but newer crashes? It would help to
> solve the problem if finding out from [1] what's the latest release
> which still works and the earliest release which is broken.

I didn't notice that Peter (CCed) had also reported a similar issue:

https://lore.kernel.org/all/IA0PR20MB5731A6A9BAFB17E886DF2097B0889@IA0PR20MB5731.namprd20.prod.outlook.com/

He reports that WLAN.RM.4.4.1-00132-QCARMSWP-1 is the latest working
release. Can I then assume that WLAN.RM.4.4.1-00140-QCARMSWPZ-1 is the
first broken release? It would be good if everyone can verify these two
releases to make sure that we are looking at the same bug.

The releases are available here:

https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
