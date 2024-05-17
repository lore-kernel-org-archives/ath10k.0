Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38BFC04FFE
	for <ath10k@archiver.kernel.org>; Fri, 17 May 2024 08:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCE/QGeysKp1DmypTPMFAXigzTxAQaxxmaM/FFThxEs=; b=Ei8tK0mmuhDXdLy7+BoRAxAT4f
	kOD3eBsgiZMY9alDaQuJmOS6PzQM85nMOVq/Dn+h1NsC+2yEt61JJ4+oQEi45nx3wwTx3nSfKkvZl
	xYmEYajv1rxN+xVtariT7TRQfIPBKwU/1mNpX2xP1Dtet066TnJiaog0Pzr4iqFzX1D+BxhS+3hIQ
	sPc7rUoJ/3nATr8XaTsX6tqwBjqDDYYj6BSM1zSIh08yuWuD4fLm1WI1DfzJJublOqtHs1m0D7LHU
	f2SgB11Os+ukEHbhMmMA/UmcehTY7kJz2NvM8r/r3GInaWNalpKK6nz9Gesokb4ICD9yZbTZUOn/b
	/GRZMmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tC8-00000007FXX-3t1v;
	Fri, 17 May 2024 08:44:04 +0000
Received: from mail-108-mta107.mxroute.com ([136.175.108.107])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tC6-00000007FWq-0OQa
	for ath10k@lists.infradead.org;
	Fri, 17 May 2024 08:44:03 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta107.mxroute.com (ZoneMTA) with ESMTPSA id 18f85b8ce030008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 17 May 2024 08:43:52 +0000
X-Zone-Loop: ba9294ef659c3422d49d4257f0766695495fbf763dd0
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mCE/QGeysKp1DmypTPMFAXigzTxAQaxxmaM/FFThxEs=; b=IFmBsOkImQ2xcb4yX/TJuFl4un
	jJIsC0s5Wn5hx6x1x/3hEqXCU7GHPZvFYpgxTXYcxvSx/MTti49SSqaKzQFD62cWjj0TlTZuWoCca
	VoiETgs8JmEIXwQlnWQu2xuWuiGBK+uvJi0/MjYacF2S/2qPo3L2vpbFEAaAa7tCFTByzmPIhhva+
	nCecRAICxpPecObq1GR9T5Kujv1nVloeFJszMyQFeGkU1DUXnz5FhMJBxQ/Hj936KEtKKye/I3kVg
	J5v+S0GuqN957Cx2EdVzFm6g2zxfcwe9a9qIZ2RONvuzU5MWUjfigVTNuRs7EPqnmPRzkEBsFvfQk
	2dKawM6Q==;
Message-ID: <1489399e-4f49-4d37-8494-e9d575d656a4@ericswpark.com>
Date: Fri, 17 May 2024 17:43:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Park <me@ericswpark.com>
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
 <85de5d4a-6c73-4cd0-8f30-73dd6e1f8eb0@ericswpark.com>
 <87pltoifbq.fsf@kernel.org>
 <c707de9b-2b55-4720-a9f8-1654946c6616@ericswpark.com>
 <87cypnijr6.fsf@kernel.org>
Content-Language: en-US
In-Reply-To: <87cypnijr6.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_014402_381815_7E0FE33E 
X-CRM114-Status: GOOD (  10.71  )
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

On 5/15/24 5:04 PM, Kalle Valo wrote:

> Eric Park <me@ericswpark.com> writes:
>> I'm unsure what to test next, if it can be triaged at all. It's an
>> outdated card  in a really old laptop and I can always work around it
>> with a USB WiFi adapter. If anyone has any suggestions I'm all ears
>> but otherwise I think this would be a good place to stop.
> One thing to try is to make sure your setup matches what James is using,
> especially the firmware version.

Interesting, this is what I get from `dmesg`:

qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub 144d:4125
firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 features ignore-otp,
no-4addr-pad crc32 10bf8e08

I'm guessing the firmware version 1.1.1 is the latest one for the hw
2.1 variant (going off of the firmware repository), but please correct
me if I'm wrong!

Looking at the repository that version was updated 8 years ago. Is
there anything else I can try? I'm guessing newer firmware only
works on the newer hardware revisions.


- Eric


