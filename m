Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B380C433E0
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 11:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F79E64DCF
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 11:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F79E64DCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=afuPeodGalfJTKEXs1r0y+VUDuQzDVcmu9aSoe8sRcY=; b=ANHgBbjJ7DAzB0hmKM/kz3lu7
	IL3LyFV/CUlL4v+GxOZZdbC/whE22GzSehp3nMbE4GmcXszeja/chUrA/Vjcv7buQgrvu8WDF4wUR
	MYg0+Q4bF3YZ4/RyO4t0QDhYRzBMvzG2YKATkzE6OXtBUOH0tsX70IckfWXbF1BMy/mQXhI9wEdrb
	awjziyN8abxJMrTYg+wy/jTx9N8hlyHCbyFadEIGGaYoa0LDXbbI+KVeYKINOU4HJvicwpnYgONR4
	jSvZ3d4tC7hRItkjA4E9lYIedrA+Rq4+EWemWfxJAXDmVEP2Si2LvvNw4a7wDhkg8MHGnkgZk7RRv
	+zzYJZElQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAA4x-0006BD-Kj; Thu, 11 Feb 2021 11:24:11 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAA4v-0006Ab-3v
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 11:24:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613042648; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Dn9coNEToyxwX/TVzTX6emePR81SEBacxRQQnPTnmAE=;
 b=FN2Y62cin+WmHP1sU5dyDWkcv5OLjK9jQwvCQRKteUIzoOKLESgU0reaa3gnwvqwj36lmrKa
 K3vh5eOwUB3kAPlv3WD+3vSd6RamEKx3KwAl916VZa4brGysaUQnaBTorr3WyBYR7DsIrj5x
 vIJeR/lPidm3KgXBBEZd6VrAo0U=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 602513d881f6c45dceee38f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 11:24:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 63E70C433ED; Thu, 11 Feb 2021 11:24:07 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 826DBC433CA;
 Thu, 11 Feb 2021 11:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 826DBC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
 <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
 <87h7mktjgi.fsf@codeaurora.org>
 <db4cd172-6121-a0b7-6c3f-f95baae1c1ed@linuxfoundation.org>
Date: Thu, 11 Feb 2021 13:24:02 +0200
In-Reply-To: <db4cd172-6121-a0b7-6c3f-f95baae1c1ed@linuxfoundation.org> (Shuah
 Khan's message of "Wed, 10 Feb 2021 09:13:07 -0700")
Message-ID: <87wnvesv8t.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_062409_209835_FAA58E3E 
X-CRM114-Status: GOOD (  28.85  )
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
 Wen Gong <wgong@codeaurora.org>, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> writes:

> On 2/10/21 1:28 AM, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:
>>
>>> On 2021-02-10 08:42, Shuah Khan wrote:
>>>> ath10k_mac_get_rate_flags_ht() floods dmesg with the following
>>>> messages,
>>>> when it fails to find a match for mcs=7 and rate=1440.
>>>>
>>>> supported_ht_mcs_rate_nss2:
>>>> {7,  {1300, 2700, 1444, 3000} }
>>>>
>>>> ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2
>>>> mcs 7
>>>>
>>>> dev_warn_ratelimited() isn't helping the noise. Use dev_warn_once()
>>>> instead.
>>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> ---
>>>>   drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>>>> b/drivers/net/wireless/ath/ath10k/mac.c
>>>> index 3545ce7dce0a..276321f0cfdd 100644
>>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>>> @@ -8970,8 +8970,9 @@ static void ath10k_mac_get_rate_flags_ht(struct
>>>> ath10k *ar, u32 rate, u8 nss, u8
>>>>   		*bw |= RATE_INFO_BW_40;
>>>>   		*flags |= RATE_INFO_FLAGS_SHORT_GI;
>>>>   	} else {
>>>> -		ath10k_warn(ar, "invalid ht params rate %d 100kbps nss %d mcs %d",
>>>> -			    rate, nss, mcs);
>>>> +		dev_warn_once(ar->dev,
>>>> +			      "invalid ht params rate %d 100kbps nss %d mcs %d",
>>>> +			      rate, nss, mcs);
>>>>   	}
>>>>   }
>>>
>>> The {7,  {1300, 2700, 1444, 3000} } is a correct value.
>>> The 1440 is report from firmware, its a wrong value, it has fixed in
>>> firmware.
>>
>> In what version?
>>
>
> Here is the info:
>
> ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id
> 0x00340aff sub 17aa:0827
>
> ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00140-QCARMSWPZ-1 
> api 6 features wowlan,ignore-otp,mfp crc32 29eb8ca1
>
> ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 4ac0889b
>
> ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal otp
> max-sta 32 raw 0 hwcrypto 1
>
>>> If change it to dev_warn_once, then it will have no chance to find the
>>> other wrong values which report by firmware, and it indicate
>>> a wrong value to mac80211/cfg80211 and lead "iw wlan0 station dump"
>>> get a wrong bitrate.
>>
>
> Agreed.
>
>> I agree, we should keep this warning. If the firmware still keeps
>> sending invalid rates we should add a specific check to ignore the known
>> invalid values, but not all of them.
>>
>
> Would it be helpful to adjust the default rate limits and set the to
> a higher value instead. It might be difficult to account all possible
> invalid values?
>
> Something like, ath10k_warn_ratelimited() to adjust the
>
> DEFAULT_RATELIMIT_INTERVAL and DEFAULT_RATELIMIT_BURST using
> DEFINE_RATELIMIT_STATE
>
> Let me know if you like this idea. I can send a patch in to do this.
> I will hang on to this firmware version for a little but longer, so
> we have a test case. :)

I would rather first try to fix the root cause, which is the firmware
sending invalid rates. Wen, you mentioned there's a fix in firmware. Do
you know which firmware version (and branch) has the fix?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
