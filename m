Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB8DC87FC5
	for <ath10k@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSQ2e5Ukh+OSMFXmOt+aMGcava2/LQ659PBJk/zaZDA=; b=EkPGxqURroIlHjrSOS/mP2GlWt
	AoQTkB0eQvZ9FsKHjZu91sFXJ9/YuAtBTXIUG+WTMgYiwrxrc4nmysV3L+Fjqr6t5YRyEeaBaq/Zv
	k6H9B0aBVrX6/Rgz6sfj2ZdzV/XiXiUAxl3DnwK0rJ2ZpTkdZMu819l3hI0ucIL+CrzwkoY9JH/7A
	KAkdFaaatrBwdvU1CIB/V4SMtxI+j8IRA+PuwLbhk1g4RnIfJ5RDr/cLZpB1wVEP3hfae4xIwzV3y
	7XitJ7vHTu5QmTYYtuEFytrWMkWgDKuXFUnwn6pLtWwFg3qwdO6kdUhlyMxt0SnuYLxam2cgkJkUR
	72R5cZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNr-000000083SZ-3GdC;
	Thu, 24 Jul 2025 17:05:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexH8-00000007mj0-1kh9
	for ath10k@lists.infradead.org;
	Thu, 24 Jul 2025 14:50:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so8471865e9.3
        for <ath10k@lists.infradead.org>; Thu, 24 Jul 2025 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753368624; x=1753973424; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSQ2e5Ukh+OSMFXmOt+aMGcava2/LQ659PBJk/zaZDA=;
        b=kCWdYHomZ52uwrJhr8VOhHtIvtNXGvYWJGSUa1USw+rGY8XU19vTqtVsxfw027dwFE
         nj2Kjww/SNJvUgdo7xEW7gxQNqrV7T7tY7XLYLFhGOYGcGTus8sTERHHeg00LuxXJSLf
         2j4DxPAuyDPWkhpvhE6OoakW809Eaudx3azmu9eggCILvkFIpirJ0VOiRgpSO25fgYmL
         tr3sJouazLUmgA8PFZjjyjtMvKMsiXU00viqTMTcnBooPyYm5Lt3hZaovXhR6IqIpNdp
         a6pf1zpo8l5/mMoOQzRnC/XOyDPvjj5nhLWWLYmJqMFN/6+dwPJRJUl1/tm5qcAgCPn4
         BgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368624; x=1753973424;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSQ2e5Ukh+OSMFXmOt+aMGcava2/LQ659PBJk/zaZDA=;
        b=fQqXXkbx/oPT8XLs7WhE0VXMZKFFJEKOh3EwpRLbgNUgu3xgfKmLIN+7WK93XAhDCc
         eSpSVuGzK79+XHw7KGhXE3z2kl0gz06ABtVzNxFM2xnLuCh4QFkZYU8jcuUViRNpFNuD
         iEsATphUSLGnChz55KqkgCk0136aTt0SDBkOWP27p7pDPNlEfWgwUvXMu9Y4jXrzj00d
         2cbswUxjPwtCcqe54noRpuoph4W+j0O03XK/hLrFe1nOe01ZnTYvzp7FTclR5Le+1NiX
         6jU+Cu67mD8ilUHCdR5oz0ybiMfGPMVdSJd35+KMRSn+/64iV4IwWTc7f/P1hS8WWqJH
         FZaA==
X-Forwarded-Encrypted: i=1; AJvYcCVvcCx6YpBvKML1QGEzEyORU4xKzpakwss9UUUVAqy1X8baGeTv4U2NA8VaD0l2v/J6EynlYgA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0HB7gzsk/zVkroHaie2PY2YXY8j5kq4XCJa5SUopq+gacG9pg
	9sUOjP0fhNu+oDaly9mMyz0qX4Ld1EYVi6auf/hktYrLDP5mnkLwe+5+vOT92QS9a90=
