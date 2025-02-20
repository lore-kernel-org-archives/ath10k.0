Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B33CC021B1
	for <ath10k@archiver.kernel.org>; Thu, 20 Feb 2025 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSs/K2VQQrrOagAXRPAvXhDuiMH4NijPOc7sJYHkPsg=; b=NhyulqbF0gQOwcgQvsILo8bynr
	qqlei3WYyc1YmDMROFgZTCWle5ESv3dmSJ/nXaoM/nP/PyAZmcTe26RbJPiz01lMs9GoHy6+M+G6Z
	C9+35vqKniqT2Tv4xvCiUeCP7x8v7zfA0V9vE8vqFwVRbzzJpijhDp76uJOGBqWdbGalBGkiN0Cbc
	v0GB2yQgD4KvISOffKln4UogAYTHH5FakdizyAtPl9FoYwPqXEP68O08FNR8TIwgPGvtcMQUQxXGU
	HRgRaeLZSt1AZooih/OanF0ZS5+bbiJljY4Su1RsdxcJH8DFUEeK77cUCynOVGivkrNqFq2iUpiIo
	07jQRv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77a-00000001C0I-1eeB;
	Thu, 20 Feb 2025 14:01:46 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl71y-00000001AXj-3Zv3
	for ath10k@lists.infradead.org;
	Thu, 20 Feb 2025 13:56:00 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6dd01781b56so11500706d6.0
        for <ath10k@lists.infradead.org>; Thu, 20 Feb 2025 05:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740059757; x=1740664557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSs/K2VQQrrOagAXRPAvXhDuiMH4NijPOc7sJYHkPsg=;
        b=DZSLSGd9GNsSj72/t0Jj+vedE67x80mMHYQZ3eZqlcmEh5bqwlEE39DMEJ9hDJbuHq
         JCUd0rSjUSVif1LfZDDMwmtcDmx1OToHJHeNCeyicCyS9E+QcfZU6mmNyQ+R4VUFPBGs
         bTNphm0jtL834XoRklAQqg93qeXxF7FjBwi288XPtI1sjDEmYAqA/qffQ5X+yx9mWCyj
         E6Xdxf03l+LbTul+UGZrgU/FdusbdL+bxUiz0jp8TT65uFmE63CmDCDraphmw2eBwBgp
         0UKE82w69uEbxvvkbIabLX7iyuAHwuNuH7C4iEMuZqtc96cCoXmUCAPtfa0APBQN3cB3
         M1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740059757; x=1740664557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSs/K2VQQrrOagAXRPAvXhDuiMH4NijPOc7sJYHkPsg=;
        b=jrfKg5QhL/YQ9bChsdtWzVpLZrCsBEbGs11eNv6JR+xGj9MqNsEqBJNg/mwWcdD5Uh
         HDMxoAsqi+6F9H6y6S1qJ8MkycI+wsKCILfUuqOdxQzukfwIWb5/Ysmgq90Fc+j9+RC9
         jbSKbMv8GqQiteBAS56PxttxKvBhwxb3/W7/1bXacHLBURjE9QHGVxg/vUn9i9KWKocC
         COaQOGFn6aqSJJVEaBFb7dyt12IsO8nfNshCO+UMQOtCNo+APj+ALCBiPQP6knjqTueh
         ZrksDUoXIm1Y3/kUL9HR6HSPzgQeXTUGE/0IzkMARpA6FAQFBJ5sdDu3QTYUIbdUM/lH
         oFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+9l9ukd2akNH/jcaON1nkivva6X05Iw4l0gOEUaty5sP2wg9r3yFl7OSH34cQbD+NCn8e5cc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwptraW3Ne0ri8whgHwU5ZL1TmBma6dncnVSdp75rZ4tEYh0oEU
	hJ1kaT5yJSJCL/QdwyjK8sND0Tcrx4/ok1WA+xTd59JTdVKqgXoF
X-Gm-Gg: ASbGnctkPsngNBsHlK5a+ueM2xZreu62RLsv4ao1byRMYT1bpCYQ/04uRFxxtqIOUgF
	K90e1k/5SVeJHB1+NoSj2KQ6kr9UDZrQXj/h8Hhezkn9OmzWr/IiVTfYmikUk7KqcCSjYjajzwI
	yXmnz8bP6+yvBGu499o5BkSZrN3kgaiu6feL5P+CWeJrtMSm6Isi7ABTT5/LS9imVdkl5OBFdlo
	8i15CTepDEOcgc7DX2ZTZ54ud7mmB/33AYYgsLGIT1jCA2SNSJNSusf0B/Cvmr5dZleQMsPv28/
	qiTJbhcTBKHLF/OTRoY=
