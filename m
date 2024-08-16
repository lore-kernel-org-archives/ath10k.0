Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C8AC3DA4A
	for <ath10k@archiver.kernel.org>; Fri, 16 Aug 2024 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAGCjXrxKhbef6CK8M/Tk8DVVHCkXA7g8LfrMUTUsek=; b=e0e31MP++XS8K2XM1jLHh8rpY6
	WE3VLuK8a+vNiM6f8HXJSoO2fWHqvIp7JJabaK+WPr7YTvpV6T7Zyr96FxBDXkrGNN9V+IlBO3nkZ
	RO7cQkEfs8wY9eCWq0egBo5Up+4lICAhUTkgHq6vh6RUgnmIpgPfReBZFWNGu4RxNJZkJIaCVzjVu
	qEWoaLYjUh+LC/47GvPm1znPvMpQxCqLK9TjS1kOJSskcm+AebCKCYnFHmGnOrElXizBr4fKWZFbf
	aJY2PUqRH2Q7FgYYyykJk/tKU8CJljBgUVkmzReHtxPwUedIoGuq255oEkcovz0JDR5wnd2u6b0SN
	aY0/Njxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevhV-0000000CpUJ-3NdB;
	Fri, 16 Aug 2024 12:05:01 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevhS-0000000CpTc-1ufA
	for ath10k@lists.infradead.org;
	Fri, 16 Aug 2024 12:05:00 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-70949118d26so1453563a34.0
        for <ath10k@lists.infradead.org>; Fri, 16 Aug 2024 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723809897; x=1724414697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAGCjXrxKhbef6CK8M/Tk8DVVHCkXA7g8LfrMUTUsek=;
        b=AX+m9cYmI5T7pO3jv0lSJfetoAVYrNnEktux0shvfokr3AWikeFyesaVgD0JBRxOGB
         /OvQhkgmFZA3jQx8oF7nhTlHV7ZnigJf8JGMEjYu90uMHT2rjqfWVu5o9Csev1b91XOE
         wGty8wQi/0TM0mnsNToWpSYJ12xAitcd9Vf/RDNGeApJ9C/+APv1AaPljFzG7741a/o2
         WI/bFbxVKSA6msW3xklEbRnPkNRqNG5LEiU6j0cncgsZKJNOZuZIlejuscahtS2Hql/j
         aEybnboMEzuAt2cO7Xm7Jlz/32ioBkXgEXp/AqU1Dvioz74Zw/nM17IemuM8ILCUdIUv
         W2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723809897; x=1724414697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAGCjXrxKhbef6CK8M/Tk8DVVHCkXA7g8LfrMUTUsek=;
        b=i+83Clxn64nnEtFd1970P4skFD2eAiHkly6gQFhba4aMbA5fBZZ/O6DGCCMZl/GiP8
         qJWq/spa8pCJhQEZEj1ld0i+VrQPwYwYtFEgdDmfsoqEjGHm6Qx4EU/3ozL4WpmM3OnB
         UWanMz3tQLmfWmhTkjcSwBoDjENd8DxpJmw3HkR2IcLeXc9x2AGcjF1VKCh4A672rlfa
         ZheX9nQBRkgBg0jm2AiTz4CWxw+RQdlagmSSoxM7GxCO8VXjmo8YMLEmMVQbb2MAc+KX
         n2B80BPkCjnnYP2tlGAxNlYp7ulFB9Rz/vUwlIKeSxZxMszQ25zuyjZtPVrUQGuyG387
         H7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOvUo/n6F6/epVL/ZmD9S+a8RASfCHIuvRPc4N7lkenrrlUED0yizFAXtpMWUfoJdRa80EeFrY6jaUbF+a5zE9+gJdIfUQcpp8vg==
X-Gm-Message-State: AOJu0Yz9K6HJceNdHd3RJeMlExjApYdTMC2gzUfAPOsFw/quXYAWMUr4
	vO5Spae7OFhnV9w3oweSQKJni65zE5se3YzVvksfR/PR8W1nfPjX
X-Google-Smtp-Source: AGHT+IHhh8P1PbO/OvVABQjxu4tqdd+RBPI10sxBvOVgamQfTXG9ys/lB6tA3b0mEI2uyOdBSN/t7Q==
X-Received: by 2002:a05:6830:6f42:b0:709:4065:63e6 with SMTP id 46e09a7af769-70cac850081mr2881650a34.12.1723809896624;
        Fri, 16 Aug 2024 05:04:56 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fd9e39sm15676331cf.2.2024.08.16.05.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 05:04:56 -0700 (PDT)
Message-ID: <ea2e7c62-f6e9-4cba-ae81-19fc9abed8b7@gmail.com>
Date: Fri, 16 Aug 2024 05:04:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <54fac081-7d70-4d31-9f2a-07f5d75d675d@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <54fac081-7d70-4d31-9f2a-07f5d75d675d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_050458_522689_1B70714C 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Baochen,

On 8/16/24 3:19 AM, Baochen Qiang wrote:
>
> On 7/12/2024 9:11 PM, James Prestwood wrote:
>> Hi,
>>
>> I've seen this error mentioned on random forum posts, but its always associated with a kernel crash/warning or some very obvious negative behavior. I've noticed this occasionally and at one location very frequently during FT roaming, specifically just after CMD_ASSOCIATE is issued. For our company run networks I'm not seeing any negative behavior apart from a 3 second delay in sending the re-association frame since the kernel waits for this timeout. But we have some networks our clients run on that we do not own (different vendor), and we are seeing association timeouts after this error occurs and in some cases the AP is sending a deauthentication with reason code 8 instead of replying with a reassociation reply and an error status, which is quite odd.
>>
>> We are chasing down this with the vendor of these APs as well, but the behavior always happens after we see this key removal failure/timeout on the client side. So it would appear there is potentially a problem on both the client and AP. My guess is _something_ about the re-association frame changes when this error is encountered, but I cannot see how that would be the case. We are working to get PCAPs now, but its through a 3rd party, so that timing is out of my control.
>>
>>  From the kernel code this error would appear innocuous, the old key is failing to be removed but it gets immediately replaced by the new key. And we don't see that addition failing. Am I understanding that logic correctly? I.e. this logic:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503
>>
>> Below are a few kernel logs of the issue happening, some with the deauth being sent by the AP, some with just timeouts:
>>
>> --- No deauth frame sent, just association timeouts after the error ---
>>
>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>> Jul 11 00:05:36 kernel: wlan0: authenticated
>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=16)
>> Jul 11 00:05:36 kernel: wlan0: associated
>>
>> --- Deauth frame sent amidst the association timeouts ---
>>
>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>> Jul 11 00:43:24 kernel: wlan0: authenticated
>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=101)
>> Jul 11 00:43:24 kernel: wlan0: associated
>>
> Hi James, this is QCA6174, right? could you also share firmware version?

Yep, using:

qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1dac:0261
firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp 
crc32 bf907c7c

I did try in one instance the latest firmware, 309, and still saw the 
same behavior but 288 is what all our devices are running.

Thanks,

James


