Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6730C25B78
	for <ath10k@archiver.kernel.org>; Fri, 17 May 2024 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7wsUc1EhLNRk90IDBN/gtH9UOSjgqj9R7AVPFW/Z0g=; b=nu4xW33d6zhB1LIddvWf/g5vi/
	egdYFQ3orpuqI+4cnqkjSDCwxebJjsZ3djsCA5YNGiSSywsAljVeQtHlyJVOcDE0AL5oEo0TTOJv7
	7I0pDpG2cx93264E7aUc4qe4eEbD924BlmNwZ3kj7pu4/QxFtIfEyot5BNP6CT8Q/5I2T4OMatJJ/
	zK90QwmMZ1m4JhDnlWzIXnYQavlUsN1eW0JY6VK/URLPuudQYGaeLOqbbzSBwgxXh5p4heAKee4IA
	sBSPdfOxKwRJTjrcQzzM7d/SBlh09kPPq/Oj2rRH/Eelkq4j8B4GUH4a6LTUP6E6bhfrnS4lOjrRG
	nwdMS1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7u5r-00000007OVv-3zqi;
	Fri, 17 May 2024 09:41:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7u5p-00000007OVT-2qji
	for ath10k@lists.infradead.org;
	Fri, 17 May 2024 09:41:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2AEBCE0AC2;
	Fri, 17 May 2024 09:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3DFC2BD10;
	Fri, 17 May 2024 09:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715938894;
	bh=o7wsUc1EhLNRk90IDBN/gtH9UOSjgqj9R7AVPFW/Z0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rJ7QE6jJMoCXRriSDmQh3KOshX5e/1mSv/nLFO+pIxHR8+YzQuiTdhMbbo7yRtQpF
	 z5GRZlxqruZ7Zv/A2/7cNypz0mO8hbzhkocgXTgSfGDx8ON3MytvlYjnaRJOUHLBtW
	 tPgx8DrNxev543tKbhpCPWGgD2hQesOn0rSImyt/moCoF3zBhiQzbTH42JrhZ8/pE6
	 v7FDg4AnF8UfYLxjuyICZhdQHnFLB4/4N1gF1ZJMoHy1P975IkRbFX87K/WZyb1NpK
	 mwL7Yd1Hv0pjFOc6TKW5KbSgyz67hybLiA0FQB9IElMjPrFffjJB+S203Qy69OXlAN
	 57eyInG7bWPeA==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
	<87r0ghf4rw.fsf@kernel.org>
	<a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
	<87wmolsrcc.fsf@kernel.org>
	<eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
	<87o79sfjlf.fsf@kernel.org>
	<483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
	<87bk5sqgdf.fsf@kernel.org>
	<7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
	<b9a07fe0-b50a-4d70-a7f3-3b82d224d90f@ericswpark.com>
	<87jzk7mhuh.fsf@kernel.org>
	<85de5d4a-6c73-4cd0-8f30-73dd6e1f8eb0@ericswpark.com>
	<87pltoifbq.fsf@kernel.org>
	<c707de9b-2b55-4720-a9f8-1654946c6616@ericswpark.com>
	<87cypnijr6.fsf@kernel.org>
	<1489399e-4f49-4d37-8494-e9d575d656a4@ericswpark.com>
Date: Fri, 17 May 2024 12:41:32 +0300
In-Reply-To: <1489399e-4f49-4d37-8494-e9d575d656a4@ericswpark.com> (Eric
	Park's message of "Fri, 17 May 2024 17:43:47 +0900")
Message-ID: <87v83cg4hf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_024137_922112_60658ABA 
X-CRM114-Status: GOOD (  17.92  )
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

Eric Park <me@ericswpark.com> writes:

> On 5/15/24 5:04 PM, Kalle Valo wrote:
>
>> Eric Park <me@ericswpark.com> writes:
>>> I'm unsure what to test next, if it can be triaged at all. It's an
>>> outdated card=C2=A0 in a really old laptop and I can always work around=
 it
>>> with a USB WiFi adapter. If anyone has any suggestions I'm all ears
>>> but otherwise I think this would be a good place to stop.
>> One thing to try is to make sure your setup matches what James is using,
>> especially the firmware version.
>
> Interesting, this is what I get from `dmesg`:
>
> qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 144d:4125
> firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,
> no-4addr-pad crc32 10bf8e08
>
> I'm guessing the firmware version 1.1.1 is the latest one for the hw
> 2.1 variant (going off of the firmware repository), but please correct
> me if I'm wrong!
>
> Looking at the repository that version was updated 8 years ago. Is
> there anything else I can try? I'm guessing newer firmware only
> works on the newer hardware revisions.

Aha! I had totally missed that you are using hw2.1. (James is using
hw3.2) Yeah, that hardware version has been problematic almost since the
beginning and there has been any firmware updates for a long time. I'm
not surprised at all that 802.11w is slow on hw2.1.

I think disabling 802.11w for QCA6174 hw2.1 is a good idea, patches
welcome.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

