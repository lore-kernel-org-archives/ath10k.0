Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733DFC54EBE
	for <ath10k@archiver.kernel.org>; Tue, 10 Jan 2023 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DaiRbw/F3srx7mRbn4MQwhXwpZWGNwgf4Ws7GFXlMDI=; b=Xe3yQ7JdXNrkmz
	V7897Nw16zv1r03zLf+bEDWNXmcKnUPbfwOJm4vmi1hHKZ4XZKnXxw0rnwtvUKTa/XArv4JS0Q6tm
	mo1bL6nZ/k0mKrSfSgz+9AaMGUeE+L4i+18881XcgoDIX1SnWhzQuBVARwFotWOPSr8HpjqLcWMxS
	GM6pZ937BQVq33vovmv0IN7iGvGVz+BacZD2CbSVOZNV5WdDS6GFvwd7FFra5zC0gg4KWgapqnkEv
	gnejKtC1YTDeGZgRE5aqmTsJxKtM3KZMm3Fm8p0uI8nCRrfE3PlLSpNVxnkB2/tN9JTqwYY7z3C4G
	3Z3EVtg4/XH8lZZ2Q48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAeI-0060eh-0g; Tue, 10 Jan 2023 09:10:26 +0000
Received: from forward106p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:109])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAeE-0060b6-AL
	for ath10k@lists.infradead.org; Tue, 10 Jan 2023 09:10:25 +0000
Received: from sas8-e2d6e97d76c7.qloud-c.yandex.net (sas8-e2d6e97d76c7.qloud-c.yandex.net [IPv6:2a02:6b8:c1b:2904:0:640:e2d6:e97d])
	by forward106p.mail.yandex.net (Yandex) with ESMTP id AA0CC2FC1A9C
	for <ath10k@lists.infradead.org>; Tue, 10 Jan 2023 12:10:14 +0300 (MSK)
Received: by sas8-e2d6e97d76c7.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id DAZZJFCZC8c1-fMgL0yTf;
	Tue, 10 Jan 2023 12:10:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1673341814;
	bh=30nB103jDvkwM88OOLrTPr1WWEeJ5pNXERpI4j90y/o=;
	h=Date:To:From:Subject:Message-ID;
	b=sMUhkT5Kq6jbegrunC2gSlAsSFX9EWew34ufaO7GK9S/L2O0Hmv9KFL2CbFKtmcJJ
	 xvdlSBloM3jZNlucz4O0Xo+JUm26bVHAquArUBNTwp3jOT0XIGzit599MKlnZdYVQb
	 ZDwuZ/H72xB/q9fuwEj+e4PnLT8M/Zp9MjjNPFag=
Authentication-Results: sas8-e2d6e97d76c7.qloud-c.yandex.net; dkim=pass header.i=@ya.ru
Message-ID: <02bed0819c13c14dc1f52d7d2b658b00280d2634.camel@ya.ru>
Subject: [BUG] SoftAP: zero speed between clients on QCA6174
From: dukzcry@ya.ru
To: ath10k@lists.infradead.org
Date: Tue, 10 Jan 2023 12:10:13 +0300
User-Agent: Evolution 3.46.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_011023_009297_FC2DDDD9 
X-CRM114-Status: UNSURE (   6.46  )
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

I have the Qualcomm Atheros QCNFA344A M2 module

$ lspci
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 32)

$ dmesg | grep ath10k
[    3.445810] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[    3.446081] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    3.680848] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000
chip_id 0x00340aff sub 1028:0310
[    3.680851] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[    3.681176] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-
00288- api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
[    3.748580] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 62812cba
[    3.840194] ath10k_pci 0000:02:00.0: htt-ver 3.87 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[    3.900322] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0

Now I create an AP on it either via hostapd or NetworkManager like
"sudo nmcli dev wifi hotspot ifname wlp2s0 ssid test password "mypass""

Then I connect few various clients to it and benchmark speed from any
client to AP via iperf3, which is fine

