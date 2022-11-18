Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EA9C4332F
	for <ath10k@archiver.kernel.org>; Fri, 18 Nov 2022 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8rGbGFQpva2Z4jKjMqCneNIITOTIRQ/JTg+Lxky2xQg=; b=tPk1aevW44hqV9
	wLAiHz6W0iQhJFYRMYPDBI9XT+fm37Usp2zvHCJGIqjQ7F7tt9+980SxrALpqaA5ff6G0IzI/Du0x
	RMy2Gw/W8rUE66mXHeJvk8+eWbxVG2+8WVCkigRDW9z9zRy487rxv5pOfq9Pg80YN957217MHQihb
	7mpkgU92j0nTonso6JvErNaE3QZxxJETUB8lEHeQIsXDQv+jtq9HAzyRsVw2iGMBlYWLuKWT5qqWm
	JtZG9qvEINRMPin5tfqbxPQpoiDRdEBIEKj8+jvY/eoF/Gpc7v/3c9tGqGMFQUboC4j4vLD857qVi
	jr93yMSXPGkam2s0pUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyvS-003Tdr-UB; Fri, 18 Nov 2022 10:48:50 +0000
Received: from zz.twinspot.net ([81.170.212.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyvP-003TZy-2O
	for ath10k@lists.infradead.org; Fri, 18 Nov 2022 10:48:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by zz.twinspot.net (Postfix) with ESMTP id 305848044B8A4
	for <ath10k@lists.infradead.org>; Fri, 18 Nov 2022 11:48:38 +0100 (CET)
Received: from zz.twinspot.net ([127.0.0.1])
	by localhost (zz.twinspot.net [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ROJnEOCxZ-90 for <ath10k@lists.infradead.org>;
	Fri, 18 Nov 2022 11:48:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zz.twinspot.net (Postfix) with ESMTP id DC8FB8044B8A5
	for <ath10k@lists.infradead.org>; Fri, 18 Nov 2022 11:48:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at twinspot.net
Received: from zz.twinspot.net ([127.0.0.1])
	by localhost (zz.twinspot.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tOzfBas8lyQZ for <ath10k@lists.infradead.org>;
	Fri, 18 Nov 2022 11:48:36 +0100 (CET)
Received: from zz.twinspot.net (zz.twinspot.net [10.2.10.111])
	by zz.twinspot.net (Postfix) with ESMTP id BF5988044B8A4
	for <ath10k@lists.infradead.org>; Fri, 18 Nov 2022 11:48:36 +0100 (CET)
Date: Fri, 18 Nov 2022 11:48:36 +0100 (CET)
From: Patrik Arven <patrik.arven@j-2.se>
To: ath10k@lists.infradead.org
Message-ID: <2133142983.68468.1668768516576.JavaMail.zimbra@z.j-2.se>
Subject: Qualcomm Atheros QCA9377 Wi-Fi lock up, failed to transmit packet,
 dropping: -12
MIME-Version: 1.0
X-Mailer: Zimbra 8.6.0_GA_1242 (ZimbraWebClient - FF106 (Win)/8.6.0_GA_1242)
Thread-Topic: Qualcomm Atheros QCA9377 Wi-Fi lock up, failed to transmit packet, dropping: -12
Thread-Index: dJ0INXxDg1yfKiPB9AWvoAz0mM0Isw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_024847_463940_42CDEDF6 
X-CRM114-Status: UNSURE (   2.59  )
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

Hi all

Hopefully this has been asked before, because then there might be a solution already :-)

Long story short:
================
- Connect a putty terminal trough wifi to an NXP imx6 with Qualcomm Atheros QCA9377, using ath10k_sdio 
- type "ping -f <gateway>", e.g ping -f 192.168.10.1.

The terminal window locks up and need to be killed from the client. This is observed at the serial debug console:

[86574.617400] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[86574.624725] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[86574.630852] ath10k_sdio mmc1:0001:1: failed to push frame: -12
[86574.774034] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[86574.781373] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[86574.787409] ath10k_sdio mmc1:0001:1: failed to push frame: -12

The imx6 wifi doesn't die completely, just the dropbear/ssh connection. A new putty terminal can be opened without problem.

Has anyone seen this? Is there a solution?




Short story long:
================

# uname -a

Linux pico-imx6ul 5.10.72-g97258dd1dd69-dirty #2 SMP PREEMPT Fri Nov 4 08:11:30 UTC 2022 armv7l armv7l armv7l GNU/Linux


# lsmod

Module                  Size  Used by
ath10k_sdio            32768  0
ath10k_core           327680  1 ath10k_sdio
ath                    28672  1 ath10k_core
imx_sdma               28672  8


# dmesg 

...blabla...

[   12.777278] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
[   12.896974] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0 tracing 0 dfs0 testmode 1
[   13.000567] ath10k_sdio mmc1:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
[   13.587352] ath10k_sdio mmc1:0001:1: failed to fetch board data for bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 from ath10k/QCA9377/hw1.0/board-2.bin
[   13.881212] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A crc32 544289f7
[   18.618930] Micrel KSZ8081 or KSZ8091 20b4000.ethernet-1:01: attached PHY driver [Micrel KSZ8081 or KSZ8091] (mii_bus:phy_addr=20b4000.ethernet-1:01, irq=208)
[   19.749416] ath10k_sdio mmc1:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   19.850261] mmc1: queuing unknown CIS tuple 0x01 (3 bytes)
[   19.885699] mmc1: queuing unknown CIS tuple 0x1a (5 bytes)
[   19.907835] mmc1: queuing unknown CIS tuple 0x1b (8 bytes)
[   19.928064] mmc1: queuing unknown CIS tuple 0x14 (0 bytes)


...blabla...
[78218.267131] wlan0: authenticated
[78218.287850] wlan0: associate with 84:16:f9:93:f5:ae (try 1/3)
[78218.298286] wlan0: RX AssocResp from 84:16:f9:93:f5:ae (capab=0x11 status=0 aid=1)
[78218.319390] wlan0: associated
[78218.342609] wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by 84:16:f9:93:f5:ae
[86574.617400] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[86574.624725] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[86574.630852] ath10k_sdio mmc1:0001:1: failed to push frame: -12
[86574.774034] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[86574.781373] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[86574.787409] ath10k_sdio mmc1:0001:1: failed to push frame: -12


# ethtool -i wlan0

driver: ath10k_sdio
version: 5.10.72-g97258dd1dd69-dirty
firmware-version: WLAN.TF.1.1.1-00061-QCATFSWPZ-1
expansion-rom-version:
bus-info: mmc1:0001:1
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

# ls /lib/firmware/ath10k/QCA9377/hw1.0/
board-2.bin     firmware-6.bin                notice_ath10k_firmware-6.txt
board.bin       firmware-sdio-5.bin           notice_ath10k_firmware-sdio-5.txt
firmware-5.bin  notice_ath10k_firmware-5.txt



Where/how I got the wifi firmware:

# wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20221012.tar.gz
# tar -xzf linux-firmware-20221012.tar.gz
# ssh root@$XIP mkdir /lib/firmware/ath10k
# scp -r linux-firmware-20221012/ath10k/QCA9377 root@$XIP:/lib/firmware/ath10k

When building the kernel, I used make menuconfig.
Device drivers -> Network device support -> Wireless LAN -> 
M Atheros 802.11ac wireless cards support
M Atheros ath10k SDIO support
M Qualcomm Technologies 802.11ax chipset support
M Atheros ath11k AHB support


Best regards
Patrik


-- 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
