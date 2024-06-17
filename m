Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D575C27C79
	for <ath10k@archiver.kernel.org>; Mon, 17 Jun 2024 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSfIk8K4XME6GZfBy3FFM+3s5/rKYnSusBreIG/t7cA=; b=xii0LeEd9VqU8i5RUp5p5dv81F
	lhuV9s6qpEULcJcd1irb7uO6e0Q0FsnS6jXB2QO6mN4V5xbpzC0+Or0eFLVDeiNsvutjXiPq2BCpl
	iuj7hT37lNFFFMyLPDRwLsc8M/1An3DHPsSa7tbjDowzkSd1OU8Ma1mqKhjFqMgvHzc9kvMqSzJei
	/2jTwUA+gkqq6Sommx1apBVqgZanxoxhKeEUoYuV9xapCvjlfuezmCqBaP7a3FN2E3OjMG9BGnLcL
	x94ali5ahy2k4BephP7hxez6KWJxDEmfcH/FEUvY2hPm12KvPZbtqMVJabDapNfxKTa3jaPxFCasu
	PIZQ6A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDyt-0000000BNHD-1ce4;
	Mon, 17 Jun 2024 15:09:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDyp-0000000BNGJ-3yb5
	for ath10k@lists.infradead.org;
	Mon, 17 Jun 2024 15:09:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f4a0050b9aso36794985ad.2
        for <ath10k@lists.infradead.org>; Mon, 17 Jun 2024 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718636949; x=1719241749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSfIk8K4XME6GZfBy3FFM+3s5/rKYnSusBreIG/t7cA=;
        b=SeOOrTwcgg3sRlnoHUQKBvM3qsq+eu2ZWCOpOq3b4vmCqBJmRFiRhsqVan7V9alDZl
         AGiUfoky7NHnykcPscpxXXXACjA0GeFq1rUTlkbWAE55BCGNRvQnz1hFreiP3rS7QEks
         KVQAvA18jA1ptUx+c7pjmC7MXlVbFSd0kZgAPDD/79Yfz56+r8r92G5zG5hW651lpRr/
         Aw+ZUgSKyIJVIplmb+5KicpxghNI0r0pK1LMhVsbEwNAbG9T6ml8tnrTpo/3pzu/80/X
         GqNuR+CrJ2Ee+fLoOi4pcFq6BF5kYLqE1R9QubBr+yb1XmPxfW+Tav9KbM7ftEXa50oB
         T45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636949; x=1719241749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSfIk8K4XME6GZfBy3FFM+3s5/rKYnSusBreIG/t7cA=;
        b=M3aRSyl1VPVixEnzhZv8rkQkrpyipvzRrdydn39VpaIhMl53RmnKVZOAebjGJyLfCn
         P7yv42Amb1tnidl0Xr7pkyPrGdwfaZIf54E03hUa36+bFqMgAg5KBHRxjSYAmi6Hx9Ub
         fzfKusecQ93JKObFRTQczw+dyHFhHT/quhQuVpK/KOxVdYZ9gP+1pSQLetUItq3Ld69S
         sG5uPuzTyLyxnFvnYdh9gySseLFR0+M/1o0kH4g2pm11jFu85ZJLvrIDYE+dyolqaCg9
         C8IwsTU21fXymHmMujYfVkWomUvtOnq+bw+oELN3Oay6piXcCm0b3K2wxy1mpXjA/cj1
         2KNw==
X-Forwarded-Encrypted: i=1; AJvYcCUMfpMlAC7TZ6Fk5ZlGUyipSDntR2Du8PCIRFyNQQ7HAxS54QfM4bU7qv/2enwaPVa4T9WMOjdI+XiPdOevL8WhsVtpUR/bqZq1hw==
X-Gm-Message-State: AOJu0YwuBFjVVt2lFAooLolZKy2RWFk4i2m/xP79N/qTY3XK0iUmhoBQ
	aXnlIxtU6bhceiPlCy0jA2Htes0krGxxoyHiadUSBoQWfiBGBrvb
X-Google-Smtp-Source: AGHT+IHaWapibFdK79vB3fJG4Nz96RSjPehaB6COG+NcELElXjUeNz89MPURVFDFdeqFx+o2JGWVzg==
X-Received: by 2002:a17:903:22c5:b0:1f7:e32f:f067 with SMTP id d9443c01a7336-1f862a1694emr104999715ad.50.1718636949159;
        Mon, 17 Jun 2024 08:09:09 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e56183sm80122435ad.28.2024.06.17.08.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 08:09:08 -0700 (PDT)
Message-ID: <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
Date: Mon, 17 Jun 2024 08:09:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
To: Paul Menzel <pmenzel@molgen.mpg.de>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_080912_032607_FEDE1C88 
X-CRM114-Status: GOOD (  11.58  )
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

On 6/16/24 6:10 AM, Paul Menzel wrote:
> Dear Linux folks,
>
>
> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when 
> connecting to a public WiFi:
>
>     ath10k_pci 0000:3a:00.0: invalid vht params rate 1920 100kbps nss 
> 2 mcs 9

