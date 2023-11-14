Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E68C4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r1XcdNVp7nG8SD+CrsvPC2hKq3pBv36u6SNeXZQusg=; b=kg5aDYfUNSiSgh
	5kxQnGfKv0jCB/YnGj4gfs7FWjkNCxmJAvIIQMBYpdpn35BLhq0Z55RtfY/9xGQ9NlQZSZ/YK1NfV
	2s62NSMRns+fG7RXKT36ylP/wjF8udE8GF33ZzImT9hYmvJVdGlaA9jQ2DQ8caHxumU2rUYSFvo1E
	UkBfvfzbrauhsq8zcukOxkH84sgBuXVTDYL1t6TbYqS+wSYoV//bB/g5cHGEMQcXQ0nI/kNGty6S7
	Y9YKpkQqZ2hlftiiBGaTYOdEm+TOPtK8SuyEM5tozi28RBgHEpd8vwHKQ3KyFZuFWKZloB1VvlODS
	MBY/n0yo84q3p0/WnJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ucd-00GEuL-2M;
	Tue, 14 Nov 2023 14:42:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ucb-00GEtn-0g
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 14:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52783CE193B;
	Tue, 14 Nov 2023 14:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD79C433C8;
	Tue, 14 Nov 2023 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699972946;
	bh=DO0fIrMI8bltePP6eFm4dhsUlHVl7Pv0Nlj15MYn/1Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KO14FpRQZD1DSWKdbiNeIGqB2VKa78l1Pa+/WphWykicxbc/RdR0DSVdnq5LpiSYC
	 ZFv4FNsQyJyJsfVy3OKTJEv1xA8Pw/Xy8rgsdlm8tgLooNJNxhbQyPCCxn7wUYSe6B
	 tfFGJFG6NP5o41A6STzSdQDWKmdenBzkKYRh8yYrGherM77wy/ci4djCFhGBmJYBmP
	 8OL7Pd1Z9LO53t24yOlwJ3vM9JLa86f96DK5twBuzF0CYhyleLz0yvNn7Wf05sRs6w
	 1Tp95zCCnQdB+W9tJfkhdCR8P0yaA55BIxfGoykGAkliBSZgyFJSieveLUOCaHMHEa
	 oxdY6vP6fKgVQ==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath10k: add support to allow broadcast action
 from RX
References: <20231017165306.118779-1-prestwoj@gmail.com>
	<169989062657.3473659.188127753057713210.kvalo@kernel.org>
	<2033c16c-4d9a-4592-bb81-7a9ad7821576@gmail.com>
	<87wmuk926d.fsf@kernel.org>
	<c8e75ea8-39b9-4f70-a3e9-3c9c4372cf20@gmail.com>
Date: Tue, 14 Nov 2023 16:42:24 +0200
In-Reply-To: <c8e75ea8-39b9-4f70-a3e9-3c9c4372cf20@gmail.com> (James
	Prestwood's message of "Tue, 14 Nov 2023 04:30:08 -0800")
Message-ID: <871qcstmzz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_064233_449549_3C1929D7 
X-CRM114-Status: GOOD (  19.29  )
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

James Prestwood <prestwoj@gmail.com> writes:

>>> Is there some firmware/driver value that can be queried which tells me
>>> if broadcast RX is supported?
>>
>> A good question for which I don't have an answer. Does anyone else
>> know? Do you have a simple test case for this? It would help if
>> people could test this feature on their ath10k devices and send us
>> results.
>
> I could try and come up with something. I've been testing with 2
> devices, running the full DPP protocol between... not exactly
> "simple".

Yeah, that doesn't sound simple.

>>> Or if not is checking ar->hw_rev == ATH10K_HW_QCA6174 good enough?
>>
>> BTW instead of checking ar->hw_rev our preference is to add a new
>> boolean to struct ath10k_hw_params. That way it's easier to enable
>> and disable the feature per hardware version.
>> 
>>> Or are there sub-variants that may or may not support this?
>>
>> There are several QCA6174 variants and you can check the variants
>> from ath10k_hw_params_list. For example, hw2.1 or SDIO firmware may
>> very well behave different from the PCI firmware. To be on the safe
>> side I think it's best to enable the feature only on the hardware
>> versions we have verified to work.
>
> Sounds good, I can make it specific to just my hardware and others
> could expand in the future if they need.

I think that's the best plan.

> Out of curiosity is ath9k much more limited on unique hardware? I
> based this patch off one from Jouni for ath9k [1] and it
> unconditionally enables it for the entire driver.

ath9k doesn't have firmware, or well ath9k PCI devices don't have one,
and that makes things so much simpler. Don't know how thin (or bloated)
ath9k USB firmware is.

Starting from ath10k a firmware was introduced for all 11ac devices, and
not just "the one and only firmware" but N+1 different branches of
firmware. So even if something works with one firmware branch there's no
guarantee how it works in the other N branches. Great fun supporting
that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
