Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D54C7EE30
	for <ath10k@archiver.kernel.org>; Fri, 27 Jun 2025 00:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I984LjdCSI2og4FoX/by4gyCjX2JLqS5cCJCVpz/WdQ=; b=WunnPB9dFgRa/JWUGBDz/ydqZX
	F+gXZdimEu3s3rkGTaZ/RT9+r1JnSMkZCJf2hD/13hGGeCUd1zKaFeF9UAH+Q/X8P06FRxRPi+8Kh
	YX5+Rzq8Aekry1Z2MMKbHesSSkNv3+S/saliR0+cV4Ycx8hEWVXz/RGOCgWoAbFcsaYY/KDZcmGqf
	RrlxOnL05bN6I69W8X3eaihnvxWK3S0FYcvEwxQb8o47Fc5cNUkV2iIcFx/b2nEO/I+b8Ckf0cdRi
	ZPLgQ27XeAfCzKuD5KpQsjRQCEugK094ZC5cfhSima+e1fr/9XmSsJg1jmk+x26xfNirU5SOwhqgL
	RiDMsMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwpr-0000000DBzL-2Uj6;
	Fri, 27 Jun 2025 00:20:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUviZ-0000000D1E5-3hqb
	for ath10k@lists.infradead.org;
	Thu, 26 Jun 2025 23:09:21 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-45377776935so16545765e9.3
        for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 16:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750979358; x=1751584158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I984LjdCSI2og4FoX/by4gyCjX2JLqS5cCJCVpz/WdQ=;
        b=jMjl9P8ytAthGfPKm8rg7F9MnSs7JqQ3myL6WYYujLI2L+yUHoWxNSKuT+TMok4mpm
         ygI6VUnasfBAPJO5Ero4dRLJQdBopFRwadGsLxU8x83fzLeZ3Ko2UgLx8kW+xeUehDQd
         a1xy512LvgntjSDCrUXskFWak+ntTnIvUbNDMOI1Z0sXv6qja1dJ0aVbsjoIRlqiEP6g
         yKgCNR5vOUwB5hJQUk4bm6s2HncrUbBDHekrH6n5YOJ6I7m8hFpO1AOMBJ9jtg9HaH5c
         8HKPJKxmpqhmIWoYo04d3om7cBKm89sXN+hdPWqaFy+lF9m6gYEeSRMR3xm5rU/Ngv+k
         1wjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979358; x=1751584158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I984LjdCSI2og4FoX/by4gyCjX2JLqS5cCJCVpz/WdQ=;
        b=AZsQbL7GQSTSU3jIh6l61dSPDYiSvkbb0jIYAHPahrmR2XKBm0iDH0a8YvlUzlRUbQ
         Xre45VfKr0CGarcFYNq606U5vMVU3vwk6oWz9xorBODNR1b/r3su0fNM7wyh1z265JsR
         Wtlq6EzoDW0HmR/48D5cuiuc+vCM6kWn3eOMJHaeppIYnqX6ioA0xf0PwEcPkVfx3Qp5
         Elps/S3nrxA7HGN/rkVJPaDBH/CFBPjGQi/wfb231tOHG1rUBKaGRWg3IpBTG24UFZxv
         wGCyEyGR7wwUdstsQBvkPKfqDGHwRIMDiq5GIH4FRHXHE4LWMgs0zfJ0VHPfETKoIWQp
         TNiw==
X-Forwarded-Encrypted: i=1; AJvYcCXXeeqjt2WTF6+wSr4rpLRfYD4WMjKgbVfp3xhjDwCvdmSfxv7QjnlfWuaSX1VQCl2+UmD/FNs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGNfdgghagQemEb52AdenCj2zvHu3mxjcuLvDJ5pZKpnh0qLUB
	0TbzShlIjDA/xyNPkcORIJAwLr1PQpP1KcCw2zIVVQkhgHHxim5UAOQ+iYa6BHznDA4=
X-Gm-Gg: ASbGncveXO1gMOr1ZWC5W7YcXplLtTfvSfRDbb3FZ04dDNfgniHvt1zzDxiKCkuGFcq
	becFl56q+WiLiH115pyKNbxAWn7rTgFD+zA3o6U7Z4wzrU/i0iTzvb0E5cOa3bYNUby7mX8MmmO
	5Ne4ih7QWnhz5eoFFcvy32+Dlpw6bO+hQEvow8DfeTTElQae99N6J1yHxFEOVQ4b13mRR5p+ttW
	Bx89QHMVkGAoGeRNLDt2BnJ9JVbIcl9IhF4xXXdC7OhLr5nrHtZyad4LNnaK38MWQaJx4MDbcxc
	dQ0RrnJ27FhLqPWKpVXo7wv0F4e/epp5sMc/9l9QYzl6ksqtPOtaZ+pFJ+Xa5FuK2KwYG0XfCrG
	G4nPp9BfwHKLCp/tl0MQZ3dFH24ZkMYT/PIIUpw==
X-Google-Smtp-Source: AGHT+IEDFLoM1pQr68aMEgp9Er98cj+bVVx1qoDX24JDkdLwRTa9t2VgKEse7pcv2zD5qy19rP/Gjg==
X-Received: by 2002:a05:600c:a40e:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-4538f8836bcmr3662345e9.30.1750979357707;
        Thu, 26 Jun 2025 16:09:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a421434sm32864855e9.37.2025.06.26.16.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:09:16 -0700 (PDT)
