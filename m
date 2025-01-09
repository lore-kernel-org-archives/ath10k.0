Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D19CE77197
	for <ath10k@archiver.kernel.org>; Thu,  9 Jan 2025 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DxYyQuEMERNBziJMWQCbsGrQhhdGw3TXbe21v57aGII=; b=l2exZbePVkdGBcuas77Oq8QW2p
	k7MF75vsDYEQNXst7/eqhRPpwYenq5SaWbpUVwAdUW/OxaWtRL3SpPWZWjL7JO1C0ZQzmfzkK9SfJ
	L3f1Y52ACLWLTEmZJtTsYNrDENoR0FG+f75n2N5RbYtYO00+Mtw9tq35weWheCItoPHNpq1gwOaBT
	KLK/D1D1s9j3mqrO5ooJMASk/KpJHjsaid/r+C/7E3j4FBN13vEafO3UrOjtXWsxEbcfskpF+ztnu
	4dKDNlRd9ic/PLYVjLWWKsxVRDLPC+iY2FIbr/hg6+h8+g9UGYrpPVOBG/kn5kGYAA6bkvSyUOXII
	DYGDMUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyNn-0000000D7lh-24Ld;
	Thu, 09 Jan 2025 19:39:55 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyNk-0000000D7kU-3Qvr
	for ath10k@lists.infradead.org;
	Thu, 09 Jan 2025 19:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1736451590; x=1736710790;
	bh=DxYyQuEMERNBziJMWQCbsGrQhhdGw3TXbe21v57aGII=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=J/uGNPYH3sOQSJSZJ1A35L/QIuI310/XNHPkroIyiafy3ie879roDQuShGnqjwLpb
	 5tLLuaM+teNR4qvmKK36nzY6ZuAEAPvK4QedEw7V+yh6g1s8QsMeXHPBpBHQiJB6pC
	 wqRlTeLhoOZ91AwELdnGYxVXRzCPHodGMiGa9QCyGGPJ3EXwmv+LtFerCDJWsqpKwq
	 3Y6K0aPAH0qbTV8/d3yq1i5dxG0NmkzDmIl3OPLmA8xVaLwl5Hk9j++5bSUAmOmL68
	 KS7OqSj//JWJbSuc3TlzmYlc0K5ykqb4VGhFC1l/LsLokrpU32bK6lOIhHsUBdpfEu
	 82x6YY2SX38lw==
Date: Thu, 09 Jan 2025 19:39:45 +0000
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
From: smaxxx <smaxxx@protonmail.com>
Subject: Slow WiFi speed on QC9377
Message-ID: <jLGAMZpgr-fd7mc1F0QKdZ5SEd6keErnKsICO7NTMf5vTYUjkkYdY4MlFB0wml6KiLQYodK135tt04AOtaw9HowJWXlelIEa2C7ieZvjhpk=@protonmail.com>
Feedback-ID: 4120748:user:proton
X-Pm-Message-ID: f7e09e1c69e9de938beecc1b7b6f8907202e7d1a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_113953_005595_5A1C4D71 
X-CRM114-Status: UNSURE (   6.38  )
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


Problem

I have slow WiFi speed on my Lenovo Ideapad C340-15IWL notebook running Ubu=
ntu 24.04.1 LTS.

I reach about 30-40 Mbit/s and experience packet loss as soon as I hit that=
 limit. It seems that this is the overall max throughput.
How I measure

To make the tests more meaningful, I am running a iperf3 server on my local=
 PC, that is connected to the same router per Ethernet (1 Gbit/s).

iperf3 -c  192.168.2.182
Connecting to host 192.168.2.182, port 5201
[  5] local 192.168.2.111 port 54734 connected to 192.168.2.182 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  3.00 MBytes  25.1 Mbits/sec    0   97.0 KBytes    =
 =20
[  5]   1.00-2.00   sec  3.25 MBytes  27.3 Mbits/sec    0    103 KBytes    =
 =20
[  5]   2.00-3.00   sec  3.38 MBytes  28.3 Mbits/sec    0    113 KBytes    =
 =20
[  5]   3.00-4.00   sec  3.75 MBytes  31.5 Mbits/sec    0    164 KBytes    =
 =20
[  5]   4.00-5.00   sec  3.38 MBytes  28.3 Mbits/sec    0    188 KBytes    =
 =20
[  5]   5.00-6.00   sec  2.88 MBytes  24.1 Mbits/sec    0    188 KBytes    =
 =20
[  5]   6.00-7.00   sec  3.75 MBytes  31.5 Mbits/sec    0    188 KBytes    =
 =20
[  5]   7.00-8.00   sec  3.38 MBytes  28.3 Mbits/sec    0    147 KBytes    =
 =20
