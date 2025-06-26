Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E670DC7EE30
	for <ath10k@archiver.kernel.org>; Thu, 26 Jun 2025 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iJwlXkm7kquT9VL2iSx95X+5Uf83x9tlRzgwBHxTlN8=; b=DmHRmc5hPorevdIZTl52LbamKk
	+/MNwD4AmC0GhQaa+wXu4QE9gKPDlaJHQh4PVNJ3HIJABeTWSBaLWWqY9oaNM+E5Xvhvhwk7lep6O
	Bz15TCg87M9B0OTLBPEYpCPgMxeI5ss8WaxahIEXJ0A407QZc4ITe6xhW7rIVu7TarNfO025Nh+Be
	c/Ri9opbIwQ8/Zl13yErgXD04wkVBgL243cUTXBqYvpTBHqHB3sh3/UAg3PmIQsvYcRGU2XpYMxrN
	pcU7ets7DBAyG8GIa9pyyQJDKCA7T+Dao/hv7o6CJOW8MYfcxyaiJjgfIo/uhi5qtLQU931jnoG8C
	IjghJf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuC-0000000Bzbp-3sF9;
	Thu, 26 Jun 2025 14:48:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUntk-0000000BzOS-1TZt
	for ath10k@lists.infradead.org;
	Thu, 26 Jun 2025 14:48:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45310223677so6652615e9.0
        for <ath10k@lists.infradead.org>; Thu, 26 Jun 2025 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750949298; x=1751554098; darn=lists.infradead.org;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJwlXkm7kquT9VL2iSx95X+5Uf83x9tlRzgwBHxTlN8=;
        b=KWDrBGkwWJNJswNQ/AA3xEWWIGzR73+YGX963BpyMhIGmsI0nWK+HvEpG8tzSpjcSD
         5eTaryMqRKtYHi4Zm7ffVQpFt6TWQ/S53KSbpkeFmzv9y8kc2j+Ln/jrIVry2mWROgXo
         mtfLH7M2m5pdLx98GTaUmOffHqI8NurXvbbAhcajjrcin8VTimO+I3lEz2K4sYOwsfl7
         sYWRAsyUIx/DYkQqioObDeJDb1gTmJeT0M0e9vW0muKAXo0NJOAcL5jfMoWrxPyRwqlc
         4Ph/Vq5nDlp4cJh2k/wFJwHFoJitO1wKdVzYs3JsxC9xGL2NZ2pCkFy2DuA6IWV+pAIA
         LiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949298; x=1751554098;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJwlXkm7kquT9VL2iSx95X+5Uf83x9tlRzgwBHxTlN8=;
        b=eZbjUAlAbbCe18WOEpVC7BF7GFY016GxGhi4XnKyzXlObVb2oa8+Ai6EHkoAKOrls3
         Vxi+vxvNkWqtrgQeIwB5RymLUvyjeGdXMgSynBcgI6FnIRPXpxU/T2PyLgPAOo0H4bfR
         eqlZ8OpoS3ZG2h1qKc+RlUs90y4AkcDNqhId20V0MVSfaVdS6T4pcIS0x3t4vKND8coq
         ZvSClT9LJXPU0tvxLu2gr73k5haqsDhpQ4OixBlnSfM6ZjRLFu/C1ezas4jiao1qlc/w
         FHnTg3i2S+QiBN+vh1ZYCX36AlM6ppoIxgB3QgN1ietATbaZBKdOObe9Ik1wXdLWNtj/
         Z93g==
X-Forwarded-Encrypted: i=1; AJvYcCUHnmjIdNU4dS86YgkyQfgtor3p5KSlSgDBVHgnQ+k8qOQWVZHe6Q6KsRehGo87V30WzkY+fEU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwnGk4GvbAqBVcuyZUesBNeJqwUmAIwF+yp/RsZDHzlCAqrwdg
	6Q42umjp5QJhz/SpQQ0aKiRm9f6vfCTIEtg0MB+SzSClyQVnYP8W0m7E4LS4RFmXcgw=
X-Gm-Gg: ASbGncuoFep3FLtxh/vCQ8cKvQKBsqtP4GS0XdSFNmIMuKFhGioepcoLzgccfxPMnrD
	Yx41M3H4p7G7QpEIJspedc4A8xv0UfCNwgNNw9ihjVg43DDDfX8PsTIozuUDlEGZrbUoS7303cs
	G/M1G0nEAM6LsI2wkwBj28XW/ZNCVGz/hWeWMQBtmPv4fb5mR7npRrry+BiJTgk8u0NzWAo1gMA
	5kRtc88ITKCA/8U9FKAmJA6qEBTSqJ3PCufwO1OJ1ftYtY56ePUBYY+5c5j0jJvI3MsMzffEK3/
	Bfbyg9V68zNVBsO+fx6zb/l6LDaxaiJ0b9DPH/fZE0zEaKp4VHksVqsUNMbZ2DYJBShuoycLoaG
	x+A==
X-Google-Smtp-Source: AGHT+IFeME8z8xyt10nAyrnqInmUfp/yZ6rndW5t7mimqK/e6IHzphs36nsFBZGRV/KKh3o/5tTo2w==
X-Received: by 2002:a05:600c:8b45:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-45381a9f5a2mr69583125e9.4.1750949298311;
        Thu, 26 Jun 2025 07:48:18 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3b3213sm21843175e9.18.2025.06.26.07.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:48:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 15:48:17 +0100
