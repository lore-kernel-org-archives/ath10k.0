Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88CCD37B4
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBnNjREbFycHL4m/FJ4Jp/1aXtm04wBP4Y+JiUN5d3k=; b=HSjSDlbrleWOLsHyviw/vd43Cv
	JoHGepGmkv7guKcBxRDuHzDd703OV5lkwQ9PVCR1+/0T7hYosnQxvHSj/w3b7baBJ7ukkZpSk5rPi
	Qu0LS6DVx1XnohzSKzRnlTP48m1fn6VKkzHyFXjS3+vS18h9AjwUFdX8G2KPlnc0ZhJ7iS/virXie
	6j1KupzRgs7DxiXnkrkCY2gOVgsN50hO9ze0FzhYdTWCggAYC4ngE7NWEcQt93oC1IU6xU+Q6Y9gD
	dwE+fAqUXkjzroGT4nvT3n10IKtb2con/scnFjSGB0D8FKb6H6bKgrte1tpXTZobgOCotUxL+8RkP
	bTCFZ/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqjz-00000004iS6-0Prk;
	Wed, 04 Sep 2024 14:12:11 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqhF-00000004hkF-2CXX
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 14:09:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6c34fb4f65eso21749076d6.0
        for <ath10k@lists.infradead.org>; Wed, 04 Sep 2024 07:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725458959; x=1726063759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBnNjREbFycHL4m/FJ4Jp/1aXtm04wBP4Y+JiUN5d3k=;
        b=Nz07uK4pGPf1sefe2E5j2yhFxSAUrSvdcwNeK08hdXX2oQMB2uiGAUMMCmMVsCw5oo
         30l+nQAdZsnUt0V9mopzaae1/4z+ypPB2rUbWTzuO1A3YCATmP07EkfqqqaMQObP4eTS
         YRZwbPshWpq0ycJP3XB9V1HgZxyPEQuyqFWgQ/pfdVnDxF8PkNCAFqe9E3nsuFIoimUM
         lSWdgLqiSvmZYm38JyY8m2SGguVM9PpkKsDmMHHiwIvT1fce/7N4E5nMH5OPCihi40D2
         +6inF47HtHy9rKwl8yw/xIG5som14LgTwkYI7gKgjZ4rMjVHWkb/quusD58p3Ed9sM2X
         WepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725458959; x=1726063759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBnNjREbFycHL4m/FJ4Jp/1aXtm04wBP4Y+JiUN5d3k=;
        b=rJ527r+3AeBltN8BZ+FPwyhunYRMWezCLQwGfqq5/cLhO8kwkEi5za44CB7R9J6zYS
         bMk6Ui70PMcx8VMEi4TyfZ5QPn7bctdLavAjDWQC0ZgIzksUarntQ0tHnK4vrR1q8q56
         aOHLIvmcgUVmh5n2qwc+oT6DIuJbnNTk97uoIGwpVItEwq+1+bCH0Xp0DzKetglm90/C
         S8NxRR/Sqf9RMgGJ5c0Ci4eUKV+OqumJXN0h8PfblkmdB9i9mn5xKI7qxcFXMD12cshw
         kUJgBeC3bOPfT2mdV6+kDGiH1LB8CKE1yyUY0ERv7SEe5e5okua4zXuurP5XVQ8OJZVa
         tNEg==
X-Forwarded-Encrypted: i=1; AJvYcCXFOHEspJVWuUtw1tAdtHVFl5C8PgFR1WQxXACrFSMIjWn0JJACrVTUWz7vXfSm4R/I6OiBTVU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4/8ciUBwqux8yuRwjEdfEIv4KVCXEVwAtko7B1h/A+7p0kbAe
	x2BkYMatksuflX44Poe/30oATY2PnCZy2INnwhSMNtHa7yGw12B1
X-Google-Smtp-Source: AGHT+IG3CGvgAmLD0d29LbDLly51OTmvJujHY2V2VY29Luj12WBFXTdDaitxOnJu8gKy0sTPW0Bbrg==
X-Received: by 2002:a05:6214:5c0a:b0:6c3:7030:d28a with SMTP id 6a1803df08f44-6c3c9c17453mr60613026d6.43.1725458959098;
        Wed, 04 Sep 2024 07:09:19 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c35bd06de7sm41076296d6.17.2024.09.04.07.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:09:18 -0700 (PDT)
Message-ID: <8be8619d-f09f-43b2-ada8-2fca2a7d8ea5@gmail.com>
Date: Wed, 4 Sep 2024 07:09:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
 (ETIMEDOUT)
To: Paul Menzel <pmenzel@molgen.mpg.de>, Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
References: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_070921_592720_A677FE62 
X-CRM114-Status: GOOD (  18.35  )
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

