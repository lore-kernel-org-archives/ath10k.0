Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9718BCEACD6
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBzw9/79/QPfcWGFG2BWQFjy8N10Vm14Ce5F2O5dqjE=; b=mylkfPrvz+j+ppMJU5MkKvW4e7
	hSzkcnjW94cKnTx2jVe5zQNjI2zXVKegR4e9k2e4ujGjvggKVJsRBDqy2XFriTgE4lnPNWur79HbD
	YvaesJLzC+Y6yzEESavcUE3Hm5yoG8HhH4r8ge82rh86YAg1AR0UP+jWxPnsn+5yufDNkaa+ROg4y
	8KYHLIGPK3hovrX40Ojk+/mJ2MlURgerNNObPbYDQ0DCvlcOqwgWKGVcd4+ugcfkhDCS9UuC6WFqb
	86QbM+r3kKAger6yJ72eIzwxX75GaMou7A041yv34+OJYO9cu9+AJANmHCVeVY4nBapQKcflv4Zjc
	ZflfCWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1iZ-0000000D9NA-0GLR;
	Fri, 14 Nov 2025 21:52:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1iW-0000000D9Ml-3a5s
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 21:52:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-297dd95ffe4so21410495ad.3
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 13:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763157148; x=1763761948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBzw9/79/QPfcWGFG2BWQFjy8N10Vm14Ce5F2O5dqjE=;
        b=W3dhnuYKSw/9WgJerHJbDCCQ9lruC1s5aBuhmFTLPCaC/w7ZT/aBTzmmr7o8xS0QIt
         2n5tbxmLVJkt6Qyhn3+g1kzMguXCmajbJ5aqYFmsLyTYaQbbknvoOfXh6+2FLSiBLI3h
         hDTMJ4UZ1x2kr6rulm/4huwwU++zs+sVSA9HgwlJiE/KNv/iD1c/N0aqE78hesLzi7jA
         YJhmDBX4Ug+FhrKGw/Kq0kVa7ydpchtvMhfEXe9bcaqG/BeBDR/Dfxer5Xd2Mq1WGMJh
         azgs3mZuR5t0IcXHOdraAYXn+tdcEHiG/2I2ka6Xs2IJ2zGHqjvk6g2TgPdw9tWO2sv1
         GUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763157148; x=1763761948;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBzw9/79/QPfcWGFG2BWQFjy8N10Vm14Ce5F2O5dqjE=;
        b=cXbo9oAlwJAAVx1TwQJBNy7EVlJ0roXhBt+AejiCYbBFlYplHY1Fg1Yl7Hd2EHdpvu
         AsbEaj18KG/FwSVRAxCBOfWTPBtVbIQsdN8JVdco1ynwO3GT4BSJ2vhlPrryaZe17akK
         IpBBkYbbbtIIS28OQIGbi+VoNXUkziNqO6tmYKpLIdr/JwA2y88JC1sBGEsJBhTsOG9w
         9E2+LIHKHSzS5uz3MseBo2CvE/UD7tk89nGZWgiW0XdjftVw69OldID0PYMx8zVTpvAu
         S5s3AHe/Yw84/pHa3Dk8kDfgo8RgjIwYO76W7xR3ERxvY8bKc1X3kw/QxO6vnWL/J9B3
         qZnw==
X-Forwarded-Encrypted: i=1; AJvYcCW8OXA2Hj124NjI+EEjYTLfOCTVmFDHe+dYfyqnpmAGftr/q+PUbR8dH49Aq28XNlHBXEIUM30=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCtF6rTMXfENPHyA+0DkimkH1SirVoqlBnXFb5VAE78wWFxl2F
	lzjmiE/YqRMGQbbC07oKXhvem8rHoPDI/nLoh3LzVpWm04Dv168nmBSX
X-Gm-Gg: ASbGncvK0lFNxzHjFoXUPPuvbnr/fEbzSc75SUj7D4mqFWUODZ36hI8r9bEqgnIDoDO
	WLrHEIwEt2VqHMRdWTrVxV4pjZF/rLKa0RStcM0eaTy9LwV/EMIO8PoHimbSMl4GyLS/fbImOyw
	vgxh3PvpwNAM7zt5Y4DIEdYaQVZv2iKSqW7So1KxfHOOHm8cUrWkp9hIbN9VGV3nIfkdHUcGfJN
	Crc+vIWghMb1TwUodPvrzx84pjoIE8q+3VVyLOhc6f/YXFQavrF+zNqW63yo4mBsLsegKjnVtkG
	L+r7gS+1EfmAovg2bUL+7VBmrDITSizXjyTo5Gbm4NGTlP8nI+AR0MZqi1XD3s1N1DXd77MiII1
	64Ylf4xGDlybql/AJh2o5Z8eGm2x5aKZNiysVYIE+Vudf7wTKRLGB3iVbKtVA3fHoaCGhxOzOsm
	fbWDok7B8h4xY1aQRLl2cBBVyC
