Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC5EE7717D
	for <ath10k@archiver.kernel.org>; Mon,  9 Dec 2024 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIkHrI16OePy61C9ceQR9I8sAvVv6yBqJfVrm74icI0=; b=eiDSxehRKyLN6KNMwTlRE7oJIR
	qmWlYvdeF/nErgQL8fHkxiUzCrX5Ap+aEFm17Tz4wWmIN3dVtUaoVJy2FjlANOXxVHVyfajuXDNmK
	aXOVKjmTur9TW4dHHKO6u/O/6JqwyoZsl5SF0J96V0D4IwNYqlrPkWg9AAua8qnPOOf4aFyJRLVgn
	807esCeGqYZED4Om3vXB0o8pBH534sIsMRxPQqUiIMV0pvtELgM2fkhVEX9Sfs/6TRjzu4hmzDVdS
	UNFm0IjcKck2Y4odixihWH0q2fOGHO82EnTq/eb3SQoExXHvKNuSEwUtYDETpq3hc0Td5UXBoH6yc
	eiF18iIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdOB-00000007qHy-1JdE;
	Mon, 09 Dec 2024 13:01:27 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd1G-00000007jh9-3ND2
	for ath10k@lists.infradead.org;
	Mon, 09 Dec 2024 12:37:48 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d88282980bso40822176d6.3
        for <ath10k@lists.infradead.org>; Mon, 09 Dec 2024 04:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733747865; x=1734352665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIkHrI16OePy61C9ceQR9I8sAvVv6yBqJfVrm74icI0=;
        b=lD2vSujposijrIaZySFy/76PDMVVQBUig4Y/bY//r8hBe6JvWA5muCZZO1pnkmWKtV
         B8PwSy/zopOpQfXJJU3siCempfCHkyXAm/RfsPG0cfGNqdHIlawzRElUdMUdKPsrT7pk
         YzLupV2AbcUooGUHDWczyX40PC7NJlO+VjuRZcb6oKAinc1TQzVNAUPyXNTnWLMYn6SS
         qSVeEzl9g5ST9JUeMrbd7l6fV+RH+KprwKlDgAPqa825l9FyTldO3w7lezDXoujggQXU
         m4h9zcYP6O6w5S8MXSFDlj3Y7378MITMG4LdqOkt/eurrRId6/ifLfsOqQwGU/0O8YGr
         2/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747865; x=1734352665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIkHrI16OePy61C9ceQR9I8sAvVv6yBqJfVrm74icI0=;
        b=NABdGz4RMFMk0oA1TirdyXbx7BjzYplraXMCwsCGNAFe53sDVlLzy2M8cAcoTVNLxC
         1YjBhRigR/3g23YKM4ZUYf0PqSEZMV15Hp3OOvvpkh8Qb63VBCO1buJkb9BC69zzCMVI
         OX9NrUnBqB7cgvDVSxt4QSAj8qtQ5efwUwaVXz44o7bPriWDkOwnPfPeqgjok15r7LvK
         NwbQV/0iMf345N0Fo+rJapwWEC4OtsrkiIn/AOH86TKLIOgOmFs1BQ+Mb5LUtE6wl+u/
         CHAA1nHp5MP/bg4LT1zbGakSOpU8nwPmTpHED+JCZ1+Z2yc95mc3CF2/H7FtFXCT/cW8
         Zvfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgnnQ/ymsG/f5eLaddE6pLWkg8ULko9AlawPENUYWs+KNjHFcpX0DnOtmS132Y46i1ht325zo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEPICilxDuxyACQ16qlLYhonOws9DeTt3w7sYLhNJSeMHdOdbG
	N1AnA9pXrd6fszTEMcBmDoyC/RBTbqZm1CszP4OCr5gVRsDTgUyZL8zsUA==
X-Gm-Gg: ASbGncv/z+N03Ch0HGtSr1pbmBujt2eRci/GLqrvD0th4iDATA7i+0humnqf5nPGoSX
	EWHa2IOd+yYnBqqGo3FNMNC6U9u2wDSmiqaoYgeQ+ECHA0oHB+faWQFrxi6xeAGl/ewcNVXrx3F
	DZ9I/QJsIVI0Tdb6/mSHqc3zcSp8+wmH85rVxeagzL9vSQ5y1pqQ6MTkBVCgsJYM+/5lRKJbC1x
	tlabNLBnuCcjI6cnLk0QDT1NKJpo4IHM45roz3ZiPWjaG46bR01mA==
