Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C79C3064D
	for <ath10k@archiver.kernel.org>; Thu, 27 Jun 2024 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4gLrZc+w7mUh5pQdRJLrbFMJm3I4uzQamXREb3EHkk=; b=NDIdaZ6pDaVG3zqmy1QcOQGOa2
	KXjNBIoCwl9+pGRFWrEYt5rxjEOP8z/cc7GQ1q5OWDalEqeUZMw7X6XBC8jQdxq2HVMT8Fv0PfoEx
	U6TBkfATLMaih825zX2YQzX1EsiBOKGvWbMV4DNtHnes2zFdL6HTNiPyXobNxMXJi7Xo93pAO6am6
	W0V7pu2+7TOH88M4rA7abyLxERRE7FQkk7HhjC+rKV53FHQIWvpqjJxN3vtsem3s92IO3y91Zz9oV
	3vi3c5fnZO628b6rFGUMmOUUJJYH2KOAUVjDMVU+7h8mCk/KWepm0ee7gzFeb/rw1zf24YAEWJOV5
	16mHqZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMt92-0000000BGxJ-2jmc;
	Thu, 27 Jun 2024 17:42:52 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMt8y-0000000BGw8-0KDC
	for ath10k@lists.infradead.org;
	Thu, 27 Jun 2024 17:42:50 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-79c10f03a5dso220197485a.0
        for <ath10k@lists.infradead.org>; Thu, 27 Jun 2024 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719510165; x=1720114965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4gLrZc+w7mUh5pQdRJLrbFMJm3I4uzQamXREb3EHkk=;
        b=EW2ta0AgnvUvRF7qVjSmcKWzFHfz/Etw0EYGVmUS0EGONO50Z7N5Z1R38ypRmyJbFn
         eiTgO9YkOsrs81YaGYNauzlRTfiqKJD1AWVgA/awamtcQKXz3RPJEncNqFZTPwdaabGp
         BPxsq5A5crKmZ5ypNfA4ZKGxgUfwxBQooo0OK0pk3TBSVuvHKNI9LtwKP8Zvc0iLOXdw
         TQLo/uik7DlG0YsOqtVY5Ai91Y/fPkYSaEd9pQKLV2pE6jebK7kSxFJ6autCqKkVq1mr
         IxvFrpNuHhfE3Rwv8j+8mudYcVVdwaLHT2qKBaS8O2DEhSeMjRVrgh68egZEiqIjuWcl
         0HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719510165; x=1720114965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4gLrZc+w7mUh5pQdRJLrbFMJm3I4uzQamXREb3EHkk=;
        b=FXXrFFSF8gZGySuJzBZhJwjlmwXbM/CXuncfvYKk5VcKyYXmo9FA0xrWy66+urTm5Z
         wnt51NyNTQ3sirSvEkw/xYLLa+sspGw71ku4eiRpSx/h6TerOPcz/ZDNX7jylXHmwxjM
         pWGDjWLSN4/YhoGNkP4Ddj1fTsNLrMDYR6x6g+UJ0g2SjE7A0vUjSzFa54sUnumt76JU
         0gY4kMBA7/vlyBQkgeRAusWcnupbYCGvzkzE8QYCLI6/aaPOeq49R4pvNJo/3pbAIh1y
         ijs9il80cXik4NehBtSHfIkUd5p4PNnpAuRf7U7x3CPNjPHZCjd636AkJfVwCMFX/Fpa
         3XQg==
X-Forwarded-Encrypted: i=1; AJvYcCVIhoGGQZWAJFjKt/OvssHIB8Cyixx3fFSiv3phiBNBg6JnwTwCbn6ank2L1112O5PfA8ZA94c32vO2N/ELLII2UwhumATYUoxYUA==
X-Gm-Message-State: AOJu0YxvPU0VO0MFnjSwRZIcij37fjbI35cLwHUSGcBM050qe0ZXT7wX
	F93yMKo/Js2rC1vZKNFlm9It6ObOXmzIW2DDgAMHqQzydJwT+T68
