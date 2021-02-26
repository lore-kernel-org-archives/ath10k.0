Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E6DC433E0
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 18:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAF864F1F
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 18:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAF864F1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GlGHeKLQDlvsh+ASjzhUcmlD+iSkIcv8xjFDYzILdeQ=; b=t69HVQxff0RpAieWk7t2zOpH7
	OW9TWJ0HZJLPJ6zANxLfxqcLXoguAjitVRacEjOPpzuClYiJz0UdYremNgLsiIqhga/lt7L5MTH/6
	Tnj99C4iCO8r7oUBF9PAQ0OYKbwlc0HF1m86JbiRIUUI1YpIZ1skRz3ulKrCC+IW2goRp9LcV54g7
	KW3eskGj//mWft2RNWma7weGzThuvNRMpc5VQpACHR4EO1+LY2UXygDZ/KvLoBu81WG3q8mfbeQN6
	Xk4SVqczCMfh5yuKaVOMy3LAlmvER0FB9T8IWjZx04F/BShCsSLNdqqRLxozy/E0wI9fejltQ4bA4
	KY3HsgXAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhR8-0001eJ-GU; Fri, 26 Feb 2021 18:01:58 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhR5-0001dR-Bd
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 18:01:56 +0000
Received: by mail-ot1-x333.google.com with SMTP id x9so5490502otp.8
 for <ath10k@lists.infradead.org>; Fri, 26 Feb 2021 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J3D1ZBXfHJ7T5OxXlR3ELZS2hjiPuLERxYL/JoPYBLg=;
 b=em6t2aIGUSHjJ/uI9iLtOHsLnHHm7jMylbWwnlaQSffVQyI99zLOYCtGceNuRQdMR3
 p/fcZkxAh3PgLrGTGsZ4WrchrB/MMUfrBOdki8JYYruxepwR814fPQ28v3JOAPDGacsX
 mivZTkNGNrzIqA3NoWL7jA+4hlXYXauWd2B+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J3D1ZBXfHJ7T5OxXlR3ELZS2hjiPuLERxYL/JoPYBLg=;
 b=Wtf6OiGfpuCZbFNcWR2tkcaCF/dgCNtS3VCVmqsqKl9XTraICcMcTYlljEL8EQojlg
 F8UGxlOpzbqIT5viS1NGSxxf9RsT1C8dzz47TXt1CPOsgdtkz4R4ll336AvLB0S5EYhA
 KQeZgdZGjFptbkuEbDuv8CqLrbKTSYoIGsf1V9J1ecLqv0bAzDpfrhtNytpyg+0bV9Fv
 2DMbcxXblFvq75NM8/FzOK71Npp6l1P2Ye/GolgcoG9IBcQVqbPy4JeEVVO1beVWAYZ8
 WIDZ5CuIT4y22XvJI4B7oeiPlDgGcB8rlQmLxGjX6U2mWe868pXUcUl6WwjBVTDySQJY
 2n2g==
X-Gm-Message-State: AOAM531KLB0wOs4puNBaCofRIHvZminLlGATjDhYn93hTqfguuEpJacV
 JHxSgLkxwpbT+yd1ZDhdcnywzA==
X-Google-Smtp-Source: ABdhPJyXTO4fVVhj3Lz7WaoyA3SHDDtpNMqnkToCAKlLscHCfj/Sw8klMeVZN9tZvRI7+y2ssm3m/Q==
X-Received: by 2002:a05:6830:244b:: with SMTP id
 x11mr3098309otr.19.1614362513366; 
 Fri, 26 Feb 2021 10:01:53 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id j25sm1231790ota.37.2021.02.26.10.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 10:01:53 -0800 (PST)
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
 <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
 <87h7mktjgi.fsf@codeaurora.org>
 <db4cd172-6121-a0b7-6c3f-f95baae1c1ed@linuxfoundation.org>
 <87wnvesv8t.fsf@codeaurora.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <82e3e0a2-d95b-cffb-4fa7-2eaa4513dd48@linuxfoundation.org>
