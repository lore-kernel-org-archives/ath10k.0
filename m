Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70448C4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hfJix95s+meWAz5U3eYkOe96/GesfA/hGU9It0Sk6Y=; b=dXPtizAUWluaZ3cbi8bZ1Iv7TR
	hth/AaP77Q5FNGOtlT4YX3xD1m2VUqLE4oVxaYiwIi2VwJdx1KICEZD8a9PuFfdcODBBpSTOw3q4h
	HHj/4UDKnP4wgmUhHja8+se/sFCXdfSuN1Nj+4kd6tXTF35SXprqRR6V+kbcvml+bjsVZ91qSIUG/
	DkZK5+YQc1hJC4IINeRNJnEYvD69F1vnVQYODD9AVw/fiEc2fzy+x/KUt21vpv0K2GsjAH9wPwpTK
	KTo+AqsnVMrSo2/P+1mcgegUdRfLKzs+TdO7OKRrtjQLCTtqds1KwqDnael6b0/r4Qrje8YoEQkrH
	0dhBbctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Ves-00000003rQz-32px;
	Mon, 29 Apr 2024 18:23:22 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Vep-00000003rP1-2p5X
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 18:23:21 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-78f05341128so347031585a.0
        for <ath10k@lists.infradead.org>; Mon, 29 Apr 2024 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714414996; x=1715019796; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hfJix95s+meWAz5U3eYkOe96/GesfA/hGU9It0Sk6Y=;
        b=VkdT5SK7xQLShCJ41PTTka2fKByGge43GSZC2ColooVLP+k7AqNA4k6Q0atWHBQYkH
         jotenlml+hfRYSx2WwVhjMMZXceA9iRhL+ih6HglHc5nKZXCrT73qjRfSu5s4+fpzkLF
         Ag2RbafCbD7nHH+Su+Q8XNUj9YXKbd4fDsIIRo4PYM7ouJMYoaPMFGlctlVj7hLUJbXl
         4pliPQE6ZgAF/MrGvQ6rT1FQcN7JpmV6hbTPVWwz1uNAfHjVJtPmbRPbK6T3cZbJPLt4
         g2E4mYUpP12T7teRphPMVSVNpCTAhrF4fbq6JaGZ4/KdfKK8ffm2LQzetP6P9dPwhh1N
         sI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714414996; x=1715019796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hfJix95s+meWAz5U3eYkOe96/GesfA/hGU9It0Sk6Y=;
        b=klbrx0KPv87mkSo0ofj1ST4dvoI+h/aujiIGjJ9JMZ1b5sJgNRCZWwrfaVI1CH064y
         2smxk9UUgt0VjNNnET97JYxidXobfjWHGXYjpKPvBPy4ol+SNjspbs/RazoQKzdJcy+J
         yxX/B/fMP9q8li+JIKAs3fiFjEN5tH8/3KYRNH2ct7ApyoVrVN3JiP6TLHqJbhr1hMlv
         z4+YVxoN4Jyny+kATpv1jNW0oH6vS1NZyg2sVoD70TS1rJMdNuHA3e8oSwSYMOh+nz7J
         cGgwgWUpfggrqswqSdtPvFvu3pxVG3VHIEy+MUqVTugROk6MQWx5rCFqAAqMNw+EM2OY
         DKzA==
X-Gm-Message-State: AOJu0Yxwl+WPKVR6wiNx8jgS9GLRe61LXVQGHsF1v9M4pmZm4Z58UaPg
	0m5/8l7bDEUYND328HXBQ8iL1qDX708Nb3I/Qo3yUJxg4GsE3FN4a/bseg==
X-Google-Smtp-Source: AGHT+IELs5ZzbqXSYFbqRCpwgO1VOMQqC6QLm0moL77pM86NAf4U3G0t73MSOw/oj3jJLKvj3E/0iA==
X-Received: by 2002:a05:620a:3849:b0:790:9dee:5ee5 with SMTP id po9-20020a05620a384900b007909dee5ee5mr10343594qkn.2.1714414995814;
        Mon, 29 Apr 2024 11:23:15 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id y10-20020a37e30a000000b007907319aa02sm7465541qki.67.2024.04.29.11.23.14
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 11:23:15 -0700 (PDT)
Message-ID: <ce0e2043-5085-4dd6-86bd-89dca6f566be@gmail.com>
Date: Mon, 29 Apr 2024 11:23:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
To: ath10k@lists.infradead.org
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org> <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
 <87wmolsrcc.fsf@kernel.org>
 <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
 <87o79sfjlf.fsf@kernel.org>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87o79sfjlf.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_112319_753232_E8DC943E 
X-CRM114-Status: GOOD (  24.57  )
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

Hi Eric,

On 4/29/24 5:18 AM, Kalle Valo wrote:
> Eric Park <me@ericswpark.com> writes:
>
>> On 4/25/24 5:51 AM, Kalle Valo wrote:
>>
>>> I do not use Network Manager or other connection managers when testing.
>>> It's much more reliable to use wpasupplicant directly and you get full
>>> control. I usually create a custom config file and then start the
>>> supplicant manually. Some pointers:
>>>
>>> (...)
>> I had some time today to test this, but unfortunately I couldn't
>> figure out if wpa_supplicant was using WPA2 or WPA3. Trying to connect
>> via `key_mgmt=SAE` caused `dhcpcd` to time out looking for carriers,
>> so I guess it was connecting via WPA2. In any case the speed results
>> were the same as disabling WPA3 on the router-side.
> If you run wpa_supplicant -dddt (or similar) you get a lot of debug
> output, I'm sure it will also include the cipher.
>
>> The reason I'm sending this email despite not making much progress
>> above is because it turns out I was chasing a red herring. The real
>> problem behind the degraded throughput was 802.11w. The router was
>> advertising support for it (802.11w capable but optional), but was not
>> forcing clients that didn't have the capability (required mode).
>>
>> In Optional mode, I was experiencing the degraded performance. But
>> after I disabled 802.11w on the router side, the speeds recovered to
>> normal levels on both 2.4 GHz and 5 GHz bands, even connected over
>> WPA3.
>>
>> So I'm guessing something on the driver's side is signaling that it
>> supports 802.11w, when in reality it doesn't or some bug with the
>> implementation causes the speed to drop. Or maybe there's an overhead
>> I'm unaware of when 802.11w is enabled? My limited understanding of
>> 802.11w is that the management frames are protected to prevent deauth
>> attacks.
>>
>> I'm not sure where to begin troubleshooting this, but in the interim
>> can I disable the capability advertising on the driver-level? I don't
>> want to disable 802.11w on my entire network, if possible.
> Very good that you found this is 802.11w related. What is the make and
> model of your router?
>
> I don't know how well ath10k 802.11w support is tested and then it was
> last tested. Do you happen to have other Access Points supporting
> 802.11w? That might help to pinpoint if 802.11w is completely broken in
> ath10k or if this is an interoperability issue with ath10k and your AP.

FWIW I just had 802.11w enabled on our test floor (should have been to 
begin with...) where all clients are running QCA6174's. I tested with 
iperf and saw zero difference in throughput between MFP disabled and 
enabled. We also set MFP to required, not optional. So at least the 
hardware variant/firmware we run isn't picky with MFP:

qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 168c:3363
firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp 
crc32 bf907c7c

Thanks,

James

>

