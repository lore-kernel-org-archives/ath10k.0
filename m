Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKN1q-0006hG-Nl
 for ath10k@lists.infradead.org; Mon, 21 Sep 2020 14:42:57 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id ED74D40009
 for <ath10k@lists.infradead.org>; Mon, 21 Sep 2020 16:42:40 +0200 (CEST)
Received: from sara.hytechdrive.se (h-170-152-149.A163.priv.bahnhof.se
 [81.170.152.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id 3D45E40009
 for <ath10k@lists.infradead.org>; Mon, 21 Sep 2020 16:42:40 +0200 (CEST)
Date: Mon, 21 Sep 2020 16:42:40 +0200 (CEST)
From: =?UTF-8?Q?Peter_=C3=85strand?= <astrand@lysator.liu.se>
Subject: Re: Meshed WiFi with QCA9377 (USB/SDIO)
In-Reply-To: <alpine.LRH.2.23.451.2009180928250.29354@sara.hytechdrive.se>
Message-ID: <alpine.LRH.2.23.451.2009211638410.6177@sara.hytechdrive.se>
References: <alpine.LRH.2.23.451.2009141438290.19926@sara.hytechdrive.se>
 <alpine.LRH.2.23.451.2009180928250.29354@sara.hytechdrive.se>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org


On Fri, 18 Sep 2020, Peter Astrand wrote:

> Will try SDIO based RED bean as soon as it arrives.

With 5.9.0-rc5-wt-ath+ (master) and firmware and board file generated from 
https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/sdio, 
the firmware crashes as below:


[ 2413.397804] sdio_read_cis: 1 callbacks suppressed
[ 2413.397807] mmc0: queuing unknown CIS tuple 0x01 (3 bytes)
[ 2413.400926] mmc0: queuing unknown CIS tuple 0x1a (5 bytes)
[ 2413.402180] mmc0: queuing unknown CIS tuple 0x1b (8 bytes)
[ 2413.402431] mmc0: queuing unknown CIS tuple 0x14 (0 bytes)
[ 2413.422846] mmc0: Internal clock never stabilised.
[ 2413.422850] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 2413.422859] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x0000c001
[ 2413.422870] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
[ 2413.422879] mmc0: sdhci: Argument:  0x80002603 | Trn mode: 0x00000000
[ 2413.422890] mmc0: sdhci: Present:   0x01ff0000 | Host ctl: 0x00000004
[ 2413.422901] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 2413.422912] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000003
[ 2413.422919] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
[ 2413.422929] mmc0: sdhci: Int enab:  0x00ff0083 | Sig enab: 0x00ff0083
[ 2413.422940] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 2413.422952] mmc0: sdhci: Caps:      0x21e608b2 | Caps_1:   0x00002077
[ 2413.422962] mmc0: sdhci: Cmd:       0x0000341a | Max curr: 0x00000064
[ 2413.422971] mmc0: sdhci: Resp[0]:   0x00001003 | Resp[1]:  0x00000000
[ 2413.422982] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 2413.422988] mmc0: sdhci: Host ctl2: 0x00000000
[ 2413.422989] mmc0: sdhci: ============================================
[ 2413.443025] mmc0: Internal clock never stabilised.
[ 2413.443029] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 2413.443042] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x0000c001
[ 2413.443053] mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
[ 2413.443064] mmc0: sdhci: Argument:  0x80002603 | Trn mode: 0x00000000
[ 2413.443076] mmc0: sdhci: Present:   0x01ff0000 | Host ctl: 0x00000004
[ 2413.443087] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 2413.443098] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000003
[ 2413.443109] mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
[ 2413.443120] mmc0: sdhci: Int enab:  0x00ff0083 | Sig enab: 0x00ff0083
[ 2413.443131] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 2413.443142] mmc0: sdhci: Caps:      0x21e608b2 | Caps_1:   0x00002077
[ 2413.443154] mmc0: sdhci: Cmd:       0x0000341a | Max curr: 0x00000064
[ 2413.443165] mmc0: sdhci: Resp[0]:   0x00001003 | Resp[1]:  0x00000000
[ 2413.443175] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 2413.443182] mmc0: sdhci: Host ctl2: 0x00000000
[ 2413.443182] mmc0: sdhci: ============================================
[ 2413.446176] mmc0: queuing unknown CIS tuple 0x80 (1 bytes)
[ 2413.446323] mmc0: queuing unknown CIS tuple 0x81 (1 bytes)
[ 2413.446458] mmc0: queuing unknown CIS tuple 0x82 (1 bytes)
[ 2413.446509] mmc0: new high speed SDIO card at address 0001
[ 2413.476637] ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
[ 2413.476639] ath10k_sdio mmc0:0001:1: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[ 2413.477069] ath10k_sdio mmc0:0001:1: firmware ver  api 5 features ignore-otp crc32 21a4f95a
[ 2413.628310] ath10k_sdio mmc0:0001:1: board_file api 2 bmi_id N/A crc32 91463f7b
[ 2414.205864] ath10k_sdio mmc0:0001:1: firmware crashed! (guid 74234224-1314-444d-842d-2ebb7b0c9aee)
[ 2414.205870] ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
[ 2414.205871] ath10k_sdio mmc0:0001:1: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[ 2414.206311] ath10k_sdio mmc0:0001:1: firmware ver 1.0.0.591 api 5 features ignore-otp crc32 21a4f95a
[ 2414.206318] ath10k_sdio mmc0:0001:1: board_file api 2 bmi_id N/A crc32 91463f7b
[ 2414.206320] ath10k_sdio mmc0:0001:1: htt-ver 0.0 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1

Any suggestions?

Br,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