X-Google-Smtp-Source: AGHT+IFzG5G8loVPrt2m99Vf9liH4+Os353C7jesl5WB/ulucNS7A9E/E7KQAAQHqOfMxC4w0C9YHg==
X-Received: by 2002:a17:90b:17cc:b0:33b:bf8d:6172 with SMTP id 98e67ed59e1d1-343fa74be0amr4908759a91.34.1763157146855;
        Fri, 14 Nov 2025 13:52:26 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516cf89sm1487932a91.10.2025.11.14.13.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:52:26 -0800 (PST)
Message-ID: <b2838a23-ea30-4dee-b513-f5471d486af2@gmail.com>
Date: Fri, 14 Nov 2025 13:52:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
From: James Prestwood <prestwoj@gmail.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <54fac081-7d70-4d31-9f2a-07f5d75d675d@quicinc.com>
 <ea2e7c62-f6e9-4cba-ae81-19fc9abed8b7@gmail.com>
 <22978701-ca79-4e90-8ceb-16bdaf230e8f@quicinc.com>
 <dda85730-3f19-490e-bb0f-99b13511c062@quicinc.com>
 <54f29515-047d-483d-8d9f-a0315a71ad7a@quicinc.com>
 <d5587bb4-4622-4ba2-bb4d-71a21e237021@gmail.com>
 <0e474fe5-cebc-487e-8884-ba505d83711a@quicinc.com>
 <69232460-cd7b-4723-9ed4-b4473a7c5d90@gmail.com>
Content-Language: en-US
In-Reply-To: <69232460-cd7b-4723-9ed4-b4473a7c5d90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_135228_926815_830D1BFF 
X-CRM114-Status: GOOD (  29.26  )
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


