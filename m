Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928DDC4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPTVuhDEUENTgcsagjeQe7VOflfGCDiGU2/A/WrOZjY=; b=KLr3oHh0ReSq8i
	Uf+hMxtJ5gvmmwgGmFT+avHPQGR+Qvelq4QhWTUkNra51rQXGWmJBPhlZgV55QGnqh2UFyCrKta3H
	vljg/ZYCqtxe0sUJU/0ykZWTllConwo8FNyIuM0xfAtZb5xdOSSbLK4ZsVCXB1rQ5BU5Snaj5wo5c
	/xSmS3YR6GEJkxPaA+I/kOdeM9rhB172nfel3Mk8Umcd+XEVN/+9XwhJmwdc1nu2a7MRsY7G8ghIs
	2dJjLqoQlRLHeoIVNzXUh1vmkpvMppYc3S5uNlewxkjTEWwfXL8f5o4f1wwrY95PRwnK+2Wcf6JOf
	ke0lBv2+FBPohPjTG5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2sYd-00Fto9-0J;
	Tue, 14 Nov 2023 12:30:19 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2sYZ-00FtnK-2T
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 12:30:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso4283282b3a.1
        for <ath10k@lists.infradead.org>; Tue, 14 Nov 2023 04:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699965012; x=1700569812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQTfT0zTJuBtXZlDzif1ZDcc9hhUB4tbfGAcFSTfp4A=;
        b=meTCA7iDwd79jIayu6Hrwkpa/zfk4M/LieOMPVTCZu1t4S+upqlPJEnKmToJuv0UeY
         dF65wdREy6IF9gRVG+lxW5Uzh5/bwAqFysaHls6Ig0fGgfPC9mTBakLcCvG3+EQVGh8f
         rqX8D3xVFplJZHHAJtcibvo552J+ynR1tnJuJGNbzVJyMHp2fyrs9FYJi1bBwNZBs8vZ
         yM2OKMbz3d1J2s9wENV7FbB6AqE8dmbVjVoBzmrGK/biE/SDBqhJHxc8RrctF+GDrLjB
         BBQeo4/vh1jFFHUp4cvBJ68KKw9rD3xH3GFpe18Q3z1wh+tLISgiCDIhNNAo/QDrugfR
         NOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699965012; x=1700569812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQTfT0zTJuBtXZlDzif1ZDcc9hhUB4tbfGAcFSTfp4A=;
        b=AOVHEefF+Wu1M1RsVVmalwI7owImG6wo+hlDsvwvvjVXzgDOtBauP0RjFryhda0/v6
         jxNuD4KZ9ucdUyzq0hK2LlISH3m8cS8VGxbYGhJwcvH6+vIxUwAQZTcZq+HbEmAo5z97
         RKfM3RwLEP7Xc1Y33182bDQuTmkz38JLwQcbvtYB/me16FYqOZGJ3Cm5N5sAeVt0RIfN
         UYzPfmnHfBwkDQudiV6wejKFB9KtFWMA7uWntxJegUBIJXHBIKeZahQ2wgnSndyQv96r
         qPxSYMA9KfPMzf2GcYRh0QxQOC0Klm4hJWFmIYHR1gGGhdYjHUW56XXkXuSeBD8q683e
         st2w==
X-Gm-Message-State: AOJu0YzdxLOKwpjD1Hw61uWilNhLWUQMR9hR9xWKEnugcxVnmrxFKRGm
	Jvc25vHbtHnHlI+kMO0Aj5FdCkyK2iM=
X-Google-Smtp-Source: AGHT+IHdYTorzfhXpsHtmI5qrCwfNwvSuQ0qqSZFH+2P0Kw23tu5RTgepsehkE7dMCwXWUaLGschdQ==
X-Received: by 2002:a05:6a00:783:b0:68b:a137:373d with SMTP id g3-20020a056a00078300b0068ba137373dmr2848049pfu.17.1699965011931;
        Tue, 14 Nov 2023 04:30:11 -0800 (PST)