[  5]   8.00-9.00   sec  3.25 MBytes  27.3 Mbits/sec    0    164 KBytes    =
 =20
[  5]   9.00-10.00  sec  3.38 MBytes  28.3 Mbits/sec    0    182 KBytes    =
 =20
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  33.4 MBytes  28.0 Mbits/sec    0             sende=
r
[  5]   0.00-10.03  sec  32.8 MBytes  27.4 Mbits/sec                  recei=
ver

My system and more info about my WiFi connection

I am connected via 5 GHz and the router is basically 4 meters away with no =
obstacles in front of it. The same issue exists with 2.4 GHz.
Kernel / OS version

# cat /etc/os-release

PRETTY_NAME=3D"Ubuntu 24.04.1 LTS"
NAME=3D"Ubuntu"
VERSION_ID=3D"24.04"
VERSION=3D"24.04.1 LTS (Noble Numbat)"
VERSION_CODENAME=3Dnoble
ID=3Dubuntu
ID_LIKE=3Ddebian
HOME_URL=3D"https://www.ubuntu.com/"
SUPPORT_URL=3D"https://help.ubuntu.com/"
BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/priva=
cy-policy"
UBUNTU_CODENAME=3Dnoble
LOGO=3Dubuntu-logo

# uname -a
Linux laptop 6.8.0-51-generic #52-Ubuntu SMP PREEMPT_DYNAMIC Thu Dec  5 13:=
09:44 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

# lspci
[...]
02:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Netw=
ork Adapter (rev 31)
[...]

iwconfig

# iwconfig (sensitive data redacted)

wlp2s0    IEEE 802.11  ESSID:"My WiFI SSID" =20
          Mode:Managed  Frequency:5.5 GHz  Access Point: AA:BB:CC:DD:EE:FF =
=20
          Tx-Power=3D23 dBm =20
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
          Link Quality=3D67/70  Signal level=3D-43 dBm =20
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:37   Missed beacon:0

ncmli device wifi list

# mcli device wifi list
IN-USE  BSSID              SSID                 MODE   CHAN  RATE        SI=
GNAL  BARS  SECURITY =20
*       AA:BB:CC:DD:EE:FF  My WiFi SSID   Infra  100   540 Mbit/s  97      =
=E2=96=82=E2=96=84=E2=96=86=E2=96=88  WPA2 WPA3=20

dmesg | grep ath10k

[    4.182676] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    4.400376] ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chi=
p_id 0x003821ff sub 17aa:0901
[    4.400382] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1=
 dfs 0 testmode 0
[    4.400767] ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCAT=
FSWPZ-5 api 5 features ignore-otp crc32 c3e0d04f
[    4.463619] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 8=
aedfa4a
[    4.556609] ath10k_pci 0000:02:00.0: htt-ver 3.44 wmi-op 4 htt-op 3 cal =
otp max-sta 32 raw 0 hwcrypto 1
[    4.620003] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0

What I tried

I disabled bluetooth. Issue persists.

I disabled power management. Issue persists.

I reinstalled the package "linux-firmware". Issue persists.

I disabled IPv6. Issue persists.

I changed the ath10k firmware from 6 to 5 and vice versa. Issue persists:

:/lib/firmware/ath10k/QCA9377/hw1.0# ls -la
total 896
drwxr-xr-x 2 root root   4096 Jan  9 19:35 .
drwxr-xr-x 3 root root   4096 Apr 25  2024 ..
-rw-r--r-- 1 root root   2737 Nov 29 11:50 board-2.bin.zst
-rw-r--r-- 1 root root   1215 Nov 29 11:50 board.bin.zst
-rw-r--r-- 1 root root 498888 Nov 29 11:50 firmware-5.bin.zst
-rw-r--r-- 1 root root 390717 Nov 29 11:50 firmware-sdio-5.bin.zst
-rw-r--r-- 1 root root   5222 Nov 29 11:50 notice_ath10k_firmware-5.txt.zst
lrwxrwxrwx 1 root root     52 Nov 29 11:50 notice_ath10k_firmware-6.txt.zst=
 -> ../../QCA6174/hw3.0/notice_ath10k_firmware-6.txt.zst
lrwxrwxrwx 1 root root     32 Nov 29 11:50 notice_ath10k_firmware-sdio-5.tx=
t.zst -> notice_ath10k_firmware-5.txt.zst


mv /lib/firmware/ath10k/QCA9377/hw1.0/firmware-6.bin.zst /root/
modprobe -r ath10k_pci
modprobe ath10k_pci

I checked if any neighbors are on the same channel as my router, but I did =
not find any. I also exclude this problem because on a Windows laptop I do =
not have this issue.

I now have no idea anymore what to check or try. Can anyone help me? Thank =
you very much!



Sent with Proton Mail secure email.

