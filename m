Return-Path: <SRS0=5jfJ=KV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EE4C4707F
	for <ath10k@archiver.kernel.org>; Wed, 26 May 2021 00:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED4261417
	for <ath10k@archiver.kernel.org>; Wed, 26 May 2021 00:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ED4261417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rwOE/73G+b3P/bB3NpO84TA5csp6X9UPS9aYu5YpvyE=; b=uDsfjFfp1YopkD
	j5PeW3XL1g83i1fOZp4hkbXbV+sUMKDprVnDrr50zKIn+k7ikWduFPiOBaodRz3Sqgy4CZhkuHYpf
	M4T/aK7VnHbVyqvLKD1FWwAGHkZZawH5dVmzIoRvo6I020Gjo1+ie6SKORA2f6XPHBvG0dtQfI0rI
	1/WrMjShjerAJGxA0NmDZP/Gmf5+UGXNncC8wtbTjpJUrHx1loQP6lvDpqCXasui0S56pYXUOAwho
	G4k+vrc13iNZv0BWy/2iT40kHZlmzOyvzmuzWZKIMUj19D9ysOT2ounl4z2VED+tCyObRY3ECRK5f
	Ar8CsE0zZv7sCKjoBiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llhav-009YFg-Sa; Wed, 26 May 2021 00:40:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llhat-009YDP-4Z
 for ath10k@lists.infradead.org; Wed, 26 May 2021 00:40:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id a2so48805613lfc.9
 for <ath10k@lists.infradead.org>; Tue, 25 May 2021 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ypVMTn6I7nsagousMXgHvo+LlfnyFeUFfmChgDMMp1A=;
 b=j3MZryKZPjJpMCTmfi00Q8OPFtMaRd6sIvLyIr/my6dmWSLbb9tfGi9WM0i8tJF5TG
 Ws7LaWQ+bIF5cXIr/FjCnYtAPe0v6/GX+YanyF1jr/5hV1q995pJEEK9ORjTSynOb/t8
 o0/b6eA4jbnHdH5ACDpMJi7QPoXlfRFP43ZnxcTdjb6Eve2kClYtPSsqPa9avWxpDv2Q
 i/Cg1cy/L13LY+ku4KmtxC0R/f0BFAou204y+zkAqw4EgnAAU8vXYKpkeMM3vJxaY5fd
 ZFB7DSQLwXdOAoN1B7DY6zXRfaxb6Xar996ydW0HoA9PVWOJ4RMfZqHngG3Lc+fDU3vH
 OeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ypVMTn6I7nsagousMXgHvo+LlfnyFeUFfmChgDMMp1A=;
 b=sXKBxj773/5a0mJcBq4F15KszCmzrbLSb126lbQzcdcgQtx7sAkE9IJjsLSCzJ693Q
 cleqU2ViBWKLfvJO2us+es4/dDGASUykmR6TgEac6+tpb8+OZEiFB3qkBFuoWPZPp1kK
 tK0HK5Bsi7Q3nfdYkLQENfAi0Vd2JPR/12kj/qYDZuEhov4A1xoIlAj3bAgSQmb/S+D/
 EJpkg7BkQzW4wbNS9BcNbM/MsSfnqAh+X3YInPJ+Kc5bf87O0/oaXOyLyj5wv/nZUFAv
 AAqX4J24Y1Thpdw55YgCceRHEaClbHOUio63f3hzF+B6gNt9AVKwgW7HRI4RBp+gRS5C
 8Q7w==
X-Gm-Message-State: AOAM532a30+HtxBKTIVnfIhpflFv9BYYZB2mshkt/J3o42IZQ9qkNCV9
 cl3kRmOEXANdxVrgL1CdEy/0W0x/inUemmHcg9o=
X-Google-Smtp-Source: ABdhPJz87YSsBwtBaFfNRE1dUxbbpX1EeVZk2axI1UZgH2m6pnnVivmKVu+jb/vFl60qRO6zkveiRjPjqdJ18roeKiA=
X-Received: by 2002:a05:6512:1191:: with SMTP id
 g17mr210922lfr.500.1621989616610; 
 Tue, 25 May 2021 17:40:16 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 May 2021 21:40:05 -0300
