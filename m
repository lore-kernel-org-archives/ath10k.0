Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AB2EB64D7
	for <ath10k@archiver.kernel.org>; Wed, 14 Jun 2023 01:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PtnS3nkJ8mg6e5AiIAmys+0Qe/ql/3CUkaOnF2kdDtA=; b=MIQC8yO/+ZiFQn
	e1s4Zx9hhjpFiSbht9YvW1VjTQoRroD2bQVfwrqmLksL338pjbGXr/RyaaWpTtBMU3Qr6j5HiXVNe
	FZKo5a4r3qANLIr7km+jzHLGemSo4NS9Sz5sIBDgU4uqTyKaV6WFU2fJl3rtfbfdaMLei4T98970v
	x0ZaugAUoHB6fHFCxSQVrQ5aX3U9VJ91M7I9ejhZ6+oqclxjsQjAzWS2v+F/8RDimerABQ8k1yOMG
	AkrjTh8GN5p5iIrUzBbb+amQ22FzOxXJkw7ljQVswk7EniuKILWuvfp4Hj4oPlmO7A6yCW8Hf31e/
	s4NfnzrxOiHCr0KMp9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9F6q-009bGI-2u;
	Wed, 14 Jun 2023 01:15:40 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9F6j-009bEV-0y
	for ath10k@lists.infradead.org;
	Wed, 14 Jun 2023 01:15:39 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-65242634690so4715197b3a.0
        for <ath10k@lists.infradead.org>; Tue, 13 Jun 2023 18:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686705329; x=1689297329;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qx8m0l5OukQyzZseritYmbm+wBilDwp6PVLNmtxjoI=;
        b=H74dI4jAg+9W8MW9L/inWX8URAO7fqd24702FyhtGOpHb2DJljdLQZjw5evS087UsE
         WNzJIJpTmAmFXj9l0mCNHNIervudP3x4Jr1JCv2vQQTdjwfiFagzaq25CsHbIVvk9MAM
         qlGCX8Hu/933RwtSR/3LJYSFk9RVMzciR+8o7QETLBVLmepXtGwAofv/Hc3APSrdf0Oa
         H/kjV7zykOQzTtOwfhktyXB0QvZTuRBhpiU9kvkQYbt42vyIrAqPyKSqhoowC7mIpqoH
         MpQ+Zh+ExjUJOktFhEZMaBPSkchSH7elhUqCpslJRF8FqoPAhIrDNqHBj9vN7hS3TVKa
         JeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686705329; x=1689297329;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Qx8m0l5OukQyzZseritYmbm+wBilDwp6PVLNmtxjoI=;
        b=UFPvxA4GXj+wQwTZqjulvxRS1JGCYwdrMUlLIcfF2Nvj9aZ/jwxwYA0yU01480EhOy
         xTZ9hL2vUkntXZ336+AcjWM1udLzRSHQElsTJRWtNpXDwThn2beKvR6P9LA2xKGZskwG
         sGey2CIPh/qR2btrRZJ+5vmdcK4HToc0jJ2qnGcDsuNRWLUDybLWzmZvUglLE0U4SXNI
         N7i5CiNcmm1IuM5J9iLhi7ZOB3y49VOuWxxkn46mgkeR6s9jFvQqiP8png2rB/otG+jG
         gzmteYoNht7YAQrU4U5Ey1Gb7LZyN40NliQqEI4iczEa1GZN97UXzF1VXWaijMIMldCp
         J2EA==
X-Gm-Message-State: AC+VfDwuLhvBmXizrKxvjb7KliZEaYBsBUYih8g+QKRwgovRuU+rOUfp
	BNEiKF7vyfpGscoGdiIjQdk=
X-Google-Smtp-Source: ACHHUZ5DBMu8zSisl8h2f9Kwp+pIiWwmyc4Hge5VKLHTWvYmyBg/a5P6Qgx96/xwdB8jnW9DzMukCw==
X-Received: by 2002:a05:6a20:4426:b0:11a:efaa:eb3e with SMTP id ce38-20020a056a20442600b0011aefaaeb3emr362375pzb.33.1686705328722;
        Tue, 13 Jun 2023 18:15:28 -0700 (PDT)
Received: from [192.168.0.103] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902b58800b001a988a71617sm10837354pls.192.2023.06.13.18.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 18:15:28 -0700 (PDT)
Message-ID: <2db51694-aa57-cbfd-096e-4925b76232b0@gmail.com>
Date: Wed, 14 Jun 2023 08:15:24 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 Garry Williams <gtwilliams@gmail.com>
Cc: Linux Atheros 10K <ath10k@lists.infradead.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Dell XPS 13 ath10k_pci firmware crashed!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_181533_364608_6B4F3646 
X-CRM114-Status: GOOD (  11.24  )
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

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Beginning with kernel 6.2.15-300.fc38.x86_64 and continuing through 6.3.7-200.fc38.x86_64, the wifi connection fails periodically with these log messages:
> 
> ath10k_pci 0000:02:00.0: firmware crashed! (guid 6c545da0-593c-4a0e-b5ad-3ef2b91cdebf)
> ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
> ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
> ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
> ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
> ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -16
> ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
> ath10k_pci 0000:02:00.0: Copy Engine register dump:
> ath10k_pci 0000:02:00.0: [00]: 0x00034400  12  12   3   3
> ath10k_pci 0000:02:00.0: [01]: 0x00034800  14  14 347 348
> ath10k_pci 0000:02:00.0: [02]: 0x00034c00   8   2   0   1
> ath10k_pci 0000:02:00.0: [03]: 0x00035000  16  15  16  14
> ath10k_pci 0000:02:00.0: [04]: 0x00035400 2995 2987  22 214
> ath10k_pci 0000:02:00.0: [05]: 0x00035800   0   0  64   0
> ath10k_pci 0000:02:00.0: [06]: 0x00035c00   0   0  18  18
> ath10k_pci 0000:02:00.0: [07]: 0x00036000   1   1   1   0
> ath10k_pci 0000:02:00.0: could not request stats (-108)
> ath10k_pci 0000:02:00.0: could not request peer stats info: -108
> ath10k_pci 0000:02:00.0: failed to read hi_board_data address: -28
> ieee80211 phy0: Hardware restart was requested
> ath10k_pci 0000:02:00.0: could not request stats (-108)
> ath10k_pci 0000:02:00.0: device successfully recovered
> 
> 
> If I disconnect and reconnect using network manager, the connection is restored.  But this same failure recurs over and over after some few minutes to a few hours.
> 
> This is a regression.  The error was not reported with any previous kernel since 6.2.14-300.fc38.x86_64

See Bugzilla for the full thread.

Unfortunately, the reporter can't bisect this regression (he only tries
distribution kernels instead).

Anyway, I'm adding it to regzbot (as mainline regression because v6.2.x
has already EOL):

#regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217549
#regzbot title: ath10k_pci firmware crashed on Dell XPS 13

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217549

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