This has been reported/discussed [1]. It was hinted that there was a 
firmware fix for this, but none that I tried got rid of it. I got fed up 
enough with the logs filling up with this I patched our kernel to remove 
the warning. AFAICT it appears benign (?). Removing the warning was 
purely "cosmetic" so other devs stopped complaining about it :)

[1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html

>
>
> Kind regards,
>
> Paul
>
>
> ```
> Jun 16 11:38:15 abreu kernel: Linux version 
> 6.10.0-rc3-00174-ga3e18a540541 (build@bohemianrhapsody.molgen.mpg.de) 
> (gcc (Debian 13.2.0-25) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) 
> #196 SMP PREEMPT_DYNAMIC Sun Jun 16 06:02:29 CEST 2024
> […]
> Jun 16 11:38:15 abreu kernel: DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 
> 2.21.0 06/02/2022
> […]
> Jun 16 11:38:33 abreu kernel: ath10k_pci 0000:3a:00.0: enabling device 
> (0000 -> 0002)
> Jun 16 11:38:33 abreu kernel: ath10k_pci 0000:3a:00.0: pci irq msi 
> oper_irq_mode 2 irq_mode 0 reset_mode 0
> Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
> target 0x05030000 chip_id 0x00340aff sub 1a56:1535
> Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
> debugfs 0 tracing 0 dfs 0 testmode 0
> Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
> WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
> Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: board_file api 
> 2 bmi_id N/A crc32 d2863f91
> Jun 16 11:38:34 abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 3.87 
> wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> Jun 16 11:38:34 abreu kernel: ath: EEPROM regdomain: 0x6c
> Jun 16 11:38:34 abreu kernel: ath: EEPROM indicates we should expect a 
> direct regpair map
> Jun 16 11:38:34 abreu kernel: ath: Country alpha2 being used: 00
> Jun 16 11:38:34 abreu kernel: ath: Regpair used: 0x6c
> […]
> Jun 16 11:39:20 abreu kernel: wlp58s0: authenticate with 
> 70:18:a7:0e:f7:cb (local address=9c:b6:d0:d1:6a:b1)
> Jun 16 11:39:20 abreu kernel: wlp58s0: send auth to 70:18:a7:0e:f7:cb 
> (try 1/3)
> Jun 16 11:39:20 abreu kernel: wlp58s0: send auth to 70:18:a7:0e:f7:cb 
> (try 2/3)
> Jun 16 11:39:20 abreu kernel: wlp58s0: send auth to 70:18:a7:0e:f7:cb 
> (try 3/3)
> Jun 16 11:39:20 abreu kernel: wlp58s0: authentication with 
> 70:18:a7:0e:f7:cb timed out
> Jun 16 11:39:22 abreu kernel: wlp58s0: authenticate with 
> 4c:bc:48:39:16:ab (local address=9c:b6:d0:d1:6a:b1)
> Jun 16 11:39:22 abreu kernel: wlp58s0: send auth to 4c:bc:48:39:16:ab 
> (try 1/3)
> Jun 16 11:39:22 abreu kernel: wlp58s0: send auth to 4c:bc:48:39:16:ab 
> (try 2/3)
> Jun 16 11:39:22 abreu kernel: wlp58s0: send auth to 4c:bc:48:39:16:ab 
> (try 3/3)
> Jun 16 11:39:22 abreu kernel: wlp58s0: authentication with 
> 4c:bc:48:39:16:ab timed out
> Jun 16 11:39:24 abreu kernel: wlp58s0: authenticate with 
> 4c:bc:48:38:d8:4b (local address=9c:b6:d0:d1:6a:b1)
> Jun 16 11:39:24 abreu kernel: wlp58s0: send auth to 4c:bc:48:38:d8:4b 
> (try 1/3)
> Jun 16 11:39:24 abreu kernel: wlp58s0: authenticated
> Jun 16 11:39:24 abreu kernel: wlp58s0: associate with 
> 4c:bc:48:38:d8:4b (try 1/3)
> Jun 16 11:39:24 abreu kernel: wlp58s0: RX AssocResp from 
> 4c:bc:48:38:d8:4b (capab=0x1101 status=0 aid=30)
> Jun 16 11:39:24 abreu kernel: wlp58s0: associated
> Jun 16 11:39:24 abreu kernel: wlp58s0: Limiting TX power to 20 (23 - 
> 3) dBm as advertised by 4c:bc:48:38:d8:4b
> Jun 16 11:39:50 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:39:56 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:02 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:08 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:20 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:26 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:32 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:38 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:43 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:40:49 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:41:01 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:41:13 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:41:19 abreu kernel: ath10k_pci 0000:3a:00.0: invalid vht 
> params rate 1920 100kbps nss 2 mcs 9
> Jun 16 11:41:21 abreu kernel: wlp58s0: deauthenticating from 
> 4c:bc:48:38:d8:4b by local choice (Reason: 3=DEAUTH_LEAVING)
>

