Return-Path: <SRS0=izlz=HM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913A8C433DB
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 08:29:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1536D64E25
	for <ath10k@archiver.kernel.org>; Wed, 10 Feb 2021 08:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1536D64E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=++bJ0R7hXn59yoZtRfE5AeShg1yIwzBNvr0mObyqzQM=; b=y+9K2U8GwZdKm/0BagR+LCZ4s
	lId69wJP8qyBaYE6D487gYRKYkt/7hcZ9C7Ph5l88tbC1bIav4GURPJlzHYdv/Tz54s781wzd4NLm
	3Ut1dwyQbO7vTULT5Pc+IxBFYzrKoPj5S79q3yiNBBClYWf4aw+Sx5ziPAJhZm4+TEHEs4iD8v/79
	uQLpDy0BkMumcKJG7h81eVlxzq7qWzIKjITHPhuLPTLfyxg8mreYVZNS5wK6qHCcs5t9T/r5Kz+LL
	fPknCZdYUsbWZdEjMH7vfbXudKIj8vPupyLczC+bbEGggtqxBrZnoLop+U0uOKZmqkh+pOlD4iloa
	r/WR7O12Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9krx-0005S2-NH; Wed, 10 Feb 2021 08:29:05 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9krt-0005RO-SP
 for ath10k@lists.infradead.org; Wed, 10 Feb 2021 08:29:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612945743; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=BQcw0kZHs0UzLmmDYGY+jo88rGm4rVQUuEYLarQue+s=;
 b=dFvDr8j1k7WbgcFCiSEOVJMjt6pQ3A88M+bc1B3/kdw9BtXfL4PUeXbg3TDmqlD5Oi2zYsr0
 hZuyNtS46dGiNF6vEz4zmMdHzhLK7dndCb3EsRzmTUtmOZV6eJ25Ao3yJA3ic3eC/l2gkP8X
 lPFSolu+Q7hL5ZY/2xFl5BLfCjU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60239943e3df861f4b33d519 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:28:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54141C43463; Wed, 10 Feb 2021 08:28:50 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CADDC43461;
 Wed, 10 Feb 2021 08:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5CADDC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
 <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
Date: Wed, 10 Feb 2021 10:28:45 +0200
In-Reply-To: <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org> (Wen Gong's
 message of "Wed, 10 Feb 2021 10:36:23 +0800")
Message-ID: <87h7mktjgi.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_032903_260051_B35259AB 
X-CRM114-Status: GOOD (  20.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2021-02-10 08:42, Shuah Khan wrote:
>> ath10k_mac_get_rate_flags_ht() floods dmesg with the following
>> messages,
>> when it fails to find a match for mcs=7 and rate=1440.
>>
>> supported_ht_mcs_rate_nss2:
>> {7,  {1300, 2700, 1444, 3000} }
>>
>> ath10k_pci 0000:02:00.0: invalid ht params rate 1440 100kbps nss 2
>> mcs 7
>>
>> dev_warn_ratelimited() isn't helping the noise. Use dev_warn_once()
>> instead.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index 3545ce7dce0a..276321f0cfdd 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -8970,8 +8970,9 @@ static void ath10k_mac_get_rate_flags_ht(struct
>> ath10k *ar, u32 rate, u8 nss, u8
>>  		*bw |= RATE_INFO_BW_40;
>>  		*flags |= RATE_INFO_FLAGS_SHORT_GI;
>>  	} else {
>> -		ath10k_warn(ar, "invalid ht params rate %d 100kbps nss %d mcs %d",
>> -			    rate, nss, mcs);
>> +		dev_warn_once(ar->dev,
>> +			      "invalid ht params rate %d 100kbps nss %d mcs %d",
>> +			      rate, nss, mcs);
>>  	}
>>  }
>
> The {7,  {1300, 2700, 1444, 3000} } is a correct value.
> The 1440 is report from firmware, its a wrong value, it has fixed in
> firmware.

In what version?

> If change it to dev_warn_once, then it will have no chance to find the
> other wrong values which report by firmware, and it indicate
> a wrong value to mac80211/cfg80211 and lead "iw wlan0 station dump"
> get a wrong bitrate.

I agree, we should keep this warning. If the firmware still keeps
sending invalid rates we should add a specific check to ignore the known
invalid values, but not all of them.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
