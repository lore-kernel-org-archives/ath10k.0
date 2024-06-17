Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CFAC27C79
	for <ath10k@archiver.kernel.org>; Mon, 17 Jun 2024 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYKZbKA1IH1qpLBsnDaAu/eGeDN326v+sTxO24RWZEc=; b=TfjBGboFuBU7Cm3obwmRroZvWR
	9i6eckO9gAcHfuKUqXUIaLGu51zOZJceXKHdPIn8ajX4b9+jHfX64hpZCRvCOhddizVfjVsJ2Atgw
	Zqh0Qs4eAz80Rzn2bpgW/lmBq+prItI7P32OEPektdvtkucQcSk7+UDeUmnGb1g2iLm06kdjyolFh
	RA4IH2YtlEppH3He38OTEgLLYtTQAlnbENOo5ypJb+drmz0tmMijAdsrzTer9E3bocex13WFoyax8
	CP3+7Q2ZIfqVLGBjGFZL/1oPG11rNWkVjr6DAEtK1caHdeipT3pJULYxdgf6CU0+mSvFquZEArEFL
	lMtWwOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJET8-0000000BWZ2-1oKm;
	Mon, 17 Jun 2024 15:40:30 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJET6-0000000BWXa-0iKh
	for ath10k@lists.infradead.org;
	Mon, 17 Jun 2024 15:40:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c51fb916b1so947713a91.0
        for <ath10k@lists.infradead.org>; Mon, 17 Jun 2024 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718638827; x=1719243627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYKZbKA1IH1qpLBsnDaAu/eGeDN326v+sTxO24RWZEc=;
        b=e/B16VZPmDnBrK/cCMAfUVKtkMwfx0Ab5CunIwzYC+daELu487gEJXPRwjr9dT+0wo
         HIvKVrQtCbpv1ujyUx94Mi5ARru/sBj8ySUyC0SC9/FX3G5RLAxfok+yxQKzOH4JWvqZ
         GZ0oPXQ2rvt/wBgvBkx/K6XSH7ESuCu5mQNHOOJN6/cB1RlAYnRqD8IFq0yuYXU3pjkY
         qYMOfts4dYeJ3DShPNFh7ugjECPnTk29JcODEZZqMV+3F1tKFiTSpBXbYWs5j5Uwq+b9
         9ks8hD4tsErlnYeDMCKrm0pZpN/WHj2eCoEgP6/xQ5sHZkn7zmG05FiRj1QDN++xyBJV
         1yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638827; x=1719243627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKZbKA1IH1qpLBsnDaAu/eGeDN326v+sTxO24RWZEc=;
        b=DxhkRLVGip9cVGn/7vRi45ecOsvZn9DSNvwXjE+0dTaAS349IRLcet95lCAwmO76sX
         fGYYK5f90J+TqXxXwxEwUkX/Kll72PlW75axh570OnVuqL+VuxMu5Mb9ufDe+lpztIcD
         hZwCCkzjErjwGW5J2Nq+Ihvu/5gi72nbDPNCIVa/QNMUJV9O1yP1Lgmer0FLIpZZEWy0
         oF8znPLrXp58BPOEzW/db+XBDVkv+i20NqTzGIPKgdV+4YyXxoKYpQDQMymHNzOwPJsW
         J22Fs4GplULILvjJI/mw2Vu/X+8gI8vhNhON3mj4pSWcb8En6PbxY3HLzvM74639ZO7D
         JjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWblj4Fhnci1kZZjE7/HlwTcLKvqKXLXu110NUh2YfEhdYbirSAIurp5/nnTFuFX8tMpQaWAuUaFxglL7anW/eeyaN4vheRXPZy4Q==
X-Gm-Message-State: AOJu0YxeAm1zFjjIAD9fkrj2WoKJJI/9TlAbiNuBDbFxNkulnA2GhYD1
	nUeifDUJ3p9jF3BuShD7BBhRKMRQn7PyFPm6RIrJlWsbB7Q5Cbv7
X-Google-Smtp-Source: AGHT+IFHFsKHtLXkZcWv7XUVxV29Z6bbPOrvzMOfmWEj2bjq7IKEVu74hiV3XqolDSUa8zDgMsp85A==
X-Received: by 2002:a17:90a:ae06:b0:2c2:f6a3:3043 with SMTP id 98e67ed59e1d1-2c4db133ea3mr9702567a91.9.1718638827086;
        Mon, 17 Jun 2024 08:40:27 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c45cc95dsm9152634a91.22.2024.06.17.08.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 08:40:26 -0700 (PDT)
Message-ID: <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com>
Date: Mon, 17 Jun 2024 08:40:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Kalle Valo <kvalo@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
 <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> <87iky7mvxt.fsf@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87iky7mvxt.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_084028_249127_07EB623E 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Kalle,

On 6/17/24 8:27 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>> Hi Paul,
>>
>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>> Dear Linux folks,
>>>
>>>
>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>> connecting to a public WiFi:
>>>
>>>      ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps
>>> nss 2 mcs 9
>> This has been reported/discussed [1]. It was hinted that there was a
>> firmware fix for this, but none that I tried got rid of it. I got fed
>> up enough with the logs filling up with this I patched our kernel to
>> remove the warning. AFAICT it appears benign (?). Removing the warning
>> was purely "cosmetic" so other devs stopped complaining about it :)
>>
>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html
> More reliable link to the discussion:
>
> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org/
>
> I think we should add this workaround I mentioned in 2021:
>
>     "If the firmware still keeps sending invalid rates we should add a
>      specific check to ignore the known invalid values, but not all of
>      them."
>
>     https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>
> I guess that would be mcs == 7 and rate == 1440?
I think its more than this combination (Paul's are different). So how 
many combinations are we willing to add here? Seems like that could get 
out of hand if there are more than a few invalid combinations. Would we 
also want to restrict the workaround to specific hardware/firmware?
>

