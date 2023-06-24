Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED668EB64D7
	for <ath10k@archiver.kernel.org>; Sat, 24 Jun 2023 01:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxKteBIukPAsY4RWPxpcI4LCO3j5f5Fv1dwjfdpAblw=; b=kc/++X4FTgmYBg
	d1RPaCvGNyf3pQ0aaDWVUGANW2Fthjxezjki2r+ELi162WoY9z6dK9/YbkwVJS9A69H87Hg2H/+mg
	hTZXuJMpCyWYVerY56f/DhMz6Sp6Vagg+fFdIIM0HAEkMrVVmrxHWxZM11YtajHcQkdRr0P7iruvY
	SjGeXrGCfltgXtVgsaa4l7aDAhk4b2d3GdO1cZZAS0JsaWb2JIpDkXXGIDIjOKt8lXNY5RvY4tleo
	GqtnjoE+2Qy1nZwO9U1EgNwJWBVr9kpx1f2BnCxz7gl9CdSKJHoHpDNZ2lryrwVnon9N4BoyWhxZO
	bnxeei7aUdsD1KRTfmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCrqe-004ygx-1L;
	Sat, 24 Jun 2023 01:13:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCrqa-004yfz-2d
	for ath10k@lists.infradead.org;
	Sat, 24 Jun 2023 01:13:54 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666e6541c98so1068395b3a.2
        for <ath10k@lists.infradead.org>; Fri, 23 Jun 2023 18:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687569227; x=1690161227;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XPifuwGr7qotS1J4egDcigsPGqIRoWlg/6w0xflvqXc=;
        b=os0PUm6FrKL+A1DoENP/u20TiGluWujR7+ihWm5WpvDPntOiaFqI+zagF77EPxUeFd
         gr58N43P9mAq2znfThw1PfGQKEPSYSXsYzcEoKK9A5Du4HKGvzQScblJDy/iGqZAKuWT
         a4wWxbqnCDJ7t06JAr5Z8X0hOH//fnXZWeq9NqYVRLpKrC6kx5piOAgW//ZY9LTxMEnL
         jqOhCNst0AIt7XcCt8LzYtm++QMHG2HaCRrv86PEx6ef3m7DMWmPFU5054WCk+Mv5os1
         kXSEIEH24AbdO3seGYjPXpcaT5TcOUwYnekVdahikCV0h8quKcRXl8JnajWrTwBJOX4a
         9cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687569227; x=1690161227;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPifuwGr7qotS1J4egDcigsPGqIRoWlg/6w0xflvqXc=;
        b=W5UWYM6bCYN1Z1lZnHih9xYGa25QTM3N64ZWOtwlIPBxwHd8975Zn2B54NS6ZNFh2I
         v1HSAq9mDuxip+kd4WYB6l0c2/XTGLMZ2GYMnBisLRrK7CHuRhwsPwjGd4iNUqM867Kd
         +YquGnIQXA8joKGSzRfo3tDPkOVjbi9PClzbU7k/2l1Wa0lJ78/2JvhIzrHQ73rzeYN6
         7rXyKRIYlRBdCoZUkDn/eli9TZLNkK7xUrzFA8VUVO9g4SX4ERF2Siwp7nYIg/t1Fekr
         MG9iLRAvc56CCxFJoAUAGWsvpOLfxtsDwTfjFz6bYB5D95c+p7KVHRXJeceFtGtKFOgb
         WRgA==
X-Gm-Message-State: AC+VfDx5bTwtXLXQKl6K4CO6srPETJ1G4ZK3TI9v6KdGGbbe9TLgkz92
	0WHO/zdUNNXRlX7kHIIJfig=
X-Google-Smtp-Source: ACHHUZ606czjila05woldXKyuDA7Rq8dbV1i+0k6tpmn1h59UzY57EaMRyDQG9n05OaV37lSyFMttw==
X-Received: by 2002:a05:6a20:12d1:b0:121:b440:2820 with SMTP id v17-20020a056a2012d100b00121b4402820mr19195240pzg.19.1687569227466;
        Fri, 23 Jun 2023 18:13:47 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j6-20020a655586000000b0054fe7736ac1sm195469pgs.76.2023.06.23.18.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 18:13:47 -0700 (PDT)
Message-ID: <0e85ca99-d1d6-097b-2e04-4cd6492098a1@gmail.com>
Date: Sat, 24 Jun 2023 08:13:26 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: Dell XPS 13 ath10k_pci firmware crashed!
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kalle Valo <kvalo@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 Garry Williams <gtwilliams@gmail.com>
Cc: Linux Atheros 10K <ath10k@lists.infradead.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <2db51694-aa57-cbfd-096e-4925b76232b0@gmail.com>
Content-Language: en-US
In-Reply-To: <2db51694-aa57-cbfd-096e-4925b76232b0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_181352_860482_490F42B3 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 6/14/23 08:15, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> Beginning with kernel 6.2.15-300.fc38.x86_64 and continuing through 6.3.7-200.fc38.x86_64, the wifi connection fails periodically with these log messages:
>>
>> ath10k_pci 0000:02:00.0: firmware crashed! (guid 6c545da0-593c-4a0e-b5ad-3ef2b91cdebf)
>> ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
>> ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
>> ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
>> ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
>> ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
>> ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -16
>> ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
>> ath10k_pci 0000:02:00.0: Copy Engine register dump:
>> ath10k_pci 0000:02:00.0: [00]: 0x00034400  12  12   3   3
>> ath10k_pci 0000:02:00.0: [01]: 0x00034800  14  14 347 348
>> ath10k_pci 0000:02:00.0: [02]: 0x00034c00   8   2   0   1
>> ath10k_pci 0000:02:00.0: [03]: 0x00035000  16  15  16  14
>> ath10k_pci 0000:02:00.0: [04]: 0x00035400 2995 2987  22 214
>> ath10k_pci 0000:02:00.0: [05]: 0x00035800   0   0  64   0
>> ath10k_pci 0000:02:00.0: [06]: 0x00035c00   0   0  18  18
>> ath10k_pci 0000:02:00.0: [07]: 0x00036000   1   1   1   0
>> ath10k_pci 0000:02:00.0: could not request stats (-108)
>> ath10k_pci 0000:02:00.0: could not request peer stats info: -108
>> ath10k_pci 0000:02:00.0: failed to read hi_board_data address: -28
>> ieee80211 phy0: Hardware restart was requested
>> ath10k_pci 0000:02:00.0: could not request stats (-108)
>> ath10k_pci 0000:02:00.0: device successfully recovered
>>
>>
>> If I disconnect and reconnect using network manager, the connection is restored.  But this same failure recurs over and over after some few minutes to a few hours.
>>
>> This is a regression.  The error was not reported with any previous kernel since 6.2.14-300.fc38.x86_64
> 
> See Bugzilla for the full thread.
> 
> Unfortunately, the reporter can't bisect this regression (he only tries
> distribution kernels instead).
> 
> Anyway, I'm adding it to regzbot (as mainline regression because v6.2.x
> has already EOL):
> 
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217549
> #regzbot title: ath10k_pci firmware crashed on Dell XPS 13
> 

It comes out that the regression is due to Fedora patches (see Bugzilla thread),
thus:

#regzbot invalid: regression caused by downstream patch

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
