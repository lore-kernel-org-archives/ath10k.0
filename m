Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56902C4338F
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 12:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22CFE61051
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 12:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22CFE61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:
	From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TvOOwF8FTWAvfFo1mu/Nf+EL3u8/YomgSauLbNtJ1tA=; b=Xq6gN+8t5nwvv5pLuaJB1ZG/kR
	UIMJhKwZGyzYJsUKMx46bVQDkYQrzzS3O0Pl9xDCciwoCVkaymd4tBT20As0GJIjXgohNVzhNvb+E
	7FIBiblhpaJr1w+oUVUfyqsdZZGk7tcEnoHRUZa4WkmCKm8RchvHwZIQZ3+yYZnrP8oSpjIoVmp6f
	DAo/o9LugsWBw1qBQQ0OuFxOHwu8gwdJv376xjkkOXFsGfSteP5wLC9CpIA+th855VeQurkzhAMdk
	rCZf+RSsJ7q9s6VguD90EIFSiNLrewXpKIhZ50hwnW+4JPwQVIR02gwI3nlSqVR3XXH8TmTJzfZ9r
	oTqrmzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGKwI-005Ysq-HB; Wed, 18 Aug 2021 12:45:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGKw1-005YkK-3o
 for ath10k@bombadil.infradead.org; Wed, 18 Aug 2021 12:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Date:Reply-To:Content-Type:To:Subject:
 From:Sender:Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=81UwN/0HzSbJMO8xGBs4ZXF5eUh4CFA7oXjensEFVCc=; b=YWVXNlUyAHS2AfgymA3NyRhyra
 F1Yu63ulbXOM9yVxEjsj8ca5RhUheLJPjlyMABfjatxNuql4lch/yhfcdqHEedKbwwcB7DrKJU8uk
 fqwIsrhfW81EqT7aMNpkdm5NlCRHIoYAwqNYT9rNpfCA3ZkddxTQH/zFS/hil3iUPC3VwU/xBuoke
 FXd1D0DVjklHq6s0u1i3EhfmaMfJRxEFQuOEebmxAI1Y7WTs2l6xkCJ3CUSgAVvnThFJxgdzCGAIF
 tOqb9a67vkk15uW0B2FUBAutoc9Xu2b1RpiBX+FauCMlaY9RcsnfAEEjkqgaEUxUuvMNrL2v2Jo5W
 GNYVGY9A==;
Received: from [209.141.60.106] (helo=7yo9qi3.com)
 by casper.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGKud-003pXZ-IB
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 12:43:49 +0000
From: "Ms. Kim" <9sporst9@gmail.com>
Subject: investment ventures in your country
To: ath10k@lists.infradead.org
Date: Wed, 18 Aug 2021 19:43:23 +0700
X-Priority: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_134331_367804_01ACE0F0 
X-CRM114-Status: SPAM  (  -5.81  )
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
Reply-To: "Ms. Kim" <9sporst9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Message-ID: <E1mGKwI-005Ysq-HB@bombadil.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


My name is Ms. Kim Chan Ouk, A Thai citizen in Asian Continent but currently
residing in abroad, I trust this email meets you in good health, I just got
your contact today during a research about your country and I will say that
I foresee success of my future investment ventures in your country. I want
to invest in your country and I would like you to assist me in my investment
with moral and physical advises. Please do reply me as soon as possible so
we can discuss more.

I look forward to hear from you soon
9sporst9@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