On 12/9/24 4:37 AM, James Prestwood wrote:
>
> On 12/8/24 10:48 PM, Baochen Qiang wrote:
>>
>> On 12/6/2024 8:27 PM, James Prestwood wrote:
>>> Hi Baochen,
>>>
>>> On 12/5/24 6:47 PM, Baochen Qiang wrote:
>>>> On 9/5/2024 9:46 AM, Baochen Qiang wrote:
>>>>> On 9/5/2024 2:03 AM, Jeff Johnson wrote:
>>>>>> On 8/16/2024 5:04 AM, James Prestwood wrote:
>>>>>>> Hi Baochen,
>>>>>>>
>>>>>>> On 8/16/24 3:19 AM, Baochen Qiang wrote:
>>>>>>>> On 7/12/2024 9:11 PM, James Prestwood wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> I've seen this error mentioned on random forum posts, but its 
>>>>>>>>> always associated
>>>>>>>>> with a kernel crash/warning or some very obvious negative 
>>>>>>>>> behavior. I've noticed
>>>>>>>>> this occasionally and at one location very frequently during 
>>>>>>>>> FT roaming,
>>>>>>>>> specifically just after CMD_ASSOCIATE is issued. For our 
>>>>>>>>> company run networks I'm
>>>>>>>>> not seeing any negative behavior apart from a 3 second delay 
>>>>>>>>> in sending the re-
>>>>>>>>> association frame since the kernel waits for this timeout. But 
>>>>>>>>> we have some
>>>>>>>>> networks our clients run on that we do not own (different 
>>>>>>>>> vendor), and we are
>>>>>>>>> seeing association timeouts after this error occurs and in 
>>>>>>>>> some cases the AP is
>>>>>>>>> sending a deauthentication with reason code 8 instead of 
>>>>>>>>> replying with a
>>>>>>>>> reassociation reply and an error status, which is quite odd.
>>>>>>>>>
>>>>>>>>> We are chasing down this with the vendor of these APs as well, 
>>>>>>>>> but the behavior
>>>>>>>>> always happens after we see this key removal failure/timeout 
>>>>>>>>> on the client side. So
>>>>>>>>> it would appear there is potentially a problem on both the 
>>>>>>>>> client and AP. My guess
>>>>>>>>> is _something_ about the re-association frame changes when 
>>>>>>>>> this error is
>>>>>>>>> encountered, but I cannot see how that would be the case. We 
>>>>>>>>> are working to get
>>>>>>>>> PCAPs now, but its through a 3rd party, so that timing is out 
>>>>>>>>> of my control.
>>>>>>>>>
>>>>>>>>>    From the kernel code this error would appear innocuous, the 
>>>>>>>>> old key is failing to
>>>>>>>>> be removed but it gets immediately replaced by the new key. 
>>>>>>>>> And we don't see that
>>>>>>>>> addition failing. Am I understanding that logic correctly? 
>>>>>>>>> I.e. this logic:
>>>>>>>>>
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ 
>>>>>>>>>
>>>>>>>>> mac80211/key.c#n503
>>>>>>>>>
>>>>>>>>> Below are a few kernel logs of the issue happening, some with 
>>>>>>>>> the deauth being sent
>>>>>>>>> by the AP, some with just timeouts:
>>>>>>>>>
>>>>>>>>> --- No deauth frame sent, just association timeouts after the 
>>>>>>>>> error ---
>>>>>>>>>
>>>>>>>>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous 
>>>>>>>>> BSS> for new assoc to
>>>>>>>>> <new BSS>
>>>>>>>>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to 
>>>>>>>>> install key for vdev 0
>>>>>>>>> peer <previous BSS>: -110
>>>>>>>>> Jul 11 00:05:33 kernel: wlan0: failed to remove key 
>>>>>>>>> (0, <previous BSS>) from
>>>>>>>>> hardware (-110)
>>>>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>>>>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>>>>>>>>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> 
>>>>>>>>> timed out
>>>>>>>>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>>>>>>>>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>>>>>>>>> Jul 11 00:05:36 kernel: wlan0: authenticated
>>>>>>>>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> 
>>>>>>>>> (capab=0x1111 status=0
>>>>>>>>> aid=16)
>>>>>>>>> Jul 11 00:05:36 kernel: wlan0: associated
>>>>>>>>>
>>>>>>>>> --- Deauth frame sent amidst the association timeouts ---
>>>>>>>>>
>>>>>>>>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous 
>>>>>>>>> BSS> for new assoc to
>>>>>>>>> <new BSS>
>>>>>>>>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to 
>>>>>>>>> install key for vdev 0
>>>>>>>>> peer <previous BSS>: -110
>>>>>>>>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, 
>>>>>>>>> <previous BSS>) from
>>>>>>>>> hardware (-110)
>>>>>>>>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> 
>>>>>>>>> while associating
>>>>>>>>> (Reason: 8=DISASSOC_STA_HAS_LEFT)
>>>>>>>>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>>>>>>>>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>>>>>>>>> Jul 11 00:43:24 kernel: wlan0: authenticated
>>>>>>>>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> 
>>>>>>>>> (capab=0x1111 status=0
>>>>>>>>> aid=101)
>>>>>>>>> Jul 11 00:43:24 kernel: wlan0: associated
>>>>>>>>>
>>>>>>>> Hi James, this is QCA6174, right? could you also share firmware 
>>>>>>>> version?
>>>>>>> Yep, using:
>>>>>>>
>>>>>>> qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1dac:0261
>>>>>>> firmware ver WLAN.RM.4.4.1-00288- api 6 features 
>>>>>>> wowlan,ignore-otp,mfp
>>>>>>> crc32 bf907c7c
>>>>>>>
>>>>>>> I did try in one instance the latest firmware, 309, and still 
>>>>>>> saw the
>>>>>>> same behavior but 288 is what all our devices are running.
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> James
>>>>>> Baochen, are you looking more into this? Would prefer to fix the 
>>>>>> root cause
>>>>>> rather than take "[RFC 0/1] wifi: ath10k: improvement on key 
>>>>>> removal failure"
>>>>> I asked CST team to try to reproduce this issue such that we can 
>>>>> get firmware dump for
>>>>> debug further. What I got is that CST team is currently busy at 
>>>>> other critical
>>>>> schedules and they are planning to debug this ath10k issue after 
>>>>> those schedules get
>>>>> finished.
>>>>>
>>>> Jeff, I am notified that CST team can not reproduce this issue.
>>> Thanks for reaching out to them at least. Maybe the firmware team 
>>> can provide some info
>>> about how long it _should_ take to remove a key and we can make the 
>>> timeout reflect that?
>> are you implying that the failure is due to a not-long-enough wait in 
>> host driver? or you
>> want to know the maximum time firmware needs in removing key, and if 
>> it is less than 3s we
>> can reduce current timeout to WAR the issue you hit?
> No I'm not implying the wait isn't long enough. I would like to know 
> the maximum time the firmware should take normally and only wait that 
> amount of time, which would fix the issues we see with Cisco APs.
>>
>>> Thanks,
>>>
>>> James
>>>
>>>
Attempting to revive this thread again with additional information. 
After initially discovering this I have been carrying a patch which 
lowers the timeout to 1 second instead of 3. Though undesirable (since 
it delays roams by 1 second) it did work around the issue with Cisco 
APs. Unfortunately we now see the same issue with another vendor, 
"Extreme Networks", despite the delay being only 1 second.

I can't remember if it was mentioned but we do not see this failure with 
other AP vendors like Meraki or Aruba, and even some clients that use 
Cisco don't experience it. But it appears to happen more (sometimes 90%+ 
of the time) with certain AP vendors. I cannot begin to imagine how the 
AP would have any effect on the driver/firmware's ability to remove a 
key locally, but here we are.

Currently I'm thinking I have 2 options:

   - Further reduce the wait, but given the failure happens so 
consistently the roaming time will be at minimum whatever I set the 
timeout to.

   - Remove the wait entirely for DISABLE_KEY. I have no idea if this is 
safe/recommenced but given the failure isn't handled (only an error log) 
it feels like I could remove it.

Thanks,

James