Connecting to host 10.42.0.1, port 5201
[  5] local 10.42.0.19 port 60646 connected to 10.42.0.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  3.89 MBytes  32.6 Mbits/sec    0    208 KBytes
[  5]   1.00-2.00   sec  4.04 MBytes  33.9 Mbits/sec    0    331 KBytes
[  5]   2.00-3.00   sec  3.23 MBytes  27.1 Mbits/sec    6    280 KBytes
[  5]   3.00-4.00   sec  3.04 MBytes  25.5 Mbits/sec    1    308 KBytes
[  5]   4.00-5.00   sec  4.16 MBytes  34.9 Mbits/sec    0    378 KBytes
[  5]   5.00-6.00   sec  4.04 MBytes  33.9 Mbits/sec    0    411 KBytes
[  5]   6.00-7.00   sec  4.16 MBytes  34.9 Mbits/sec    0    411 KBytes
[  5]   7.00-8.00   sec  2.67 MBytes  22.4 Mbits/sec    0    436 KBytes
[  5]   8.00-9.00   sec  3.85 MBytes  32.3 Mbits/sec    0    458 KBytes
[  5]   9.00-10.00  sec  2.92 MBytes  24.5 Mbits/sec    0    458 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  36.0 MBytes  30.2 Mbits/sec    7            
sender
[  5]   0.00-10.02  sec  34.0 MBytes  28.4 Mbits/sec                 
receiver

iperf Done.


Now I try to measure speed between any two clients and get

Connecting to host 10.42.0.83, port 5201
[  5] local 10.42.0.19 port 58262 connected to 10.42.0.83 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   414 KBytes  3.39 Mbits/sec    7   7.07 KBytes
[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec   12   2.83 KBytes 
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec   16   4.24 KBytes 
[  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    8   15.6 KBytes 
[  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec   13   2.83 KBytes 
[  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec   11   4.24 KBytes 
[  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    7   2.83 KBytes 
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    4   4.24 KBytes 
[  5]   8.00-9.00   sec   127 KBytes  1.04 Mbits/sec    3   2.83 KBytes
[  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec    4   2.83 KBytes 
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   542 KBytes   444 Kbits/sec   85            
sender
[  5]   0.00-10.01  sec   277 KBytes   227 Kbits/sec                 
receiver

iperf Done.

Which is a way too low. Ssh is also very slow between clients, VNC
shows similar speed rates and unable to render desktop at that speed
for sure

The system is totally stock and clean. I also have USB ath9k adapter in
this system, which doesn't show this issue

$ lsusb
Bus 001 Device 004: ID 0cf3:9271 Qualcomm Atheros Communications AR9271
802.11n

$ dmesg | grep ath9k
[    3.446722] usb 1-3.3: ath9k_htc: Firmware ath9k_htc/htc_9271-
1.4.0.fw requested
[    3.446804] usbcore: registered new interface driver ath9k_htc
[    3.734857] usb 1-3.3: ath9k_htc: Transferred FW:
ath9k_htc/htc_9271-1.4.0.fw, size: 51008
[    3.985462] ath9k_htc 1-3.3:1.0: ath9k_htc: HTC initialized with 33
credits
[    4.212339] ath9k_htc 1-3.3:1.0: ath9k_htc: FW Version: 1.4
[    4.212343] ath9k_htc 1-3.3:1.0: FW RMW support: On
[    4.217755] ath9k_htc 1-3.3:1.0 legacy: renamed from wlan0

Speed between two clients is fine for it

Connecting to host 10.42.1.83, port 5201
[  5] local 10.42.1.19 port 43456 connected to 10.42.1.83 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  1.43 MBytes  12.0 Mbits/sec    0    107 KBytes
[  5]   1.00-2.00   sec  1.55 MBytes  13.0 Mbits/sec    0    165 KBytes
[  5]   2.00-3.00   sec  1.24 MBytes  10.4 Mbits/sec    0    208 KBytes
[  5]   3.00-4.00   sec  1018 KBytes  8.34 Mbits/sec    0    247 KBytes
[  5]   4.00-5.00   sec   509 KBytes  4.17 Mbits/sec   19    198 KBytes
[  5]   5.00-6.00   sec  1.12 MBytes  9.39 Mbits/sec    0    232 KBytes
[  5]   6.00-7.00   sec  1.68 MBytes  14.1 Mbits/sec    0    252 KBytes
[  5]   7.00-8.00   sec   573 KBytes  4.69 Mbits/sec    0    259 KBytes
[  5]   8.00-9.00   sec  1.12 MBytes  9.38 Mbits/sec    0    264 KBytes
[  5]   9.00-10.00  sec  1.12 MBytes  9.39 Mbits/sec    0    264 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  11.3 MBytes  9.49 Mbits/sec   19            
sender
[  5]   0.00-10.11  sec  10.4 MBytes  8.59 Mbits/sec                 
receiver

iperf Done.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