X-Google-Smtp-Source: AGHT+IHCd1tZ8eBTeaXau57tRGRkOjOUigSV7QVgEliVOB2FeKxGji7kvcMAiUD0Vt4thAfD9dnehg==
X-Received: by 2002:ad4:5ae9:0:b0:6d8:9b7b:14b8 with SMTP id 6a1803df08f44-6d91e2d2c9bmr5921426d6.3.1733747865010;
        Mon, 09 Dec 2024 04:37:45 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fded9sm48430976d6.76.2024.12.09.04.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:37:44 -0800 (PST)
Message-ID: <69232460-cd7b-4723-9ed4-b4473a7c5d90@gmail.com>
Date: Mon, 9 Dec 2024 04:37:42 -0800
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
 <d5587bb4-4622-4ba2-bb4d-71a21e237021@gmail.com>
 <0e474fe5-cebc-487e-8884-ba505d83711a@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <0e474fe5-cebc-487e-8884-ba505d83711a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043746_842777_1A186AE8 
X-CRM114-Status: GOOD (  22.18  )
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


On 12/8/24 10:48 PM, Baochen Qiang wrote:
>
> On 12/6/2024 8:27 PM, James Prestwood wrote:
>> Hi Baochen,
>>
>> On 12/5/24 6:47 PM, Baochen Qiang wrote:
>>> On 9/5/2024 9:46 AM, Baochen Qiang wrote:
>>>> On 9/5/2024 2:03 AM, Jeff Johnson wrote:
>>>>> On 8/16/2024 5:04 AM, James Prestwood wrote:
>>>>>> Hi Baochen,
>>>>>>
>>>>>> On 8/16/24 3:19 AM, Baochen Qiang wrote:
>>>>>>> On 7/12/2024 9:11 PM, James Prestwood wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I've seen this error mentioned on random forum posts, but its always associated
>>>>>>>> with a kernel crash/warning or some very obvious negative behavior. I've noticed
>>>>>>>> this occasionally and at one location very frequently during FT roaming,
>>>>>>>> specifically just after CMD_ASSOCIATE is issued. For our company run networks I'm
>>>>>>>> not seeing any negative behavior apart from a 3 second delay in sending the re-
>>>>>>>> association frame since the kernel waits for this timeout. But we have some
>>>>>>>> networks our clients run on that we do not own (different vendor), and we are
>>>>>>>> seeing association timeouts after this error occurs and in some cases the AP is
>>>>>>>> sending a deauthentication with reason code 8 instead of replying with a
>>>>>>>> reassociation reply and an error status, which is quite odd.
>>>>>>>>
>>>>>>>> We are chasing down this with the vendor of these APs as well, but the behavior
>>>>>>>> always happens after we see this key removal failure/timeout on the client side. So
>>>>>>>> it would appear there is potentially a problem on both the client and AP. My guess
>>>>>>>> is _something_ about the re-association frame changes when this error is
>>>>>>>> encountered, but I cannot see how that would be the case. We are working to get
>>>>>>>> PCAPs now, but its through a 3rd party, so that timing is out of my control.
>>>>>>>>
>>>>>>>>    From the kernel code this error would appear innocuous, the old key is failing to
>>>>>>>> be removed but it gets immediately replaced by the new key. And we don't see that
>>>>>>>> addition failing. Am I understanding that logic correctly? I.e. this logic:
>>>>>>>>
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/
>>>>>>>> mac80211/key.c#n503
>>>>>>>>
>>>>>>>> Below are a few kernel logs of the issue happening, some with the deauth being sent
>>>>>>>> by the AP, some with just timeouts:
>>>>>>>>
>>>>>>>> --- No deauth frame sent, just association timeouts after the error ---
>>>>>>>>
>>>>>>>> Jul 11 00:05:30 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to
>>>>>>>> <new BSS>
>>>>>>>> Jul 11 00:05:33 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0
>>>>>>>> peer <previous BSS>: -110
>>>>>>>> Jul 11 00:05:33 kernel: wlan0: failed to remove key (0, <previous BSS>) from
>>>>>>>> hardware (-110)
>>>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 2/3)
>>>>>>>> Jul 11 00:05:33 kernel: wlan0: associate with <new BSS> (try 3/3)
>>>>>>>> Jul 11 00:05:33 kernel: wlan0: association with <new BSS> timed out
>>>>>>>> Jul 11 00:05:36 kernel: wlan0: authenticate with <new BSS>
>>>>>>>> Jul 11 00:05:36 kernel: wlan0: send auth to <new BSS>a (try 1/3)
>>>>>>>> Jul 11 00:05:36 kernel: wlan0: authenticated
>>>>>>>> Jul 11 00:05:36 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>> Jul 11 00:05:36 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0
>>>>>>>> aid=16)
>>>>>>>> Jul 11 00:05:36 kernel: wlan0: associated
>>>>>>>>
>>>>>>>> --- Deauth frame sent amidst the association timeouts ---
>>>>>>>>
>>>>>>>> Jul 11 00:43:18 kernel: wlan0: disconnect from AP <previous BSS> for new assoc to
>>>>>>>> <new BSS>
>>>>>>>> Jul 11 00:43:21 kernel: ath10k_pci 0000:02:00.0: failed to install key for vdev 0
>>>>>>>> peer <previous BSS>: -110
>>>>>>>> Jul 11 00:43:21 kernel: wlan0: failed to remove key (0, <previous BSS>) from
>>>>>>>> hardware (-110)
>>>>>>>> Jul 11 00:43:21 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>> Jul 11 00:43:21 kernel: wlan0: deauthenticated from <new BSS> while associating
>>>>>>>> (Reason: 8=DISASSOC_STA_HAS_LEFT)
>>>>>>>> Jul 11 00:43:24 kernel: wlan0: authenticate with <new BSS>
>>>>>>>> Jul 11 00:43:24 kernel: wlan0: send auth to <new BSS> (try 1/3)
>>>>>>>> Jul 11 00:43:24 kernel: wlan0: authenticated
>>>>>>>> Jul 11 00:43:24 kernel: wlan0: associate with <new BSS> (try 1/3)
>>>>>>>> Jul 11 00:43:24 kernel: wlan0: RX AssocResp from <new BSS> (capab=0x1111 status=0
>>>>>>>> aid=101)
>>>>>>>> Jul 11 00:43:24 kernel: wlan0: associated
>>>>>>>>
>>>>>>> Hi James, this is QCA6174, right? could you also share firmware version?
>>>>>> Yep, using:
>>>>>>
>>>>>> qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1dac:0261
>>>>>> firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp
>>>>>> crc32 bf907c7c
>>>>>>
>>>>>> I did try in one instance the latest firmware, 309, and still saw the
>>>>>> same behavior but 288 is what all our devices are running.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> James
>>>>> Baochen, are you looking more into this? Would prefer to fix the root cause
>>>>> rather than take "[RFC 0/1] wifi: ath10k: improvement on key removal failure"
>>>> I asked CST team to try to reproduce this issue such that we can get firmware dump for
>>>> debug further. What I got is that CST team is currently busy at other critical
>>>> schedules and they are planning to debug this ath10k issue after those schedules get
>>>> finished.
>>>>
>>> Jeff, I am notified that CST team can not reproduce this issue.
>> Thanks for reaching out to them at least. Maybe the firmware team can provide some info
>> about how long it _should_ take to remove a key and we can make the timeout reflect that?
> are you implying that the failure is due to a not-long-enough wait in host driver? or you
> want to know the maximum time firmware needs in removing key, and if it is less than 3s we
> can reduce current timeout to WAR the issue you hit?
No I'm not implying the wait isn't long enough. I would like to know the 
maximum time the firmware should take normally and only wait that amount 
of time, which would fix the issues we see with Cisco APs.
>
>> Thanks,
>>
>> James
>>
>>

