Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF67E77188
	for <ath10k@archiver.kernel.org>; Fri, 10 Jan 2025 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:From:To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgfEYv+2aiSHCthWCdU/LTGlSBMauBxuASb/7UTvZnQ=; b=f0rj1T6oB66lZiiC4EGEHrQr4i
	OUyhUSqrVTI+OO1OO+4uE7lwPJV2kRb46M2gs6rC0HFayD2IVu65ieM5tLerVfR0f/Vw7kPLPQvmY
	VwWYwWvkH1dLTmlBsmCWFdOio/iYfk9c/W3/awvUfKHMaE54THSQJZASJvXzwQYNSLKI+OZiCDD+O
	F0NiC8Ft1FJXj+1FTwnJDwQvHkJh8G0uBZ7ZS+yzFrC7jVzNPy11CLL/w1egB0mKJ8gcOHxycXMMU
	vW8P7e0m8JgQEXV3uggaqG+mxXre3ONF4kraL4j7wETh+mEAB86j1y4T8LQUhpR3JBl0FHpdQJvfj
	z1cgdumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCUJ-0000000Ezkp-0wJv;
	Fri, 10 Jan 2025 10:43:35 +0000
Received: from mail-10696.protonmail.ch ([79.135.106.96])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCUG-0000000EzkP-1z29
	for ath10k@lists.infradead.org;
	Fri, 10 Jan 2025 10:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1736505809; x=1736765009;
	bh=WgfEYv+2aiSHCthWCdU/LTGlSBMauBxuASb/7UTvZnQ=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UHFnSJLFyyYdjbdimRduNYUh0BUux9Lvu0CM40XaUGk8sNIVs38BhoZsMD+SbJM9l
	 15EFO91b3wHBZMry03bln0WkoRn3K52MpngXHqrWz+cAMIzZq61FqGDrW4CcuCncos
	 yoTKlTq/Y3aQmTY9s21CRooWiZ2QzXjsGBjOIYeX6wtvV02/h5ecCt3nZqmbUuD+sh
	 YALPEaqzKU1QxHscbatetdWmOzem4aT91cw+YJFKLpekxdVNwIDyDCWG27RyxhqtE1
	 r2ZRuYOZrtSX+vT0j/ldbsqQaXAqBfbbROqnmzVOf6+Gy86rcsy8Zz8UCgaq0XItC0
	 o48sGVJo6iT2A==
Date: Fri, 10 Jan 2025 10:43:24 +0000
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
From: smaxxx <smaxxx@protonmail.com>
Subject: Re: Slow WiFi speed on QC9377
Message-ID: <ph8MqbGHbHR3_t7MZ-gpZF_RF9NQemCzXCHlkN4lcd0ZWZ_u5axS-5G39iWfuxoIpUV3VMxT7zTduKbyu9MOXMb__A6GJOVBFBkfn9crNUE=@protonmail.com>
In-Reply-To: <jLGAMZpgr-fd7mc1F0QKdZ5SEd6keErnKsICO7NTMf5vTYUjkkYdY4MlFB0wml6KiLQYodK135tt04AOtaw9HowJWXlelIEa2C7ieZvjhpk=@protonmail.com>
References: <jLGAMZpgr-fd7mc1F0QKdZ5SEd6keErnKsICO7NTMf5vTYUjkkYdY4MlFB0wml6KiLQYodK135tt04AOtaw9HowJWXlelIEa2C7ieZvjhpk=@protonmail.com>
Feedback-ID: 4120748:user:proton
X-Pm-Message-ID: bae9beb0168645e66659c6353b20ddc4a0b48d1c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_024332_684384_C6C72403 
X-CRM114-Status: GOOD (  15.87  )
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

Hi everyone,

it seems that this is not a ath10k firmware issue but rather a kernel issue=
. I tried following:

Live boot newest Manjaro: Problem

Live boot Ubuntu 18.04: Full WiFi speed as expected

Live boot Ubuntu 20.04: Problem

Ubuntu 18.04 had kernel 5.4.0-84 and WLAN.TF.2.1-00021-QCARMSWP api 6 - no =
problem.

Ubuntu 20.04 had same firmware but kernel 5.15 - problem. I am gonna try to=
 downgrade the kernel and see if that fixes my problem.


On Thursday, January 9th, 2025 at 7:39 PM, smaxxx <smaxxx@protonmail.com> w=
rote:

