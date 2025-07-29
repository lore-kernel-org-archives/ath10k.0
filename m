Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7959C87FC9
	for <ath10k@archiver.kernel.org>; Tue, 29 Jul 2025 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwA1RlZ6wO9TlQ9boahv87HHJljaAP2dy/gW/a+blhQ=; b=ZjwraaCrk0St68dY2PwUJB7AZV
	dCQLUErA9Ilt66YaAeSD+CXDAi1UVjqENfIZDo3Cr26HnSc7fQawLz8IJ214MOb3zSTY246QrpMM1
	87AyxKmEdUJh+hFiJrHVbagOV35agYNqndBGyc1FIWcZyYHimsdb2F0y6sA3CP+0ySuWWCFZZsWih
	T5queg64p7Z7AnmpPzIBBWRCqdBUV5d+/T8ucBiQ9ry5k9QgfS804qsqPZOGaBjSBa6nX5VniZSwQ
	yqku0YJH3ivCwvx+7IQz4KJmsUeUReT0QaQc+zSzQtkV23NvT5gsW9EVHvUaLSbK7oo6bMxSS+nZ5
	PAOTMGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoEI-0000000HN56-2RDt;
	Tue, 29 Jul 2025 17:35:10 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoEG-0000000HN4H-2zE9
	for ath10k@lists.infradead.org;
	Tue, 29 Jul 2025 17:35:10 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-74b56b1d301so3992183b3a.1
        for <ath10k@lists.infradead.org>; Tue, 29 Jul 2025 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753810507; x=1754415307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HwA1RlZ6wO9TlQ9boahv87HHJljaAP2dy/gW/a+blhQ=;
        b=J5DGd7ed/OFZNXpcdCeHG940N1TrL39PTHR3GBoUEmPKA+kuRIcQpZFXhsF0i9HNCj
         +zSrZTRIDjEIewIaLtACBC+jB//j6+V5nd2Sg6F1qTh8pwf5lYeQWynj3HZ3zf1lZl7Q
         h9TnSqcYotYJEUvQLniVozbtoDJO1jdfsg5QJiXVPfewM0uXHNf2tY9a3PuGeZSiIG5u
         3mbYPyoJTtDhWv+2kbyHxeuIFNN0ITw4+BWiAr79E1q65BSwTxWfSA21b8zMFn92xJTP
         m8tnxmzX2CTPRdXGnW9sUNuu7LKIjnao61xBKgWnJYCTXgUywMZxxfHl/cXkV3A+28m5
         nr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810507; x=1754415307;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwA1RlZ6wO9TlQ9boahv87HHJljaAP2dy/gW/a+blhQ=;
        b=et/erpvV1cHz73HYN2hR6yllUc1Kn+ajtXEAjD06935leRJyDay3KTayfJhPsohFEA
         KVPhQ5IPRVK07tBpQNpGgx87anW/iaB4cZbfSSCBc0T6vTm8MsIUzDPlwbmeYnWv/Kmk
         Bw71u1h3N/xQvb2pK5Apq7y1YKhirXlLVJzhVtt27FQVXxT1ND0h4j1VbMCPL5rva1aa
         WB+oedbNk6lpOl/YPO/Iyxl5MrOQKjmlaD6/kR+cUQxt5kPluWTajQZlGRv3DuDXK3uj
         o3lwbsb+AKOMEgp3aGjqeii7CyzmjDM/if7+7lIjQbTHP3n6losOB5VPrrecJRoWLuJJ
         XSoA==
X-Forwarded-Encrypted: i=1; AJvYcCXkd8yTWQok47o82+eW6wYutI5l3GUIp+wmbShLJ9KxbFUzQvDg8ufU4/7L2fo7R9ccDrCuMUc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnCJLjZi348kX3nOQ2Na9zvo6zt2ebQezGIIciOSSRiGfGpH8F
	w0Qh/c9tDuoPbhNUEklPFTmX71eADAuEj+fFbGxFll/SuoyYcel5NYQu
X-Gm-Gg: ASbGncucp/AzuMth6uMVBZ81dCiAhsKZCO+ZutThwfV5rA3wWDSVM7LPVjyT6+DD0RM
	NLRNLk/L0KtIXSJS8SXOH28V+6G4EoQs+np9gEh3y7wf6VCwhBHvazwkovhXgu3dvMm5MtJ9pQw
	sN5ZRw605uIc5fbKvWtgexHKV9g38N6/gF6Jpw7DZH99QPnB65D+IHP8C+L10rTZSENfHAhEuzf
	PQkgwjkvaq2l9O7TLaTIVQvnkDGNEtXuwqJEGfHQjofGVnNt/WEqyOg0hPUqrXUKv5UjpZrS6tE
	s5jQ8Qg8aPA3Gf8rgXFEC1M2X4K/by/ez4DWCmZsRomWUHfEKt0bQWXV7Exy0gl6PxjompfSKgH
	C26uxgYphb7n2wThb1l8refe9OYYbym/q8OyMwSVfDjR4xehULQ28VDg=
X-Google-Smtp-Source: AGHT+IE1dmaZoFNOYX+Gigetj57fT95zLeVxN+Drcy30z0zJ7kHrKOg7qJ05QcxUEd5gYQTYuwqFlQ==
X-Received: by 2002:a05:6a20:7346:b0:237:de39:7ebb with SMTP id adf61e73a8af0-23dc0d32203mr451871637.6.1753810507358;
        Tue, 29 Jul 2025 10:35:07 -0700 (PDT)
Received: from [192.168.0.119] ([115.187.48.187])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b41fda7b737sm5233638a12.66.2025.07.29.10.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 10:35:07 -0700 (PDT)
Message-ID: <04489490-aca2-4e67-8eb2-e95f223ead3c@gmail.com>
Date: Tue, 29 Jul 2025 23:05:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org
References: <FB546B0D-2209-4FA0-9DC9-A75C0BC9FA4F@gmail.com>
 <20250711163645.GA2294895@bhelgaas>
 <CAEmM+QiSZBoJV2n6944tYU7fcrzKRTUgsKRdqwDEkKkZiPVCMw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEmM+QiSZBoJV2n6944tYU7fcrzKRTUgsKRdqwDEkKkZiPVCMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_103508_753134_110BEC96 
X-CRM114-Status: GOOD (  10.40  )
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

Hello everyone,

I hope this email finds you all in good health.

This short email is being made as a humble request to look at the logs I 
sent previously, and if anything can be done to them.

Thanks,

Bandhan Pramanik

বন্ধন প্রামাণিক


On 7/12/25 12:18 PM, Bandhan Pramanik wrote:
> Compiled the usual way: the bzImage compiled within 4-5 minutes
> (compared to 1 hour previously), and the modules compiled within 1
> hour (compared to 8 hours previously). Also, the congestion strangely
> didn't happen. It was instead silently followed by "No Internet".
>
> Didn't add the kernel-level journalctl because I'm sure that the
> normal journalctl includes the kernel-level stuff too:
> https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/07b34aa3fa19da5afa4bb161454e3cb2081b9880/journalctl%2520v6.16-rc4-PATCH1
>
> Please let me know what you think of the logs.
>
> Bandhan

