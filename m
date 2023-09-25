Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D2DCE7A81
	for <ath10k@archiver.kernel.org>; Mon, 25 Sep 2023 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpIhdZnI+jhdMzp0QZFyK62zSbhqukLmpmIQFs9OsdA=; b=PmnUmtwXrvkJPP
	mTmFE8x6Q8He6TjctTaLS9Q4jtjMUJ7YPX2qMnrqXzkNzpo06Jj9MjgCcuSkMDN1s7iXyDXqLmJ2T
	s49aItKTmMMZGIjJb5JZD4W862hX1GWa+I1LhzlHRBpqN8wAqT/fnF4QmPHTwwonzJ9rwB630VhFt
	HCUYcALVyYwf6LGHOA6+lN8spnmTRDMkJ218JaHBu3DfLo68tkozeiBi+rCx6hnz4UaWKR5DGOZtx
	7Ld2QSQTcPu+7BO4HcD8CHfTa4Jb2Bbl0xljVW1J9KTEpqJfHWuYQgXkpSSSaJ2h4tUWE72UshXux
	zpxR8IQwWSDozN3IsNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkick-00Dx49-2f;
	Mon, 25 Sep 2023 10:15:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkich-00Dx3i-2f
	for ath10k@lists.infradead.org;
	Mon, 25 Sep 2023 10:15:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c5db4925f9so41707695ad.1
        for <ath10k@lists.infradead.org>; Mon, 25 Sep 2023 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695636925; x=1696241725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NVXxEEpqJ2UNnbMQkJOTpjyQq9eSlrGNtIF8Dr6n5c=;
        b=LLjE1mXFyXsWo6m06MDf3HyfJnhCMLairJkFzavE0LMvUOTpNIYeQUAX2lbyPF3HsO
         oRVkRnU7fddpr6CBHEi8xP4CZDYgSCUbX7DJvnzvZjJnagzzToEy1a0NU9nGNjnB90XY
         CkSMLbpsr3OX2zmGsN3IKSb76ukUKwQUdEVdnERI8UGZHiHozGpGRSSBOFazhqIHP/2H
         wmf5BfgZEGhCFVaJP4hHueiViHU+sqQ3p3kliadfCyJHkHeS9Mj52XjyLV5XHSV7ysZ2
         DR0aWevL6+5KhPiwYlc1OgmAfQd4NfNGRKQ1QoepKtJ1p/4R9M/0PjuNSEkI+obw1xJK
         nCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695636925; x=1696241725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NVXxEEpqJ2UNnbMQkJOTpjyQq9eSlrGNtIF8Dr6n5c=;
        b=euKGA3fSoBw/dzLL+U/RTeIvf1WMnOkqLnw0uLCCwqsJwsJtaSFV0/tioNGI7XvDLF
         ZQ+SZSa8KgjY1CE182nVAwyB1gnunlTYmA4ZCbznObmSIqENETX6yrv6AIC06ZMBJANi
         pwsq3QX+nmuaeSN8OR429rZhbiHKHHMzhcdX09u3bI27lLcMs4RCexyOC6bnT/pNvwdo
         q8bWSinJxJ88VjlCH6Wn9e/JjefKqohULYuPia1Wp0SHH1m+notyj84jjuy3RxyXyg8M
         B966I+aZVhL40FrvmsULrC4fiMYcQzuaTuSBdH0oyW/MAef6E9Bk6oXaesfYhYAdC++w
         qIDA==
X-Gm-Message-State: AOJu0YxVcDJ+WsQYzC/xnfuukvR6ngIjg21rus1mUgDc9P8fozy0an+B
	PLSobYAyNrmp1SbEv1Pf1Vc=
X-Google-Smtp-Source: AGHT+IEpbKaWl3nI75eL3Q9w3y/kFGxa7JzulCEuEbiSKZp03h6499/2xqNpvyYfnC+ckNXuzXNCcA==
X-Received: by 2002:a17:903:230a:b0:1bc:4415:3c1 with SMTP id d10-20020a170903230a00b001bc441503c1mr15610557plh.7.1695636924844;
        Mon, 25 Sep 2023 03:15:24 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902cec900b001b9e9edbf43sm8481468plg.171.2023.09.25.03.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 03:15:24 -0700 (PDT)
Message-ID: <cafad11a-d7c7-4b68-880a-d6e05578fa5c@gmail.com>
Date: Mon, 25 Sep 2023 17:15:20 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Atheros QCA6174 ath10k_pci fimware crashing
To: Kalle Valo <kvalo@kernel.org>
Cc: Cool Goose <coolgoose54@yahoo.in>,
 Linux ath10k <ath10k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1209906123.2716993.1695416371605.ref@mail.yahoo.com>
 <1209906123.2716993.1695416371605@mail.yahoo.com>
 <ZQ4vQNe3XsArwWQT@debian.me> <87a5taa7lp.fsf@kernel.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87a5taa7lp.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_031527_887466_281AD9CE 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 25/09/2023 17:08, Kalle Valo wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>>> Sep 19 09:01:11 hostname kernel: ath10k_warn: 149 callbacks suppressed
>>> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake target for read32 at 0x00036044: -110
>>> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake target for read32 at 0x00036044: -110
>>> Sep 19 09:01:11 hostname kernel: ath10k_pci 0000:03:00.0: failed to wake target for read32 at 0x00036044: -110
>>>
>>
>> Looks like hardware issue, right?
> 
> It could be a hardware issue (for example a problem with the PCI bus
> communication) but also simply a firmware crash. These kind of reports
> come time to time but root cause is unknown.
> 

The reporter said on Arch Linux forum (see TS) that trying older
linux-firmware package doesn't help, so I suspect this as hardware issue.

Cool Goose, what is your laptop model?

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