X-Google-Smtp-Source: AGHT+IG//EwMg38LvAk1MF7ryiTZFxH2eRowNFWBaeVsSmMv9351WHPYqaTDf4aQnLSkkZsRhf8o6g==
X-Received: by 2002:ad4:5fcd:0:b0:6d8:a0c8:e468 with SMTP id 6a1803df08f44-6e66ccd4b26mr282933056d6.24.1740059757566;
        Thu, 20 Feb 2025 05:55:57 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65dcf946asm86463026d6.125.2025.02.20.05.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:55:57 -0800 (PST)
Message-ID: <966f3c12-4995-4b46-a833-3b5522921764@gmail.com>
Date: Thu, 20 Feb 2025 05:55:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ath10k: failed to flush transmit queue
To: Kalle Valo <kvalo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: Cedric Veilleux <veilleux.cedric@gmail.com>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com>
 <1df0c5cc-ce58-450e-9f91-7f8f599cb11d@nbd.name> <87le1hjupo.fsf@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87le1hjupo.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_055558_891618_E5A45927 
X-CRM114-Status: GOOD (  16.84  )
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

Hi All,

On 7/31/24 11:13 AM, Kalle Valo wrote:
> Felix Fietkau <nbd@nbd.name> writes:
>
>> On 12.07.24 04:23, Cedric Veilleux wrote:
>>
>>> AP mode.
>>> Both 2.4 and 5ghz channels.
>>> Using WLE600VX (QCA986x/988x), we are seeing the following errors in
>>> kernel logs:
>>> [12978.022077] ath10k_pci 0000:04:00.0: failed to flush transmit
>>> queue
>>> (skip 0 ar-state 1): 0
>>> [13343.069189] ath10k_pci 0000:04:00.0: failed to flush transmit queue
>>> (skip 0 ar-state 1): 0
>>> They are somewhat random but frequent. Can happen once a day or many
>>> times per hour.
>>> They are associated with 3-4 seconds of radio silence. Full packet
>>> loss. Then everything resumes normally, STA are still associated and
>>> traffic resumes.
>>> I have tested with major kernel versions:
>>> 6.1.97: stable (tested for many days on 10+ access points)
>>> 6.2.16: stable (tested for few hours single machine)
>>> 6.3.13: stable (tested for few hours single machine)
>>> 6.4.16: unstable  (we have errors within an hour)
>>> 6.5.13: unstable  (we have errors within an hour)
>>> 6.6.39: unstable  (we have errors within an hour)
>>> 6.7.12: unstable  (we have errors within an hour)
>>> 6.8.10: unstable  (we have errors within an hour)
>>> 6.9.7: unstable  (we have errors within an hour)
>>>   From these tests I believe something changed in 6.4 series causing
>>> instabilities and the dreaded "failed to flush transmit queue" error.
>>> This is a custom linux distribution. Only change is the kernel. All
>>> other packages are same versions. Everything rebuilt from source using
>>> bitbake/yocto. Same linux-firmware files.
>> I'm pretty sure it's caused by this commit:
>>
>> commit 0b75a1b1e42e07ae84e3a11d2368b418546e2bec
>> Author: Johannes Berg <johannes.berg@intel.com>
>> Date:   Fri Mar 31 16:59:16 2023 +0200
>>
>>      wifi: mac80211: flush queues on STA removal
>>
>> I guess somebody needs to look into making the queue flush on ath10k
>> more reliable (or even better, implement a more lightweight .flush_sta
>> op).
>>
>> I don't have time to do the work myself, but hopefully this
>> information could help somebody else take care of it.
> Adding ath10k list so that everyone see this.

I want to revive this thread and provide some additional data. This is 
not just something that happens in AP mode, or specifically with the 
hardware mentioned. After upgrading from 6.2 to 6.8 we started seeing 
this on client devices running the QCA6174 hw 3.2 firmware ver 
WLAN.RM.4.4.1-00288- api 6. We see it during disconnects which isn't as 
big of a deal, the more concerning time is during roams which makes 
roams go from less than 200ms to over 5 seconds.

Based on this report I have tried using Remi's set of patches [1] which 
implement flush_sta(), but we end up with the same ~5 second hang, just 
in ath10k_flush_sta() instead of ath10k_flush(). I'm unsure if this is a 
firmware problem, or some race within the driver itself. In the past I 
have reduced timeouts [2] to work around these type of things but its 
really just a band-aid.

I would agree that this was "introduced" by Johannes' commit above, but 
the original commit does make sense... This is just an ath10k problem 
with flushing the queue's.

At this point I'm really left with two options:

  - Revert Johannes commit to flush the queues, thereby reducing 
security, OR

  - Reduce the timeout from 5 seconds to something more manageable, like 
1 second (hopefully someone more in the know can comment here).

Has anyone else looked at this regression? Maybe has some workaround 
other than my options above?

Thanks,

James

[1] 
https://lore.kernel.org/linux-wireless/17d26d6a3e80ff03939ee7935fdc07f979b61a4f.1732293922.git.repk@triplefau.lt/

[2] 
https://lore.kernel.org/linux-wireless/20240814164507.996303-2-prestwoj@gmail.com/


