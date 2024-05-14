Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CE9C04FFE
	for <ath10k@archiver.kernel.org>; Tue, 14 May 2024 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Voh1m+wASjswNc0kOqJ2oDPHRuDLkeFvUdI2+r6kbJc=; b=baCj+pNQsE73B6qcuQVy5U3npe
	/v7IQQn27c/obj7C14e1wSlw3tPxO3HJZjAUJ8HLksDeYC5R13tHk14CJLmjPHYHk/YH+9SUlpRdY
	rkZElk13Q6tj6EiybenCYFWHy3/qnPvGHAP6bMYp/Y2acvBlMMouAzIH68MK5mMnwCfuSrkmf6vnF
	FaSQxPUwIiAzDEQmB2dTI3Fpp7Vk5j+zPeh4ZV95mKLObmk3511cOvGI70sTPNisbc359EpXTtBIm
	TKvtVU8zBigHDlEl9+XN6Pee50nbygFkAG1DnDTOs+EhHqZMNJXJYjs4DwfM3z5tm/YezMkbCFZWn
	Rhq/xwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s70Yx-0000000HLLs-0H7S;
	Tue, 14 May 2024 22:23:59 +0000
Received: from mail-108-mta2.mxroute.com ([136.175.108.2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s70Yu-0000000HLLF-19MG
	for ath10k@lists.infradead.org;
	Tue, 14 May 2024 22:23:58 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta2.mxroute.com (ZoneMTA) with ESMTPSA id 18f793479210008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 14 May 2024 22:23:53 +0000
X-Zone-Loop: 6c33295b52acafbcb5acef5f87a4cf72a82776b5c44b
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Voh1m+wASjswNc0kOqJ2oDPHRuDLkeFvUdI2+r6kbJc=; b=mUEJHnDYzyda7NPQwO+i+wc/6t
	ZBqVihRuwZg7IlMXCbPP3/EGjCfMr0YFjJBU9TAade1JkuIBoqn/wYvTV8/8uzfwlIrSdoKQA0Vur
	Tm92qb10ns+ovpuuP3I4u6fq8Ob22EFbBKMNL+4wQi0zrmKQdk4YAHWTZbHSnpaKXGuvIRV6Hj9qJ
	mWyAhA2kJGAlKDfWPNLP9E2xF6ZXMHfsw2QW24Ysxo+z7KPq1Uz+oJfIU7mGhcp9cGy+y0S1pKUBq
	xhkUwhLxEuNzNtCW7pdnZYHM8ALRH8fBVjhd7YMq0joF5CnfvXTWhpeNAkoXfZ5qJxcok/lRk0kET
	mLDMUixA==;
Message-ID: <c707de9b-2b55-4720-a9f8-1654946c6616@ericswpark.com>
Date: Wed, 15 May 2024 07:23:48 +0900
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
 <85de5d4a-6c73-4cd0-8f30-73dd6e1f8eb0@ericswpark.com>
 <87pltoifbq.fsf@kernel.org>
Content-Language: en-CA
From: Eric Park <me@ericswpark.com>
In-Reply-To: <87pltoifbq.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_152356_536260_546F38D2 
X-CRM114-Status: GOOD (  11.70  )
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

On 5/15/2024 12:27 AM, Kalle Valo wrote:

> But James is reporting[1] that 802.11w is working for him. So it doesn't
> seem to be completely broken even if you are having problems and
> removing the 802.11w support from the driver doesn't sound right.
>
> [1] https://lore.kernel.org/all/ce0e2043-5085-4dd6-86bd-89dca6f566be@gmail.com/

I actually didn't see that email -- I'm not very familiar with how 
mailing lists work but I guess I have to be subscribed to receive 
updates, even for mail chains that I've started. So thank you for 
linking me his email.

I'm unsure what to test next, if it can be triaged at all. It's an 
outdated card  in a really old laptop and I can always work around it 
with a USB WiFi adapter. If anyone has any suggestions I'm all ears but 
otherwise I think this would be a good place to stop.

- Eric