> Problem
>=20
> I have slow WiFi speed on my Lenovo Ideapad C340-15IWL notebook running U=
buntu 24.04.1 LTS.
>=20
> I reach about 30-40 Mbit/s and experience packet loss as soon as I hit th=
at limit. It seems that this is the overall max throughput.
> How I measure
>=20
> To make the tests more meaningful, I am running a iperf3 server on my loc=
al PC, that is connected to the same router per Ethernet (1 Gbit/s).
>=20
> iperf3 -c 192.168.2.182
> Connecting to host 192.168.2.182, port 5201
> [ 5] local 192.168.2.111 port 54734 connected to 192.168.2.182 port 5201
> [ ID] Interval Transfer Bitrate Retr Cwnd
> [ 5] 0.00-1.00 sec 3.00 MBytes 25.1 Mbits/sec 0 97.0 KBytes
> [ 5] 1.00-2.00 sec 3.25 MBytes 27.3 Mbits/sec 0 103 KBytes
> [ 5] 2.00-3.00 sec 3.38 MBytes 28.3 Mbits/sec 0 113 KBytes
> [ 5] 3.00-4.00 sec 3.75 MBytes 31.5 Mbits/sec 0 164 KBytes
> [ 5] 4.00-5.00 sec 3.38 MBytes 28.3 Mbits/sec 0 188 KBytes
> [ 5] 5.00-6.00 sec 2.88 MBytes 24.1 Mbits/sec 0 188 KBytes
> [ 5] 6.00-7.00 sec 3.75 MBytes 31.5 Mbits/sec 0 188 KBytes
> [ 5] 7.00-8.00 sec 3.38 MBytes 28.3 Mbits/sec 0 147 KBytes
> [ 5] 8.00-9.00 sec 3.25 MBytes 27.3 Mbits/sec 0 164 KBytes
> [ 5] 9.00-10.00 sec 3.38 MBytes 28.3 Mbits/sec 0 182 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval Transfer Bitrate Retr
> [ 5] 0.00-10.00 sec 33.4 MBytes 28.0 Mbits/sec 0 sender
> [ 5] 0.00-10.03 sec 32.8 MBytes 27.4 Mbits/sec receiver
>=20
> My system and more info about my WiFi connection
>=20
> I am connected via 5 GHz and the router is basically 4 meters away with n=
o obstacles in front of it. The same issue exists with 2.4 GHz.
> Kernel / OS version
>=20
> # cat /etc/os-release
>=20
> PRETTY_NAME=3D"Ubuntu 24.04.1 LTS"
> NAME=3D"Ubuntu"
> VERSION_ID=3D"24.04"
> VERSION=3D"24.04.1 LTS (Noble Numbat)"
> VERSION_CODENAME=3Dnoble
> ID=3Dubuntu
> ID_LIKE=3Ddebian
> HOME_URL=3D"https://www.ubuntu.com/"
> SUPPORT_URL=3D"https://help.ubuntu.com/"
> BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
> PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/pri=
vacy-policy"
> UBUNTU_CODENAME=3Dnoble
> LOGO=3Dubuntu-logo
>=20
> # uname -a
> Linux laptop 6.8.0-51-generic #52-Ubuntu SMP PREEMPT_DYNAMIC Thu Dec 5 13=
:09:44 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
>=20
> # lspci
> [...]
> 02:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Ne=
twork Adapter (rev 31)
> [...]
>=20
> iwconfig
>=20
> # iwconfig (sensitive data redacted)
>=20
> wlp2s0 IEEE 802.11 ESSID:"My WiFI SSID"
> Mode:Managed Frequency:5.5 GHz Access Point: AA:BB:CC:DD:EE:FF
> Tx-Power=3D23 dBm
> Retry short limit:7 RTS thr:off Fragment thr:off
> Encryption key:off
> Power Management:off
> Link Quality=3D67/70 Signal level=3D-43 dBm
> Rx invalid nwid:0 Rx invalid crypt:0 Rx invalid frag:0
> Tx excessive retries:0 Invalid misc:37 Missed beacon:0
>=20
> ncmli device wifi list
>=20
> # mcli device wifi list
> IN-USE BSSID SSID MODE CHAN RATE SIGNAL BARS SECURITY
> * AA:BB:CC:DD:EE:FF My WiFi SSID Infra 100 540 Mbit/s 97 =E2=96=82=
=E2=96=84=E2=96=86=E2=96=88 WPA2 WPA3
>=20
> dmesg | grep ath10k
>=20
> [ 4.182676] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode=
 0 reset_mode 0
> [ 4.400376] ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip=
_id 0x003821ff sub 17aa:0901
> [ 4.400382] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 =
dfs 0 testmode 0
> [ 4.400767] ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATF=
SWPZ-5 api 5 features ignore-otp crc32 c3e0d04f
> [ 4.463619] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 8a=
edfa4a
> [ 4.556609] ath10k_pci 0000:02:00.0: htt-ver 3.44 wmi-op 4 htt-op 3 cal o=
tp max-sta 32 raw 0 hwcrypto 1
> [ 4.620003] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
>=20
> What I tried
>=20
> I disabled bluetooth. Issue persists.
>=20
> I disabled power management. Issue persists.
>=20
> I reinstalled the package "linux-firmware". Issue persists.
>=20
> I disabled IPv6. Issue persists.
>=20
> I changed the ath10k firmware from 6 to 5 and vice versa. Issue persists:
>=20
> :/lib/firmware/ath10k/QCA9377/hw1.0# ls -la
> total 896
> drwxr-xr-x 2 root root 4096 Jan 9 19:35 .
> drwxr-xr-x 3 root root 4096 Apr 25 2024 ..
> -rw-r--r-- 1 root root 2737 Nov 29 11:50 board-2.bin.zst
> -rw-r--r-- 1 root root 1215 Nov 29 11:50 board.bin.zst
> -rw-r--r-- 1 root root 498888 Nov 29 11:50 firmware-5.bin.zst
> -rw-r--r-- 1 root root 390717 Nov 29 11:50 firmware-sdio-5.bin.zst
> -rw-r--r-- 1 root root 5222 Nov 29 11:50 notice_ath10k_firmware-5.txt.zst
> lrwxrwxrwx 1 root root 52 Nov 29 11:50 notice_ath10k_firmware-6.txt.zst -=
> ../../QCA6174/hw3.0/notice_ath10k_firmware-6.txt.zst
>=20
> lrwxrwxrwx 1 root root 32 Nov 29 11:50 notice_ath10k_firmware-sdio-5.txt.=
zst -> notice_ath10k_firmware-5.txt.zst
>=20
>=20
>=20
> mv /lib/firmware/ath10k/QCA9377/hw1.0/firmware-6.bin.zst /root/
> modprobe -r ath10k_pci
> modprobe ath10k_pci
>=20
> I checked if any neighbors are on the same channel as my router, but I di=
d not find any. I also exclude this problem because on a Windows laptop I d=
o not have this issue.
>=20
> I now have no idea anymore what to check or try. Can anyone help me? Than=
k you very much!
>=20
>=20
>=20
> Sent with Proton Mail secure email.

