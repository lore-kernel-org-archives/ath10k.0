Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66B5C54E5D
	for <ath10k@archiver.kernel.org>; Thu, 14 Mar 2024 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydOw5fr/AFZUtVGxJCncGRnX7kcC+G1b69vGaI6Rc7o=; b=S+efDYRbdE5bPvd/kex3H6DfFt
	K+k0CJYusa7+76IJJJ/KgkN0Dgy5tQcP0WS9cGZFACvYC7ZY5nKdbOFdC+FqKQg3p4KujaVSA0KeS
	97/W+Pg+FM1WBUuKJibjtn6pdz9qUoT8i4OaECgtlb/7q9SuZ2UxLBRp0qjNg0udxp5vAccXEk3kK
	36+OPeJWoSzQ+wp+20Wpw3/FmOAf5toApCxrx791hkwUyy6UPT9RZYOnKZAMQClbbBdM7o2yuKZ3k
	kbagVVtcvRLh2h3mVpXuQz87QdhankD1Y85LSHk6nZIVPaz02rM2zzp5GWG6benDRoKORn8jDh9dv
	0tdkGu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkpFm-0000000FBGO-1ZRj;
	Thu, 14 Mar 2024 17:52:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkpFi-0000000FBFS-3xLu
	for ath10k@lists.infradead.org;
	Thu, 14 Mar 2024 17:52:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33e76d653b5so1110841f8f.3
        for <ath10k@lists.infradead.org>; Thu, 14 Mar 2024 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1710438742; x=1711043542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydOw5fr/AFZUtVGxJCncGRnX7kcC+G1b69vGaI6Rc7o=;
        b=OuNuy3fA6l4vRd0x7WDKS0bWUVFBoa/j+hH9RGr1kyNBBMwAdPL09/iw91Z1xWQiZF
         XJ36iLE6Jld3ivmdlKYd6YPXYB0213RckNUhEYV9san1S+lU7LIgPu6s/19/zVUxuFh8
         IKsMM6z+5BAjQLAPjxFCyb8oyPMIplvJiG34BJdRY0BvenG4Fj+62M0ikVqByYwkedWj
         +yfvxP6g5uMRKdE2finj9q2XhnGXBq5Wu0Wsi+ERtamHlJohMVim4VPwUPRMS8TOcmhJ
         b983JFachAMUpQ4KqmenzYE04luvh1X+o1x0Tw2LXpW0ieRxhjmebXByjuZzpzJqC9F3
         A6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710438742; x=1711043542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydOw5fr/AFZUtVGxJCncGRnX7kcC+G1b69vGaI6Rc7o=;
        b=J5hBAhNMwyKkclzKZKN19wYZrJXwGlbkpCpTftWoRgUHp3mnoRlCuMjbCrVqQkdn2D
         yvPEGR3pJIzCOkYOpFD/+UV94TryuKxRWWzIs7wwpaNWG4cNHt7hnaTRkR23LxMALQeS
         /QBbuyyyQVxqWuBZ00/Pe7FTnWkvbmA5dXIeh3kYwiceaf9j92YYIX8yqv376jYPdMKJ
         6F+PtapF3tBmWRxD4ZVqAmkzqOK9J+nGQdfat6s5cidK8afi5VkfPTKNbqdcWWtf3xcX
         s1FEVTntPvlKhhU8uFKY2HaktaC/Qiz0rQHss/Nyya6L+/3d/RhTsc5+tZW7H3OmwLBd
         HgKA==
X-Gm-Message-State: AOJu0Yx/1+CqJgALyvzt+o37GGPlKu2tOnlphVzeWgg13hkC+rpOLU53
	2Yi4ehw3pHrltrDI6P08SOhJ32LZx8wOI8tcLwaTD59QXCRR48YXbBQkQWYvG7E=
X-Google-Smtp-Source: AGHT+IEOyhXOB1aioQMfsxpLm0S1khFSThiLIjiZsbb+aHejkjcjgWgHwFtSf1gI/HfTM8GLlmW6jA==
X-Received: by 2002:adf:e3c4:0:b0:33e:7650:24c8 with SMTP id k4-20020adfe3c4000000b0033e765024c8mr2049164wrm.12.1710438742240;
        Thu, 14 Mar 2024 10:52:22 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id bt14-20020a056000080e00b0033e2777f313sm1270176wrb.72.2024.03.14.10.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 10:52:21 -0700 (PDT)
Message-ID: <150c9705-e5ed-4d4a-b935-c0101a27795e@freebox.fr>
Date: Thu, 14 Mar 2024 18:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
 <c48ead11-0e2a-4066-b324-84f802215c9a@quicinc.com>
 <2f588948-0261-4985-91e8-d5060e673cd9@freebox.fr>
 <15db6593-c474-43a5-ad20-b0e108137713@quicinc.com>
 <cbedb60c-c849-4b7e-a00e-c75ec8429adb@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <cbedb60c-c849-4b7e-a00e-c75ec8429adb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_105227_130936_AE5CBE4A 
X-CRM114-Status: GOOD (  14.55  )
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

On 14/03/2024 15:33, Jeff Johnson wrote:

> On 3/7/2024 8:46 AM, Jeff Johnson wrote:
>
>> On 3/7/2024 7:29 AM, Marc Gonzalez wrote:
>>
>>> Have you heard back from the dev team?
>>>
>>> Do they confirm that an issue involving missing MSA_READY notifications
>>> was ever noticed?
>>>
>>> What devices were affected? (All msm8998? A subset of msm8998?)
>>>
>>> Was the issue eventually fixed?
>>> (Probably fixed, otherwise newer devices would be affected)
>>
>> The feedback I received was "it might be ok to change all ath10k qmi to
>> skip waiting for msa_ready", and it was pointed out that ath11k (and
>> ath12k) do not wait for it.
>>
>> However with so many deployed devices, "might be ok" isn't a strong
>> argument for changing the default behavior.
>>
>> So my preference would be to use the firmware capability in the board
>> file that Kalle has recommended.
> 
> Marc,
> I finally have an engineer who wants to research this further.
> Can you provide the kernel log that shows the firmware version being used?

Hello Jeff,

Is this the line you're after:

[   32.367011] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2

Hopefully, my Debian setup will soon be 100% functional
so I can easily tweak the kernel, and add more logs.


Bonus question:
Is it legal for my company to publish our versions of qcom firmwares on linux-firmware?
(Perhaps a generic set of FWs would work; but AFAIU, there is some kind
of signature verification at some point)


Regards


