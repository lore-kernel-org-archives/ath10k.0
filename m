Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9885ACA0EDC
	for <ath10k@archiver.kernel.org>; Sun, 17 Aug 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+glvcUxBNLETyj4EbzaF6Mcl14MmSj24IXXGqr4BWU=; b=MfkahzwwUdu6wGgmdUsmXEaqaT
	YShbYJJGudb4y7bZCb8KykNrAEKWgqT2tJYvG0yHFAr9N1WpgDXxpKxzC/I/uJ7SV4g3d9uF5by5w
	rxqYNUTN5qeveUQkvS1orINS4xRELlaS+bgTE/Bd6qVYgaSVwWLxoiWv4yY4ghIW9aJRT0vogkoTo
	7f/PYslVf/s25TaB81P+Od0zllVkYJY6ZYhdsl7+WRDc9+6G3EUBbFXLn6GqJIzbO498M/LmHRq51
	VODSbQEO5bBlSlcBRQWanjoQF+h4HgkaRrfr3Jfk1s83EjP6nhSH1Lm0/TwtFgGstpfK++9fPnpuR
	HBeKJFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unZqW-00000005WLF-216g;
	Sun, 17 Aug 2025 09:38:36 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unZqU-00000005WKv-0Ukt
	for ath10k@lists.infradead.org;
	Sun, 17 Aug 2025 09:38:35 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2430c5b1b32so26049355ad.1
        for <ath10k@lists.infradead.org>; Sun, 17 Aug 2025 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755423513; x=1756028313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V+glvcUxBNLETyj4EbzaF6Mcl14MmSj24IXXGqr4BWU=;
        b=UvzXCJ1/3sCp67iQjgJAENrcflsFmnrG9kVWsY1VKXRbrT4rxOjaG1r1UPkwJ8yOp0
         8WRQ+d4+2tVh9La7+Ov3HM8SN123JQj3B9wIbwe6Ne13C6YSmoG0KnW07E4wACn6mSo7
         oMUyG2aGnIF4n3s7bmId49Jh4+LJUJBUhaKbFHvDP64ckMcG1GTfv5p5kJElZKMFmcXJ
         11nl0VNGXrPKq8Lcr8x07JMnvh8MbZkanjb4++5Zss5ojK5X2asblIKydI3rVHnx/LDW
         liv+XhVp9u3GG1qUZ8jdGS6vVLbhyR7FdjwOs2edpN5M14aIYE9aX7i8X7th5l22onqz
         6SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755423513; x=1756028313;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+glvcUxBNLETyj4EbzaF6Mcl14MmSj24IXXGqr4BWU=;
        b=v+q2Wry23pQxifSbo8kMuea6RbxCe7xxYl+RBlRm1kijSZ9yr4fpOTQdthq02ksCez
         TMpi1wOrBRgxhs7TL7bJOiuTSvDzktPHUNMto/SBwHic6BIIcWbMWDuwt1RqEpFSAYhS
         QOH06XTekGzkQW8qSKjRIeBlLISyPMXfH9f21O/SgKCa+tim8v6tvZPPOBEvqbPXcAeZ
         xpQyPEPTxRskqp6ZmXr+TYvQj2Y1PhnSQ0u50zhNfGL+XYGQZLUyMpQGKkZ1d16S2M2C
         zBGoXLeyaMI2xAYjYp6F3hImLGhBzgMVC0WvGv10JpDD30ldAF7AHueJcaLnLr85sJ3H
         HqGg==
X-Forwarded-Encrypted: i=1; AJvYcCWjAR8TTkAN+blwaiNfP5ZYzmg1lYKDlPuTxal2SSeIs2+0wCHOmaY4BZYZKkOLn706FntqOxI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcOEIsWPfXsCAlXTb2PRJrzNaCBfo95ruuniE7zEq6rklcCpcJ
	v9oWm9gtA8Qc80CXn2nfjJqwOfUMFYu4JLoWlBK93pkE41Xua/iEMKxv