Message-Id: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Cc: <linux-wireless@vger.kernel.org>, <jeff.johnson@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>
Subject: [question, bug] regularly disconnecting wifi on RB1 and RB2 boards,
 ath10
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <jjohnson@kernel.org>, <ath10k@lists.infradead.org>
X-Mailer: aerc 0.20.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074820_390304_525B503C 
X-CRM114-Status: UNSURE (   8.91  )
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

Hi all,

After a long time of testing it seems the problem narrows down to qrb2210 r=
b1
and qrb4210 rb2 boards.

After booting, the board connects to the wifi network and after around ~5-1=
0
minutes it loses the connection (nothing in dmesg). A simple ping of anothe=
r
machine on the local network doesn't work. After, I guess, around 5000
seconds the GROUP_KEY_HANDSHAKE_TIMEOUT message is printked:

[ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=3D=
GROUP_KEY_HANDSHAKE_TIMEOUT)
[ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=3D=
82:95:77:b1:05:a5)
[ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
[ 5067.100192] wlan0: authenticated
[ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
[ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x11 sta=
tus=3D0 aid=3D2)
[ 5067.193624] wlan0: associated

and after that wireless connection works for ~5-10 minutes and then the cyc=
le
repeats. The longer log with more info and some info with firmware versions=
,
ids, etc is at the end of this email [1]. Simple wlan0 down and wlan0 up fi=
xes
things for a few minutes.

iw wlan0 link reports the following when wireless network is working:

root@rb1:~# iw wlan0 link
Connected to 8c:58:72:d4:d1:8d (on wlan0)
        SSID: void
        freq: 5300
        RX: 45802 bytes (424 packets)
        TX: 71260 bytes (125 packets)
        signal: -66 dBm
        rx bitrate: 433.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 1

bss flags:      short-slot-time
dtim period:    1
beacon int:     100

and this when wireless connection doesn't work:

Connected to 8c:58:72:d4:d1:8d (on wlan0)
        SSID: void
        freq: 5300
        RX: 850615 bytes (9623 packets)
        TX: 20372 bytes (247 packets)
        signal: -61 dBm
        rx bitrate: 6.0 MBit/s

    bss flags:      short-slot-time
    dtim period:    1
    beacon int:     100

This was tested with three different routers and different wifi networks.
Other devices here do not exhibit this behaviour.

Any hints on how to debug this? Any debug switches I can toggle to debug th=
is?
I am happy to provide more info or test changes/patches if any.

Thanks in advance.
Best regards,
Alexey

[1]:

[    7.758934] ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x40=
07 board_id 0xff soc_id 0x40670000
[    7.769740] ath10k_snoc c800000.wifi: qmi fw_version 0x337703a3 fw_build=
_timestamp 2023-10-14 01:26 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HL.3=
.3.7.c2-00931-QCAHLSWMTPLZ-1
[   11.086123] ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 ch=
ip_id 0x00000000 sub 0000:0000
[   11.095622] ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing =
0 dfs 0 testmode 0
[   11.103998] ath10k_snoc c800000.wifi: firmware ver  api 5 features wowla=
n,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel crc32 a79c5b24
[   11.144810] ath10k_snoc c800000.wifi: htt-ver 3.128 wmi-op 4 htt-op 3 ca=
l file max-sta 32 raw 0 hwcrypto 1
[   11.230894] ath10k_snoc c800000.wifi: invalid MAC address; choosing rand=
om
[   11.238128] ath: EEPROM regdomain: 0x0
[   11.242060] ath: EEPROM indicates default country code should be used
[   11.248582] ath: doing EEPROM country->regdmn map search
[   11.253950] ath: country maps to regdmn code: 0x3a
[   11.258805] ath: Country alpha2 being used: US
[   11.263466] ath: Regpair used: 0x3a
[   15.355756] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=3D=
82:95:77:b1:05:a5)
[   15.363942] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
[   15.372142] wlan0: authenticated
[   15.377928] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
[   15.386338] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x11 sta=
tus=3D0 aid=3D2)
[   15.466514] wlan0: associated
[   23.167251] systemd-journald[195]: Oldest entry in /var/log/journal/ec3e=
0078e5e0499bac67949f3edf3fcf/system.journal is older than the configured fi=
le retention duration (1month), suggesting rotation.
[   23.185186] systemd-journald[195]: /var/log/journal/ec3e0078e5e0499bac67=
949f3edf3fcf/system.journal: Journal header limits reached or header out-of=
-date, rotating.
[   31.750177] l5: disabling
[   31.753382] l11: disabling
[   31.756385] l16: disabling
[ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=3D=
GROUP_KEY_HANDSHAKE_TIMEOUT)
[ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=3D=
82:95:77:b1:05:a5)
[ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
[ 5067.100192] wlan0: authenticated
[ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
[ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x11 sta=
tus=3D0 aid=3D2)
[ 5067.193624] wlan0: associated
[10437.346541] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=3D=
GROUP_KEY_HANDSHAKE_TIMEOUT)
[10440.340111] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=3D=
82:95:77:b1:05:a5)
[10440.348408] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
[10440.356698] wlan0: authenticated
[10440.361077] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
[10440.369516] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x11 sta=
tus=3D0 aid=3D2)
[10440.446661] wlan0: associated