Message-ID: <CAOMZO5DPAr0XPHefewjF2fx7UL+7RvycAYLZdfosOUT6bwWHBA@mail.gmail.com>
Subject: ath10k_sdio: Long time for loading firmware and RCU errors
To: Christian Hewitt <christianshewitt@gmail.com>, 
 Gary Bisson <gary.bisson@boundarydevices.com>, gerg@kernel.org,
 erik.stromdahl@gmail.com, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_174019_221920_3C909006 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I am using the QCA9377 chip on an imx6dl-pico-pi board running kernel
5.10.37 and I noticed that the firmware takes a long time to load
(more than 3 minutes after boot):

[  192.544227] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target
0x05020001 chip_id 0x00000000 sub 0000:0000
[  192.554451] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[  192.566465] ath10k_sdio mmc1:0001:1: firmware ver
WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
7746e551
[  192.765756] ath10k_sdio mmc1:0001:1: failed to fetch board data for
bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
from ath10k/QCA9377/hw1.0/board-2.bin
[  192.784424] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A
crc32 544289f7
[  194.081698] ath10k_sdio mmc1:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[  194.160101] mmc1: queuing unknown CIS tuple 0x01 (3 bytes)
[  194.177321] mmc1: queuing unknown CIS tuple 0x1a (5 bytes)
[  194.187873] mmc1: queuing unknown CIS tuple 0x1b (8 bytes)
[  194.194279] mmc1: queuing unknown CIS tuple 0x14 (0 bytes)

And then when I try to use it the following RCU messages are seen:

# wpa_supplicant  -iwlan0 -c /etc/wpa.conf &
# Successfully initialized wpa_supplicant
[  234.360447] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.390478] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.409903] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.461811] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.513919] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.566124] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.669870] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.721845] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.773752] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
[  234.877801] NOHZ tick-stop error: Non-RCU local softirq work is
pending, handler #08!!!
wlan0: CTRL-EVENT-REGDOM-CHANGE init=BEACON_HINT type=UNKNOWN

# wlan0: SME: Trying to authenticate wit[  239.203438] wlan0:
authenticate with xx:xx:xx:xx:xx:xx
h d4:b9:2f:2a:f8:64 (SSID='FABIOHOUSE' freq=2412 MHz)
[  239.264154] wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
[  239.280319] wlan0: authenticated
wlan0: Trying to associate with xx:xx:xx:xx:xx:xx(SSID='FABIOHOUSE'
freq=2412 MHz)
[  239.296632] wlan0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
[  239.309133] wlan0: RX AssocResp from xx:xx:xx:xx:xx:xx(capab=0x411
status=0 aid=4)
[  239.336270] wlan0: associated
wlan0: Associated with xx:xx:xx:xx:xx:xx
wlan0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
wlan0: WPA: Key negotiation completed
[  239.553262] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
with xx:xx:xx:xx:xx:xx [PTK=CCMP GTK=CCMP]
wlan0: CTRL-EVENT-CONNECTED - Connection to xx:xx:xx:xx:xx:xx
completed [id=0 id_str=]

Despite the two problems reported above the Wifi connection works:

# udhcpc -i wlan0
udhcpc: started, v1.33.0
udhcpc: sending discover
udhcpc: sending select for 192.168.0.19
udhcpc: lease of 192.168.0.19 obtained, lease time 86400
deleting routers
adding dns x.y.z.w
adding dns x.y.z.w

# ping google.com
PING google.com (172.217.29.110): 56 data bytes
64 bytes from a.b.c.d: seq=0 ttl=113 time=27.756 ms
64 bytes from a.b.c.d: seq=1 ttl=113 time=32.397 ms
64 bytes from a.b.c.d: seq=2 ttl=113 time=31.407 ms
64 bytes from a.b.c.d seq=3 ttl=113 time=30.491 ms

Does anyone have any suggestions for fixing these two issues? I have
also tested 5.12.4 with the same results. Using the QCA9377 firmware
from the latest linux-firmware tree.

Thanks,

Fabio Estevam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
