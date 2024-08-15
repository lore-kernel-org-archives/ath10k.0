Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0010BC52D7C
	for <ath10k@archiver.kernel.org>; Thu, 15 Aug 2024 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RjQfC9B1fvnRu6RvXMXIpYc8OGb2IYxIWcv0ZiP1jU=; b=sZdsB+ybH03dE12me8eMhGy3Ik
	+cPW7LtgOhi6Rr7zPub+FQVLVZEDLG3rCa9jHc4/ADeg6hNCohccPVdFzFpyU6hmJJ6xp02lpizWm
	3nngj6ZbQ/JxTYCIrVrcV9GUJXJ2eNXSyu5ZkusHbIU73VGO2PFE070RymLEeWI2Bayp9kkuHmoPq
	g3NuRpiFm2cqokac3d8GFyuA/09hWhLNkzeetRtpDBKH0lBcVR5dPoAwj4rW71I10VbLulxCp93P1
	sGOZUsz6wmF43XKE8TKLfXq78Sk/wGXgJTSjmXeja2bNPkRJ3VDgGFuGzOg+WgpVy7FSsrNomjUzG
	t+09qAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sechX-0000000AQkX-2omI;
	Thu, 15 Aug 2024 15:47:47 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sechQ-0000000AQiX-37dI
	for ath10k@lists.infradead.org;
	Thu, 15 Aug 2024 15:47:46 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6b7a0ef0e75so6527946d6.1
        for <ath10k@lists.infradead.org>; Thu, 15 Aug 2024 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723736859; x=1724341659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RjQfC9B1fvnRu6RvXMXIpYc8OGb2IYxIWcv0ZiP1jU=;
        b=CHfqFfpACyRKpuVPxTXviVcNqs7exN3J2s2vmaSWEiAvRyk/T2ueRIRLowrlxlfvLj
         N0xHqAGLFEMVZS7T9QhhdSHyJHi9l5QTJ8InsJxs2TWeKM3HmHkqP8p4U0m2yXRkSh9L
         k+AL8A66We4varPWWx5hUmMtH0+hapvRwMuiAKEveIZvM7AaTkTou3+WKnEEqazz08Qw
         4Jgd9ILl6JZiSBOhh4PId5bC87Ds2E6xnInH7JStmyFVPAk3czog6hFqbUkljM5SNood
         WrXZo3C69TwDpJ7Gbp6AG3z84b3iA1tusEettDp8N0YIsUihZPUaBvsFqrdvHtWPERka
         JKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723736859; x=1724341659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RjQfC9B1fvnRu6RvXMXIpYc8OGb2IYxIWcv0ZiP1jU=;
        b=tFL7nGWzoqaTWGLMtQV4wCHa6W66vFYHD0SzvbNHn0xshAQqgApLVd3nOk/0JEd/L8
         dT8Zjb3DAzKVLizdWSDiOnWJ/1Hr8XaPXCrDiQBWH9oesPmTQ/12pKM5tgUdz/u6B29q
         cgtw6xw2OC8kKDLdGiy5MXxibJSgsJtL1OqsjvRozvym4iTgrvW2Cc+ZNUvjvOQBnevN
         Vuy2vX49lIgBS/5P51OcDOlHEIKR0Rv6PCkA+LXq6TFDpfLtHssmg70wzf5eI1VYnzRH
         QHioXW6Pw84w9gJz/Cfs0r6Kex+vvHxrnbNmi4wfjHhj++WrFs1UkX6VDCqI7Weu71z6
         FW6w==
X-Forwarded-Encrypted: i=1; AJvYcCWe7Lw+6eS9dIbyM0KANcnvz2yHw3IUzqQgYcfHAJm9yc8OOHgSff7vwXBDv5FJCTE0nETtfmuYSsXxqyBuXPsi8su/WvI06GFeXQ==
X-Gm-Message-State: AOJu0YzkQBqMb8ITKvcEfZRwCYrxfk7gYaSn4u/rED+1VBwCGmhdAQiG
	D+UN1vxWwmIAeSKMsOYqLHCqSGbuTBQylym8XQGQuPdwL1KHEtYk
X-Google-Smtp-Source: AGHT+IHsRYOCPAznA6wBSI0oYhBA7QUz6I0fUMWqcxHEROKqf4ooNcNPMAvUZYYZW9Wfcok9Wbt8Xw==
X-Received: by 2002:a05:6214:540e:b0:6bb:841c:ec6f with SMTP id 6a1803df08f44-6bf5d164943mr84594716d6.3.1723736858644;
        Thu, 15 Aug 2024 08:47:38 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fdd9818sm7406806d6.13.2024.08.15.08.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 08:47:38 -0700 (PDT)
Message-ID: <6ba02350-3c8c-4664-9d68-67cb7e90eddb@gmail.com>
Date: Thu, 15 Aug 2024 08:47:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
 <c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
 <9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com> <87r0apyjc3.fsf@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87r0apyjc3.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_084740_804424_A5D7D196 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Kalle,

On 8/15/24 7:03 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>> Hi,
>>
>> So I have no resolution to this (trying to get the AP vendor to chase
>> it down), but I'm toying with the idea of trying to work around
>> whatever issue the AP is having when this occurs. The only thing I can
>> think of is that there is a 3 second delay between the authentication
>> and reassociation, and perhaps this is causing some timeout in the AP
>> and in turn the deauth.
>>
>> I'm wondering how long it should take to add/remove a key from the
>> firmware? 3 seconds seems very long, and I question if this timeout is
>> really necessary or was just chosen arbitrarily? Is this something
>> that could be lowered down to e.g. 1 second without negative impacts?
>> The code in question is in ath10k_install_key:
>>
>> ret = ath10k_send_key(arvif, key, cmd, macaddr, flags);
>> if (ret)
>>      return ret;
>>
>> time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
>> if (time_left == 0)
>>      return -ETIMEDOUT;
> I can't remember anymore but I'm guessing the 3s delay was chosen
> arbitrarily just to be on the safe side and not get unnecessary
> timeouts.
>
Thanks, I have reduced this to 1 second and have had it running on a 
client for ~19 hours. Still am seeing the timeouts, but no more than 
prior. And even with the timeouts the roams are successful.

After doing more looking in the spec I did see that there is 
dot11ReassociationDeadline which may be coming into play here. Of course 
these APs aren't advertising any TIE or even support FT resource 
requests that so its impossible to know for sure, and hostapd AFAICT 
doesn't enforce any deadlines even if you set it... But in any case the 
timeout reduction is helping immensely and avoiding a disconnect.

Thanks,

James




