Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B81E77173
	for <ath10k@archiver.kernel.org>; Fri,  6 Dec 2024 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7cxDYGURsL5gkV+0SpqL58pd20ALFslfNYgsoF4uBM=; b=esZ0u9GaS7u0N0Dt7nNyffuEGB
	hVOazonfRg5ocqXANo4yMVt+aZVLV3ihTznyn5khyYpd7kXyHfyH+B6yAPngL6208vT2NzeRfZUEt
	bj3kU1JCvLY/aAqx18+/dDEgOR99i3LMzUvdHBkZ9CHRLy4iek3cuC2QnHSgLI8QGomdoa5ir/C+D
	e9B4HzCHTvsGIMyDSa6UVLtr4K+UBPlWZy35/ZgXkiqzoDiQxbC4LVc1Wt5vCTmVlxD4Z1tqvZR5+
	DYPbKYwg0iPSg8kHe2BYSN+haqJtTAc5d1JpHrZCuCWc4L62ieVF0QbOAt4YbtT+5riG8r27pRjdz
	0GX9iQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXQc-00000001Ygq-2rU3;
	Fri, 06 Dec 2024 12:27:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXQa-00000001YgH-1x5g
	for ath10k@lists.infradead.org;
	Fri, 06 Dec 2024 12:27:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-215b4681c94so16376055ad.0
        for <ath10k@lists.infradead.org>; Fri, 06 Dec 2024 04:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733488043; x=1734092843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7cxDYGURsL5gkV+0SpqL58pd20ALFslfNYgsoF4uBM=;
        b=Bg7zt2eaQelZuDEZVadi30zg6MzTDxPfXsf6q6rkf88dM0WHfbU+do5+ThNuQbgYG1
         d6U2ED8jD0MlnLM9Jl2euKwNflArynJ9Ttie/MnJ/jwQveA+7dUoBhPLGrSLFERFblUD
         K0wdo0npaPZS685JnzwCieBszZp3qzGtO3iDn+639Dbn/qkAeEZz4i8TtQ5k4G9n4X3x
         PqUZyQBhkoDRNbcMxSknW7kA4CVBTsebXFIvGXMPcdNuTlPg3wd1Ncz9A+NDMCsdy50T
         PdzmNimdYJjFJSCf9ihqHBu39Q25fRqyPVEDF0xGw/Lnf7V0UYyKR83tQQoHk1W6pwVH
         iV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733488043; x=1734092843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7cxDYGURsL5gkV+0SpqL58pd20ALFslfNYgsoF4uBM=;
        b=QOxGTsz+t5kdErllLWuXNTMFnduPE8U5d76rJF2AaZJrGpNkc1ZKk4hfufvm0tCoeh
         VlKfFl23wnEUKG+w3ohvKO4KvnHQuMASN3lVUpu/39fzhYWmZ28flTTlBH1dD3VRfrKY
         SrvhTbmKw+LCHw90ZOE7Q4e0WSpKbVua/jfU2+AmAx35ZFqCZKgKsMWMorBVZEZQXAPU
         oPDX6+UKPwYJUyB+GqCcmNQj5jroleCJXEKEqExcdRFEPfmiWZvlfPfm83zJSLBe8gC3
         VWYiwZkFEEi4yG3WRf8lFAQhzRBLXJj2Kc4rc6AmoDLdtc3yWKsXwaj8/IEVeueKJ6eA
         RdXA==
X-Forwarded-Encrypted: i=1; AJvYcCW5XJUC/AF/2Cl59Jt5IsUxp5d9cY4ft7jO6R8Zi6+FJZqz2GjSqCvMUqI0ANf+rmdDCoMM2nw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYXO9UEM5syp7Y4j14LKPiNXOEVDUFQpjZzIul+50vV9ZvmNUF
	WO4WUGTF5eA3AqSK4MHnqdZH6TFVJSWZy1CQzyqiowoob5w/sy3P
X-Gm-Gg: ASbGncvOPdoXDk+JmBiwI4S18+Yxx9CixBci2VYjVFG5gc1BAq73hT/ucJs/vUPrOzo
	RvcpTSMQBGUPwWxj2zNquKZGDin5iP4PnsCgYQ/5gY7VA5sF3oCfZnPCUIW/gdV7e1gStG+KSoA
	EPE3+oo5YDQy9ko7tr1YNrNbmf4fSevEG925ORRzAxbTDEkV+kYezKyyNxiCZ/0qhfC2bsO8Q9g
	s/OfolXUz6OG7/MwMWAdzn8ofHi1Y7RL84kA+ETGTDAkn3BSbDU6VPvdjcgLlEY81GyMaVI0M01
	MwFjlosBLAVuscOOrmGhRezqB938
X-Google-Smtp-Source: AGHT+IHwgi3jIg5cM3Gld+lrQWC8IKCrJk7nBa4AWQoviVQ28seWu7ZgnDFsMF6uuPvBU1PWa2gvnw==
X-Received: by 2002:a17:903:230e:b0:215:aee1:7e3e with SMTP id d9443c01a7336-21614d19681mr42519275ad.5.1733488043015;
        Fri, 06 Dec 2024 04:27:23 -0800 (PST)