X-Gm-Gg: ASbGncuLTtmTQZCJtJYDsaUwmXOp+0eVJSe5vyA8yRcI8bhlWmRLVtMypuxwfp0hDFd
	HPInulHmRQEivyLv+/IKKHmoQfD+WiloO8r8C9Dv6N9nmP2oasPkKZQmdo7osX0XkDZs1HFhtMU
	xT24TfHQpSm7Pt/6SxyeeyQFzkl1CHGyQhdhFDCUnvkYWjCdM5TaKoAggLkkf+SyO+cvnDo/CM/
	RHNlAHb5grn2lyf6glpOLiO0uoeXp1QgRuic1H26oS0OnY/FWXbraenSa9zEIwyKHxYFw26Q3hn
	5vp+XEwjZV7JbYfhkweXzUgOCh8b62eiLzaV+CUOd9r2bJV6CvUyMOcLUZc8Yul8oqrVRWVDgWp
	lUF5HeV5rM9ImybHdxjyXhv2e1MI=
X-Google-Smtp-Source: AGHT+IFqO4ntehoEF4kO6OCrr9ISOQHx6+YtV7vjh6jjeQE1JlhK4Ccrv+abJqQBg4d7I+32KHeQZg==
X-Received: by 2002:a05:600c:45c3:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-45868d69d8emr64877745e9.27.1753368624162;
        Thu, 24 Jul 2025 07:50:24 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705c4dbdsm23975875e9.25.2025.07.24.07.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:50:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 15:50:22 +0100
Message-Id: <DBKDAXJ0V9U0.10YYX5H5HAJBT@linaro.org>
Cc: <jjohnson@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <jeff.johnson@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <Zgp0ym-MGzX2eSZdlkVYbgvjkJ0CzKItjaC5pafzQnj1AOZnVAqvCIZfYoK7nwDhUgOA0U8eNolNtaWXbExOAQ==@protonmail.internalid> <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org> <5df11ee4-d645-4be2-841f-715343f1b7a4@linaro.org> <CAFEp6-0zwy2JdFOvRQ5ghMwD-J6b7F5YcVKNf-5R=8XdEpGDSw@mail.gmail.com> <CAFEp6-1wO9xwisOAtv6D__nb3Uo=8_f9rHifi-JAQ0oPD+JSVg@mail.gmail.com>
In-Reply-To: <CAFEp6-1wO9xwisOAtv6D__nb3Uo=8_f9rHifi-JAQ0oPD+JSVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_075026_467439_FADCEB2D 
X-CRM114-Status: GOOD (  40.95  )
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

Hi Loic,

On Wed Jul 23, 2025 at 11:42 AM BST, Loic Poulain wrote:
> Hi Alexey,
>
> On Tue, Jul 22, 2025 at 5:53=E2=80=AFPM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
>>
>> On Fri, Jun 27, 2025 at 1:09=E2=80=AFAM Bryan O'Donoghue
>> <bryan.odonoghue@linaro.org> wrote:
>> >
>> > On 26/06/2025 15:48, Alexey Klimov wrote:
>> > > Hi all,
>> > >
>> > > After a long time of testing it seems the problem narrows down to qr=
b2210 rb1
>> > > and qrb4210 rb2 boards.
>> > >
>> > > After booting, the board connects to the wifi network and after arou=
nd ~5-10
>> > > minutes it loses the connection (nothing in dmesg). A simple ping of=
 another