Received: from [192.168.254.82] ([50.39.172.77])
        by smtp.gmail.com with ESMTPSA id fi42-20020a056a0039aa00b006bb5ff51177sm1066326pfb.194.2023.11.14.04.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 04:30:11 -0800 (PST)
Message-ID: <c8e75ea8-39b9-4f70-a3e9-3c9c4372cf20@gmail.com>
Date: Tue, 14 Nov 2023 04:30:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add support to allow broadcast action from
 RX
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20231017165306.118779-1-prestwoj@gmail.com>
 <169989062657.3473659.188127753057713210.kvalo@kernel.org>
 <2033c16c-4d9a-4592-bb81-7a9ad7821576@gmail.com> <87wmuk926d.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87wmuk926d.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_043015_808702_418523F6 
X-CRM114-Status: GOOD (  23.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 11/14/23 12:20 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
> 
>> On 11/13/23 7:50 AM, Kalle Valo wrote:
>>> James Prestwood <prestwoj@gmail.com> wrote:
>>>
>>>> Advertise support for multicast frame registration and update the RX
>>>> filter with FIF_MCAST_ACTION to allow broadcast action frames to be
>>>> received. Broadcast action frames are needed for the Device
>>>> Provisioning Protocol (DPP) for Presence and PKEX Exchange requests.
>>>>
>>>> Signed-off-by: James Prestwood <prestwoj@gmail.com>
>>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>> On what hardware and firmware did you test with this? As there's so
>>> many
>>> different combinations in ath10k we use Tested-on tag to document that.
>>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag
>>> As ath10k hardware and firmware can work very differently from each
>>> other I'm
>>> suspicious if this feature really work in all of them.
>>
>> I only tested on a QCA6174 (and I'll add Tested-on for that). This
>> makes sense and maybe enabling unconditionally for all ath10k hardware
>> is the wrong way to go about it.
>>
>> Since I don't have the ability to test every hardware combination
>> hopefully someone from atheros can chime in.
> 
> Heh, Atheros is long gone. But your comment made me remember the good
> old times and smile :)

Oh yeah, QCOM bought Atheros just before I got my first job there. 
Wasn't sure if the remaining devs still thought of themselves "Atheros" 
employees to this day :)

> 
>> Is there some firmware/driver value that can be queried which tells me
>> if broadcast RX is supported?
> 
> A good question for which I don't have an answer. Does anyone else know?
> 
> Do you have a simple test case for this? It would help if people could
> test this feature on their ath10k devices and send us results.

I could try and come up with something. I've been testing with 2 
devices, running the full DPP protocol between... not exactly "simple".

I suppose you could create a station device, register for beacons, just 
sit and see if you see any. I'm not sure though if this is a 1:1 test 
since really its action frame I'm after, and the firmware may treat them 
differently.

> 
>> Or if not is checking ar->hw_rev == ATH10K_HW_QCA6174 good enough?
> 
> BTW instead of checking ar->hw_rev our preference is to add a new
> boolean to struct ath10k_hw_params. That way it's easier to enable and
> disable the feature per hardware version.
> 
>> Or are there sub-variants that may or may not support this?
> 
> There are several QCA6174 variants and you can check the variants from
> ath10k_hw_params_list. For example, hw2.1 or SDIO firmware may very well
> behave different from the PCI firmware. To be on the safe side I think it's
> best to enable the feature only on the hardware versions we have
> verified to work.

Sounds good, I can make it specific to just my hardware and others could 
expand in the future if they need. Out of curiosity is ath9k much more 
limited on unique hardware? I based this patch off one from Jouni for 
ath9k [1] and it unconditionally enables it for the entire driver.

[1] 
https://lore.kernel.org/linux-wireless/20200426084733.7889-1-jouni@codeaurora.org/

Thanks,
James

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