On 9/4/24 3:45 AM, Paul Menzel wrote:
> Dear Linux folks,
>
>
> Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3 
> (or unloading and loading the `ath10k_core`/`ath10k_pci` modules) 
> having been connected to an AVM network:
>
>     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware 
> (-110)
>
> Error code 110 is the value for ETIMEDOUT. I saw James patch [1], and 
> applied it, and the error is still there (as exepected).
My patch won't actually fix the timeout, I just lowered the time that 
ath10k would wait before it continued which fixed some incompatibility 
on the AP side of things. Based on your logs though, it appears you 
already got disconnected before the failure to remove the key...
>
> Can the warning be improved so the user know, which component is at 
> fault?
>
>
> Kind regards,
>
> Paul
>
>
> [1]: 
> https://lore.kernel.org/all/20240814164507.996303-1-prestwoj@gmail.com/
>
> ```
> Sep 04 07:21:38.469669 abreu kernel: Linux version 
> 6.11.0-rc6-00027-ga91d08fcc356 (build@bohemianrhapsody.molgen.mpg.de) 
> (gcc (Debian 14.2.0-4) 14.2.0, GNU ld (GNU Binutils for Debian) 
> 2.43.1) #294 SMP PREEMPT_DYNAMIC Tue Sep  3 23:01:18 CEST 2024
> Sep 04 07:21:38.469718 abreu kernel: Command line: 
> BOOT_IMAGE=/vmlinuz-6.11.0-rc6-00027-ga91d08fcc356 
> root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer 
> mem_sleep_default=deep log_buf_len=8M cryptomgr.notests
> […]
> Sep 04 12:34:55.826218 abreu sudo[25874]:  pmenzel : TTY=pts/7 ; 
> PWD=/home/pmenzel ; USER=root ; COMMAND=/usr/sbin/modprobe ath10k_pci
> Sep 04 12:34:55.828046 abreu sudo[25874]: pam_unix(sudo:session): 
> session opened for user root(uid=0) by pmenzel(uid=5272)
> Sep 04 12:34:55.869839 abreu kernel: ath10k_pci 0000:3a:00.0: pci irq 
> msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> Sep 04 12:34:56.005202 abreu sudo[25874]: pam_unix(sudo:session): 
> session closed for user root
> Sep 04 12:34:56.161706 abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 
> hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
> Sep 04 12:34:56.162591 abreu kernel: ath10k_pci 0000:3a:00.0: kconfig 
> debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> Sep 04 12:34:56.163115 abreu kernel: ath10k_pci 0000:3a:00.0: firmware 
> ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 
> 0793bcf2
> Sep 04 12:34:56.241683 abreu kernel: ath10k_pci 0000:3a:00.0: 
> board_file api 2 bmi_id N/A crc32 d2863f91
> Sep 04 12:34:56.333784 abreu kernel: ath10k_pci 0000:3a:00.0: htt-ver 
> 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
> Sep 04 12:34:56.417649 abreu kernel: ath: EEPROM regdomain: 0x6c
> Sep 04 12:34:56.417919 abreu kernel: ath: EEPROM indicates we should 
> expect a direct regpair map
> Sep 04 12:34:56.418022 abreu kernel: ath: Country alpha2 being used: 00
> Sep 04 12:34:56.418114 abreu kernel: ath: Regpair used: 0x6c
> Sep 04 12:34:56.422440 abreu NetworkManager[610]: <info> 
> [1725446096.4223] device (wlan0): driver supports Access Point (AP) mode
> […]
> Sep 04 12:35:12.042484 abreu wpa_supplicant[618]: wlp58s0: WPA: Group 
> rekeying completed with ce:ce:1e:27:bb:e0 [GTK=CCMP]
> Sep 04 12:35:21.800998 abreu sudo[25953]:  pmenzel : TTY=pts/7 ; 
> PWD=/home/pmenzel ; USER=root ; COMMAND=/usr/sbin/modprobe -r ath10k_pci
> Sep 04 12:35:21.803733 abreu sudo[25953]: pam_unix(sudo:session): 
> session opened for user root(uid=0) by pmenzel(uid=5272)
> Sep 04 12:35:21.881668 abreu kernel: wlp58s0: deauthenticating from 
> ce:ce:1e:27:bb:e0 by local choice (Reason: 3=DEAUTH_LEAVING)
You get deauthenticated here, which then triggers the driver to remove 
the key...
> Sep 04 12:35:22.905717 abreu kernel: ath10k_pci 0000:3a:00.0: failed 
> to install key for vdev 0 peer ce:ce:1e:27:bb:e0: -110
> Sep 04 12:35:22.906604 abreu kernel: wlp58s0: failed to remove key (0, 
> ce:ce:1e:27:bb:e0) from hardware (-110)

And the removal fails. But afaict the removal failure was not the reason 
for the disconnect.

> Sep 04 12:35:22.908927 abreu wpa_supplicant[618]: wlp58s0: 
> CTRL-EVENT-DISCONNECTED bssid=ce:ce:1e:27:bb:e0 reason=3 
> locally_generated=1
> Sep 04 12:35:22.908995 abreu wpa_supplicant[618]: BSSID 
> ce:ce:1e:27:bb:e0 ignore list count incremented to 2, ignoring for 10 
> seconds
> ```