Message-ID: <5df11ee4-d645-4be2-841f-715343f1b7a4@linaro.org>
Date: Fri, 27 Jun 2025 00:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
To: Alexey Klimov <alexey.klimov@linaro.org>, jjohnson@kernel.org,
 ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org
References: <Zgp0ym-MGzX2eSZdlkVYbgvjkJ0CzKItjaC5pafzQnj1AOZnVAqvCIZfYoK7nwDhUgOA0U8eNolNtaWXbExOAQ==@protonmail.internalid>
 <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_160919_945965_5841912F 
X-CRM114-Status: GOOD (  21.42  )
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

On 26/06/2025 15:48, Alexey Klimov wrote:
> Hi all,
> 
> After a long time of testing it seems the problem narrows down to qrb2210 rb1
> and qrb4210 rb2 boards.
> 
> After booting, the board connects to the wifi network and after around ~5-10
> minutes it loses the connection (nothing in dmesg). A simple ping of another
> machine on the local network doesn't work. After, I guess, around 5000
> seconds the GROUP_KEY_HANDSHAKE_TIMEOUT message is printked:
> 
> [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=GROUP_KEY_HANDSHAKE_TIMEOUT)
> [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.100192] wlan0: authenticated
> [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [ 5067.193624] wlan0: associated
> 
> and after that wireless connection works for ~5-10 minutes and then the cycle
> repeats. The longer log with more info and some info with firmware versions,
> ids, etc is at the end of this email [1]. Simple wlan0 down and wlan0 up fixes
> things for a few minutes.
> 
> iw wlan0 link reports the following when wireless network is working:
> 
> root@rb1:~# iw wlan0 link
> Connected to 8c:58:72:d4:d1:8d (on wlan0)
>          SSID: void
>          freq: 5300
>          RX: 45802 bytes (424 packets)
>          TX: 71260 bytes (125 packets)
>          signal: -66 dBm
>          rx bitrate: 433.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 1
> 
> bss flags:      short-slot-time
> dtim period:    1
> beacon int:     100
> 
> and this when wireless connection doesn't work:
> 
> Connected to 8c:58:72:d4:d1:8d (on wlan0)
>          SSID: void
>          freq: 5300
>          RX: 850615 bytes (9623 packets)
>          TX: 20372 bytes (247 packets)
>          signal: -61 dBm
>          rx bitrate: 6.0 MBit/s
> 
>      bss flags:      short-slot-time
>      dtim period:    1
>      beacon int:     100
> 
> This was tested with three different routers and different wifi networks.
> Other devices here do not exhibit this behaviour.
> 
> Any hints on how to debug this? Any debug switches I can toggle to debug this?
> I am happy to provide more info or test changes/patches if any.
> 
> Thanks in advance.
> Best regards,
> Alexey
> 
> [1]:
> 
> [    7.758934] ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
> [    7.769740] ath10k_snoc c800000.wifi: qmi fw_version 0x337703a3 fw_build_timestamp 2023-10-14 01:26 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> [   11.086123] ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   11.095622] ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> [   11.103998] ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel crc32 a79c5b24
> [   11.144810] ath10k_snoc c800000.wifi: htt-ver 3.128 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> [   11.230894] ath10k_snoc c800000.wifi: invalid MAC address; choosing random
> [   11.238128] ath: EEPROM regdomain: 0x0
> [   11.242060] ath: EEPROM indicates default country code should be used
> [   11.248582] ath: doing EEPROM country->regdmn map search
> [   11.253950] ath: country maps to regdmn code: 0x3a
> [   11.258805] ath: Country alpha2 being used: US
> [   11.263466] ath: Regpair used: 0x3a
> [   15.355756] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [   15.363942] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [   15.372142] wlan0: authenticated
> [   15.377928] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [   15.386338] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [   15.466514] wlan0: associated
> [   23.167251] systemd-journald[195]: Oldest entry in /var/log/journal/ec3e0078e5e0499bac67949f3edf3fcf/system.journal is older than the configured file retention duration (1month), suggesting rotation.
> [   23.185186] systemd-journald[195]: /var/log/journal/ec3e0078e5e0499bac67949f3edf3fcf/system.journal: Journal header limits reached or header out-of-date, rotating.
> [   31.750177] l5: disabling
> [   31.753382] l11: disabling
> [   31.756385] l16: disabling
> [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=GROUP_KEY_HANDSHAKE_TIMEOUT)

So.

I wonder what state the GTK - offload is in here.

         WMI_GTK_OFFLOAD_CMDID = WMI_CMD_GRP(WMI_GRP_GTK_OFL),

drivers/net/wireless/ath/ath10k/wmi-tlv.c:	cfg->gtk_offload_max_vdev = 
__cpu_to_le32(2);

Try toggling that offload off or on and see what happens.

> [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.100192] wlan0: authenticated
> [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [ 5067.193624] wlan0: associated
> [10437.346541] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=GROUP_KEY_HANDSHAKE_TIMEOUT)
> [10440.340111] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [10440.348408] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [10440.356698] wlan0: authenticated
> [10440.361077] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [10440.369516] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [10440.446661] wlan0: associated
> 
You can put another device on your WiFi network into monitor mode and 
sniff what is taking place.

Kali Linux I've used in the past on an RPI for this purpose and it was 
very easy todo.

https://cyberlab.pacific.edu/resources/lab-network-wireless-sniffing

Another thing to try is to do this same test on an open - unencrypted link.

If we really suspect firmware here, lets try switching off firmware 
offload features one-by-one, starting with GTK offload.

---
bod