Date: Fri, 26 Feb 2021 11:01:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87wnvesv8t.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_130155_518072_1D951DEE 
X-CRM114-Status: GOOD (  25.13  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/11/21 4:24 AM, Kalle Valo wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> On 2/10/21 1:28 AM, Kalle Valo wrote:
>>> Wen Gong <wgong@codeaurora.org> writes:
>>>
>>>> On 2021-02-10 08:42, Shuah Khan wrote:
>>>>> ath10k_mac_get_rate_flags_ht() floods dmesg with the following
>>>>> messages,
>>>>> when it fails to find a match for mcs=7 and rate=1440.
>>>>>
>>>>> supported_ht_mcs_rate_nss2:
>>>>> {7,  {1300, 2700, 1444, 3000} }
>>>>>
>>>>> ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2
>>>>> mcs 7
>>>>>
>>>>> dev_warn_ratelimited() isn't helping the noise. Use dev_warn_once()
>>>>> instead.
>>>>>
>>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>> ---
>>>>>    drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
>>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>>>>> b/drivers/net/wireless/ath/ath10k/mac.c
>>>>> index 3545ce7dce0a..276321f0cfdd 100644
>>>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>>>> @@ -8970,8 +8970,9 @@ static void ath10k_mac_get_rate_flags_ht(struct
>>>>> ath10k *ar, u32 rate, u8 nss, u8
>>>>>    		*bw |= RATE_INFO_BW_40;
>>>>>    		*flags |= RATE_INFO_FLAGS_SHORT_GI;
>>>>>    	} else {
>>>>> -		ath10k_warn(ar, "invalid ht params rate %d 100kbps nss %d mcs %d",
>>>>> -			    rate, nss, mcs);
>>>>> +		dev_warn_once(ar->dev,
>>>>> +			      "invalid ht params rate %d 100kbps nss %d mcs %d",
>>>>> +			      rate, nss, mcs);
>>>>>    	}
>>>>>    }
>>>>
>>>> The {7,  {1300, 2700, 1444, 3000} } is a correct value.
>>>> The 1440 is report from firmware, its a wrong value, it has fixed in
>>>> firmware.
>>>
>>> In what version?
>>>
>>
>> Here is the info:
>>
>> ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id
>> 0x00340aff sub 17aa:0827
>>
>> ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00140-QCARMSWPZ-1
>> api 6 features wowlan,ignore-otp,mfp crc32 29eb8ca1
>>
>> ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 4ac0889b
>>
>> ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal otp
>> max-sta 32 raw 0 hwcrypto 1
>>
>>>> If change it to dev_warn_once, then it will have no chance to find the
>>>> other wrong values which report by firmware, and it indicate
>>>> a wrong value to mac80211/cfg80211 and lead "iw wlan0 station dump"
>>>> get a wrong bitrate.
>>>
>>
>> Agreed.
>>
>>> I agree, we should keep this warning. If the firmware still keeps
>>> sending invalid rates we should add a specific check to ignore the known
>>> invalid values, but not all of them.
>>>
>>
>> Would it be helpful to adjust the default rate limits and set the to
>> a higher value instead. It might be difficult to account all possible
>> invalid values?
>>
>> Something like, ath10k_warn_ratelimited() to adjust the
>>
>> DEFAULT_RATELIMIT_INTERVAL and DEFAULT_RATELIMIT_BURST using
>> DEFINE_RATELIMIT_STATE
>>
>> Let me know if you like this idea. I can send a patch in to do this.
>> I will hang on to this firmware version for a little but longer, so
>> we have a test case. :)
> 
> I would rather first try to fix the root cause, which is the firmware
> sending invalid rates. Wen, you mentioned there's a fix in firmware. Do
> you know which firmware version (and branch) has the fix?
> 

Picking this back up. Wen, which firmware version has this fix? I can
test this on my system and get rid of the noisy messages. :)

thanks,
-- Shuah

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
