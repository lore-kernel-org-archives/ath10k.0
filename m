Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B324FC25B5C
	for <ath10k@archiver.kernel.org>; Tue,  7 May 2024 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0b5SOYai2Bv/mGRQSDnEkbLCf0A6sSNC3NPItwsPt5c=; b=iE53Ts6b0NRVr//6x+9kh6Cxut
	FkN2qyIdzPaU6rEGH4qSvpDHT6YeK28d9t/oKr3jCta36r9PZWRS1SoVSDcBSeLHVT6tIS10FhEqd
	2tDMFacf7/Zuune9vxaKFH0dEBdkzxZRQW9ByO1zoav45491wgGsEM5I5d82cPix54AsjAw1R5K5d
	Ltwkf+esqtXTyZWEJlOw0254b1VQvWRlqlvVK7w2+C/YTZIgn1mozJvQ1LQk2IqnWx6am8ddUgS6n
	Poz9sFZOvNz4xbJIWEn4wHIMPwD5psaYfbF/EvsY+96LWTHVv2vYIYIZPZC8jHbTgbTS1SQQjglw6
	6AoaOM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49le-00000009G5I-2S5H;
	Tue, 07 May 2024 01:37:18 +0000
Received: from mail-108-mta19.mxroute.com ([136.175.108.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49lZ-00000009G4L-3fvx
	for ath10k@lists.infradead.org;
	Tue, 07 May 2024 01:37:16 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta19.mxroute.com (ZoneMTA) with ESMTPSA id 18f50b27c5f0008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 May 2024 01:37:05 +0000
X-Zone-Loop: 9db5fa84250b9d735746f312b947d02d3a9fa23c1dc7
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0b5SOYai2Bv/mGRQSDnEkbLCf0A6sSNC3NPItwsPt5c=; b=DcfyLiuHpdlwSCOD3sKNQO3Cno
	3QaDNNG1PTLTVfEdtwzIOpQsreX8BrP7GedwgJsmGp3OjKX6Nzfglkw9eUgTJdmN/g+2ovO4ZIPCe
	TCi3wJljzf+Jfv3WtSep8+mEuuSTkfRjGg1M8ccg/RfgWwkdNWvJRcECqtfLx8BP5cB/glUfG45wb
	YT3uxeVWA1Btp34SVfEZ1d1q3oknRgVcxnpZRuMpzZZ+/hTlNP2sgCbRfoGJE0a6KXlpivRH9FdYp
	KN9BGbQp19+IBLXLnq3pCSOSga3AYYOfLGrjo0bB4wSyYvQ2rLJ2dF9drre/AFuaDWIzfaccB5KHH
	pbZX+AdA==;
Message-ID: <85de5d4a-6c73-4cd0-8f30-73dd6e1f8eb0@ericswpark.com>
Date: Tue, 7 May 2024 10:37:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org> <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
 <87wmolsrcc.fsf@kernel.org>
 <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
 <87o79sfjlf.fsf@kernel.org> <483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
 <87bk5sqgdf.fsf@kernel.org>
 <7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
 <b9a07fe0-b50a-4d70-a7f3-3b82d224d90f@ericswpark.com>
 <87jzk7mhuh.fsf@kernel.org>
Content-Language: en-CA
From: Eric Park <me@ericswpark.com>
In-Reply-To: <87jzk7mhuh.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_183714_074721_2D5CB2AF 
X-CRM114-Status: UNSURE (   4.90  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 5/6/2024 6:04 PM, Kalle Valo wrote:

> (...)
> This is of course just a theory. I don't know how familiar you are with
> 802.11 protocols but that is something to investigate. Unfortunately I
> have very little time for ath10k nowadays.

Not very familiar with 802.11 protocols, I'm just a user. Until it can 
be fixed can PMF
be disabled for the QCA6174 card?

- Eric


