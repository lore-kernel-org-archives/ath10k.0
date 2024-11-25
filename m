Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61878D58D49
	for <ath10k@archiver.kernel.org>; Mon, 25 Nov 2024 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhQpteI+JLPbTs96NH5Q2R+bV4YCuAlyZ2+sdKHomVw=; b=Y4zZANy0TYpzVL23tUC27nX3Zi
	TzLRgIVFofSnFGcDceEZckPPDb5EAhSUfSzYMbn8kqLX5TsXx7WJ5zUY4ptcwsMY24aBcv8HSio8N
	d5ftuXfZ8wgoPfcqdT5W/DeOq6+oN3BmJMvyZx96Ogxn0f/fZq+vBD6D7QBjiKgIDRpzd0xXvI98n
	2P4/u9hryOhfTLchhRkpybhpJPz8nrFLsYPzook1Kr6D3XjMTWjWzsMBw/t8jyoVkoEJ4Idec/HWn
	yTguDEBroYJXGpRzyZTXfg2eWSV0WOpdtUaYvT+rsXOIHVQdLf3EZJQazqk9vRRvqVBFlhU8gxfOJ
	rVVa+CFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZCI-000000088eM-0Hgu;
	Mon, 25 Nov 2024 13:32:15 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZCF-000000088db-40J0
	for ath10k@lists.infradead.org;
	Mon, 25 Nov 2024 13:32:13 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7b1601e853eso284299285a.2
        for <ath10k@lists.infradead.org>; Mon, 25 Nov 2024 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732541530; x=1733146330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhQpteI+JLPbTs96NH5Q2R+bV4YCuAlyZ2+sdKHomVw=;
        b=g4BcXP2egKv25ixU1cz6/RZEKqJgJvIe/VuVD6SI2TMHHqE1fTkjcY1m0tJ0BNvHJo
         WSdIf5I2i3XRu589RM2JhGyeNfHv0ThpqI8IOQMVYi30sip5N54ypXahZs9xZLR4EfVN
         gLVxiDFnlZVoUJJ0DZ++rBNWh/zO2veB7bl6tRIvx96CZU1JXrmgOHu4vW5vGhMlWLGZ
         g2pHMU/Jps0DCdIrkPXawFmXYs7lBxd0+6rgJKIfU7oHZqNdPqVaRbjGYLuxY0h2gDLv
         DxsdocCURc8X4hgfANf95mvOz/MSjCATiBJ9txI0p06SdbOsmpN4iPYducJrT1ftB2gj
         jKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541530; x=1733146330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhQpteI+JLPbTs96NH5Q2R+bV4YCuAlyZ2+sdKHomVw=;
        b=t7Hecjvtvd9gs5ziKyVUC6az7Yp0mJVg4gZGyctAkrDAYJ7U4to5y7JT3waU9ux8iS
         YppuGUo+PZhk6Sqmec//GayHopKjI84cu2fKAIUdl+5IcEFjsOM2dCKEAqa020NN3sJQ
         cos2IVGKn83xxQSDgBAuPKTuf2psIJJaFWNOOJVB+1RvUXAJfeRBUNN17HddVUuuOork
         pvV6HdVyNLoNfIGtkI+jUhciTNE2U4kZBu6gmXzgmueyUWBHp9ZfaTRxjr5E3TGJnfFQ
         nKX+g/RAXysyuQboR129Gf/hay4goTfYdzLqs6dVIJENiySvxuR1clYBXzIveUt4Dl58
         Zzzg==
X-Forwarded-Encrypted: i=1; AJvYcCWxZ0rlpFt7SaL8vRImyd0dcBABp7eXHyzChKwQKZxWBjo5s8kPslKEj/xD/bmH4zGzKLaT7z0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHM2RP9MshTy1N5QTw0LOTcVpyZRo1J1ge8iJYEGFYdSa8nL6O
	QzT9qgg67vm2Glz4jSAYCAkI/UxRqd7RF2VReUTqAp1AiV4xuFQHV5D/0w==
X-Gm-Gg: ASbGncuakBnMNaJ1/XGYyxfU1kbMd+OMkHcfIG+Z64Xzkpg5wPKKo2YWaXvRQB2hh0D
	uaKlg7fa5Abeoty6wTr1KrvY8eLlo12dS5vGR6giytyPMVqZ2uo4CTYl7zmCL/1mEmY9M13Rwm4
	lFPauucvQnFNFBJd+1X5MuToS6WGMLpvQsCoD/k2hsHloAYZDfvXHqeIusb7y9LamFX12dULqeA
	86+Ud/l7QtUFopUqKUhqeKfahtPpDxrqFYUBSnV9nt0U/9QK1M+vg==