X-Google-Smtp-Source: AGHT+IEknF/hbYmxJv5GVjta1oahcOg+apR9zJOpwBaCGfSsnRnL26OuoL00t/4W2nMAYNcE1+tBCw==
X-Received: by 2002:a05:620a:1913:b0:79b:e8ca:861b with SMTP id af79cd13be357-79be8ca8876mr1614969285a.17.1719510165141;
        Thu, 27 Jun 2024 10:42:45 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d5c7ff033sm75464285a.40.2024.06.27.10.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 10:42:44 -0700 (PDT)
Message-ID: <d9f95dcc-6343-4af3-8acc-a150fb4e5923@gmail.com>
Date: Thu, 27 Jun 2024 10:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
 <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> <87iky7mvxt.fsf@kernel.org>
 <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com> <875xu6mtgh.fsf@kernel.org>
 <f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104248_139122_431F3D2D 
X-CRM114-Status: GOOD (  22.63  )
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

HI Baochen,

On 6/26/24 1:53 AM, Baochen Qiang wrote:
>
> On 6/18/2024 6:33 PM, Kalle Valo wrote:
>> + baochen
>>
>> James Prestwood <prestwoj@gmail.com> writes:
>>
>>> Hi Kalle,
>>>
>>> On 6/17/24 8:27 AM, Kalle Valo wrote:
>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>
>>>>> Hi Paul,
>>>>>
>>>>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>>>>> Dear Linux folks,
>>>>>>
>>>>>>
>>>>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>>>>> connecting to a public WiFi:
>>>>>>
>>>>>>       ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps
>>>>>> nss 2 mcs 9
>>>>> This has been reported/discussed [1]. It was hinted that there was a
>>>>> firmware fix for this, but none that I tried got rid of it. I got fed
>>>>> up enough with the logs filling up with this I patched our kernel to
>>>>> remove the warning. AFAICT it appears benign (?). Removing the warning
>>>>> was purely "cosmetic" so other devs stopped complaining about it :)
>>>>>
>>>>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html
>>>> More reliable link to the discussion:
>>>>
>>>> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org/
>>>>
>>>> I think we should add this workaround I mentioned in 2021:
>>>>
>>>>      "If the firmware still keeps sending invalid rates we should add a
>>>>       specific check to ignore the known invalid values, but not all of
>>>>       them."
>>>>
>>>>      https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>>>>
>>>> I guess that would be mcs == 7 and rate == 1440?
>>> I think its more than this combination (Paul's are different).
>> Good point.
>>
>>> So how many combinations are we willing to add here? Seems like that
>>> could get out of hand if there are more than a few invalid
>>> combinations.
>> Yeah, but there haven't been that many different values reported yet,
>> right? And I expect that ath10k user base will just get smaller in the
>> future so the chances are that we will get less reports.
>>
>>> Would we also want to restrict the workaround to specific
>>> hardware/firmware?
>> Good idea, limiting per hardware would be simple to implement using
>> hw_params. Of course we could even limit this per firmware version using
>> enum ath10k_fw_features, but not sure if that's worth all the extra work.
>>
>> Baochen, do you know more about this firmware bug? Any suggestions?
> OK, there are two issues here:
>
> 1. invalid HT rate: "ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2 mcs 7".
>
> As commented by Wen quite some time ago, this has been fixed from firmware side, and firmware newer than [ver:241] has the fix included.
Thanks for pointing this out, I guess I didn't look close enough at the 
log and missed "ht" vs "vht" when I brought it up on that older thread. 
I thought i was seeing the same problem even with newer firmware.
>
> 2. invaid VHT rate: "ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps nss 2 mcs 9".
>
> After checking with firmware team, I thought this is because there is a mismatch in rate definition between host and firmware: In host, the rate for 'nss 2 mcs 9' is defined as {1560, 1733}, see supported_vht_mcs_rate_nss2[]. While in firmware this is defined as {1730, 1920}. So seems we can update host definition to avoid this issue.
That would be great!

Thanks,

James