X-Gm-Gg: ASbGncvq9zoV2U6lxuqoZ66V9Wyw6teERLfNGwdn8U8P+5KCJba3YaIcy5lE0RXyw+D
	XTUfkcnYKoHfUFWRCsmEWbp7RW7DRPsvwnIJ0Brs/sEBTlzF6muhTIHCnBAcWC+CZ4NcPPWecDN
	xl7p2XmTTtStM1Euw7tYIrT8STeiGifRv+p4HMwTPoF6/ZqFkAgUOSEZP7gXe4dDhwPKzOiZ/J9
	+CEpICEgJU83p9Fpdcj7eXcp/e1QwR/V8Ct5WvFr40rRMa8JtB60ITAf2XAOxfcajhajKWc3kDm
	GTgEH3baNjjlF1rrSRVWNoZzzNj7DJVxupNkOTiofTsnRS+MCRo8veNx5rDXPysYX8D04YUEXwo
	J8kSl11xT/Nu2kNRTxn1aNphi3TQcIZ+Q3s8u0JfyEjVKzOVPS3FfQZU/
X-Google-Smtp-Source: AGHT+IHkGdbvw5mBqyT/2JEfiXA/xt9ZKA48sqXHZkrOlalPiagbZZCBEljY1VqxFuyOzhpXRp8Wcw==
X-Received: by 2002:a17:902:da82:b0:242:b138:8119 with SMTP id d9443c01a7336-2445988787emr180301885ad.26.1755423512654;
        Sun, 17 Aug 2025 02:38:32 -0700 (PDT)
Received: from [192.168.0.218] ([116.206.223.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9d02csm51916845ad.7.2025.08.17.02.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 02:38:32 -0700 (PDT)
Message-ID: <db9749a0-9c6a-4781-b5fd-82eb129a9c36@gmail.com>
Date: Sun, 17 Aug 2025 15:08:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH TEST] ath10k: Testing Mani's ASPM patch (QCA9377, v6.16-rc1)
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org
References: <FB546B0D-2209-4FA0-9DC9-A75C0BC9FA4F@gmail.com>
 <20250711163645.GA2294895@bhelgaas>
 <CAEmM+QiSZBoJV2n6944tYU7fcrzKRTUgsKRdqwDEkKkZiPVCMw@mail.gmail.com>
 <04489490-aca2-4e67-8eb2-e95f223ead3c@gmail.com>
Content-Language: en-US
In-Reply-To: <04489490-aca2-4e67-8eb2-e95f223ead3c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_023834_157193_8DBD13AD 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

I was actually trying to build a kernel for someone else using build 
automation scripts. They still didn't compile. (Here's the relevant 
thread I'm referring to: 
https://lore.kernel.org/ath10k/176B76BC-6801-4C3F-A774-9611B43ED4AF@gmail.com/T/#t) 

Regardless, I tested the patches by Mani 
(https://lore.kernel.org/r/20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com).

Here are the logs:

Without pcie_aspm=off (did not work): 
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/84edf89740919e3cba2ac33e567110b14e2d3627/patch-dmesg

With pcie_aspm=off (worked, no issues observed): 
https://gist.github.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d832a16180/raw/84edf89740919e3cba2ac33e567110b14e2d3627/patch-dmesg-pcie_aspm_off

I'm not fully sure what the logs imply, but thanks, it did work even 
after playing YouTube videos for two hours (might not even work in the 
future, cannot be certain). Earlier, my laptop had its Wi-Fi turning off 
within minutes because of IRQ #16 being flooded, in every kernel I 
tested so far. Now, it does work.

There can be seen certain stuff in the second log, where it took some 
time to connect to Wi-Fi, but I think it is mostly fine.

Thanks to those who have prepared the patches and those who did bear 
with me, but there's one request I still need to make.

For anyone who has built patched kernels for Ubuntu and exported in DEB 
files, I would appreciate any guidance or pointers on how to do the 
same, as my efforts to use "make deb-pkg" have been futile: 
https://github.com/BandhanPramanik/ath10k-patched-kernel-ppa/actions/runs/16975573959/job/48123563881


Bandhan Pramanik
বন্ধন প্রামাণিক