X-Google-Smtp-Source: AGHT+IEURwGuMC4Gy8Zr5QFKX+tkbku+wwToefBd6e+40wJ70jL4HPvic9pgjmPB0UZbuDDNXbTE6g==
X-Received: by 2002:a05:620a:44cf:b0:7a9:b268:3655 with SMTP id af79cd13be357-7b5145909d5mr1812046485a.43.1732541529780;
        Mon, 25 Nov 2024 05:32:09 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6676409casm133541585a.50.2024.11.25.05.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:32:09 -0800 (PST)
Message-ID: <87c9bf22-9534-4292-bf9f-013cc710a3bc@gmail.com>
Date: Mon, 25 Nov 2024 05:32:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <54fac081-7d70-4d31-9f2a-07f5d75d675d@quicinc.com>
 <ea2e7c62-f6e9-4cba-ae81-19fc9abed8b7@gmail.com>
 <22978701-ca79-4e90-8ceb-16bdaf230e8f@quicinc.com>
 <dda85730-3f19-490e-bb0f-99b13511c062@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <dda85730-3f19-490e-bb0f-99b13511c062@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_053211_995596_CF08BD0E 
X-CRM114-Status: GOOD (  21.19  )
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

On 9/4/24 6:46 PM, Baochen Qiang wrote:
>
> On 9/5/2024 2:03 AM, Jeff Johnson wrote:
>> On 8/16/2024 5:04 AM, James Prestwood wrote:
>>> Hi Baochen,
>>>
>>> On 8/16/24 3:19 AM, Baochen Qiang wrote:
>>>> On 7/12/2024 9:11 PM, James Prestwood wrote:
>>>>> Hi,
>>>>>
>>>>> I've seen this error mentioned on random forum posts, but its always associated with a kernel crash/warning or some very obvious negative behavior. I've noticed this occasionally and at one location very frequently during FT roaming, specifically just after CMD_ASSOCIATE is issued. For our company run networks I'm not seeing any negative behavior apart from a 3 second delay in sending the re-association frame since the kernel waits for this timeout. But we have some networks our clients run on that we do not own (different vendor), and we are seeing association timeouts after this error occurs and in some cases the AP is sending a deauthentication with reason code 8 instead of replying with a reassociation reply and an error status, which is quite odd.
>>>>>
>>>>> We are chasing down this with the vendor of these APs as well, but the behavior always happens after we see this key removal failure/timeout on the client side. So it would appear there is potentially a problem on both the client and AP. My guess is _something_ about the re-association frame changes when this error is encountered, but I cannot see how that would be the case. We are working to get PCAPs now, but its through a 3rd party, so that timing is out of my control.
>>>>>
>>>>>   From the kernel code this error would appear innocuous, the old key is failing to be removed but it gets immediately replaced by the new key. And we don't see that addition failing. Am I understanding that logic correctly? I.e. this logic:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503
>>>>>
>>>>> Below are a few kernel logs of the issue happening, some with the deauth being sent by the AP, some with just timeouts:
>>>>>
>>>>> --- No deauth frame sent, just association timeouts after the error ---
>>>>>
>>>>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>>>>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>>>>> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>>>>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
>>>>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>>>>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>>>>> Jul 11 00:05:36 kernel: wlan0: authenticated
>>>>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=16)
>>>>> Jul 11 00:05:36 kernel: wlan0: associated
>>>>>
>>>>> --- Deauth frame sent amidst the association timeouts ---
>>>>>
>>>>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>>>>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>>>>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>>>>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
>>>>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>>>>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>>>>> Jul 11 00:43:24 kernel: wlan0: authenticated
>>>>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=101)
>>>>> Jul 11 00:43:24 kernel: wlan0: associated
>>>>>
>>>> Hi James, this is QCA6174, right? could you also share firmware version?
>>> Yep, using:
>>>
>>> qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1dac:0261
>>> firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp
>>> crc32 bf907c7c
>>>
>>> I did try in one instance the latest firmware, 309, and still saw the
>>> same behavior but 288 is what all our devices are running.
>>>
>>> Thanks,
>>>
>>> James
>> Baochen, are you looking more into this? Would prefer to fix the root cause
>> rather than take "[RFC 0/1] wifi: ath10k: improvement on key removal failure"
> I asked CST team to try to reproduce this issue such that we can get firmware dump for debug further. What I got is that CST team is currently busy at other critical schedules and they are planning to debug this ath10k issue after those schedules get finished.

Any movement on this front? We are still carrying that RFC patch to work 
around the associated compatibility issues with Cisco APs when this 
timeout occurs.

While I do agree the RFC patch isn't optimal, trying to get a firmware 
fix for ~6 year old hardware also may not be very easy. fwiw we've been 
running the RFC patch for about 3 months now, as of today its running on 
over 4000 client devices. So IMO the patch itself is safe if there was 
any concern.

Thanks,

James


