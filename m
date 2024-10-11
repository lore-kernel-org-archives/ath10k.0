Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4244D0EE17
	for <ath10k@archiver.kernel.org>; Fri, 11 Oct 2024 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EICz9GuOyoUBn41No93e0bSvSxbKxa69NwvBJHCFQU=; b=gVZVKu8GJgflQGHIZ2jqDRrLUq
	PO+e0SnfeEn6lZ7LyJSjoEVI2TVCoUI3pt9wHKyytVoHpX0IZK9lYZmjWF+wauWRN9wDtxByXnYc0
	1YZgifw+CU/z3HBcG3wLWZvDoIv4p9gPLdTgktvY9fLtYejJKRsQqOKSq1zIMOui3S9T/LUDkvdZI
	tayIhWeYMblY+sr1Odaf+yUcezvnzv9m8mW422z5WqW4OckURjnhHlHcGOsQkG2ooemjJJ4J64ne+
	NyuxHh0G85t2iLpKNJqF09zFQRn2N3GkyJDtSKiAr8vt87KVVbfXlsxmGPhDTCbm7WPphUq/hUwee
	8Uv47WGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szIdJ-0000000Gz0C-3aLm;
	Fri, 11 Oct 2024 16:36:53 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szId0-0000000Gyvc-1F4e
	for ath10k@lists.infradead.org;
	Fri, 11 Oct 2024 16:36:35 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-45f05f87ca5so13549261cf.2
        for <ath10k@lists.infradead.org>; Fri, 11 Oct 2024 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728664592; x=1729269392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EICz9GuOyoUBn41No93e0bSvSxbKxa69NwvBJHCFQU=;
        b=gncfmIOAGO3wQLA+LFeZm3J7kLkuPJctV8He6aUkB9/har3T8ql7QbNxShaWAixdkG
         iAgnFSKHzm+KIiu308TVAJHdV4arx9nIKRVo/xYHyj91+zD9XlovRuD0LOgd4qZFpb75
         qtUdH0OqiEWcO2NGvcwErBQZ1E9yMrfSVyFh/MPRY1jMFx/UA+EBO29WPkDoZx/b8Unq
         gkqIWmACt17jWxaqaG3EPgunFRX1VNFW2l+nWgF7HSoZPZdiw/CVAO1tjaBVrUFgmMYV
         ThJfwyHWaaYD8oIUVuHw2O/AxtPvdckMknimNdqDQ0lk23KamTEArsLW1JTGJ10k5PRa
         bDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664592; x=1729269392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EICz9GuOyoUBn41No93e0bSvSxbKxa69NwvBJHCFQU=;
        b=h1qtOmVigiq19ELn30JYFuYaME1Pr3e8jcAGJyMKuoyXph6d+/8ZrmLqeMnxjMX7yW
         0M4w6PrzyrJUwo9jqTTZjPaY1LpmOcyNINkFcuwW5wHOWeVDm3tf2S9q0h93AJvGPLLa
         rIZLZTzHE5lpucU7yMVqEpqUFWJmpL74vE/406yqkAX0gQRcsJ2cES8YljLxy1n6eME8
         ccITIBBX98Bp+5qMJFuGJKOstL2O2O61WGp/ai7qcM5iUaOjo8SwmbuD8CxV34RhnObb
         9IEp7BhOaTxsQSPBTypbZ8a0Yq+DxQfSLn8VIi4+kgiG2aiG6TgKuVYqQXhUAMFWsb6d
         Bvlg==
X-Forwarded-Encrypted: i=1; AJvYcCWmI8+3X/1fLrWgLmYXkpf2ITM5UiDj+PMSCgC9NC91mu+3VmO1VqVBnqRoA4ogaTpU4xB2QeI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwORZ+L39aLZBiJ1GsfX/7RyWC61q3HT4P1hJjcEFShrFpqgQYe
	GfvSAxchx92clqIHghXH+CjaeYWoUQhySwBXinjcRSQzZaS/k5mH
X-Google-Smtp-Source: AGHT+IG44fWfmR7QcPGgn1sQ4iDCOvZwINz0uufu8zxEXB5D5LFVJ4ttB1zQ8SXb+8eLL+1E1a9hew==
X-Received: by 2002:a05:622a:1f10:b0:458:5716:fbd8 with SMTP id d75a77b69052e-4604bbcecf9mr54546141cf.32.1728664592363;
        Fri, 11 Oct 2024 09:36:32 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46042895a9csm16691971cf.91.2024.10.11.09.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 09:36:31 -0700 (PDT)
Message-ID: <7ccfcd67-986b-40a3-8311-73b5335f980c@gmail.com>
Date: Fri, 11 Oct 2024 09:36:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
 (ETIMEDOUT)
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
References: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
 <8be8619d-f09f-43b2-ada8-2fca2a7d8ea5@gmail.com>
 <8eda1bd2-88fc-4262-aec0-6f88a73797ef@molgen.mpg.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <8eda1bd2-88fc-4262-aec0-6f88a73797ef@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_093634_357820_FB971ED4 
X-CRM114-Status: GOOD (  17.81  )
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

Hi Paul,

On 10/11/24 5:48 AM, Paul Menzel wrote:
> Dear James,
>
>
> Am 04.09.24 um 16:09 schrieb James Prestwood:
>
>> On 9/4/24 3:45 AM, Paul Menzel wrote:
>
>>> Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3 
>>> (or unloading and loading the `ath10k_core`/`ath10k_pci` modules) 
>>> having been connected to an AVM network:
>>>
>>>     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from 
>>> hardware (-110)
>>>
>>> Error code 110 is the value for ETIMEDOUT. I saw James patch [1], 
>>> and applied it, and the error is still there (as expected).
>>
>> My patch won't actually fix the timeout, I just lowered the time that 
>> ath10k would wait before it continued which fixed some 
>> incompatibility on the AP side of things. Based on your logs though, 
>> it appears you already got disconnected before the failure to remove 
>> the key...
>
> I am still applying your patch manually on the current master branch, 
> and it looks like it hasn’t still been reviewed. Maybe it’s due to the 
> RFC tag. Do you plan on moving it ahead?

There was another thread, which I cant seem to find where Kalle had 
mentioned the RFC patch. IIRC Kalle had said the proper fix is in the 
firmware, and would rather not take this patch upstream if we can get 
the firmware addressed. And I would have to agree this is the best 
approach if this is an option. This RFC patch was merely a workaround 
for some odd behavior with Cisco APs that one of our customers was 
using, where the APs would actually reject roams if they took too long, 
hence why reducing the timeout "fixed" the problem.

Last I checked your situation was different, your device got 
disconnected _then_ failed to remove the key. If this is the case my RFC 
patch isn't going to really change much, apart from fail in 1 second vs 
3 seconds.

Thanks,

James

>
>
> Kind regards,
>
> Paul
>
>
>>> [1]: 
>>> https://lore.kernel.org/all/20240814164507.996303-1-prestwoj@gmail.com/