>> > > machine on the local network doesn't work. After, I guess, around 50=
00
>> > > seconds the GROUP_KEY_HANDSHAKE_TIMEOUT message is printked:
>> > >
>> > > [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason=
: 16=3DGROUP_KEY_HANDSHAKE_TIMEOUT)
>> > > [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local add=
ress=3D82:95:77:b1:05:a5)
>> > > [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
>> > > [ 5067.100192] wlan0: authenticated
>> > > [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
>> > > [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0=
x11 status=3D0 aid=3D2)
>> > > [ 5067.193624] wlan0: associated
>> > >
>> > > and after that wireless connection works for ~5-10 minutes and then =
the cycle
>> > > repeats. The longer log with more info and some info with firmware v=
ersions,
>> > > ids, etc is at the end of this email [1]. Simple wlan0 down and wlan=
0 up fixes
>> > > things for a few minutes.
>> > >
>> > > iw wlan0 link reports the following when wireless network is working=
:
>> > >
>> > > root@rb1:~# iw wlan0 link
>> > > Connected to 8c:58:72:d4:d1:8d (on wlan0)
>> > >          SSID: void
>> > >          freq: 5300
>> > >          RX: 45802 bytes (424 packets)
>> > >          TX: 71260 bytes (125 packets)
>> > >          signal: -66 dBm
>> > >          rx bitrate: 433.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 1
>> > >
>> > > bss flags:      short-slot-time
>> > > dtim period:    1
>> > > beacon int:     100
>> > >
>> > > and this when wireless connection doesn't work:
>> > >
>> > > Connected to 8c:58:72:d4:d1:8d (on wlan0)
>> > >          SSID: void
>> > >          freq: 5300
>> > >          RX: 850615 bytes (9623 packets)
>> > >          TX: 20372 bytes (247 packets)
>> > >          signal: -61 dBm
>> > >          rx bitrate: 6.0 MBit/s
>> > >
>> > >      bss flags:      short-slot-time
>> > >      dtim period:    1
>> > >      beacon int:     100
>> > >
>> > > This was tested with three different routers and different wifi netw=
orks.
>> > > Other devices here do not exhibit this behaviour.
>> > >
>> > > Any hints on how to debug this? Any debug switches I can toggle to d=
ebug this?
>> > > I am happy to provide more info or test changes/patches if any.
>> > >
>> > > Thanks in advance.
>> > > Best regards,
>> > > Alexey
>> > >
>> > > [1]:
>> > >
>> > > [    7.758934] ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_fami=
ly 0x4007 board_id 0xff soc_id 0x40670000
>> > > [    7.769740] ath10k_snoc c800000.wifi: qmi fw_version 0x337703a3 f=
w_build_timestamp 2023-10-14 01:26 fw_build_id QC_IMAGE_VERSION_STRING=3DWL=
AN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
>> > > [   11.086123] ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x0000=
0008 chip_id 0x00000000 sub 0000:0000
>> > > [   11.095622] ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 t=
racing 0 dfs 0 testmode 0
>> > > [   11.103998] ath10k_snoc c800000.wifi: firmware ver  api 5 feature=
s wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel crc32 a7=
9c5b24
>> > > [   11.144810] ath10k_snoc c800000.wifi: htt-ver 3.128 wmi-op 4 htt-=
op 3 cal file max-sta 32 raw 0 hwcrypto 1
>> > > [   11.230894] ath10k_snoc c800000.wifi: invalid MAC address; choosi=
ng random
>> > > [   11.238128] ath: EEPROM regdomain: 0x0
>> > > [   11.242060] ath: EEPROM indicates default country code should be =
used
>> > > [   11.248582] ath: doing EEPROM country->regdmn map search
>> > > [   11.253950] ath: country maps to regdmn code: 0x3a
>> > > [   11.258805] ath: Country alpha2 being used: US
>> > > [   11.263466] ath: Regpair used: 0x3a
>> > > [   15.355756] wlan0: authenticate with 8c:58:72:d4:d1:8d (local add=
ress=3D82:95:77:b1:05:a5)
>> > > [   15.363942] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
>> > > [   15.372142] wlan0: authenticated
>> > > [   15.377928] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
>> > > [   15.386338] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0=
x11 status=3D0 aid=3D2)
>> > > [   15.466514] wlan0: associated
>> > > [   23.167251] systemd-journald[195]: Oldest entry in /var/log/journ=
al/ec3e0078e5e0499bac67949f3edf3fcf/system.journal is older than the config=
ured file retention duration (1month), suggesting rotation.
>> > > [   23.185186] systemd-journald[195]: /var/log/journal/ec3e0078e5e04=
99bac67949f3edf3fcf/system.journal: Journal header limits reached or header=
 out-of-date, rotating.
>> > > [   31.750177] l5: disabling
>> > > [   31.753382] l11: disabling
>> > > [   31.756385] l16: disabling
>> > > [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason=
: 16=3DGROUP_KEY_HANDSHAKE_TIMEOUT)
>> >
>> > So.
>> >
>> > I wonder what state the GTK - offload is in here.
>> >
>> >          WMI_GTK_OFFLOAD_CMDID =3D WMI_CMD_GRP(WMI_GRP_GTK_OFL),
>> >
>> > drivers/net/wireless/ath/ath10k/wmi-tlv.c:      cfg->gtk_offload_max_v=
dev =3D
>> > __cpu_to_le32(2);
>> >
>> > Try toggling that offload off or on and see what happens.
>> >
>> > > [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local add=
ress=3D82:95:77:b1:05:a5)
>> > > [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
>> > > [ 5067.100192] wlan0: authenticated
>> > > [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
>> > > [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0=
x11 status=3D0 aid=3D2)
>> > > [ 5067.193624] wlan0: associated
>> > > [10437.346541] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason=
: 16=3DGROUP_KEY_HANDSHAKE_TIMEOUT)
>> > > [10440.340111] wlan0: authenticate with 8c:58:72:d4:d1:8d (local add=
ress=3D82:95:77:b1:05:a5)
>> > > [10440.348408] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
>> > > [10440.356698] wlan0: authenticated
>> > > [10440.361077] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
>> > > [10440.369516] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0=
x11 status=3D0 aid=3D2)
>> > > [10440.446661] wlan0: associated
>> > >
>> > You can put another device on your WiFi network into monitor mode and
>> > sniff what is taking place.
>> >
>> > Kali Linux I've used in the past on an RPI for this purpose and it was
>> > very easy todo.
>> >
>> > https://cyberlab.pacific.edu/resources/lab-network-wireless-sniffing
>> >
>> > Another thing to try is to do this same test on an open - unencrypted =
link.
>> >
>> > If we really suspect firmware here, lets try switching off firmware
>> > offload features one-by-one, starting with GTK offload.
>> >
>> > ---
>> > bod
>> >
>>
>> I configured the GTK rekey interval to one minute and encountered a
>> similar issue. It appears that something may be going wrong after the
>> GTK rekeying process completes.
>>
>> The GTK update is handled entirely by wpa_supplicant (not offloaded),
>> and while the new key seems to be installed correctly, with frames
>> still being transmitted and received (from aircap perspective), they
>> appear to be dropped or mishandled in the RX firmware path.
>>
>> This suggests there might be an issue with how the new keys are being
>> applied or interpreted by the firmware. I=E2=80=99ll continue debugging =
to
>> pinpoint the root cause.
>>
>> Regards,
>> Loic
>
> Could you check if this change helps:
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
> b/drivers/net/wireless/ath/ath10k/mac.c
> index c61b95a928da..4fa7dd62aeac 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -288,8 +288,10 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
>                 key->flags |=3D IEEE80211_KEY_FLAG_GENERATE_IV;
>
>         if (cmd =3D=3D DISABLE_KEY) {
> -               arg.key_cipher =3D ar->wmi_key_cipher[WMI_CIPHER_NONE];
> -               arg.key_data =3D NULL;
> +               /*  Not all hardware supports key deletion operations. so=
 we
> +                *  replace the key with a junk value to invalidate it.
> +                */
> +               memset(arg.key_data, 0, arg.key_len);
>         }

Thank you. I'll check and respond.

Best regards,
Alexey