Received: from [192.168.1.164] (h69-130-12-20.bendor.broadband.dynamic.tds.net. [69.130.12.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3fd47sm27705445ad.39.2024.12.06.04.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 04:27:22 -0800 (PST)
Message-ID: <d5587bb4-4622-4ba2-bb4d-71a21e237021@gmail.com>
Date: Fri, 6 Dec 2024 04:27:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <54fac081-7d70-4d31-9f2a-07f5d75d675d@quicinc.com>
 <ea2e7c62-f6e9-4cba-ae81-19fc9abed8b7@gmail.com>
 <22978701-ca79-4e90-8ceb-16bdaf230e8f@quicinc.com>
 <dda85730-3f19-490e-bb0f-99b13511c062@quicinc.com>
 <54f29515-047d-483d-8d9f-a0315a71ad7a@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <54f29515-047d-483d-8d9f-a0315a71ad7a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_042724_506061_7012E7C6 
X-CRM114-Status: GOOD (  19.12  )
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

On 12/5/24 6:47 PM, Baochen Qiang wrote:
>
> On 9/5/2024 9:46 AM, Baochen Qiang wrote:
>>
>> On 9/5/2024 2:03 AM, Jeff Johnson wrote:
>>> On 8/16/2024 5:04 AM, James Prestwood wrote:
>>>> Hi Baochen,
>>>>
>>>> On 8/16/24 3:19 AM, Baochen Qiang wrote:
>>>>> On 7/12/2024 9:11 PM, James Prestwood wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I've seen this error mentioned on random forum posts, but its always associated with a kernel crash/warning or some very obvious negative behavior. I've noticed this occasionally and at one location very frequently during FT roaming, specifically just after CMD_ASSOCIATE is issued. For our company run networks I'm not seeing any negative behavior apart from a 3 second delay in sending the re-association frame since the kernel waits for this timeout. But we have some networks our clients run on that we do not own (different vendor), and we are seeing association timeouts after this error occurs and in some cases the AP is sending a deauthentication with reason code 8 instead of replying with a reassociation reply and an error status, which is quite odd.
>>>>>>
>>>>>> We are chasing down this with the vendor of these APs as well, but the behavior always happens after we see this key removal failure/timeout on the client side. So it would appear there is potentially a problem on both the client and AP. My guess is _something_ about the re-association frame changes when this error is encountered, but I cannot see how that would be the case. We are working to get PCAPs now, but its through a 3rd party, so that timing is out of my control.
>>>>>>
>>>>>>   From the kernel code this error would appear innocuous, the old key is failing to be removed but it gets immediately replaced by the new key. And we don't see that addition failing. Am I understanding that logic correctly? I.e. this logic:
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/key.c#n503
>>>>>>
>>>>>> Below are a few kernel logs of the issue happening, some with the deauth being sent by the AP, some with just timeouts:
>>>>>>
>>>>>> --- No deauth frame sent, just association timeouts after the error ---
>>>>>>
>>>>>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>>>>>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>>>>>> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>>>>>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
>>>>>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>>>>>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>>>>>> Jul 11 00:05:36 kernel: wlan0: authenticated
>>>>>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=16)
>>>>>> Jul 11 00:05:36 kernel: wlan0: associated
>>>>>>
>>>>>> --- Deauth frame sent amidst the association timeouts ---
>>>>>>
>>>>>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to <new BSS>
>>>>>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0 peer <previous BSS>: -110
>>>>>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous BSS>) from hardware (-110)
>>>>>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while associating (Reason: 8=DISASSOC_STA_HAS_LEFT)
>>>>>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>>>>>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>>>>>> Jul 11 00:43:24 kernel: wlan0: authenticated
>>>>>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0 aid=101)
>>>>>> Jul 11 00:43:24 kernel: wlan0: associated
>>>>>>
>>>>> Hi James, this is QCA6174, right? could you also share firmware version?
>>>> Yep, using:
>>>>
>>>> qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1dac:0261
>>>> firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp
>>>> crc32 bf907c7c
>>>>
>>>> I did try in one instance the latest firmware, 309, and still saw the
>>>> same behavior but 288 is what all our devices are running.
>>>>
>>>> Thanks,
>>>>
>>>> James
>>> Baochen, are you looking more into this? Would prefer to fix the root cause
>>> rather than take "[RFC 0/1] wifi: ath10k: improvement on key removal failure"
>> I asked CST team to try to reproduce this issue such that we can get firmware dump for debug further. What I got is that CST team is currently busy at other critical schedules and they are planning to debug this ath10k issue after those schedules get finished.
>>
> Jeff, I am notified that CST team can not reproduce this issue.

Thanks for reaching out to them at least. Maybe the firmware team can 
provide some info about how long it _should_ take to remove a key and we 
can make the timeout reflect that?

Thanks,

James



